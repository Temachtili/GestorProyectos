<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="es">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">


    <!--    Archivos js locales    -->
    <script src="../js/jquery-3.5.1.js"></script>
    <script src="../js/Tareas.js"></script>


    <!--    Archivos css locales    -->
    <link href="../css/jquery-ui.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/font-awesome-4.7.0/css/font-awesome.min.css">


    <!--    Archivos js externos    -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <title>Gantt</title>
</head>

<body setcve="<%=request.getParameter("cveProyecto")%>">
<nav class="navbar navbar-expand-lg navbar-light bg-light mb-3">
    <div class="container-fluid container">
        <a class="navbar-brand" href="Proyectos.jsp">Organizador de tareas</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="Proyectos.jsp"> Mis proyectos</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container mb-5">
    <div class="row">
        <div class="col-10">
            <h1 class="display-4"><%=request.getParameter("nombreProyecto")%>
            </h1>
        </div>
        <div class="col-2 d-flex align-items-center">
            <button type="button" onclick="agregar()" class="btn btn-success me-3">
                Nueva tarea
            </button>
        </div>
    </div>
    <div class="input-group mb-3 ui-widget">
        <input type="text" class="form-control" id="Buscar" placeholder="Buscar Tarea por Nombre">
        <button class="btn btn-outline-secondary" type="button" id="btnBuscar"><i class="fa fa-search"
                                                                                  aria-hidden="true"></i></button>
    </div>

    <div class="card" id="TareaActual">
        <div class="card-header">
            <p id="Titulo">Tarea de ejemplo</p>
        </div>
        <div class="card-body">
            <div class="mb-3">
                <label class="form-label"></label>
                <div class="row mb-3">
                    <div class="col-1">
                        <p id="PorcentajeNum" name="">Porcentaje: </p>
                    </div>
                    <div class="col-11">
                        <div class="progress">
                            <div id="PorcentajeBar" class="progress-bar progress-bar-striped progress-bar-animated"
                                 role="progressbar" style="width: 100%"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">Fecha:</label>
                <p id="Fecha">05/01/2021 (Ejemplo)</p>
            </div>
            <div class="mb-3 d-flex justify-content-center">
                <button type="button" class="btn btn-primary me-3" onclick="editar(this)" predecesor="">Editar</button>
                <button type="button" class="btn btn-danger" onclick="borrar(this)" predecesor="">Eliminar</button>
            </div>
        </div>
    </div>

    <br>

    <div class="row row-cols-1 row-cols-md-3 g-4" id="CardMeses">
        <div class="col d-none" name="Enero">
            <div class="card">
                <div class="card-header">
                    Enero
                </div>
                <ul class="list-group list-group-flush" id="Enero" noTarea="0">

                </ul>
            </div>
        </div>

        <div class="col d-none" name="Febrero">
            <div class="card">
                <div class="card-header">
                    Febrero
                </div>
                <ul class="list-group list-group-flush" id="Febrero">

                </ul>
            </div>
        </div>

        <div class="col d-none" name="Marzo">
            <div class="card">
                <div class="card-header">
                    Marzo
                </div>
                <ul class="list-group list-group-flush" id="Marzo">

                </ul>
            </div>
        </div>

        <div class="col d-none" name="Abril">
            <div class="card">
                <div class="card-header">
                    Abril
                </div>
                <ul class="list-group list-group-flush" id="Abril">

                </ul>
            </div>
        </div>

        <div class="col d-none" name="Mayo">
            <div class="card">
                <div class="card-header">
                    Mayo
                </div>
                <ul class="list-group list-group-flush" id="Mayo">

                </ul>
            </div>
        </div>

        <div class="col d-none" name="Junio">
            <div class="card">
                <div class="card-header">
                    Junio
                </div>
                <ul class="list-group list-group-flush" id="Junio">

                </ul>
            </div>
        </div>

        <div class="col d-none" name="Julio">
            <div class="card">
                <div class="card-header">
                    Julio
                </div>
                <ul class="list-group list-group-flush" id="Julio">

                </ul>
            </div>
        </div>

        <div class="col d-none" name="Agosto">
            <div class="card">
                <div class="card-header">
                    Agosto
                </div>
                <ul class="list-group list-group-flush" id="Agosto">

                </ul>
            </div>
        </div>

        <div class="col d-none" name="Septiembre">
            <div class="card">
                <div class="card-header">
                    Septiembre
                </div>
                <ul class="list-group list-group-flush" id="Septiembre">

                </ul>
            </div>
        </div>

        <div class="col d-none" name="Octubre">
            <div class="card">
                <div class="card-header">
                    Octubre
                </div>
                <ul class="list-group list-group-flush" id="Octubre">

                </ul>
            </div>
        </div>

        <div class="col d-none" name="Noviembre">
            <div class="card">
                <div class="card-header">
                    Noviembre
                </div>
                <ul class="list-group list-group-flush" id="Noviembre">

                </ul>
            </div>
        </div>

        <div class="col d-none" name="Diciembre">
            <div class="card">
                <div class="card-header">
                    Diciembre
                </div>
                <ul class="list-group list-group-flush" id="Diciembre">

                </ul>
            </div>
        </div>


    </div>
</div>

<div class="bg-light d-flex flex-column align-items-center p-1">
    <p>© Copyright</p>
    <p>Aviles Gama Angel Gael</p>
    <p>Ramos Peña Alejandro Jair</p>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
        crossorigin="anonymous"></script>
</body>

</html>