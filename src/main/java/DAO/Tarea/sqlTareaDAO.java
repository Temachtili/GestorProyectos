package DAO.Tarea;

import Base.Conexion;
import Modelo.Tarea;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class sqlTareaDAO implements TareaDAO {

    // Variables de Conexion
    private Connection conector;
    private final Conexion conexion = new Conexion();
    //Variables de uso Sql
    private ResultSet rs;
    private PreparedStatement ps;
    //Query's
    private final String INSERTAR = "insert into Tarea(cveproyecto, nombre_tarea, fecha_entrega, porcentaje) values(?, ?, ?, ?);";
    private final String BORRAR = "delete from Tarea where cveproyecto = ? and predecesor = ?;";
    private final String LISTAR = "select * from tarea where cveproyecto = ?;";
    private final String CAMBIAR = "update Tarea set nombre_tarea = ?, fecha_entrega = ?, porcentaje = ? where cveproyecto = ? and predecesor = ?;";
    private final String CONSULTANOMBRE = "select * from Tarea where nombre_tarea = ?;";
    private final String CONSULTARTAREA = "select * from tarea where cveProyecto = ? and nombre_tarea = ? and fecha_entrega = ? and porcentaje = ?;";

    public sqlTareaDAO(){
        try{
            conector = conexion.connectDB();
            if (conector == null){  System.out.println("Fallida conexión a la base de datos en sqlTareaDAO()");  }
        }catch (Exception e){
            System.out.println(e.toString() + " en sqlTareaDAO()");
        }
    }

    @Override
    public int insertar(Tarea ob) {

        int cveProyecto = 0;

        if (conector != null){
            try {
                // Se prepara el statement y añaden los datos del objeto
                ps = conector.prepareStatement(INSERTAR);
                ps.setInt(1, ob.getCveProyecto());
                ps.setString(2, ob.getNombreTarea());
                ps.setString(3, ob.getFechaEntrega());
                ps.setInt(4, ob.getPorcentaje());
                ps.executeUpdate(); // Se ejecuta el query

                cveProyecto = 1;

            }catch (Exception e){
                System.out.println(e.toString() + " en insertar() - sqlTareaDAO");
            }finally {
                closeConnections();
            }
        }else{
            System.out.println("Fallida conexión a la base de datos en sqlTareaDAO()");
        }

        return cveProyecto;
    }

    @Override
    public int eliminar(Tarea ob) {

        int cveProyecto = 0;

        if (conector != null){
            try {
                //Se prepara el statement
                ps = conector.prepareStatement(BORRAR);
                ps.setInt(1, ob.getCveProyecto());
                ps.setInt(2, ob.getPredecesor());

                ps.executeUpdate(); //Se ejecuta el Query
                cveProyecto = 1;

            }catch (Exception e){
                System.out.println(e.toString() + " en eliminar() - sqlTareaDAO");
            }finally {
                closeConnections();
            }
        }

        return cveProyecto;
    }

    public Tarea consultarTarea(String nombreTarea) {
        Tarea tarea = null;
        try{
            //  Se prepara el statement y añaden los datos
            ps = conector.prepareStatement(CONSULTANOMBRE);
            ps.setString(1, nombreTarea);

            rs = ps.executeQuery();

            while (rs.next()){
                tarea = new Tarea(rs.getInt("cveProyecto"), rs.getString("nombre_tarea"), rs.getString("fecha_entrega"), rs.getInt("predecesor"), rs.getInt("porcentaje"));
            }

        }catch (Exception exception){
            exception.printStackTrace();
        }finally {
            closeConnections();
        }
        return tarea;
    }

    public Tarea consultarTarea(int cveProyecto, String nombre_tarea, String fecha_entrega, int porcentaje){
        Tarea tarea = null;
        try{
            //  Se prepara el statement y añaden los datos
            ps = conector.prepareStatement(CONSULTARTAREA);
            ps.setInt(1, cveProyecto);
            ps.setString(2, nombre_tarea);
            ps.setString(3, fecha_entrega);
            ps.setInt(4, porcentaje);

            rs = ps.executeQuery();

            while (rs.next()){
                tarea = new Tarea(rs.getInt("cveProyecto"), rs.getString("nombre_tarea"), rs.getString("fecha_entrega"), rs.getInt("predecesor"), rs.getInt("porcentaje"));
            }

        }catch (Exception exception){
            exception.printStackTrace();
        }finally {
            closeConnections();
        }
        return tarea;
    }

    @Override
    public int cambiar(Tarea ob) {
        int cveProyecto = 0;
        try{
            if(ob != null){
                // Se prepara el statement y añaden los datos del objeto
                incorporarDatos(ob, CAMBIAR);
                ps.executeUpdate(); // Se ejecuta el query

                cveProyecto = ob.getCveProyecto();
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            closeConnections();
        }

        return cveProyecto;
    }

    private void incorporarDatos(Tarea ob, String query) throws SQLException {
        ps = conector.prepareStatement(query);
        ps.setString(1, ob.getNombreTarea());
        ps.setString(2, ob.getFechaEntrega());
        ps.setInt(3, ob.getPorcentaje());
        ps.setInt(4, ob.getCveProyecto());
        ps.setInt(5, ob.getPredecesor());
    }

    public ArrayList<Tarea> listar(int id) {
        ArrayList<Tarea> lista = new ArrayList<>();

        try{
            ps = conector.prepareStatement(LISTAR);
            ps.setInt(1, id);
            ps.execute();
            rs = ps.getResultSet();

            while (rs.next()){
                lista.add(new Tarea(rs.getInt("cveProyecto"), rs.getString("nombre_tarea"), rs.getString("fecha_entrega"), rs.getInt("predecesor"), rs.getInt("porcentaje")));
            }
        }catch (Exception e){
            System.out.println(e.toString() + " en listar() - sqlTareaDAO");
            lista = null;
        }finally {
            closeConnections();
        }

        System.out.println(lista);
        return lista;
    }

    @Override
    public void closeConnections() {
        try {
            if (conector != null){  conector.close();   }
            conexion.closeDB();
        }catch (SQLException e){
            System.out.println(e.toString() + " en closeConnections() - sqlTareaDAO");
        }
    }
}

