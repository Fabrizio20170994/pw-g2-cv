package pe.edu.ulima.pw.g2.mvc.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pe.edu.ulima.pw.g2.mvc.dao.entities.OcupationEntity;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.OcupationRepository;

@Controller
public class OcuController {
    
    @Autowired
    private OcupationRepository repoOcu;

    @GetMapping("/ocupac")
    public String cargarOcupaciones(Model model){
        List<OcupationEntity> listaOcu = repoOcu.findAll();
        model.addAttribute("listaOcupaciones", listaOcu);
        return "ocupaciones";
    }

}