<%@ page import="DAO.Tarea.sqlTareaDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Modelo.Tarea" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="US-ASCII" %>
<%
    //  Inicio, obtener datos del proyecto seleccionado
    sqlTareaDAO sql = new sqlTareaDAO();
    ArrayList<Tarea> lista = sql.listar(Integer.parseInt(request.getParameter("cveProyecto")));
%>

<%=new Gson().toJson(lista)%>