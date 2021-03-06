package pe.edu.ulima.pw.g2.mvc.dao.entities;



import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name = "ocupations")
public class OcupationEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    private String nombre;
    private String descripcion;
    private int anioI;
    private int anioF;
     
    @ManyToOne
    private EntityEntity entidad;

    @OneToMany(mappedBy = "ocupacion")
    private List<ExperienciasEntity> experiencias;
    
    public OcupationEntity(){}
    

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public EntityEntity getEntidad() {
        return this.entidad;
    }

    public void setEntidad(EntityEntity entidad) {
        this.entidad = entidad;
    }


    public List<ExperienciasEntity> getExperiencias() {
        return this.experiencias;
    }

    public void setExperiencias(List<ExperienciasEntity> experiencias) {
        this.experiencias = experiencias;
    }
    

    public OcupationEntity(Long id, String nombre, String descripcion, int anioI, int anioF, EntityEntity entidad,
            List<ExperienciasEntity> experiencias) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.anioI = anioI;
        this.anioF = anioF;
        this.entidad = entidad;
        this.experiencias = experiencias;
    }
    

}