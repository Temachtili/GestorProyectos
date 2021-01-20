<%@ page import="DAO.Tarea.TareaDAO" %>
<%@ page import="DAO.Proyecto.ProyectoDAO" %>
<%@ page import="DAO.Proyecto.sqlProyectoDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Modelo.Proyecto" %>
<%@ page import="Modelo.Tarea" %>
<%@ page import="com.google.gson.Gson" %>
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
    <link rel="stylesheet" type="text/css" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/font-awesome-4.7.0/css/font-awesome.min.css">
    <script src="../js/jquery-3.5.1.js"></script>
    <script src="../js/main.js"></script>

    <title>Gantt</title>

    <%
        ProyectoDAO p = new sqlProyectoDAO();
        ArrayList<Proyecto> lista = p.listar(1);

        ArrayList<String> nombres = new ArrayList<>();

        for (Proyecto pro : lista){ nombres.add(pro.getNombreProyecto()); }

        System.out.println(nombres);

        if(request.getParameter("NombreProyecto") != null){
            Proyecto nuevoProyecto = new Proyecto(request.getParameter("NombreProyecto"));
            ProyectoDAO sql = new sqlProyectoDAO();
            sql.insertar(nuevoProyecto);
        }

    %>

    <style>
        .lista:hover{
            cursor: pointer;
        }
    </style>
    
    <script>
        let lista = <%=new Gson().toJson(nombres)%>;

        $( function (){
            for (let i of lista){
                console.log("dato " + i);

                const contenedor = document.getElementById("lista-proyectos");
                let listaProyectos = `
                    <li id="`+ i +`" class="list-group-item lista" onclick="llamarTareas("`+i+`")">
                        <div class="row">
                            <div class="col-10">`+i+`</div>
                            <div class="col-1">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Nuevo_Proyecto">Editar</button>
                            </div>
                            <div class="col-1">
                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#Confirmar_Borrar">Borrar</button>
                            </div>
                        </div>
                    </li>`;

                contenedor.insertAdjacentHTML("beforeend", listaProyectos);

            }
        });
    </script>

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
            <button type="button" class="btn btn-success"  data-bs-toggle="modal" data-bs-target="#Nuevo_Proyecto">Nuevo Proyecto</button>
        </div>
    </div>

    <div class="input-group mb-3">
        <input type="text" class="form-control" id="Buscar" placeholder="Buscar proyecto">
        <button class="btn btn-outline-secondary" type="button" id="btnBuscar"><i class="fa fa-search" aria-hidden="true"></i></button>
    </div>
    <div class="card">
        <ul id="lista-proyectos" class="list-group list-group-flush">

        </ul>
    </div>

    <br>

    <!-- Modal -->
    <div class="modal fade" id="Nuevo_Proyecto" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Titulo_Modal">Crear Nueva Proyecto</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="mb-3">
                        <label class="form-label">Nombre del proyecto</label>
                        <input type="text" class="form-control" id="Nombre_Proyecto" placeholder="Nombre">
                    </div>

                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" id="Guardar">Guardar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="Confirmar_Borrar" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Borrar proyecto</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <div class="d-flex align-items-center flex-column">
                            <p class="fs-4 text-center">¿Seguro que desea borrar de forma permanente este proyecto?</p>
                        </div>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-danger" id="Borrar">Borrar</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
        crossorigin="anonymous"></script>

<script>
    $(document).ready(function() {
        $("#Guardar").click(function () {
            var parametro = {"NombreProyecto" : $('#Nombre_Proyecto').val()};
            $.ajax({
                data:  parametro,
                url:   'Proyectos.jsp',
                type:  'post',
                success:  function () {
                    $('#lista-proyectos').append(
                        '<li class="list-group-item">'+
                            '<div class="row">' +
                                '<div class="col-10">' +
                                    $('#Nombre_Proyecto').val()+
                                '</div>' +
                                '<div class="col-1">' +
                                    '<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Nuevo_Proyecto">Editar</button>' +
                                '</div>' +
                                '<div class="col-1">' +
                                '   <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#Confirmar_Borrar">Borrar</button>' +
                                '</div>' +
                            '</div>' +
                        '</li>');
                }
            });

        });
    });
</script>

</body>

</html>