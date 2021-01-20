<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="es">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="normalize.css">
    <link rel="stylesheet" type="text/css" href="Estilo.css">
    <link rel="stylesheet" href="../css/font-awesome-4.7.0/css/font-awesome.min.css">

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
            <h1 class="display-4">Nombre del proyecto</h1>
        </div>
        <div class="col-2 d-flex align-items-center">
            <button type="button" class="btn btn-success me-3" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Nueva tarea
            </button>
        </div>
    </div>
    <div class="input-group mb-3">
        <input type="text" class="form-control" id="Buscar" placeholder="Buscar Actividad / Fecha / Nombre">
        <button class="btn btn-outline-secondary" type="button" id="btnBuscar"><i class="fa fa-search"
                                                                                  aria-hidden="true"></i></button>
    </div>

    <div class="card">
        <div class="card-header">
            Tarea 1
        </div>
        <div class="card-body">
            <div class="mb-3">
                <label class="form-label">Nombre tarea</label>
                <input type="text" class="form-control" id="Tarea" placeholder="Nombre" disabled>
            </div>
            <div class="mb-3">
                <label class="form-label">Porcentaje</label>
                <div class="row mb-3">
                    <div class="col-1">
                        <p id="PorcentajeNum">80%</p>
                    </div>
                    <div class="col-11">
                        <input type="range" class="form-range" min="0" max="100" step="5" id="PorcentajeBar" disabled>
                    </div>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">Fecha</label>
                <input type="date" class="form-control" id="Fecha" disabled>
            </div>
            <div class="mb-3 d-flex justify-content-center">
                <button type="button" class="btn btn-primary me-3" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Editar
                </button>
                <button type="button" class="btn btn-danger">
                    Eliminar
                </button>
            </div>
        </div>
    </div>

    <br>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    Enero
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <div class="row mb-3">
                            <div class="col-sm-4">Tarea 1</div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning"
                                         role="progressbar" style="width: 75%"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row mb-3">
                            <div class="col-sm-4">Tarea 2</div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-success"
                                         role="progressbar" style="width: 78%"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row mb-3">
                            <div class="col-sm-4">Tarea 3</div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger"
                                         role="progressbar" style="width: 25%"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col">
            <div class="card">
                <div class="card-header">
                    Febrero
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <div class="row mb-3">
                            <div class="col-sm-4">Tarea 1</div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning"
                                         role="progressbar" style="width: 75%"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row mb-3">
                            <div class="col-sm-4">Tarea 2</div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-success"
                                         role="progressbar" style="width: 78%"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row mb-3">
                            <div class="col-sm-4">Tarea 3</div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger"
                                         role="progressbar" style="width: 25%"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row mb-3">
                            <div class="col-sm-4">Tarea 4</div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-sucess"
                                         role="progressbar" style="width: 55%"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col">
            <div class="card">
                <div class="card-header">
                    Marzo
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <div class="row mb-3">
                            <div class="col-sm-4">Tarea 1</div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning"
                                         role="progressbar" style="width: 75%"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row mb-3">
                            <div class="col-sm-4">Tarea 2</div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-success"
                                         role="progressbar" style="width: 78%"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row mb-3">
                            <div class="col-sm-4">Tarea 3</div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger"
                                         role="progressbar" style="width: 25%"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col">
            <div class="card">
                <div class="card-header">
                    Abril
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <div class="row mb-3">
                            <div class="col-sm-4">Tarea 1</div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning"
                                         role="progressbar" style="width: 75%"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row mb-3">
                            <div class="col-sm-4">Tarea 2</div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-success"
                                         role="progressbar" style="width: 78%"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row mb-3">
                            <div class="col-sm-4">Tarea 3</div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger"
                                         role="progressbar" style="width: 25%"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col">
            <div class="card">
                <div class="card-header">
                    Mayo
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <div class="row mb-3">
                            <div class="col-sm-4">Tarea 1</div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning"
                                         role="progressbar" style="width: 75%"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row mb-3">
                            <div class="col-sm-4">Tarea 2</div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-success"
                                         role="progressbar" style="width: 78%"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row mb-3">
                            <div class="col-sm-4">Tarea 3</div>
                            <div class="col-sm-8">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger"
                                         role="progressbar" style="width: 25%"></div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

    </div>

    <br>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Crear Nueva Tarea</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="mb-3">
                        <label class="form-label">Nombre tarea</label>
                        <input type="text" class="form-control" id="TareaForm" placeholder="Nombre">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Porcentaje</label>
                        <div class="row mb-3">
                            <div class="col-1">
                                <p id="PorcentajeNumForm">80%</p>
                            </div>
                            <div class="col-11">
                                <input type="range" class="form-range" min="0" max="100" step="5" id="PorcentajeBarForm">
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Fecha</label>
                        <input type="date" class="form-control" id="FechaForm">
                    </div>

                </div>
                <div class="modal-footer">
                    <div class="mx-auto">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" id="Guardar">Guardar</button>
                    </div>
                </div>
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