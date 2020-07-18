package pe.edu.ulima.pw.g2.mvc.forms;

public class EditUserForm {
    private String user_email;
    private String user_nombre;
    private String user_password;
    private String user_apellido;
    private String user_telefono;
    private String user_linkedinUrl;
    private String user_active;
    private String user_datosRelevantes;
    private String user_role;

    public EditUserForm() {
    }

    public String getUser_datosRelevantes() {
        return user_datosRelevantes;
    }

    public void setUser_datosRelevantes(String user_datosRelevantes) {
        this.user_datosRelevantes = user_datosRelevantes;
    }

    public String getUser_linkedinUrl() {
        return user_linkedinUrl;
    }

    public void setUser_linkedinUrl(String user_linkedinUrl) {
        this.user_linkedinUrl = user_linkedinUrl;
    }

    public String getUser_telefono() {
        return user_telefono;
    }

    public void setUser_telefono(String user_telefono) {
        this.user_telefono = user_telefono;
    }

    public String getUser_apellido() {
        return user_apellido;
    }

    public void setUser_apellido(String user_apellido) {
        this.user_apellido = user_apellido;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_nombre() {
        return user_nombre;
    }

    public void setUser_nombre(String user_nombre) {
        this.user_nombre = user_nombre;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_active() {
        return user_active;
    }

    public void setUser_active(String user_active) {
        this.user_active = user_active;
    }

    public String getUser_role() {
        return user_role;
    }

    public void setUser_role(String user_role) {
        this.user_role = user_role;
    }
}