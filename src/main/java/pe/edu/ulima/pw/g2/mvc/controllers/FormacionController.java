package pe.edu.ulima.pw.g2.mvc.controllers;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.validation.Valid;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pe.edu.ulima.pw.g2.mvc.dao.entities.FormacionEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.UserEntity;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.EntityRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.FormacionRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.TipoFormacionRepository;
import pe.edu.ulima.pw.g2.mvc.dto.FormacionDTO;

@Controller
public class FormacionController {

  @Autowired
  private ModelMapper modelMapper;

  @Autowired
  private FormacionRepository formacionRepository;

  @Autowired
  private TipoFormacionRepository tipoRepository;

  @Autowired
  private EntityRepository entityRepository;
  
  @GetMapping("/formacion")
  public String listaFormaciones(WebRequest request, Model model,
    @RequestParam(required = false) Long tipo) {

    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    UserEntity currentUser = (UserEntity) authentication.getPrincipal();


    List<FormacionEntity> formaciones;
    if (tipo != null) {
      formaciones = formacionRepository.findByUserAndTypeId(currentUser, tipo);
    } else {
      formaciones = formacionRepository.findByUser(currentUser);
    }

    FormacionDTO formacion = new FormacionDTO();

    if (model.getAttribute("formacion") != null) {
      formacion = (FormacionDTO) model.getAttribute("formacion");
    }

    model.addAttribute("formaciones", formaciones);
    model.addAttribute("tipos", tipoRepository.findAll());
    model.addAttribute("entities", entityRepository.findUserEntities(currentUser));
    model.addAttribute("formacion", formacion);

    return "formaciones";
  }

  @PostMapping("/formacion")
  public ModelAndView crearFormacion(@ModelAttribute("formacion") @Valid FormacionDTO formacionDto, 
    BindingResult result, Model model, final RedirectAttributes redirectAttributes) {
    
    List<String> errors = new ArrayList<String>();

    if (result.hasErrors() || formacionDto.getAnioFin() > Calendar.getInstance().get(Calendar.YEAR)) {
      for (FieldError error : result.getFieldErrors()) {
        errors.add("El campo " + error.getField() + " no ha sido completado correctamente");
      }

      if (formacionDto.getAnioFin() > Calendar.getInstance().get(Calendar.YEAR))
        errors.add("El año de fin no es del calendario vigente");

      redirectAttributes.addFlashAttribute("errors", errors);
      redirectAttributes.addFlashAttribute("formacion", formacionDto);

      return new ModelAndView("redirect:/formacion");
    }
    
    final FormacionEntity formacion = modelMapper.map(formacionDto, FormacionEntity.class);
    
    formacion.setTipo(
      tipoRepository.findById(formacionDto.getTipo()).get()
    );

    formacion.setEntidad(
      entityRepository.findById(formacionDto.getEntidad()).get()
    );

    formacionRepository.saveAndFlush(formacion);

    return new ModelAndView("redirect:/formacion");
  }
}