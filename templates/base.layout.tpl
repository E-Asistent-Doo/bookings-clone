{{define "base"}}
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://unpkg.com/notie/dist/notie.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/styles.css">

    <title>Bookings</title>

  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar scroll</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarScroll">
          <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="/">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/about">About</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Rooms
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                <li><a class="dropdown-item" href="/generals-quarters">General's Quarters</a></li>
                <li><a class="dropdown-item" href="/majors-suite">Major's Suite</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="/make-reservation">Make reservation :)</a></li>
              </ul>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/search-availability" tabindex="-1">Book now</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="/contact" tabindex="-1" aria-disabled="true">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
        
        {{block "content" .}}

        {{end}}

        {{block "js" .}}

        {{end}}


    <footer class="py-3 my-4 bg-dark text-light">
        <ul class="nav justify-content-center border-bottom pb-3 mb-3">
          <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
          <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
          <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
          <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
          <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
        </ul>
        <p class="text-center text-muted">&copy; 2021 Company, Inc</p>
      </footer>
    </div>



  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script src="https://unpkg.com/notie"></script>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->

    <script>

      (function() {
          'use strict';
          window.addEventListener('load', function() {

              let forms = document.getElementsByClassName('needs-validation');

              Array.prototype.filter.call(forms, function(form) {

                  form.addEventListener('submit', function(event) {
                      if(form.checkValidity() === false) {
                          event.preventDefault();
                          event.stopPropagation();
                      }

                      form.classList.add('was-validated');
                  }, false);
              });
          }, false);

      })();


      //Type for example success, error, warning
      function notify(msg, type) {
        notie.alert({
          type: type,
          text: msg
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
      function Prompt() {

        const toast = function(c) {

          const {msg = "", icon = "success", position = "top-end"} = c;

          const Toast = Swal.mixin({
            toast: true,
            title: msg,
            position: position,
            icon: icon,
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            didOpen: (toast) => {
              toast.addEventListener('mouseenter', Swal.stopTimer)
              toast.addEventListener('mouseleave', Swal.resumeTimer)
            }
          });


          Toast.fire({});
        }

        const success = function() {

          const {msg = "", title = "", footer = ""} = c;

          Swal.fire({
            icon: "success",
            title: title,
            text: msg,
            footer: footer
          })
        }

        
        const error = function() {

        const {msg = "", title = "", footer = ""} = c;

        Swal.fire({
          icon: "error",
          title: title,
          text: msg,
          footer: footer
        })
        }

        return {
          toast,
          success,
          error
        }
      }

      const attention = new Prompt();


      async function custom(c) {
        const { msg = "", title = "" } = c;

        const { value: result } = await Swal.fire({
          title: title,
          html: msg,
          backdrop: false,
          focusConfirm: false,
          showCancelButton: true,
          willOpen: () => {
            
            if (c.willOpen !== undefined) c.willOpen();

            // const elem = document.getElementById('reservation-dates-modal');
            // const rp = new DateRangePicker(elem, {
            //   format: 'yyyy-mm-dd',
            //   showOnFocus: true
            // })
          },
          preConfirm: () => {
            return [
              document.getElementById('start_date').value,
              document.getElementById('end_date').value
            ];
          },
          didOpen: () => {
            if(c.didOpen !== undefined) c.didOpen();
          }
        });

        if (result) {
          if (result.dismiss !== Swal.DismissReason.cancel) {
            if (result.value !== "") {
              if (c.callback !== undefined) {
                c.callback(result);
              }
            } else {
              c.callback(false);
            }
          } else {
            c.callback(false);
          }
        }
      }

    </script>


  </body>
</html>
{{end}}