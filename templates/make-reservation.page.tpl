{{template "base" .}}

{{define "content"}}

    <div class="container">

        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 d-block mx-auto">
                <h1 class="mt-5">Make Reservation</h1>
                <p>Details about reservation</p>

                {{$res := index .Data "reservation"}}

                <form action="/make-reservation" method="post" class="" novalidate>
                  <input type="hidden" name="csrf_token" value="{{.CSRFToken}}">
                  <div class="row">
                    <div class="col">
                      <div class="form-group">
                        <label for="first_name" class="form-label">First name:</label>
                        {{with .Form.Errors.Get "first_name"}}
                          <label class="text-danger">{{.}}</label>
                        {{end}}
                        <input class="form-control {{with .Form.Errors.Get "first_name"}} is-invalid {{end}}"
                        type="text" id="first_name" name="first_name" value="{{$res.FirstName}}" required autocomplete="off">
                      </div>
                    </div>
                    <div class="col">
                      <div class="form-group">
                        <label for="last_name" class="form-label">Last name: </label>
                        {{with .Form.Errors.Get "last_name"}}
                          <label class="text-danger">{{.}}</label>
                        {{end}}
                        <input type="text" class="form-control {{with .Form.Errors.Get "last_name"}} is-invalid {{end}}"
                         id="last_name" name="last_name" value="{{$res.LastName}}" required autocomplete="off">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group">
                        <label for="email" class="form-label">Email: </label>
                        {{with .Form.Errors.Get "email"}}
                          <label class="text-danger">{{.}}</label>
                        {{end}}
                        <input type="email" class="form-control {{with .Form.Errors.Get "email"}} is-invalid {{end}}"
                         id="email" name="email" value="{{$res.Email}}" required autocomplete="off">
                      </div>
                  </div>
                  <div class="row">
                    <div class="form-group">
                        <label for="phone" class="form-label">Phone: </label>
                        {{with .Form.Errors.Get "phone"}}
                          <label class="text-danger">{{.}}</label>
                        {{end}}
                        <input type="phone"class="form-control {{with .Form.Errors.Get "phone"}} is-invalid {{end}}"
                         id="phone" name="phone" value="{{$res.Phone}}" required autocomplete="off">
                      </div>
                  </div>

                  <button type="submit" class="btn btn-primary mt-3">Make reservation</button>
                </form>
            </div>
        </div>




    </div>

{{end}}