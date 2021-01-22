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
<%@ page contentType="text/html; ISO-8859-1; charset=UTF-8"%>
<%
    if(request.getParameter("Nombre") != null){
        TareaDAO nuevaTarea = new sqlTareaDAO();
        nuevaTarea.insertar(new Tarea(Integer.parseInt(request.getParameter("cve")),request.getParameter("Nombre"),request.getParameter("Fecha"),Integer.parseInt(request.getParameter("Porcentaje"))));
    }

    if(request.getParameter("Borrar") != null){
        TareaDAO nuevaTarea = new sqlTareaDAO();
        nuevaTarea.eliminar(new Tarea(Integer.parseInt(request.getParameter("cve")),Integer.parseInt(request.getParameter("predecesor"))));
    }

    if(request.getParameter("Editar") != null){
        TareaDAO nuevaTarea = new sqlTareaDAO();
        nuevaTarea.cambiar(new Tarea(Integer.parseInt(request.getParameter("cve")),request.getParameter("Nombre"),request.getParameter("Fecha"),Integer.parseInt(request.getParameter("predecesor")),Integer.parseInt(request.getParameter("Porcentaje"))));
    }
%>
