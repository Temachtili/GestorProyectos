<%@ page import="DAO.Proyecto.ProyectoDAO" %>
<%@ page import="DAO.Proyecto.sqlProyectoDAO" %>
<%@ page import="Modelo.Proyecto" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.ArrayList" %>
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

    <link href="../css/jquery-ui.css" rel="stylesheet"/>

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script src="../js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <title>Gantt</title>

    <%
        sqlProyectoDAO p = new sqlProyectoDAO();
        ArrayList<Proyecto> lista =  p.traerTodo();

        if(request.getParameter("NombreProyecto") != null){
            ProyectoDAO sql = new sqlProyectoDAO();
            sql.insertar(new Proyecto(request.getParameter("NombreProyecto")));
        }

        if(request.getParameter("Borrar") != null){
            ProyectoDAO sql = new sqlProyectoDAO();
            sql.eliminar(new Proyecto(Integer.parseInt(request.getParameter("Borrar"))));
        }

        if(request.getParameter("Actualizar") != null){
            ProyectoDAO sql = new sqlProyectoDAO();
            sql.cambiar(new Proyecto(Integer.parseInt(request.getParameter("cveProyecto")),request.getParameter("Actualizar")));
        }


        /*  Creacion del array para autocompletar el input.text */
        ArrayList<String> name = new ArrayList<>();
        for (Proyecto proyecto : lista) { name.add(proyecto.getNombreProyecto());  }

    %>
    
    <script>
        //  Consulta proyectos
            $(buscarProyectos(""));

            var nombres = <%= new Gson().toJson(name) %>;

            function buscarProyectos(proyectos){

                var params = {
                    "proyectos": proyectos
                }

                $.ajax({
                    url: 'consultas/cConsultaProyecto.jsp',
                    type: 'GET',
                    dataType: 'html',
                    data: params

                })
                .done(function (response){
                    $("#lista-proyectos").html(response);
                })
                .fail(function (){
                    console.log("error")
                })
            }

            $(document).on('keyup', '#Buscar', function (){
                var valor = $(this).val();
                if (valor != ""){
                    buscarProyectos(valor);
                }else{
                    buscarProyectos("");
                }
            })

    </script>

    <script>
        function borrar(x){
            var cve = $(x).attr('cve');
            console.log(cve);
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#dd3333',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                        'Deleted!',
                        'Your file has been deleted.',
                        'success'
                    );

                    var parametro = {"Borrar" : cve};
                    $.ajax({
                        data:  parametro,
                        url:   'Proyectos.jsp',
                        type:  'post',
                        success:  function () {
                            $("[cve='" + cve + "']").remove();
                        }
                    });
                }
            });
        }

        function editar(x){
            var name = $(x).attr('name');
            var cve = $(x).attr('cve');
            Swal.fire({
                title: "Editar nombre",
                input: 'text',
                inputValue: name,
                inputPlaceholder: 'Nombre del proyecto',
                showCancelButton: true
            }).then((result) => {
                if (result.value) {
                    var parametro = {"Actualizar" : result.value, "cveProyecto" : cve};
                    $.ajax({
                        data:  parametro,
                        url:   'Proyectos.jsp',
                        type:  'post',
                        success:  function () {
                            $("p[name='"+name+"']").text(result.value);
                        }
                    });
                }
            });
        }

        function tarea(x){
            var id = $(x).attr('id');
            var nombre = $(x).attr('name');
            $(location).attr('href','Tareas.jsp?cveProyecto='+id+'&nombreProyecto='+ nombre);
        }

        $(document).ready(function() {

            //  Agregar proyectos
            $('#btn_nuevo').click(function () {
                Swal.fire({
                    title: "Crear nuevo proyecto",
                    input: 'text',
                    inputPlaceholder: 'Nombre del proyecto',
                    showCancelButton: true
                }).then((result) => {
                    if (result.value) {
                        var parametro = {"NombreProyecto" : result.value};
                        $.ajax({
                            data:  parametro,
                            url:   'Proyectos.jsp',
                            type:  'post',
                            success:  function () {
                                buscarProyectos("");
                            }
                        });
                    }
                });
            });
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