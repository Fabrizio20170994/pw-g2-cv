package pe.edu.ulima.pw.g2.mvc.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class ExperienciasDTO {

    @NotNull
    @NotEmpty
    private Long entidad;

    @NotNull
    @NotEmpty
    private String logro;

    @NotNull
    @NotEmpty
    private boolean visibilidad;

    @NotNull
    @NotEmpty
    private Long ocupacion;

    public ExperienciasDTO() {
    }

    public Long getOcupacion() {
        return ocupacion;
    }

    public void setOcupacion(Long ocupacion) {
        this.ocupacion = ocupacion;
    }

    public boolean getVisibilidad() {
		return visibilidad;
	}

	public void setVisibilidad(Boolean visibilidad) {
		this.visibilidad = visibilidad;
	}

	public Long getEntidad() {
        return this.entidad;
    }

    public void setEntidad(Long entidad) {
        this.entidad = entidad;
    }

    public String getLogro() {
        return this.logro;
    }

    public void setLogro(String logro) {
        this.logro = logro;
    }

    public ExperienciasDTO(@NotNull @NotEmpty Long entidad, @NotNull @NotEmpty String logro,
            @NotNull @NotEmpty boolean visibilidad, @NotNull @NotEmpty Long ocupacion) {
        this.entidad = entidad;
        this.logro = logro;
        this.visibilidad = visibilidad;
        this.ocupacion = ocupacion;
    }

}