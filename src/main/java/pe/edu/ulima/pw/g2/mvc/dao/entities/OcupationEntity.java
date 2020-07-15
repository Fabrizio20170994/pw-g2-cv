package pe.edu.ulima.pw.g2.mvc.dao.entities;

import java.util.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


@Entity
@Table(name = "ocupations")
public class OcupationEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String nombre;
    private String descripcion;
    private Date anioI;
    private Date anioF;    
    /*@ManyToOne
    private EntityOcupation entity;*/
    
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

    public OcupationEntity(Long id, String nombre, String descripcion, Date anioI, Date anioF) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.anioI = anioI;
        this.anioF = anioF;
    }

    /*public EntityOcupation getEntity() {
        return this.entity;
    }

    public void setEntity(EntityOcupation entity) {
        this.entity = entity;
    }*/

}