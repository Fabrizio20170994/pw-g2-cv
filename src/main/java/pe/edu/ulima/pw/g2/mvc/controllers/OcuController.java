package pe.edu.ulima.pw.g2.mvc.controllers;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pe.edu.ulima.pw.g2.mvc.dao.entities.EntityEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.OcupationEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.UserEntity;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.EntityRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.OcupationRepository;
import pe.edu.ulima.pw.g2.mvc.forms.OcupacionForm;
import pe.edu.ulima.pw.g2.mvc.forms.miniEntidadForm;

@Controller
public class OcuController {
    
    @Autowired
    private OcupationRepository repoOcu;

    @Autowired
    private EntityRepository repoEnt;

    

    @GetMapping("/ocupaciones")
    public String cargarOcupaciones(Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserEntity customUser = (UserEntity) authentication.getPrincipal();
        System.out.println(customUser.getNombre());
        List<EntityEntity> listaEntid = repoEnt.findUserEntities(customUser);
        int first=1;
        List<OcupationEntity> listaOcu = null;
        for (EntityEntity ent : listaEntid){
            if(first==1){
                 listaOcu= repoOcu.sacarOcupacionesDeEntidades(ent);
                first=0;
            }else{
                listaOcu.addAll(repoOcu.sacarOcupacionesDeEntidades(ent));
            }
             repoOcu.sacarOcupacionesDeEntidades(ent);
        }
        model.addAttribute("listaOcupaciones", listaOcu);
        model.addAttribute("listaEntidades", listaEntid);
        return "ocupaciones";
    }
    @PostMapping("/guardar_ocupacion")
    public String CrearOcupacion(OcupacionForm formOcup, Model model){
        OcupationEntity ocupacion = new OcupationEntity();
        Long entidadId = Long.parseLong(formOcup.getEntidad_nombre());
        Optional<EntityEntity> OpEntidad = repoEnt.findById(entidadId);

        ocupacion.setNombre(formOcup.getNombreOcup());
        ocupacion.setDescripcion(formOcup.getDescripcionOcup());
        ocupacion.setAnioI(Integer.parseInt(formOcup.getAnioIOcup()));
        ocupacion.setAnioF(Integer.parseInt(formOcup.getAnioFOcup()));
        if(OpEntidad.isPresent()){
            ocupacion.setEntidad(OpEntidad.get());
        
            repoOcu.saveAndFlush(ocupacion);
            System.out.println("se guardo la ocupacion");
        }
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserEntity customUser = (UserEntity) authentication.getPrincipal();
        System.out.println(customUser.getNombre());
        List<EntityEntity> listaEntid = repoEnt.findUserEntities(customUser);
        int first=1;
        List<OcupationEntity> listaOcu = null;
        for (EntityEntity ent : listaEntid){
            if(first==1){
                 listaOcu= repoOcu.sacarOcupacionesDeEntidades(ent);
                first=0;
            }else{
                listaOcu.addAll(repoOcu.sacarOcupacionesDeEntidades(ent));
            }
             repoOcu.sacarOcupacionesDeEntidades(ent);
        }
        model.addAttribute("listaOcupaciones", listaOcu);
        model.addAttribute("listaEntidades", listaEntid);
        return "ocupaciones";
    }
    @RequestMapping(value = "/ocupaciones_filtradas", method = RequestMethod.GET)
    public String ModificarOcupacion(miniEntidadForm formita, Model model){
        
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserEntity customUser = (UserEntity) authentication.getPrincipal();
        List<EntityEntity> listaEntid = repoEnt.findUserEntities(customUser);
        
        EntityEntity entidad = new EntityEntity();

        Long entidadId = Long.parseLong(formita.getEntidad());
        Optional<EntityEntity> opEntity = repoEnt.findById(entidadId);

        if(opEntity.isPresent()){
            entidad=opEntity.get();
        }

        List<OcupationEntity> listaOcu = repoOcu.sacarOcupacionesDeEntidades(entidad);
        
        model.addAttribute("listaOcupaciones", listaOcu);
        model.addAttribute("listaEntidades", listaEntid);
        return "ocupaciones";
    }
}