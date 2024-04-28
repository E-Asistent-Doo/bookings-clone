package main

import (
	"testing"

	"github.com/aleksaDam997/bookings/internal/helpers"
)

func TestRun(t *testing.T) {

	dbConnPollSettings := helpers.ExecFlag()

	_, err := run(dbConnPollSettings)

	if err != nil {
		t.Error("failed run()")
	}
}
