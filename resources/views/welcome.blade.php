<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>GlucosApp - Api</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <style>
            body {
                font-family: 'Nunito', sans-serif;
            }
        </style>
    </head>
    <body class="antialiased" style="margin: 5%">
        <nav id="sideNav">
            <h1>Dokumentasi API Glucos App</h1>
            <p><b>End Point : </b>https://glucos-app.as.r.appspot.com/api</b></p>
            <div>
                <ul>
                    <li><a href="#register">Register</a></li>
                    <li><a href="#login">Login</a></li>
                </ul>
        </nav>

        <!-- Register-->
            <section id="register">
            </br>
                <div>
                    <h1>
                        Register
                    </h1>
                    <ul>
                        <li>URL</li>
                            <ul>
                                <li><b style="color: rgb(26, 0, 139)">/register</b></li>
                            </ul>
                        <li>Method</li>
                            <ul>
                                <li><b  style="color: rgb(26, 0, 139)">POST</b></li>
                            </ul>
                        <li>Request Body</li>
                            <ul>
                                <li><b  style="color: rgb(26, 0, 139)" >name</b> as <b  style="color: rgb(26, 0, 139)" >String</b></li>
                                <li><b  style="color: rgb(26, 0, 139)" >email</b> as <b  style="color: rgb(26, 0, 139)" >String,</b> unique</li>
                                <li><b  style="color: rgb(26, 0, 139)" >password</b> as <b  style="color: rgb(26, 0, 139)" >String,</b> minimum 6 char</li>
                            </ul>
                        <li>Response</li>
                            <pre v-pre="" data-lang="json"><code class="lang-json">{
    "success": {
        "message": "User Created",
        "name": "Wahdina"
    }
}</code></pre>
                    </ul>
            </section>


            <!-- Login-->
            <section id="login">
                </br></br></br></br>
                <div>
                    <h1>
                        Login
                    </h1>
                    <ul>
                        <li>URL</li>
                            <ul>
                                <li><b style="color: rgb(26, 0, 139)">/login</b></li>
                            </ul>
                        <li>Method</li>
                            <ul>
                                <li><b  style="color: rgb(26, 0, 139)">POST</b></li>
                            </ul>
                        <li>Request Body</li>
                            <ul>
                                <li><b  style="color: rgb(26, 0, 139)" >email</b> as <b  style="color: rgb(26, 0, 139)" >String</b></li>
                                <li><b  style="color: rgb(26, 0, 139)" >password</b> as <b  style="color: rgb(26, 0, 139)" >String,</b></li>

                            </ul>
                        <li>Response</li>
                            <pre v-pre="" data-lang="json"><code class="lang-json">{
    "success": {
        "token": "3VraFasKAHabTnwSxSlbScN525n5hlg2zlS72ibXUa1N4LWgy78f2PwpckTT",
        "name": "Wahdina"
    }
}</code></pre>
                    </ul>
            </section>









    </body>

</html>
