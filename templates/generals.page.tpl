{{template "base" .}}

{{define "content"}}

<div class="container">

        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 d-block mx-auto">
                <img src="/static/images/generals-quarters.png" class="img-fluid img-thumbnail" alt="room image">
            </div>
        </div>

      <div class="row">
        <div class="col">
          <h1 class="text-center mt-4">
            General's quarters
          </h1>
          <p>
            Your home away from home, set on the majestic waters of the Atlantic Ocean, this will be a vacation to remember.
            Your home away from home, set on the majestic waters of the Atlantic Ocean, this will be a vacation to remember.
            Your home away from home, set on the majestic waters of the Atlantic Ocean, this will be a vacation to remember.
            Your home away from home, set on the majestic waters of the Atlantic Ocean, this will be a vacation to remember.
            Your home away from home, set on the majestic waters of the Atlantic Ocean, this will be a vacation to remember.
          </p>
        </div>
      </div>
      <div class="row">
        <a id="search-availability-btn" href="make-reservation-gq" class="btn btn-success">Check availability</a>
      </div>


    </div>

{{end}}

{{block "js" .}}
            <script>


                document.getElementById("search-availability-btn").addEventListener('click', (e) => {
                    e.preventDefault();

                        const html = `<form id="check-availability-form" action="" method="post" novalidate class="needs-validation">

                        <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label for="start_date" class="form-label">Starting date</label>
                              <input type="date" class="form-control" id="start_date" aria-describedby="startDateHelp" placeholder="Arrival">
                            </div>
                          </div>
                          <div class="col">
                            <div class="form-group">
                              <label for="end_date" class="form-label">Ending date</label>
                              <input type="date" class="form-control" id="end_date" aria-describedby="endDateHelp" placeholder="Departure">
                            </div>
                          </div>
                        </div>
                      </form>`

                        custom({
                            msg: html,
                            title: 'Random title',
                            willOpen: () => {
                              const elem = document.getElementById('reservation-dates-modal');
                              // const rp = new DateRangePicker(elem, {
                              //   format: 'yyyy-mm-dd',
                              //   showOnFocus: true
                              // })
                            },
                            didOpen: () => {
                              document.getElementById('start_date').removeAttribute('disabled');
                              document.getElementById('end_date').removeAttribute('disabled');
                            },
                            callback: function (result) {
                              console.log(result);

                              let form = document.getElementById("check-availability-form");
                              let formData = new FormData(form);
                              formData.append("csrf_token", "{{.CSRFToken}}")

                              fetch('/search-availability-json', {
                                method: "post",
                                body: formData
                              })
                                .then(response => response.json())
                                .then(data => {
                                  console.log(data);
                                })
                            }
                        })
                })
            </script>
        {{end}}

