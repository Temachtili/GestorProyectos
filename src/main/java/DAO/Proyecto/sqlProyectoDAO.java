package DAO.Proyecto;

import Base.Conexion;
import Modelo.Proyecto;
import Modelo.Tarea;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class sqlProyectoDAO implements ProyectoDAO {

    // Variables de Conexion
    private Connection conector;
    private final Conexion conexion = new Conexion();
    //Variables de uso Sql
    private ResultSet rs;
    private PreparedStatement ps;
    //Query's
    private final String INSERTAR = "insert into Proyecto(nombre_proyecto) values (?);";
    private final String BORRAR = "delete from Proyecto where cveProyecto = ?;";
    private final String LISTAR = "select * from Proyecto;";
    private final String MODIFICAR = "update proyecto set nombre_proyecto = ? where cveproyecto = ?;";
    private final String CONSULTANOMBRE = "select * from Proyecto where nombre_proyecto like concat('%', ?, '%')";

    public sqlProyectoDAO(){
        try{
            conector = conexion.connectDB();
            if (conector == null){  System.out.println("Fallida conexión a la base de datos en sqlTareaDAO()");  }
        }catch (Exception e){
            System.out.println(e.toString() + " en sqlProyectoDAO()");
        }
    }

    @Override
    public int insertar(Proyecto ob) {
        int cveProyecto = 0;

        if (conector != null){
            try {
                //Se prepara el statement
                ps = conector.prepareStatement(INSERTAR);
                ps.setString(1, ob.getNombreProyecto());

                ps.executeUpdate(); //Se ejecuta el query
                System.out.println("Se registró correctamente la tarea");
                cveProyecto = 1;

            }catch (Exception e){
                System.out.println(e.toString() + " en insertar() - sqlProyectoDAO");
            }finally {
                closeConnections();
            }
        }else{
            System.out.println("Fallida conexión a la base de datos en sqlProyectoDAO()");
        }

        return cveProyecto;
    }

    @Override
    public int eliminar(Proyecto ob) {
        int cveProyecto = 0;

        if (conector != null){
            try {
                //Se prepara el statement
                ps = conector.prepareStatement(BORRAR);
                ps.setInt(1, ob.getCveProyecto());

                ps.executeUpdate(); //Se ejecuta el Query
                System.out.println("Se eliminó el(los) registro(s)");
                cveProyecto = 1;

            }catch (Exception e){
                System.out.println(e.toString() + " en eliminar() - sqlProyectoDAO");
            }finally {
                closeConnections();
            }
        }

        return cveProyecto;
    }

    public int cambiar(Proyecto ob) {
        int cveProyecto = 0;

        if (conector != null){
            try {
                //Se prepara el statement
                ps = conector.prepareStatement(MODIFICAR);
                ps.setString(1, ob.getNombreProyecto());
                ps.setInt(2, ob.getCveProyecto());

                ps.executeUpdate(); //Se ejecuta el query
                System.out.println("Se modifico correctamente el proyecto");
                cveProyecto = 1;

            }catch (Exception e){
                System.out.println(e.toString() + " en modificar() - sqlProyectoDAO");
            }finally {
                closeConnections();
            }
        }else{
            System.out.println("Fallida conexión a la base de datos en sqlProyectoDAO()");
        }

        return cveProyecto;
    }

    public ArrayList<Proyecto> listar(String nombreProyecto) {
        ArrayList<Proyecto> lista = new ArrayList<>();

        try{
            ps = conector.prepareStatement(CONSULTANOMBRE);
            ps.setString(1, nombreProyecto);
            ps.execute();
            rs = ps.getResultSet();

            while (rs.next()){
                lista.add(new Proyecto(rs.getInt("cveProyecto"), rs.getString("nombre_proyecto")));
            }

        }catch (Exception e){
            System.out.println(e.toString() + " en listar() - sqlProyectoDAO");
            lista = null;
        }finally {
            closeConnections();
        }

        return lista;
    }

    public ArrayList<Proyecto> traerTodo(){
        ArrayList<Proyecto> lista = new ArrayList<>();

        try{
            ps = conector.prepareStatement(LISTAR);

            ps.execute();
            rs = ps.getResultSet();

            while (rs.next()){
                lista.add(new Proyecto(rs.getInt("cveProyecto"), rs.getString("nombre_proyecto")));
            }

        }catch (Exception e){
            System.out.println(e.toString() + " en listar() - sqlProyectoDAO");
            lista = null;
        }finally {
            closeConnections();
        }

        return lista;
    }

    public Proyecto consultarProyecto(String nombreTarea) {
        Proyecto proyecto = null;
        try{
            //  Se prepara el statement y añaden los datos
            ps = conector.prepareStatement(CONSULTANOMBRE);
            ps.setString(1, nombreTarea);

            rs = ps.executeQuery();

            while (rs.next()){
                proyecto = new Proyecto(rs.getInt("cveProyecto"), rs.getString("nombre_proyecto"));
            }

        }catch (Exception exception){
            exception.printStackTrace();
        }finally {
            closeConnections();
        }
        return proyecto;
    }

    @Override
    public void closeConnections() {
        try {
            if (conector != null){  conector.close();   }
            conexion.closeDB();
        }catch (SQLException e){
            System.out.println(e.toString() + " en closeConnections() - sqlProyectoDAO");
        }
    }
}
