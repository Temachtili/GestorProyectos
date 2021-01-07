package DAO;

import java.util.List;

public interface DAO <Objeto>{

    int insertar(Objeto ob);
    int eliminar(Objeto ob);
    int cambiar(Objeto ob);
    List<Objeto> listar();
    void closeConnections();

}
