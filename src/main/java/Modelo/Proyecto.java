package Modelo;

public class Proyecto {

    private int cveProyecto;
    private String nombreProyecto;

    public Proyecto() {
    }

    public Proyecto(int cveProyecto, String nombreProyecto) {
        this.cveProyecto = cveProyecto;
        this.nombreProyecto = nombreProyecto;
    }

    public Proyecto(int cveProyecto) {
        this.cveProyecto = cveProyecto;
    }

    public Proyecto(String nombreProyecto) {
        this.nombreProyecto = nombreProyecto;
    }

    public int getCveProyecto() {
        return cveProyecto;
    }

    public void setCveProyecto(int cveProyecto) {
        this.cveProyecto = cveProyecto;
    }

    public String getNombreProyecto() {
        return nombreProyecto;
    }

    public void setNombreProyecto(String nombreProyecto) {
        this.nombreProyecto = nombreProyecto;
    }

    @Override
    public String toString() {
        return "Proyecto{" +
                "cveProyecto=" + cveProyecto +
                ", nombreProyecto='" + nombreProyecto + '\'' +
                '}';
    }
}
