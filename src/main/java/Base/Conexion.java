package Base;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    protected Connection _link;

    public Conexion(){   this._link = null;  }

    /*  TODO:
    *       @return: Connection _link
    */
    public Connection connectDB(){
        final String url = "jdbc:postgresql://localhost:5432/dbWeb1";
        try{
            String user = "postgres";
            String password = "root";
            this._link = DriverManager.getConnection(url, user, password);
        }catch (Exception e){
            System.out.println(e.toString() + " en connectDB");
            closeDB();
        }

        return this._link;
    }

    public void closeDB(){
        try{
            if (this._link != null){    this._link.close();  }
        }catch (Exception e){
            System.out.println(e.toString() + " en closeDB");
        }
    }

}
