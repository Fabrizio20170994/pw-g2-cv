package pe.edu.ulima.pw.g2.mvc.dto;

import javax.validation.constraints.NotNull;

public class EntityDTO {

    @NotNull
    private String nombre;

    private String descripcion;

    @NotNull
    private Long user;

    public EntityDTO() {
    }

    public EntityDTO(@NotNull String nombre, String descripcion, @NotNull Long user) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.user = user;
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

    public Long getUser() {
        return this.user;
    }

    public void setUser(Long user) {
        this.user = user;
    }

}