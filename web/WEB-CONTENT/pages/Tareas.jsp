<%@ page import="DAO.Tarea.sqlTareaDAO" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="Modelo.Tarea" %>
<%@ page import="java.util.ArrayList" %>
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

    <%
        //  Inicio, obtener datos del proyecto seleccionado
        sqlTareaDAO sql = new sqlTareaDAO();
        ArrayList<Tarea> lista = sql.listar(Integer.parseInt(request.getParameter("cveProyecto")));

        //  Autocomplete
        sqlTareaDAO s = new sqlTareaDAO();
        ArrayList<Tarea> arr =  s.listar(Integer.parseInt(request.getParameter("cveProyecto")));

        ArrayList<String> name = new ArrayList<>();

        for (Tarea tarea : arr) { name.add(tarea.getNombreTarea()); }

    %>

    <script>
        $(function (){

            var nombres = <%= new Gson().toJson(name) %>;

            $('#Buscar').autocomplete({
                source: nombres,
                select: function (event, item){
                    var params = {
                        "tarea": item.item.value
                    }

                    $.get("consultas/cConsultaTR.jsp", params, function(tarea){
                        $('#Titulo').text(tarea['nombreTarea']);
                        $('#PorcentajeNum').text(tarea['porcentaje'] + "%");
                        $('#PorcentajeNum').attr('name',tarea['porcentaje']);
                        $('#PorcentajeBar').attr('style',"width: " + tarea['porcentaje']+"%");
                        $('#PorcentajeBar').attr('class',"progress-bar progress-bar-striped progress-bar-animated " + color(tarea['porcentaje']));
                        $('#Fecha').text(tarea['fechaEntrega']);
                    });
                }
            });
        });
    </script>

    <script>
        let lista = <%=new Gson().toJson(lista)%>;

        function actualizarTarea(element){
            var numeroTarea = $(element).attr('noTarea');
            var pre = $(element).attr('predecesor');
            console.log(lista);
            $('#Titulo').text(lista[numeroTarea]['nombreTarea']);
            $('#PorcentajeNum').text(lista[numeroTarea]['porcentaje'] + "%");
            $('#PorcentajeNum').attr('name',lista[numeroTarea]['porcentaje']);
            $('#PorcentajeBar').attr('style',"width: " + lista[numeroTarea]['porcentaje']+"%");
            $('#PorcentajeBar').attr('class',"progress-bar progress-bar-striped progress-bar-animated " + color(lista[numeroTarea]['porcentaje']));
            $('[borrar]').attr('predecesor',pre);
            $('[editar]').attr('predecesor',pre);
            $('#Fecha').text(lista[numeroTarea]['fechaEntrega']);
        }

        $(function () {

            const ext = <%= lista.size() %>;

            for (var i = 0; i < ext; i++) {
                $('#' + mes(lista[i]['fechaEntrega'].split("-")[1])).append(
                    '<li class="list-group-item" role="button" onclick="actualizarTarea(this)" noTarea="'+i+'" predecesor = "'+ lista[i]["predecesor"] +'">' +
                    '<div class="row mb-3">' +
                    '<div class="col-sm-4">' + lista[i]['nombreTarea'] + '</div>' +
                    '<div class="col-sm-8">' +
                    '<div class="progress">' +
                    '<div class="progress-bar progress-bar-striped progress-bar-animated ' + color(lista[i]['porcentaje']) + '" role="progressbar" style="width: ' + lista[i]['porcentaje'] + '%"></div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</li>'
                );
            }

            $('#TareaActual').append(
                '<div class="card-header">' +
                '<p id="Titulo">'+lista[0]['nombreTarea']+'</p>' +
                '</div>' +
                '<div class="card-body">' +
                '<div class="mb-3">' +
                '<label class="form-label">Porcentaje: </label>' +
                '<div class="row mb-3">' +
                '<div class="col-1">' +
                '<p id="PorcentajeNum" name="'+lista[0]['porcentaje']+'">'+lista[0]['porcentaje']+'%</p>' +
                '</div>' +
                '<div class="col-11">' +
                '<div class="progress">' +
                '<div id="PorcentajeBar" class="progress-bar progress-bar-striped progress-bar-animated '+color(lista[0]['porcentaje'])+'" role="progressbar" style="width: '+lista[0]['porcentaje']+'%"></div>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<div class="mb-3">' +
                '<label class="form-label">Fecha:</label>' +
                '<p id="Fecha">'+lista[0]['fechaEntrega']+'</p>' +
                '</div>' +
                '<div class="mb-3 d-flex justify-content-center">' +
                '<button type="button" class="btn btn-primary me-3" editar predecesor = "'+ lista[0]["predecesor"]+'">Editar</button>' +
                '<button type="button" class="btn btn-danger" borrar predecesor = "'+ lista[0]["predecesor"] +'">Eliminar</button>' +
                '</div>' +
                '</div>'
            );

            $('[agregar]').click(function () {
                Swal.fire({
                    title: "Crear nueva tarea",
                    html: '' +
                        '<div class="text-start">' +
                        '<div class="mb-3">' +
                        '<label class="form-label">Nombre tarea</label>' +
                        '<input type="text" class="form-control swal2-input" id="TareaForm" placeholder="Nombre">' +
                        '</div>' +
                        '<div class="mb-3">' +
                        '<label class="form-label">Porcentaje</label>' +
                        '<div class="row mb-3">' +
                        '<div class="col-3">' +
                        '<input type="number" value="80" step="5" class="form-control" id="PorcentajeNumForm">' +
                        '</div>' +
                        '<div class="col-9">' +
                        '<input type="range" class="form-range" min="0" max="100" step="5" id="PorcentajeBarForm" value="80">' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '<div class="mb-3">' +
                        '<label class="form-label">Fecha</label>' +
                        '<input type="date" class="form-control swal2-input" id="FechaForm">' +
                        '</div>' +
                        '</div>',
                    showCancelButton: true,
                    didOpen: () => {
                        inputNumber = Swal.getContent().querySelector('#PorcentajeBarForm')
                        inputRange = Swal.getContent().querySelector('#PorcentajeNumForm')

                        inputNumber.addEventListener('input', () => {
                            inputRange.value = inputNumber.value
                        })

                        inputRange.addEventListener('change', () => {
                            inputNumber.value = inputRange.value
                        })
                    }
                }).then((result) => {
                    if (result.value) { //validacion de datos
                        var parametro = {
                            "cve": <%=request.getParameter("cveProyecto")%>,
                            "Nombre": $('#TareaForm').val(),
                            "Porcentaje": $('#PorcentajeBarForm').val(),
                            "Fecha": $('#FechaForm').val()
                        };
                        $.post( "consultas/cConsultaTarea.jsp",parametro).done(function() {
                            location.reload();
                        });
                    }
                });
            });

            $('[editar]').click(function () {
                var name = $(this).attr('name');
                Swal.fire({
                    title: "Editar tarea",
                    html: '' +
                        '<div class="text-start">' +
                        '<div class="mb-3">' +
                        '<label class="form-label">Nombre tarea</label>' +
                        '<input type="text" class="form-control swal2-input" id="TareaForm" placeholder="Nombre" value="'+$('#Titulo').text()+'">' +
                        '</div>' +
                        '<div class="mb-3">' +
                        '<label class="form-label">Porcentaje</label>' +
                        '<div class="row mb-3">' +
                        '<div class="col-3">' +
                        '<input type="number" value="'+$('#PorcentajeNum').attr('name')+'" step="5" class="form-control" id="PorcentajeNumForm">' +
                        '</div>' +
                        '<div class="col-9">' +
                        '<input type="range" class="form-range" min="0" max="100" step="5" id="PorcentajeBarForm" value="'+$('#PorcentajeNum').attr('name')+'">' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '<div class="mb-3">' +
                        '<label class="form-label">Fecha</label>' +
                        '<input type="date" value="'+$('#Fecha').text()+'" class="form-control swal2-input" id="FechaForm">' +
                        '</div>' +
                        '</div>',
                    showCancelButton: true,
                    didOpen: () => {
                        inputNumber = Swal.getContent().querySelector('#PorcentajeBarForm')
                        inputRange = Swal.getContent().querySelector('#PorcentajeNumForm')

                        inputNumber.addEventListener('input', () => {
                            inputRange.value = inputNumber.value
                        })

                        inputRange.addEventListener('change', () => {
                            inputNumber.value = inputRange.value
                        })
                    }
                }).then((result) => {
                    if (result.value) {
                        var parametro = {
                            "Nombre": $('#TareaForm').val(),
                            "Porcentaje": $('#PorcentajeBarForm').val(),
                            "Fecha": $('#FechaForm').val(),
                            "cve" : <%=request.getParameter("cveProyecto")%>,
                            "predecesor" : $(this).attr('predecesor'),
                            "Editar": "true"
                        };
                        $.post( "consultas/cConsultaTarea.jsp",parametro).done(function() {
                            location.reload();
                        });
                    }
                });
            });

            $('[borrar]').click(function () {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire(
                            'Deleted!',
                            'Your file has been deleted.',
                            'success'
                        );

                        var parametro = {
                            "cve": <%=request.getParameter("cveProyecto")%>,
                            "predecesor" : $(this).attr('predecesor'),
                            "Borrar" : true
                        };
                        $.post( "consultas/cConsultaTarea.jsp",parametro).done(function() {
                            //$('#' + name).remove();
                            location.reload();
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
            <h1 class="display-4"><%=request.getParameter("nombreProyecto")%></h1>
        </div>
        <div class="col-2 d-flex align-items-center">
            <button type="button" class="btn btn-success me-3" agregar>
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

    </div>

    <br>

    <div class="row row-cols-1 row-cols-md-3 g-4" id="CardMeses">
        <div class="col d-none" name="Enero">
            <div class="card">
                <div class="card-header">
                    Enero
                </div>
                <ul class="list-group list-group-flush" id="Enero">

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