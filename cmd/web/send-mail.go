package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"strings"
	"time"

	"github.com/aleksaDam997/bookings/internal/models"
	mail "github.com/xhit/go-simple-mail/v2"
)

func listenForMail(mailhogHost *string) {
	go func() {
		for {
			msg := <-app.MailChan
			sendMsg(msg, mailhogHost)
		}
	}()
}

func sendMsg(m models.MailData, mailhogHost *string) {
	server := mail.NewSMTPClient()
	server.Host = *mailhogHost
	server.Port = 1025
	server.KeepAlive = false
	server.ConnectTimeout = 10 * time.Second
	server.SendTimeout = 10 * time.Second

	client, err := server.Connect()
	if err != nil {
		log.Println("PLEASE START MAILHOG MANULAY FROM APP FOLDER, Error connecting to SMTP server:", err)
		return
	}

	email := mail.NewMSG()
	email.SetFrom(m.From).AddTo(m.To).SetSubject(m.Subject)

	if m.Template == "" {
		email.SetBody(mail.TextHTML, string(m.Content))
	} else {
		templatePath := fmt.Sprintf("./email-templates/%s", m.Template)
		templateContent, err := ioutil.ReadFile(templatePath)
		if err != nil {
			log.Println("PLEASE START MAILHOG MANULAY FROM APP FOLDER, Error reading template file:", err)
			return
		}

		msgToSend := strings.Replace(string(templateContent), "[%body%]", m.Content, 1)
		email.SetBody(mail.TextHTML, msgToSend)
	}

	err = email.Send(client)
	if err != nil {
		log.Println("PLEASE START MAILHOG MANULAY FROM APP FOLDER, Error sending email:", err)
	} else {
		log.Println("Email sent!")
	}
}
