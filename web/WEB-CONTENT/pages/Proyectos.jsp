<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html lang="es">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <!--    Archivos css locales    -->
    <link rel="stylesheet" type="text/css" href="../css/normalize.css">
    <link href="../css/jquery-ui.css" rel="stylesheet"/>

    <!--    Archivos css externos   -->
    <link rel="stylesheet" href="../css/font-awesome-4.7.0/css/font-awesome.min.css">

    <!--    Archivos js locales -->
    <script src="../js/Proyectos.js"></script>

    <!--    Archivos js externos    -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <title>Gantt</title>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light mb-3">
    <div class="container-fluid container">
        <a class="navbar-brand" href="#">Organizador de tareas</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="#"> Mis proyectos</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-10">
            <h1 class="display-4">Mis proyectos</h1>
        </div>
        <div class="col-2 d-flex align-items-center">
            <button type="button" class="btn btn-success"  id="btn_nuevo">Nuevo Proyecto</button>
        </div>
    </div>

    <div class="input-group mb-3">
        <input type="text" class="form-control" autocomplete="on" id="Buscar" placeholder="Buscar proyecto">
        <button class="btn btn-outline-secondary" type="button" id="btnBuscar"><i class="fa fa-search" aria-hidden="true"></i></button>
    </div>
    <div class="card">
        <ul id="lista-proyectos" class="list-group list-group-flush">
        </ul>
    </div>
    <br>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
        crossorigin="anonymous"></script>

</body>

</html>