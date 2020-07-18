package pe.edu.ulima.pw.g2.mvc.dao.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "formaciones")
public class FormacionEntity {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;

  private String detalle;
  private Long anioFin;
  private Boolean visible;

  @ManyToOne
  private TipoFormacionEntity tipo;

  @ManyToOne
  private EntityEntity entidad;

  public Long getId() {
    return id;
  }

  public EntityEntity getEntidad() {
    return entidad;
  }

  public void setEntidad(EntityEntity entidad) {
    this.entidad = entidad;
  }

  public TipoFormacionEntity getTipo() {
    return tipo;
  }

  public void setTipo(TipoFormacionEntity tipo) {
    this.tipo = tipo;
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

  public void setId(Long id) {
    this.id = id;
  }

  public FormacionEntity(Long id, String detalle, Long anioFin, Boolean visible, TipoFormacionEntity tipo,
      EntityEntity entidad) {
    this.id = id;
    this.detalle = detalle;
    this.anioFin = anioFin;
    this.visible = visible;
    this.tipo = tipo;
    this.entidad = entidad;
  }

  public FormacionEntity() {
  }
}