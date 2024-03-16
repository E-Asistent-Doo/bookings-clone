package forms

import (
	"fmt"
	"net/url"
	"strings"

	"github.com/asaskevich/govalidator"
)

type Form struct {
	url.Values
	Errors errors
}

func New(data url.Values) *Form {

	return &Form{
		data,
		errors(map[string][]string{}),
	}
}

func (f *Form) Valid() bool {

	return len(f.Errors) == 0
}

func (f *Form) Required(fields ...string) {

	for _, field := range fields {

		value := f.Get(field)

		if strings.TrimSpace(value) == "" {
			f.Errors.Add(field, "This field cannot be blank")
		}
	}
}

func (f *Form) Has(field string) bool {

	x := f.Get(field)

	if x == "" {
		f.Errors.Add(field, "This field cannot be blank")
		return false
	}

	return true
}

func (f *Form) MinLength(field string, length int) bool {

	if length <= 0 {
		fmt.Println("Tried to specify MinLength validator to be less or equal to zero (length <= 0)")
		return false
	}

	x := f.Get(field)

	if len(x) < length {
		f.Errors.Add(field, fmt.Sprintf("This field must to be at least %d characters long", length))
		return false
	}

	return true

}

func (f *Form) IsEmail(field string) bool {
	if !govalidator.IsEmail(f.Get(field)) {
		f.Errors.Add(field, "Invalid email address")
		return false
	}

	return true
}
