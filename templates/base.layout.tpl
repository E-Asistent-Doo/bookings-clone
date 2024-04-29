{{define "base"}}
    <!doctype html>
    <html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Bookings</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/vanillajs-datepicker@1.0/dist/css/datepicker-bs4.min.css">
        <link rel="stylesheet" type="text/css" href="https://unpkg.com/notie/dist/notie.min.css">
        <link rel="stylesheet" type="text/css" href="/static/css/styles.css">

        <style>
            .my-footer {
                height: 9em;
                background-color: #163b65;
                padding: 1em;
                color: white;
                font-size: 80%;
            }
        </style>
    </head>

    <body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/about">About</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        Rooms
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/generals-quarters">General's Quarters</a>
                        <a class="dropdown-item" href="/majors-suite">Major's Suite</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/search-availability" tabindex="-1" aria-disabled="true">Book Now</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/contact" tabindex="-1" aria-disabled="true">Contact</a>
                </li>
                <li class="nav-item"></li>
                    {{if eq .IsAuthenticated 1}}
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                                Admin
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="/admin/dashboard">Dashboard</a>
                                <a class="dropdown-item" href="/user/logout">Logout</a>
                            </div>
                        </li>     
                    {{else}}
                        <a class="nav-link" href="/user/login" tabindex="-1" aria-disabled="true">Login</a>
                    {{end}}
                </li>
            </ul>

        </div>
    </nav>

    {{block "content" .}}

    {{end}}

    <footer class="row row-cols-1 row-cols-sm-2 row-cols-md-5 py-5 my-5 border-top" style="background-color: #163b65; color: white;">
        <div class="col mb-3">
          <a href="/" class="d-flex align-items-center mb-3 link-body-emphasis text-decoration-none">
            <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
          </a>
          <p class="text-body-secondary">&copy; 2024</p>
        </div>
    
        <div class="col mb-3">
    
        </div>
    
        <div class="col mb-3">
            <strong>Forth Smyte Bad &amp; Breakfast</strong> <br>
            Rocky Broad 101 <br>
            Northbrook, Ontario <br>
            Canada <br>
            (416) 555-333 <br>
            <a href="mailto:info@bookings.com">mMail to: info@bookings.com</a> <br>
        </div>
    
        <div class="col mb-3">

        </div>
    
        <div class="col mb-3">
            <strong>Your HOME away from HOME</strong>
        </div>
      </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
            integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
            integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/vanillajs-datepicker@1.0/dist/js/datepicker-full.min.js"></script>
    <script src="https://unpkg.com/notie"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="/static/js/app.js"></script>

    {{block "js" .}}

    {{end}}

    <script>
        let attention = Prompt();

        (function () {
            'use strict';
            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                let forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();


        function notify(msg, msgType) {
            notie.alert({
                type: msgType,
                text: msg,
            })
        }

        function notifyModal(title, text, icon, confirmationButtonText) {
            Swal.fire({
                title: title,
                html: text,
                icon: icon,
                confirmButtonText: confirmationButtonText
            })
        }

        {{with .Error}}
            notify("{{.}}", "error")
        {{end}}

        {{with .Flash}}
            notify("{{.}}", "success")
        {{end}}

        {{with .Warning}}
            notify("{{.}}", "warning")
        {{end}}
    </script>

    </body>

    </html>
{{end}}