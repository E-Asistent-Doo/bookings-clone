package helpers

import (
	"flag"
	"fmt"
	"net/http"
	"runtime/debug"

	"github.com/aleksaDam997/bookings/internal/config"
	"github.com/aleksaDam997/bookings/internal/models"
)

var app *config.AppConfig

func NewHelpers(a *config.AppConfig) {
	app = a
}

func ClientError(w http.ResponseWriter, status int) {
	app.InfoLog.Println("Client error with status of", status)
	http.Error(w, http.StatusText(status), status)
}

func ServerError(w http.ResponseWriter, err error) {
	trace := fmt.Sprintf("%s\n%s", err.Error(), debug.Stack())
	app.ErrorLog.Println(trace)
	http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
}

func IsAuthenticated(r *http.Request) bool {
	exists := app.Session.Exists(r.Context(), "user_id")
	return exists
}

func ExecFlag() models.DBConnPoolSettings {

	inProduction := flag.Bool("production", true, "Application is in production")
	useCache := flag.Bool("cache", true, "Use template cache")
	dbHost := flag.String("dbhost", "localhost", "Database host")
	dbName := flag.String("dbname", "bookings", "Database name")
	dbUser := flag.String("dbuser", "postgres", "Database user")
	dbPass := flag.String("dbpass", "root", "Database password")
	dbPort := flag.String("dbport", "5432", "Database port")
	dbSSL := flag.String("dbssl", "disable", "Database ssl settings (disable, prefer, require)")
	mailhogHost := flag.String("mailhog-host", "localhost", "Mailhog host for ports 1025/8025 on 8025 listening")

	openFlag := flag.Bool("o", false, "Automatically open the link in the default browser")
	flag.Parse()

	app.InProduction = *inProduction
	app.UseCache = *useCache

	return models.DBConnPoolSettings{
		DBHost:      dbHost,
		DBName:      dbName,
		DBUser:      dbUser,
		DBPass:      dbPass,
		DBPort:      dbPort,
		DBSSL:       dbSSL,
		OpenFlag:    openFlag,
		MailhogHost: mailhogHost,
	}
}
