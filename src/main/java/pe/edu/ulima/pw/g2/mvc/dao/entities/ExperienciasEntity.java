package pe.edu.ulima.pw.g2.mvc.dao.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "experiences")
public class ExperienciasEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String logro;

    private boolean visibilidad;

    @ManyToOne
    private OcupationEntity ocupacion;

    @ManyToOne
    private EntityEntity entidad;

    ExperienciasEntity() {}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public boolean isVisibilidad() {
        return visibilidad;
    }

    public void setVisibilidad(boolean visibilidad) {
        this.visibilidad = visibilidad;
    }

    public String getLogro() {
        return logro;
    }

    public void setLogro(String logro) {
        this.logro = logro;
    }

    public ExperienciasEntity(Long id, String logro, boolean visibilidad, OcupationEntity ocupacion,
            EntityEntity entidad) {
        this.id = id;
        this.logro = logro;
        this.visibilidad = visibilidad;
        this.ocupacion = ocupacion;
        this.entidad = entidad;
    }
    
}