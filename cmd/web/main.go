package main

import (
	"encoding/gob"
	"fmt"
	"log"
	"net/http"
	"os"
	"os/exec"
	"time"

	"github.com/aleksaDam997/bookings/internal/config"
	"github.com/aleksaDam997/bookings/internal/driver"
	"github.com/aleksaDam997/bookings/internal/handlers"
	"github.com/aleksaDam997/bookings/internal/helpers"
	"github.com/aleksaDam997/bookings/internal/models"
	"github.com/aleksaDam997/bookings/internal/render"
	"github.com/alexedwards/scs/v2"
)

const portNumber string = ":8080"

var app config.AppConfig
var session *scs.SessionManager

var infoLog *log.Logger
var errorLog *log.Logger

func main() {

	helpers.NewHelpers(&app)

	dbConnPollSettings := helpers.ExecFlag()

	db, err := run(dbConnPollSettings)

	if err != nil {
		log.Fatal(err)
	}

	defer db.SQL.Close()

	defer close(app.MailChan)
	fmt.Println("Starting mail listener...")
	listenForMail(dbConnPollSettings.MailhogHost)

	srv := &http.Server{
		Addr:    portNumber,
		Handler: routes(&app),
	}

	log.Println("Routes configured!")

	fmt.Println("Starting application on port", portNumber)

	link := fmt.Sprintf("http://localhost%s", portNumber)

	if *dbConnPollSettings.OpenFlag {
		fmt.Println("Opening link in the default browser...")

		// cmd := exec.Command("xdg-open", link) // for Linux
		// cmd := exec.Command("open", link) // for macOS
		cmd := exec.Command("cmd", "/c", "start", link) // for Windows

		err := cmd.Start()

		if err != nil {
			fmt.Println("Error opening link:", err)
		}
	} else {
		fmt.Println("To open the link in the default browser, run with the -o flag.")
	}

	const (
		colorGreen = "\033[32m"
		colorBlue  = "\033[34m"
		colorReset = "\033[0m"
	)

	if _, err := fmt.Fprint(os.Stdout, "Link: "); err != nil {
		fmt.Println("Error printing link:", err)
	}
	if _, err := fmt.Fprintf(os.Stdout, "%s%s%s\n", colorGreen, link, colorReset); err != nil {
		fmt.Println("Error printing link:", err)
	}

	err = srv.ListenAndServe()
	log.Fatal(err)
}

func run(dbConnPoolSettings models.DBConnPoolSettings) (*driver.DB, error) {

	gob.Register(models.Reservation{})
	gob.Register(models.User{})
	gob.Register(models.Room{})
	gob.Register(models.Restriction{})
	gob.Register(map[string]int{})

	mailChan := make(chan models.MailData)
	app.MailChan = mailChan

	infoLog = log.New(os.Stdout, "INFO\t", log.Ldate|log.Ltime)
	app.InfoLog = infoLog

	errorLog = log.New(os.Stdout, "ERROR\t", log.Ldate|log.Ltime|log.Lshortfile)
	app.ErrorLog = errorLog

	session = scs.New()
	session.Lifetime = 24 * time.Hour
	session.Cookie.Persist = true
	session.Cookie.SameSite = http.SameSiteLaxMode
	session.Cookie.Secure = app.InProduction

	app.Session = session

	//connect to database
	log.Println("Connecting to database...")
	connString := fmt.Sprintf("host=%s port=%s dbname=%s user=%s password=%s", *dbConnPoolSettings.DBHost, *dbConnPoolSettings.DBPort, *dbConnPoolSettings.DBName, *dbConnPoolSettings.DBUser, *dbConnPoolSettings.DBPass)
	db, err := driver.ConnectSQL(connString)

	if err != nil {
		log.Fatal("Cannot connect to database! Dying...")
	}

	tc, err := render.CreateTemplateCache()

	if err != nil {
		log.Fatal("cannot create template cache")
		return nil, err
	}

	app.TemplateCache = tc

	repo := handlers.NewRepo(&app, db)
	handlers.NewHandlers(repo)

	render.NewRenderer(&app)

	return db, nil
}
