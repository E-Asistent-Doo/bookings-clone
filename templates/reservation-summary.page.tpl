{{template "base" .}}

{{define "content"}}

{{$res := index .Data "reservation"}}

<div class="container">

        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 d-block mx-auto">
                <h1 class="mt-5"> Reservation summary</h1>

                <table class="table table-striped">
                    <thead></thead>
                    <tbody>
                        <tr>
                            <td>Name:</td>
                            <td>{{$res.FirstName}} {{$res.LastName}}</td>
                        </tr>
                        <tr>
                            <td>Arrival:</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Departure:</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td>{{$res.Email}}</td>
                        </tr>
                        <tr>
                            <td>Phone:</td>
                            <td>{{$res.Phone}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>


{{end}}