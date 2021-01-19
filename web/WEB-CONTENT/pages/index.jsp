<%--
  Created by IntelliJ IDEA.
  User: Temachtili
  Date: 1/10/2021
  Time: 3:04 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Proyecto Valorant</title>

    <!-- Hojas de Estilo -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <%@ page import="DAO.Tarea.sqlTareaDAO" %>
    <%@ page import="DAO.Tarea.TareaDAO" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="Modelo.Tarea" %>
    <%
        TareaDAO sql = new sqlTareaDAO();
        ArrayList<Tarea> arr =  sql.listar();

        ArrayList<String> nombresTareas = new ArrayList<>();

        for (Tarea tarea : arr) {
            String nombre = tarea.getNombreTarea() + " " + tarea.getFechaEntrega() + " " + tarea.getPorcentaje();
            nombresTareas.add(nombre);
        }

        System.out.println(nombresTareas);

    %>

</head>
<body>
</body>
</html>
