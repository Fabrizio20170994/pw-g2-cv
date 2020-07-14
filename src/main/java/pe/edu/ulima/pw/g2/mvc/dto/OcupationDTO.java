package pe.edu.ulima.pw.g2.mvc.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Date;

public class OcupationDTO {
    @NotNull
    @NotEmpty
    private Long id;

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
    private Date anioI;

    @NotNull
    @NotEmpty
    private Date anioF;

    public OcupationDTO() {
    }

    public OcupationDTO(@NotNull @NotEmpty Long id, @NotNull @NotEmpty Long entidad, @NotNull @NotEmpty String nombre,
            @NotNull @NotEmpty String descripcion, @NotNull @NotEmpty Date anioI, @NotNull @NotEmpty Date anioF) {
        this.id = id;
        this.entidad = entidad;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.anioI = anioI;
        this.anioF = anioF;
    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Date getAnioI() {
        return this.anioI;
    }

    public void setAnioI(Date anioI) {
        this.anioI = anioI;
    }

    public Date getAnioF() {
        return this.anioF;
    }

    public void setAnioF(Date anioF) {
        this.anioF = anioF;
    }
    
}