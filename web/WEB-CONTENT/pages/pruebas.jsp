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
    <%
        TareaDAO sql = new sqlTareaDAO();
        //ArrayList<Tarea> arr =  sql.listar();

        ArrayList<String> nombresTareas = new ArrayList<>();

        /*for (Tarea tarea : arr) {
            String nombre = tarea.getNombreTarea() + " " + tarea.getFechaEntrega() + " " + tarea.getPorcentaje();
            nombresTareas.add(nombre);
        }*/

        nombresTareas.add("Primer Proyecto 22/02/2021 70");
        nombresTareas.add("Segundo Proyecto 25/03/2021 45");
        nombresTareas.add("Tercer Proyecto 01/04/2021 10");

        System.out.println(nombresTareas);

    %>

    <script>

        $( function () {

            var nombresTareas = null;

            $('#Buscar').autocomplete({
                source: nombresTareas,
                select: function (event, item){
                    var params = {
                        tarea: item.item.value
                    }

                    $.get("consultas/cConsultaTR.jsp", params, function (response){
                        var json = JSON.parse(response);

                        document.getElementById().value = json[0]['nombreTarea'];
                        document.getElementById().value =  json[0]['fechaEntrega'];
                        document.getElementById().value =  json[0]["progreso"];
                    })
                }
            });

        });


    </script>

</head>

<body>

    <input type="text" id="Buscar" placeholder="busca una tarea">
    <input type="text" for="" id="nombreTarea">
    <input type="text" for="" id="fechaEntrega">
    <input type="text" for="" id="progreso">
    <button id="btn">Presiona</button>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>

</body>
</html>
