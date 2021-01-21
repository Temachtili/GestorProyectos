package DAO.Tarea;

import Base.Conexion;
import Modelo.Tarea;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class sqlTareaDAO implements TareaDAO {

    // Variables de Conexion
    private Connection conector;
    private final Conexion conexion = new Conexion();
    //Variables de uso Sql
    private ResultSet rs;
    private PreparedStatement ps;
    //Query's
    private final String INSERTAR = "insert into Tarea(cveproyecto, nombre_tarea, fecha_entrega, predecesor, porcentaje) values(?, ?, ?, ?, ?);";
    private final String BORRAR = "delete from Tarea where cveproyecto = ?;";
    private final String LISTAR = "select * from proyecto inner join tarea t on proyecto.cveproyecto = t.cveproyecto where t.cveproyecto = ?;";
    private final String CAMBIAR = "update Tarea set nombretarea = ?, fechaentrega = ?, predecesor = ?, porcentaje = ? where cveProyecto = ?;";
    private final String CONSULTANOMBRE = "select * from Tarea where nombretarea = ?";

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
                ps.setInt(4, ob.getPredecesor());
                ps.setInt(5, ob.getPorcentaje());
                ps.executeUpdate(); // Se ejecuta el query

                System.out.println("Se registró correctamente la tarea");
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

                ps.executeUpdate(); //Se ejecuta el Query
                System.out.println("Se eliminó el(los) registro(s)");
                cveProyecto = 1;

            }catch (Exception e){
                System.out.println(e.toString() + " en eliminar() - sqlTareaDAO");
            }finally {
                closeConnections();
            }
        }

        return cveProyecto;
    }

    public Map<String, String> consultarTarea(String nombreTarea) {
        //  Se crea el Map
        Map<String, String> mapTarea = new HashMap<>();

        try{
            //  Se prepara el statement y añaden los datos
            ps = conector.prepareStatement(CONSULTANOMBRE);
            ps.setString(1, nombreTarea);

            rs = ps.executeQuery();

            while (rs.next()){
                mapTarea.put("nombreTarea", rs.getString("nombreTarea"));
                mapTarea.put("fechaEntrega", rs.getString("fechaEntrega"));
                mapTarea.put("porcentaje", rs.getInt("porcentaje") + "");
            }

        }catch (Exception exception){
            exception.printStackTrace();
        }finally {
            closeConnections();
        }
        return mapTarea;
    }

    @Override
    public int cambiar(Tarea ob) {
        int cveProyecto = 0;
        try{
            if(ob != null){
                // Se prepara el statement y añaden los datos del objeto
                incorporarDatos(ob, CAMBIAR);
                ps.executeUpdate(); // Se ejecuta el query

                System.out.println("Se actualizó correctamente el registro");
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
        ps.setInt(1, ob.getCveProyecto());
        ps.setString(2, ob.getNombreTarea());
        ps.setString(3, ob.getFechaEntrega());
        ps.setInt(4, ob.getPredecesor());
        ps.setInt(5, ob.getPorcentaje());
    }

    @Override
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

