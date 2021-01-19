package Pruebas;

import DAO.Tarea.TareaDAO;
import DAO.Tarea.sqlTareaDAO;
import Modelo.Tarea;

import java.util.ArrayList;

public class index {
    public static void main(String[] args){
        Tarea tarea2 = new Tarea("Nuevo proyecto", "20/02/2021", 3, 45);
        DAO.Tarea.sqlTareaDAO insertTarea = new DAO.Tarea.sqlTareaDAO();
        insertTarea.insertar(tarea2);

        TareaDAO sql = new sqlTareaDAO();
        ArrayList<Tarea> arr =  sql.listar();

        ArrayList<String> nombresTareas = new ArrayList<>();
        for (Tarea tarea : arr) {
            String nombre = tarea.getNombreTarea() + " " + tarea.getFechaEntrega() + " " + tarea.getPorcentaje();
            nombresTareas.add(nombre);
        }

        System.out.println(nombresTareas);
    }
}
