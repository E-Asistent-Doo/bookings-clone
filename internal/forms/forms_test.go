package forms

import (
	"net/http"
	"net/http/httptest"
	"net/url"
	"testing"
)

func TestForm_Valid(t *testing.T) {

	var r *http.Request = httptest.NewRequest("POST", "/whatever", nil)

	var form *Form = New(r.PostForm)

	if !form.Valid() {
		t.Error("Form not vlaid when its empty")
	}
}

func TestForm_Required(t *testing.T) {

	var r *http.Request = httptest.NewRequest("POST", "/whatever", nil)

	var form *Form = New(r.PostForm)

	form.Required("a", "b", "c")

	if form.Valid() {
		t.Error("form shows valid when required fields are missing")
	}

	postedData := url.Values{}
	postedData.Add("a", "a")
	postedData.Add("b", "b")
	postedData.Add("c", "c")

	r, _ = http.NewRequest("POST", "/whatever", nil)

	r.PostForm = postedData

	form = New(postedData)
	form.Required("a", "b", "c")

	if !form.Valid() {
		t.Error("shows does not have required fields when it does")
	}
}

func TestForm_Has(t *testing.T) {

	var r *http.Request = httptest.NewRequest("POST", "/whatever", nil)

	var form *Form = New(r.PostForm)

	form.Has("a")

	if form.Valid() {
		t.Error("form shows valid when required fields are missing")
	}

	postedData := url.Values{}

	postedData.Add("a", "abcd")

	r, _ = http.NewRequest("POST", "/whatever", nil)

	r.PostForm = postedData
	form = New(r.PostForm)

	var has bool = form.Has("a")

	if !has {
		t.Error("Returns false when it's all right")
	}

	if !form.Valid() {
		t.Error("shows does not have required fields when it does")
	}
}

func TestForm_MinLength(t *testing.T) {

	var r *http.Request = httptest.NewRequest("POST", "/whatever", nil)

	var form *Form = New(r.PostForm)

	form.MinLength("a", 5)

	if form.Valid() {
		t.Error("form shows valid when required fields are missing")
	}

	postedData := url.Values{}
	postedData.Add("a", "abcd")

	r, _ = http.NewRequest("POST", "/whatever", nil)

	r.PostForm = postedData

	form = New(postedData)

	var satisfied bool = form.MinLength("a", 2)

	if !satisfied {
		t.Error("Please provide positive vlaue for length")
	}

	if !form.Valid() {
		t.Error("shows does not have required fields when it does")
	}
}

func TestForm_Email(t *testing.T) {

	var r *http.Request = httptest.NewRequest("POST", "/whatever", nil)

	var form *Form = New(r.PostForm)

	form.IsEmail("a")

	if form.Valid() {
		t.Error("form shows valid when required fields are missing")
	}

	postedData := url.Values{}

	postedData.Add("a", "abcd@gmail.com")

	r, _ = http.NewRequest("POST", "/whatever", nil)

	r.PostForm = postedData
	form = New(r.PostForm)

	var has bool = form.IsEmail("a")

	if !has {
		t.Error("Returns false when it's all right")
	}

	if !form.Valid() {
		t.Error("shows does not have required fields when it does")
	}
}
