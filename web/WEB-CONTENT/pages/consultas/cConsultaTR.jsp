<%@ page import="DAO.Tarea.TareaDAO" %>
<%@ page import="DAO.Tarea.sqlTareaDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Modelo.Tarea" %>
<%@ page import="com.google.gson.Gson" %><%--
  Created by IntelliJ IDEA.
  User: Temachtili
  Date: 1/12/2021
  Time: 1:13 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%
    String nombreTarea = request.getParameter("nombresTareas");
    TareaDAO sql = new sqlTareaDAO();
    ArrayList<Tarea> arr = (ArrayList<Tarea>) sql.consultarTarea(nombreTarea);

    System.out.println(new Gson().toJson(arr));

  %>
