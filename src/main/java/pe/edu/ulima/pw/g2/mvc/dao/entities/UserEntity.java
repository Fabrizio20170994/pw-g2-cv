package pe.edu.ulima.pw.g2.mvc.dao.entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

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
@Table(name = "users")
public class UserEntity implements UserDetails {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;
  private String nombre;
  private String email;
  private String password;
  private String apellido;
  private String telefono;
  private String linkedinUrl;
  private Boolean active;
  private String datosRelevantes;

  @ManyToOne
  private RoleEntity role;

  @Transient
  BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder(4);

  public UserEntity() {
  }

  public UserEntity(Long id, String nombre, String email, String password, String apellido, String telefono,
      String linkedinUrl, Boolean active, String datosRelevantes, RoleEntity role) {
    this.id = id;
    this.nombre = nombre;
    this.email = email;
    this.password = bCryptPasswordEncoder.encode(password);
    this.apellido = apellido;
    this.telefono = telefono;
    this.linkedinUrl = linkedinUrl;
    this.active = active;
    this.datosRelevantes = datosRelevantes;
    this.role = role;
  }

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>(); 
    grantList.add(new SimpleGrantedAuthority(role.getNombre()));
    return grantList;
  }

  @Override
  public String getUsername() {
    return nombre;
  }

  @Override
  public boolean isAccountNonExpired() {
    return active;
  }

  @Override
  public boolean isAccountNonLocked() {
    return active;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    return active;
  }

  @Override
  public boolean isEnabled() {
    return active;
  }

  public Long getId() {
    return id;
  }

  public Boolean getActive() {
    return active;
  }

  public void setActive(Boolean active) {
    this.active = active;
  }

  public RoleEntity getRole() {
    return role;
  }

  public void setRole(RoleEntity role) {
    this.role = role;
  }

  public String getDatosRelevantes() {
    return datosRelevantes;
  }

  public void setDatosRelevantes(String datosRelevantes) {
    this.datosRelevantes = datosRelevantes;
  }

  public String getLinkedinUrl() {
    return linkedinUrl;
  }

  public void setLinkedinUrl(String linkedinUrl) {
    this.linkedinUrl = linkedinUrl;
  }

  public String getTelefono() {
    return telefono;
  }

  public void setTelefono(String telefono) {
    this.telefono = telefono;
  }

  public String getApellido() {
    return apellido;
  }

  public void setApellido(String apellido) {
    this.apellido = apellido;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = bCryptPasswordEncoder.encode(password);
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getNombre() {
    return nombre;
  }

  public void setNombre(String nombre) {
    this.nombre = nombre;
  }

  public void setId(Long id) {
    this.id = id;
  }

  @Transient
  private static final long serialVersionUID = 1187208729369518598L;
}