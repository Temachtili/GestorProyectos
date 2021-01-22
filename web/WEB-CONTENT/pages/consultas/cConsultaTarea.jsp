<%@ page import="DAO.Tarea.TareaDAO" %>
<%@ page import="DAO.Tarea.sqlTareaDAO" %>
<%@ page import="Modelo.Tarea" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.google.gson.Gson" %><%--
  Created by IntelliJ IDEA.
  User: yayis
  Date: 21/01/2021
  Time: 12:00 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="application/json" %>
<%
    if(request.getParameter("Nombre") != null){
        TareaDAO nuevaTarea = new sqlTareaDAO();
        nuevaTarea.insertar(new Tarea(Integer.parseInt(request.getParameter("cve")),request.getParameter("Nombre"),request.getParameter("Fecha"),Integer.parseInt(request.getParameter("Porcentaje"))));
    }
%>
