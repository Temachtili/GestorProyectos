package Modelo;

public class Tarea {

    private int cveProyecto;
    private String nombreTarea;
    private String fechaEntrega;
    private int predecesor;
    private int porcentaje;

    public Tarea() {

    }

    public Tarea(int cveProyecto, String nombreTarea, String fechaEntrega, int predecesor, int porcentaje) {
        this.cveProyecto = cveProyecto;
        this.nombreTarea = nombreTarea;
        this.fechaEntrega = fechaEntrega;
        this.predecesor = predecesor;
        this.porcentaje = porcentaje;
    }

    public Tarea(String nombreTarea, String fechaEntrega, int predecesor, int porcentaje) {
        this.nombreTarea = nombreTarea;
        this.fechaEntrega = fechaEntrega;
        this.predecesor = predecesor;
        this.porcentaje = porcentaje;
    }

    public int getCveProyecto() {
        return cveProyecto;
    }

    public void setCveProyecto(int cveProyecto) {
        this.cveProyecto = cveProyecto;
    }

    public String getNombreTarea() {
        return nombreTarea;
    }

    public void setNombreTarea(String nombreTarea) {
        this.nombreTarea = nombreTarea;
    }

    public String getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(String fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public int getPredecesor() {
        return predecesor;
    }

    public void setPredecesor(int predecesor) {
        this.predecesor = predecesor;
    }

    public int getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(int porcentaje) {
        this.porcentaje = porcentaje;
    }
}
