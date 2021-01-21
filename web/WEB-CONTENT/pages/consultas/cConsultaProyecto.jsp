<%@ page import="DAO.Proyecto.sqlProyectoDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="Modelo.Proyecto"%><%@ page import="java.util.ArrayList"%><%--
<%--
  Created by IntelliJ IDEA.
  User: Temachtili
  Date: 1/21/2021
  Time: 11:25 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; ISO-8859-1; charset=UTF-8"%>
<%
    ArrayList<Proyecto> proyecto;
    if (request.getParameter("proyectos") != null) {
        sqlProyectoDAO tar = new sqlProyectoDAO();
        proyecto = tar.listar(request.getParameter("proyectos"));

        StringBuilder consulta = new StringBuilder();
        PrintWriter outt = response.getWriter();
        for(Proyecto value: proyecto){
             consulta.append(" <li class=\"list-group-item lista\" cve=\"").append(value.getCveProyecto()).append("\">\n")
                     .append("                        <div class=\"row\">\n")
                     .append("                            <div class=\"col-10\" role=\"button\" onClick= \"tarea(this)\" id=\"").append(value.getCveProyecto()).append("\" name=\"").append(value.getNombreProyecto()).append("\">\n")
                     .append("                                <p name=\"").append(value.getNombreProyecto()).append("\">").append(value.getNombreProyecto()).append("</p>\n")
                     .append("                            </div>\n")
                     .append("                            <div class=\"col-1\">\n")
                     .append("                                <button type=\"button\" class=\"btn btn-primary\" editar onClick= \"editar(this)\" cve=\"").append(value.getCveProyecto()).append("\" name=\"").append(value.getNombreProyecto()).append("\">Editar</button>\n")
                     .append("                            </div>\n")
                     .append("                            <div class=\"col-1\">\n")
                     .append("                                <button type=\"button\" class=\"btn btn-danger\" borrar onClick= \"borrar(this)\" cve=\"").append(value.getCveProyecto()).append("\">Borrar</button>\n")
                     .append("                            </div>\n")
                     .append("                        </div>\n")
                     .append("                    </li>");
        }
        outt.print(consulta);
  }
%>
