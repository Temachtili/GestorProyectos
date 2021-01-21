<%@ page import="DAO.Proyecto.sqlProyectoDAO" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="Modelo.Proyecto"%><%@ page import="java.util.ArrayList"%><%--
<%--
  Created by IntelliJ IDEA.
  User: Temachtili
  Date: 1/21/2021
  Time: 11:25 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="application/json; charset=UTF-8"%>
<%
  ArrayList<Proyecto> proyecto;
  if (request.getParameter("proyectos") != null) {
        sqlProyectoDAO tar = new sqlProyectoDAO();
        proyecto = tar.listar(request.getParameter("proyectos"));

        String consulta = "";
        PrintWriter outt = response.getWriter();
        for(Proyecto value: proyecto){
             consulta += " <li id=\""+ value.getNombreProyecto() + "\" class=\"list-group-item lista\" role=\"button\">\n" +
    "                        <div class=\"row\">\n" +
    "                            <div class=\"col-10\">\n" +
    "                                <p name=\""+ value.getNombreProyecto() + "\">\""+ value.getNombreProyecto() +"\"</p>\n" +
    "                            </div>\n" +
    "                            <div class=\"col-1\">\n" +
    "                                <button type=\"button\" class=\"btn btn-primary\" editar cve=\""+ value.getCveProyecto() + "\" name=\""+ value.getNombreProyecto() +"\">Editar</button>\n" +
    "                            </div>\n" +
    "                            <div class=\"col-1\">\n" +
    "                                <button type=\"button\" class=\"btn btn-danger\" borrar cve=\""+ value.getCveProyecto() +"\">Borrar</button>\n" +
    "                            </div>\n" +
    "                        </div>\n" +
    "                    </li>";
        }
  }
%>
