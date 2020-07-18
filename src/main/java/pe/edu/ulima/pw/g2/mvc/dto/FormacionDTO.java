package pe.edu.ulima.pw.g2.mvc.dto;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class FormacionDTO {

  @NotNull
  private Long tipo;

  @NotNull
  private Long entidad;

  @NotNull
  @Size(max = 250)
  private String detalle;

  @NotNull
  private Long anioFin;

  @NotNull
  private Boolean visible;

  public Long getTipo() {
    return tipo;
  }

  public Boolean getVisible() {
    return visible;
  }

  public void setVisible(Boolean visible) {
    this.visible = visible;
  }

  public Long getAnioFin() {
    return anioFin;
  }

  public void setAnioFin(Long anioFin) {
    this.anioFin = anioFin;
  }

  public String getDetalle() {
    return detalle;
  }

  public void setDetalle(String detalle) {
    this.detalle = detalle;
  }

  public Long getEntidad() {
    return entidad;
  }

  public void setEntidad(Long entidad) {
    this.entidad = entidad;
  }

  public void setTipo(Long tipo) {
    this.tipo = tipo;
  }

  public FormacionDTO() {
    visible = true;
  }
}