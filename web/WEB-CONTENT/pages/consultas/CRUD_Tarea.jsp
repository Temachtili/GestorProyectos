<%@ page import="DAO.Tarea.TareaDAO" %>
<%@ page import="DAO.Tarea.sqlTareaDAO" %>
<%@ page import="Modelo.Tarea" %><%--
  Created by IntelliJ IDEA.
  User: yayis
  Date: 21/01/2021
  Time: 12:00 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(request.getParameter("Nombre") != null){
        TareaDAO nuevaTarea = new sqlTareaDAO();
        nuevaTarea.insertar(new Tarea(Integer.parseInt(request.getParameter("cve")),request.getParameter("Nombre"),request.getParameter("Fecha"),Integer.parseInt(request.getParameter("Porcentaje"))));
    }
%>
