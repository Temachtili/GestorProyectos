package Modelo;

public class Tarea {

    private int cveProyecto;
    private String nombres;
    private String apellidoPat;
    private String apellidoMat;
    private int duracion;
    private int predecesor;
    private int avance;

    public Tarea() {

    }

    public Tarea(int cveProyecto, String nombres, String apellidoPat, String apellidoMat, int duracion, int predecesor, int avance) {
        this.cveProyecto = cveProyecto;
        this.nombres = nombres;
        this.apellidoPat = apellidoPat;
        this.apellidoMat = apellidoMat;
        this.duracion = duracion;
        this.predecesor = predecesor;
        this.avance = avance;
    }

    public Tarea(String nombres, String apellidoPat, String apellidoMat, int duracion, int predecesor, int avance) {
        this.nombres = nombres;
        this.apellidoPat = apellidoPat;
        this.apellidoMat = apellidoMat;
        this.duracion = duracion;
        this.predecesor = predecesor;
        this.avance = avance;
    }

    public int getCveProyecto() {
        return cveProyecto;
    }

    public void setCveProyecto(int cveProyecto) {
        this.cveProyecto = cveProyecto;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidoPat() {
        return apellidoPat;
    }

    public void setApellidoPat(String apellidoPat) {
        this.apellidoPat = apellidoPat;
    }

    public String getApellidoMat() {
        return apellidoMat;
    }

    public void setApellidoMat(String apellidoMat) {
        this.apellidoMat = apellidoMat;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    public int getPredecesor() {
        return predecesor;
    }

    public void setPredecesor(int predecesor) {
        this.predecesor = predecesor;
    }

    public int getAvance() {
        return avance;
    }

    public void setAvance(int avance) {
        this.avance = avance;
    }
}
