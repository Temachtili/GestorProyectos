<%@ page import="DAO.Proyecto.sqlProyectoDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="Modelo.Proyecto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="DAO.Tarea.sqlTareaDAO" %>
<%@ page import="DAO.Proyecto.ProyectoDAO" %>
<%@ page import="Modelo.Tarea" %><%--
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

    //  Registrar Proyectos
    if(request.getParameter("NombreProyecto") != null){
        ProyectoDAO sql = new sqlProyectoDAO();
        sql.insertar(new Proyecto(request.getParameter("NombreProyecto")));

        sqlProyectoDAO s = new sqlProyectoDAO();
        Proyecto proyecto1 = s.consultarProyecto(request.getParameter("NombreProyecto"));

        sqlTareaDAO tarea = new sqlTareaDAO();
        tarea.insertar(new Tarea(proyecto1.getCveProyecto(), "Tarea de guía", "05/02/2021", 100));
    }

    //  Eliminar Proyectos
    if(request.getParameter("Borrar") != null){
        ProyectoDAO sql = new sqlProyectoDAO();
        sql.eliminar(new Proyecto(Integer.parseInt(request.getParameter("Borrar"))));
    }

    //  Actualizar Proyectos
    if(request.getParameter("Actualizar") != null){
        ProyectoDAO sql = new sqlProyectoDAO();
        sql.cambiar(new Proyecto(Integer.parseInt(request.getParameter("cveProyecto")),request.getParameter("Actualizar")));
    }

    //  Busqueda Proyectos
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
            .append("                                <button type=\"button\" class=\"btn btn-primary\" onClick= \"editar(this)\" cve=\"").append(value.getCveProyecto()).append("\" name=\"").append(value.getNombreProyecto()).append("\">Editar</button>\n")
            .append("                            </div>\n")
            .append("                            <div class=\"col-1\">\n")
            .append("                                <button type=\"button\" class=\"btn btn-danger\" onClick= \"borrar(this)\" cve=\"").append(value.getCveProyecto()).append("\">Borrar</button>\n")
            .append("                            </div>\n")
            .append("                        </div>\n")
            .append("                    </li>");
        }
        outt.print(consulta);
    }

%>
