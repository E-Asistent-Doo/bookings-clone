{{template "base" .}}

{{define "content"}}

    <div class="container">

        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 d-block mx-auto">
                <h1 class="mt-5">Search for Availability</h1>

                <form action="/search-availability" method="post">

                <input type="hidden" name="csrf_token" value="{{.CSRFToken}}">

                  <div class="row">
                    <div class="col">
                      <div class="form-group">
                        <label for="start_date" class="form-label">Starting date</label>
                        <input type="date" class="form-control" name="start_date" id="start_date" aria-describedby="startDateHelp" placeholder="Arrival">
                        <small id="startDateHelp" class="form-text form-muted">Enter your starting date in the form of YYYY-MM-DD.</small>
                      </div>
                    </div>
                    <div class="col">
                      <div class="form-group">
                        <label for="end_date" class="form-label">Ending date</label>
                        <input type="date" class="form-control" name="end_date" id="end_date" aria-describedby="endDateHelp" placeholder="Departure">
                        <small id="endDateHelp" class="form-text form-muted">Enter your ending date in the form of YYYY-MM-DD.</small>
                      </div>
                    </div>
                  </div>

                  <button type="submit" class="btn btn-primary">Search Availability</button>
                </form>
            </div>
        </div>

        <button class="btn btn-success" onclick="alert('Hej ti', 'success')">Click me</button>
        <button class="btn btn-danger" onclick="attention.toast({msg: 'Hej bajo'});">Click me 2</button>
        <button id="sbb" class="btn btn-warning">Super blesavi button</button>

    </div>

{{end}}