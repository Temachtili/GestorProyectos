<%@ page import="DAO.Proyecto.ProyectoDAO" %>
<%@ page import="DAO.Proyecto.sqlProyectoDAO" %>
<%@ page import="Modelo.Proyecto" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.TreeMap" %>
<%@ page import="java.util.List" %>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <title>Gantt</title>

    <%
        ProyectoDAO p = new sqlProyectoDAO();
        List lista =  p.listar(1);
        System.out.println(lista);

        //Map<Integer, String> listado = new TreeMap<>();

        //for (Proyecto pro : p.listar(1)){ listado.put(pro.getCveProyecto(), pro.getNombreProyecto()); }

        //System.out.println("lista: " + listado);
        //System.out.println("extensión: " + listado.size());

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
    %>
    
    <script>
        let lista = <%=new Gson().toJson(lista)%>;
        console.log(lista);
        const ext = <%= lista.size() %>;

        $( function (){

            for (var i = 0; i < ext; i++){
                const contenedor = document.getElementById("lista-proyectos");
                let listaProyectos = `
                    <li id="`+ lista[i]['cveProyecto'] +`" class="list-group-item lista" role="button">
                        <div class="row">
                            <div class="col-10">
                                <p name="`+ lista[i]['nombreProyecto'] +`">`+ lista[i]['nombreProyecto'] +`</p>
                            </div>
                            <div class="col-1">
                                <button type="button" class="btn btn-primary" editar cve="`+ lista[i]['cveProyecto'] +`" name="`+ lista[i]['nombreProyecto'] +`">Editar</button>
                            </div>
                            <div class="col-1">
                                <button type="button" class="btn btn-danger" borrar cve="`+ lista[i]['cveProyecto'] +`">Borrar</button>
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
            <button type="button" class="btn btn-success"  id="btn_nuevo">Nuevo Proyecto</button>
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
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
        crossorigin="anonymous"></script>

<script>
    $(document).ready(function() {
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
                            $('#lista-proyectos').append(
                            '<li class="list-group-item" id="'+$('#Nombre_Proyecto').val()+'">'+
                                '<div class="row">' +
                                    '<div class="col-10">' +
                                        '<p name="'+result.value+'">'+result.value +'</p>' +
                                    '</div>' +
                                    '<div class="col-1">' +
                                        '<button type="button" class="btn btn-primary" editar name="'+result.value+'">Editar</button>' +
                                    '</div>' +
                                    '<div class="col-1">' +
                                    '   <button type="button" class="btn btn-danger" borrar name="'+result.value+'">Borrar</button>' +
                                    '</div>' +
                                '</div>' +
                            '</li>');
                            location.reload();
                        }
                    });
                }
            });
        });

        $('[borrar]').click(function () {
            var cve = $(this).attr('cve');
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
                            $('#' + cve).remove();
                        }
                    });
                }
            });
        });
        // Editar
        $('[editar]').click(function () {
            var name = $(this).attr('name');
            var cve = $(this).attr('cve');
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
        });
    });
</script>

</body>

</html>