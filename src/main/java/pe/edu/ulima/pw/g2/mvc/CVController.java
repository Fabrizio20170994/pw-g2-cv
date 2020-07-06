package pe.edu.ulima.pw.g2.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CVController {

    @RequestMapping(value = "/autenticacion", method = RequestMethod.GET)
    public String autenticacion() {
        return "autenticacion";
    }

    @RequestMapping(value = "/mis-datos", method = RequestMethod.GET)
    public String misDatos() {
        return "mis-datos";
    }

    @RequestMapping(value = "/entidades", method = RequestMethod.GET)
    public String entidades() {
        return "entidades";
    }

    @RequestMapping(value = "/ocupaciones", method = RequestMethod.GET)
    public String ocupaciones() {
        return "ocupaciones";
    }

    @RequestMapping(value = "/experiencias", method = RequestMethod.GET)
    public String experiencias() {
        return "experiencias";
    }

    @RequestMapping(value = "/formacion", method = RequestMethod.GET)
    public String formacion() {
        return "formacion";
    }

    @RequestMapping(value = "/cv", method = RequestMethod.GET)
    public String cv() {
        return "cv";
    }

    @RequestMapping(value = "/usuarios", method = RequestMethod.GET)
    public String usuarios() {
        return "usuarios";
    }

}