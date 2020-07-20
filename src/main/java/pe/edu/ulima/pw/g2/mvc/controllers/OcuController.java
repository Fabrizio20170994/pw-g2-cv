package pe.edu.ulima.pw.g2.mvc.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pe.edu.ulima.pw.g2.mvc.dao.entities.EntityEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.OcupationEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.UserEntity;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.EntityRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.OcupationRepository;
import pe.edu.ulima.pw.g2.mvc.forms.OcuCompletoForm;
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

    @GetMapping("/ocupaciones-update/{id}")
    public String editUserPage(@PathVariable String id, Model model){
        Optional<OcupationEntity> OpOcupacion = repoOcu.findById(Long.parseLong(id));
        OcupationEntity ocupacion = OpOcupacion.get();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserEntity customUser = (UserEntity) authentication.getPrincipal();
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
        model.addAttribute("ocupacion", ocupacion);
        model.addAttribute("listaOcupaciones", listaOcu);
        model.addAttribute("listaEntidades", listaEntid);
        return "ocupaciones-update";
    }
    @PostMapping("/actualizar_ocupacion")
    public String actualizar(OcuCompletoForm formita, Model model){
        Long ocuID = Long.parseLong(formita.getOcuID());
        Long entID = Long.parseLong(formita.getEntidad_nombre());
        System.out.println(ocuID);
        System.out.println(entID);
        Optional<OcupationEntity> OpOcupacion = repoOcu.findById(ocuID);
        System.out.println(OpOcupacion.isPresent());
        Optional<EntityEntity> OpEntidad = repoEnt.findById(entID);
        System.out.println(OpEntidad.isPresent());
        OcupationEntity ocupacion = OpOcupacion.get();
        EntityEntity entidad = OpEntidad.get();
        if(OpOcupacion.isPresent()){
            
            ocupacion.setNombre(formita.getNombreOcup());
            ocupacion.setAnioF(Integer.parseInt(formita.getAnioFOcup()));
            ocupacion.setAnioI(Integer.parseInt(formita.getAnioIOcup()));
            ocupacion.setDescripcion(formita.getDescripcionOcup());
            if(OpEntidad.isPresent()){
                
                ocupacion.setEntidad(entidad);
                repoOcu.saveAndFlush(ocupacion);
            }else{
                System.out.println("no se encuentra la entidad con ID: "+ocuID);
            }
        }else{
            System.out.println("no se encuentra la entidad con ID: "+entID);
        }

        /*Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
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
        model.addAttribute("listaEntidades", listaEntid);*/

        return "redirect:/ocupaciones";
    }
}