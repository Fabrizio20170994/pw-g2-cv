package pe.edu.ulima.pw.g2.mvc.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import pe.edu.ulima.pw.g2.mvc.dao.entities.EntityEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.OcupationEntity;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.EntityRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.OcupationRepository;
import pe.edu.ulima.pw.g2.mvc.forms.OcupacionForm;

@Controller
public class OcuController {
    
    @Autowired
    private OcupationRepository repoOcu;
    @Autowired
    private EntityRepository repoEnt;

    @GetMapping("/ocupaciones")
    public String cargarOcupaciones(Model model){
        List<OcupationEntity> listaOcu = repoOcu.findAll();
        model.addAttribute("listaOcupaciones", listaOcu);
        return "ocupaciones";
    }
    @PostMapping("/guardar_ocupacion")
    public String CrearOcupacion(OcupacionForm formOcup){
        OcupationEntity ocupacion = new OcupationEntity();
        Long entidadId = Long.parseLong(formOcup.getEntidad_nombre());
        Optional<EntityEntity> OpEntidad = repoEnt.findById(entidadId);

        ocupacion.setNombre(formOcup.getNombreOcup());
        ocupacion.setDescripcion(formOcup.getDescripcionOcup());
        ocupacion.setAnioI(formOcup.getAnioIOcup());
        ocupacion.setAnioF(formOcup.getAnioFOcup());
        if(OpEntidad.isPresent()){
            ocupacion.setEntidad(OpEntidad.get());
        
            repoOcu.saveAndFlush(ocupacion);
            System.out.println("se guardo la ocupacion");
        }
        return "redirect:/ocupaciones";
    }
}