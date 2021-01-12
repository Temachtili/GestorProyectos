<%--
  Created by IntelliJ IDEA.
  User: Temachtili
  Date: 1/12/2021
  Time: 11:28 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pruebas</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">


    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <%@ page import="DAO.Tarea.sqlTareaDAO" %>
    <%@ page import="DAO.Tarea.TareaDAO" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="Modelo.Tarea" %>
    <%@ page import="java.util.List" %>
    <%@ page import="com.google.gson.Gson" %>
    <%@ page import="java.nio.charset.StandardCharsets" %>
    <%
        TareaDAO sql = new sqlTareaDAO();
        ArrayList<Tarea> arr = (ArrayList<Tarea>) sql.listar();

        List<String> nombresTareas = new ArrayList<>();
        for (Tarea tarea : arr) {
            String nombre = StandardCharsets.UTF_8.encode(tarea.getNombreTarea() + " " + tarea.getFechaEntrega() + " " + tarea.getProgreso());
            nombresTareas.add(nombre);
        }

        String x = new Gson().toJson(nombresTareas); // anyObject = List<Bean>, Map<K, Bean>, Bean, String, etc..

    %>

    <script>

        $( function () {

            var nombresTareas = null;

            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function (){ nombresTareas = JSON.parse(this.responseText); };

            $('#Buscar').autocomplete({
                source: nombresTareas,
                select: function (event, item){
                    var params = {
                        cliente: item.item.value
                    }

                    $.get("consultas/cConsultaTR.jsp", params, function (response){
                        var json = JSON.parse(response);

                        var nombreTarea = json[0]['nombreTarea'];
                        var fechaEntrega = json[0]['fechaEntrega'];
                        var progreso = json[0]["progreso"];
                    })

                    xhttp.open("POST", "consultaTiempoReal", true);
                    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    xhttp.send("nombresTareas = " + JSON.stringify(Array.from()))
                }
            });

        });


    </script>

</head>

<body>

    <div class="progress">
        <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>

</body>
</html>
