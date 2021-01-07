package Pruebas;

import DAO.Tarea.sqlTareaDAO;
import Modelo.Tarea;

public class index {
    public static void main(String[] args){
        Tarea tarea = new Tarea("Daniela Nicolle", "Mendez", "Reyez", 6, 2, 3);
        DAO.Tarea.sqlTareaDAO insertTarea = new DAO.Tarea.sqlTareaDAO();
        insertTarea.insertar(tarea);

        DAO.Tarea.sqlTareaDAO listador = new sqlTareaDAO();

        if (listador.listar() != null){
            System.out.println("Hay registros de tareas en la base de datos");
        }else{
            System.out.println("No hay registros de tareas en la base de datos");
        }
    }
}
