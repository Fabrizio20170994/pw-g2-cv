package pe.edu.ulima.pw.g2.mvc.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class EntityDTO {


    @NotBlank(message = "El nombre no puede estar vacío")
    @Size(max=250, message="El nombre debe tener máximo 250 caracteres")
    private String nombre;

    @Pattern(regexp = "^\\W*(?:\\w+\\b\\W*){0,20}$", message = "La descripción debe tener máximo 20 palabras")
    private String descripcion;

    public EntityDTO() {
    }

    public EntityDTO(@NotBlank String nombre, String descripcion) {
        this.nombre = nombre;
        this.descripcion = descripcion;
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

}