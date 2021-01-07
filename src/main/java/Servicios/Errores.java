package Servicios;

public class Errores {
    private String _error;
    private int _id;

    //opc -> 1 trycatch, 2 if, 3 void
    private String _opc;

    public String getError() {
        return this._error;
    }

    public void setError(int id, String error, int opc) {
        this._id = id;
        this._error = error;
        if(opc == 1){
            this._opc = "trycatch";
        }else{
            if(opc == 2){
                this._opc = "if";
            }else{
                if(opc == 3){
                    this._opc = "void";
                }else{
                    this._opc = "opcion invalida";
                }
            }
        }

    }

    public void imprimirError(){ System.out.println("Error con id " + this._id + "con error " + this._error + "en un " + this._opc); }
}
