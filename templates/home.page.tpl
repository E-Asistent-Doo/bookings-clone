{{template "base" .}}

{{define "content"}}

 <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-bs-ride="carousel">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="/static/images/woman-laptop.png" class="d-block w-100" alt="Woman and laptop">
          <div class="carousel-caption d-none d-md-block">
            <h5>First slide label</h5>
            <p>Some representative placeholder content for the first slide.</p>
          </div>
        </div>
        <div class="carousel-item">
          <img src="/static/images/tray.png" class="d-block w-100" alt="Outside">
          <div class="carousel-caption d-none d-md-block">
            <h5>Second slide label</h5>
            <p>Some representative placeholder content for the second slide.</p>
          </div>
        </div>
        <div class="carousel-item">
          <img src="/static/images/outside.png" class="d-block w-100" alt="Tray">
          <div class="carousel-caption d-none d-md-block">
            <h5>Third slide label</h5>
            <p>Some representative placeholder content for the third slide.</p>
          </div>
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
    
    <div class="container">

      <div class="row">
        <div class="col">
          <h1 class="text-center mt-4">
            Welcome to Fort Smythe Bed and Breakfast
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
      <div class="d-flex justify-content-center align-items-center">
        <a href="/search-availability" class="btn btn-success w-50">Make Reservation Now</a>
      </div>


    </div>

{{end}}