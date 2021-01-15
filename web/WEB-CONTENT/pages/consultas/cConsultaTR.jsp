<%@ page import="DAO.Tarea.sqlTareaDAO" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: Temachtili
  Date: 1/12/2021
  Time: 1:13 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%
    String nombreTarea = request.getParameter("nombresTareas");
    sqlTareaDAO sql = new sqlTareaDAO();
    Map<String, String> arr = sql.consultarTarea(nombreTarea);

    PrintWriter outt = response.getWriter();
    outt.println(new Gson().toJson(arr));


  %>
