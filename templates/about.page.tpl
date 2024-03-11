{{template "base" .}}

{{define "content"}}

    <div class="container">
        <h1>Hi this is About page</h1>
    </div>
    <p>This came from template data: {{index .StringMap "test"}}</p>
    <h3> HI buddy </h3>
    <p>

        {{ if ne (index .StringMap "remote_ip") ""}}
            Your remote ip address is {{index .StringMap "remote_ip"}}
        {{else}}
            I don't know your ip address yet visit <a href="/">Home page</a> so i can see it
        {{end}}

    </p>

    <img src="/static/images/house.jpg" width="1920" height="1050" />

{{end}}