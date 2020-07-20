package pe.edu.ulima.pw.g2.mvc.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import pe.edu.ulima.pw.g2.mvc.dao.entities.EntityEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.ExperienciasEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.OcupationEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.UserEntity;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.EntityRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.ExperienciasRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.OcupationRepository;
import pe.edu.ulima.pw.g2.mvc.forms.ExperienciaForm;

@Controller
public class ExperienciasController {
    
    @Autowired
    private EntityRepository repoEnt;
    @Autowired
    private OcupationRepository repoOcu;
    @Autowired
    private ExperienciasRepository repoExp;

    @GetMapping("/experiencias")
    public String cargarOcupaciones(Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserEntity customUser = (UserEntity) authentication.getPrincipal();
        List<EntityEntity> listaEntid = repoEnt.findUserEntities(customUser);
        int first=1;
        //List<OcupationEntity> listaOcu = null;
        List<OcupationEntity> listaOcu = null;
        //
        for (EntityEntity ent : listaEntid){
            if(first==1){
                listaOcu = repoOcu.sacarOcupacionesDeEntidadesOrdenadas(ent);
                first=0;
            }else{
                listaOcu.addAll(repoOcu.sacarOcupacionesDeEntidadesOrdenadas(ent));
            }
            //repoOcu.sacarOcupacionesDeEntidades(ent);
        }
        first=1;
        List<ExperienciasEntity> listaExp = null;
        for (OcupationEntity ocu : listaOcu){
            if(first ==1){
                listaExp = repoExp.sacarExperienciasDeOcupaciones(ocu);
                first =0;
            }else{
                listaExp.addAll(repoExp.sacarExperienciasDeOcupaciones(ocu));
            }
        }
        model.addAttribute("listaExperiencias", listaExp);
        model.addAttribute("listaOcupaciones", listaOcu);
        model.addAttribute("listaEntidades", listaEntid);
        return "experiencias";
    }


    @GetMapping("/actualizar-crear-experiencia/{idEntidad}")
    public String actualizarCrearExperiencia(@PathVariable String idEntidad, Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserEntity customUser = (UserEntity) authentication.getPrincipal();
        Long idENt = Long.parseLong(idEntidad);
        Optional<EntityEntity> OpEntidadFiltrada = repoEnt.findById(Long.parseLong(idEntidad));
        int first=1;
        List<EntityEntity> listaEntid = repoEnt.findUserEntities(customUser);
        List<OcupationEntity> listaOcu = null;
        for (EntityEntity ent : listaEntid){
            if(first==1){
                listaOcu = repoOcu.sacarOcupacionesDeEntidadesOrdenadas(ent);
                first=0;
            }else{
                listaOcu.addAll(repoOcu.sacarOcupacionesDeEntidadesOrdenadas(ent));
            }
            //repoOcu.sacarOcupacionesDeEntidades(ent);
        }
        first=1;
        List<ExperienciasEntity> listaExp = null;
        for (OcupationEntity ocu : listaOcu){
            if(first ==1){
                listaExp = repoExp.sacarExperienciasDeOcupaciones(ocu);
                first =0;
            }else{
                listaExp.addAll(repoExp.sacarExperienciasDeOcupaciones(ocu));
            }
        }
        List<OcupationEntity> listaOcuFiltrada = null;
        if(OpEntidadFiltrada.isPresent()){
            
            EntityEntity entidadFiltrada = OpEntidadFiltrada.get();
            listaOcuFiltrada = repoOcu.sacarOcupacionesDeEntidades(entidadFiltrada);
        }
        model.addAttribute("listaExperiencias", listaExp);
        model.addAttribute("listaOcupaciones", listaOcu);
        model.addAttribute("listaEntidades", listaEntid);
        model.addAttribute("listaOcupacionesFiltrada", listaOcuFiltrada);
        model.addAttribute("entidadID", idENt);
        return "experienciasCrear";
    }


    @PostMapping("/crear-experiencia")
    public String crearOcupacion(ExperienciaForm formita, Model model){
        ExperienciasEntity experiencia = new ExperienciasEntity();
        Long ocupacionId = Long.parseLong(formita.getId_ocupacion());
        Optional<OcupationEntity> OpOcupacion = repoOcu.findById(ocupacionId);
        experiencia.setLogro(formita.getLogro());
        experiencia.setVisibilidad(Boolean.parseBoolean(formita.getVisibilidad()));
        if(OpOcupacion.isPresent()){
            OcupationEntity ocupacion = OpOcupacion.get();
            experiencia.setOcupacion(ocupacion);
            Long entidadId = ocupacion.getEntidad().getId();
            Optional<EntityEntity> OpEntidad = repoEnt.findById(entidadId);
            if(OpEntidad.isPresent()){
                experiencia.setEntidad(OpEntidad.get());
                repoExp.saveAndFlush(experiencia);
            }
        }
        
        return "redirect:/experiencias";
    }
}