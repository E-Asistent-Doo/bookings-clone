{{template "base" .}}

{{define "content"}}
<div class="container">
    <div class="row">
        <div class="col">
            <h1>Login</h1>
            {{$res := index .Data "reservation"}}
            <form method="post" action="/user/login">
                <input type="hidden" name="csrf_token" value="{{.CSRFToken}}">

                <div class="form-group mt-3">
                    <label for="email">Email:</label>
                    {{with .Form.Errors.Get "email"}}
                        <label class="text-danger">{{.}}</label>
                    {{end}}
                    <input class="form-control {{with .Form.Errors.Get "email"}} is-invalid {{end}}"
                        id="email" autocomplete="on" type='text'
                        name='email' value="{{$res.Email}}" required>
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    {{with .Form.Errors.Get "Password"}}
                        <label class="text-danger">{{.}}</label>
                    {{end}}
                    <input class="form-control {{with .Form.Errors.Get "Password"}} is-invalid {{end}}"
                        id="password" autocomplete="on" type='password'
                        name='password' value="{{$res.Password}}" required>
                </div>

                <hr />

                <input type="submit" class="btn btn-primary" value="submit">
            </form>
        </div>
    </div>
</div>
{{end}}