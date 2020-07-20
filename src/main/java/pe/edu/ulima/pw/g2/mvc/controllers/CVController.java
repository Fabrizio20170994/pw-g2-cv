package pe.edu.ulima.pw.g2.mvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import pe.edu.ulima.pw.g2.mvc.dao.entities.UserEntity;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.FormacionRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.OcupationRepository;

@Controller
public class CVController {

  @Autowired
  private OcupationRepository ocupationRepository;

  @Autowired
  private FormacionRepository formacionRepository;
  
  @GetMapping(value = "/cv")
  public String cv(Model model) {

    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    UserEntity currentUser = (UserEntity) authentication.getPrincipal();

    model.addAttribute("ocupaciones", ocupationRepository.findOcupacionesByUser(currentUser));
    model.addAttribute("formaciones", formacionRepository.findByUser(currentUser));

    return "cv";
  }
}