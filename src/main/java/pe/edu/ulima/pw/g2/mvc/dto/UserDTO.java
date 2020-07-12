package pe.edu.ulima.pw.g2.mvc.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class UserDTO {

  @NotNull
  @NotEmpty
  @Email
  private String email;

  @NotNull
  @NotEmpty
  private String password;

  @NotNull
  private Boolean active;

  @NotNull
  private Long role;

  private String nombre;
  private String apellido;
  private String telefono;
  private String linkedinUrl;

  public UserDTO() {}

  public UserDTO(@NotNull @NotEmpty String nombre, @NotNull @NotEmpty String email, @NotNull @NotEmpty String password,
      @NotNull @NotEmpty Boolean active, @NotNull Long role, String apellido, String telefono,
      String linkedinUrl) {
    this.nombre = nombre;
    this.email = email;
    this.password = password;
    this.active = active;
    this.role = role;
    this.apellido = apellido;
    this.telefono = telefono;
    this.linkedinUrl = linkedinUrl;
  }

  public String getLinkedinUrl() {
    return linkedinUrl;
  }

  public String getNombre() {
    return nombre;
  }

  public void setNombre(String nombre) {
    this.nombre = nombre;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public Boolean getActive() {
    return active;
  }

  public void setActive(Boolean active) {
    this.active = active;
  }

  public Long getRole() {
    return role;
  }

  public void setRole(Long role) {
    this.role = role;
  }

  public String getApellido() {
    return apellido;
  }

  public void setApellido(String apellido) {
    this.apellido = apellido;
  }

  public String getTelefono() {
    return telefono;
  }

  public void setTelefono(String telefono) {
    this.telefono = telefono;
  }

  public void setLinkedinUrl(String linkedinUrl) {
    this.linkedinUrl = linkedinUrl;
  }
}