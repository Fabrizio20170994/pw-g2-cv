package pe.edu.ulima.pw.g2.mvc.forms;

public class EditUserForm {
    private String user_active;
    private String user_role;

    public EditUserForm() {
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