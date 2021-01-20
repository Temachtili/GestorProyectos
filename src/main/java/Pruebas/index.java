package Pruebas;

import DAO.Proyecto.ProyectoDAO;
import DAO.Proyecto.sqlProyectoDAO;
import DAO.Tarea.TareaDAO;
import DAO.Tarea.sqlTareaDAO;
import Modelo.Proyecto;
import Modelo.Tarea;

import java.util.ArrayList;

public class index {
    public static void main(String[] args){

        ProyectoDAO proyecto = new sqlProyectoDAO();
        ArrayList<Proyecto> lista = proyecto.listar(1);
        System.out.println(lista);


        TareaDAO sql = new sqlTareaDAO();
        ArrayList<Tarea> arr =  sql.listar(1);

        ArrayList<String> nombresTareas = new ArrayList<>();
        for (Tarea tarea : arr) {
            String nombre = tarea.getNombreTarea() + " " + tarea.getFechaEntrega() + " " + tarea.getPorcentaje();
            nombresTareas.add(nombre);
        }

        System.out.println(nombresTareas);
    }
}
