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
@Table(name = "entities")
public class EntityEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String nombre;

    private String descripcion;

    @ManyToOne
    private UserEntity user;

    @OneToMany(mappedBy = "entidad")
    private List<OcupationEntity> ocupaciones; 

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public UserEntity getUser() {
        return this.user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }

    public List<OcupationEntity> getOcupaciones() {
        return this.ocupaciones;
    }

    public void setOcupaciones(List<OcupationEntity> ocupaciones) {
        this.ocupaciones = ocupaciones;
    }


    public EntityEntity() {

    }

    public EntityEntity(Long id, String nombre, String descripcion, UserEntity user, List<OcupationEntity> ocupaciones) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.user = user;
        this.ocupaciones = ocupaciones;
    }

    public EntityEntity(Long id, String nombre, String descripcion, UserEntity user) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.user = user;
    }

}