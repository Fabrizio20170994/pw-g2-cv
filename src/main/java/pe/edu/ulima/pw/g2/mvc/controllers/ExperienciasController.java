package pe.edu.ulima.pw.g2.mvc.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import pe.edu.ulima.pw.g2.mvc.dao.entities.EntityEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.ExperienciasEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.OcupationEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.UserEntity;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.EntityRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.ExperienciasRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.OcupationRepository;

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
        System.out.println(customUser.getNombre());
        List<EntityEntity> listaEntid = repoEnt.findUserEntities(customUser);
        int first=1;
        List<OcupationEntity> listaOcu = null;
        for (EntityEntity ent : listaEntid){
            if(first==1){
                listaOcu = repoOcu.sacarOcupacionesDeEntidades(ent);
                first=0;
            }else{
                listaOcu.addAll(repoOcu.sacarOcupacionesDeEntidades(ent));
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
}