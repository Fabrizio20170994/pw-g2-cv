package pe.edu.ulima.pw.g2.mvc.forms;

public class LoginForm {
  private String email;
  private String password;

  public String getPassword() {
    return password;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public void setPassword(String password) {
    this.password = password;
  }
}