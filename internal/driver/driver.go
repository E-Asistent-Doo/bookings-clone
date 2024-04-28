package driver

import (
	"database/sql"
	"log"
	"time"

	_ "github.com/jackc/pgx/v5"
	_ "github.com/jackc/pgx/v5/pgconn"
	_ "github.com/jackc/pgx/v5/stdlib"
)

// DB holds the database connection pool
type DB struct {
	SQL *sql.DB
}

var dbConn = &DB{}

const maxOpenDbConn = 10
const maxIdleDbConn = 5
const maxDbLifetime = 5 * time.Minute

// ConnectSQL creates database poll for database
func ConnectSQL(dsn string) (*DB, error) {
	d, err := NewDatabase(dsn)

	if err != nil {
		panic(err)
	}

	d.SetMaxOpenConns(maxOpenDbConn)
	d.SetConnMaxIdleTime(maxIdleDbConn)
	d.SetConnMaxLifetime(maxDbLifetime)

	dbConn.SQL = d

	err = TestDB(d)

	if err != nil {
		return nil, err
	}
	log.Println("Connected to database!")

	return dbConn, nil
}

// Tries ping database
func TestDB(d *sql.DB) error {

	err := d.Ping()

	if err != nil {
		return err
	}

	return nil
}

// Creates new database for application
func NewDatabase(dsn string) (*sql.DB, error) {

	db, err := sql.Open("pgx", dsn)

	if err != nil {
		return nil, err
	}

	if err = db.Ping(); err != nil {
		return nil, err
	}

	return db, nil
}
