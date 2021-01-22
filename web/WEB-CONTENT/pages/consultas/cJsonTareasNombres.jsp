<%@ page import="DAO.Tarea.sqlTareaDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Modelo.Tarea" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="US-ASCII" %>
<%
    //  Autocomplete
    sqlTareaDAO s = new sqlTareaDAO();
    ArrayList<Tarea> arr =  s.listar(Integer.parseInt(request.getParameter("cveProyecto")));

    ArrayList<String> name = new ArrayList<>();

    for (Tarea tarea : arr) { name.add(tarea.getNombreTarea()); }
%>

<%=new Gson().toJson(name)%>