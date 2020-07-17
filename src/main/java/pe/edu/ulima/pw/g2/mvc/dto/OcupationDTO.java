package pe.edu.ulima.pw.g2.mvc.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class OcupationDTO {

    @NotNull
    @NotEmpty
    private Long entidad;

    @NotNull
    @NotEmpty
    private String nombre;

    @NotNull
    @NotEmpty
    private String descripcion;

    @NotNull
    @NotEmpty
    private int anioI;

    @NotNull
    @NotEmpty
    private int anioF;

    public OcupationDTO() {
    }

    public Long getEntidad() {
        return this.entidad;
    }

    public void setEntidad(Long entidad) {
        this.entidad = entidad;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return this.descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getAnioI() {
        return this.anioI;
    }

    public void setAnioI(int anioI) {
        this.anioI = anioI;
    }

    public int getAnioF() {
        return this.anioF;
    }

    public void setAnioF(int anioF) {
        this.anioF = anioF;
    }
    
    public OcupationDTO(@NotNull @NotEmpty Long entidad, @NotNull @NotEmpty String nombre,
            @NotNull @NotEmpty String descripcion, @NotNull @NotEmpty int anioI, @NotNull @NotEmpty int anioF) {
        this.entidad = entidad;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.anioI = anioI;
        this.anioF = anioF;
    }
}