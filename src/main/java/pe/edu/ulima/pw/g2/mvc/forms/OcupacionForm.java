package pe.edu.ulima.pw.g2.mvc.forms;

public class OcupacionForm {

    private String entidad_nombre;
    private String nombreOcup;
    private String descripcionOcup;
    private String anioIOcup;
    private String anioFOcup;

    public OcupacionForm() {

    }

    public String getAnioFOcup() {
        return anioFOcup;
    }

    public void setAnioFOcup(String anioFOcup) {
        this.anioFOcup = anioFOcup;
    }

    public String getAnioIOcup() {
        return anioIOcup;
    }

    public void setAnioIOcup(String anioIOcup) {
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