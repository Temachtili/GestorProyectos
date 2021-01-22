<%@ page import="DAO.Tarea.sqlTareaDAO" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="Modelo.Tarea" %>
<%--
  Created by IntelliJ IDEA.
  User: Temachtili
  Date: 1/12/2021
  Time: 1:13 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="application/json; charset=UTF-8"%>
  <%
    Tarea tarea;
    if (request.getParameter("tarea") != null) {
      sqlTareaDAO tar = new sqlTareaDAO();
      tarea = tar.consultarTarea(request.getParameter("tarea"));

      PrintWriter outt = response.getWriter();
      outt.println(new Gson().toJson(tarea));
    }
  %>
