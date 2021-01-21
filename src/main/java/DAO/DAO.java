package DAO;

import java.util.ArrayList;

public interface DAO <Objeto>{

    int insertar(Objeto ob);
    int eliminar(Objeto ob);
    int cambiar(Objeto ob);
    void closeConnections();

}
