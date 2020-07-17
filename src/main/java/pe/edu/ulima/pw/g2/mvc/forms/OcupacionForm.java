package pe.edu.ulima.pw.g2.mvc.forms;

public class OcupacionForm {

    private String entidad_nombre;
    private String nombreOcup;
    private String descripcionOcup;
    private int anioIOcup;
    private int anioFOcup;

    public OcupacionForm() {

    }

    public int getAnioFOcup() {
        return anioFOcup;
    }

    public void setAnioFOcup(int anioFOcup) {
        this.anioFOcup = anioFOcup;
    }

    public int getAnioIOcup() {
        return anioIOcup;
    }

    public void setAnioIOcup(int anioIOcup) {
        this.anioIOcup = anioIOcup;
    }

    public String getDescripcionOcup() {
        return descripcionOcup;
    }

    public void setDescripcionOcup(String descripcionOcup) {
        this.descripcionOcup = descripcionOcup;
    }

    public String getNombreOcup() {
        return nombreOcup;
    }

    public void setNombreOcup(String nombreOcup) {
        this.nombreOcup = nombreOcup;
    }

    public String getEntidad_nombre() {
        return entidad_nombre;
    }

    public void setEntidad_nombre(String entidad_nombre) {
        this.entidad_nombre = entidad_nombre;
    }
    
}