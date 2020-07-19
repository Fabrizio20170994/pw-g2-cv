package pe.edu.ulima.pw.g2.mvc.controllers;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.validation.Valid;

import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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

  @PostConstruct
  public void initialize() {
    modelMapper.addMappings(new PropertyMap<FormacionEntity, FormacionDTO>() {
      @Override
      protected void configure() {
        skip(destination.getEntidad());
        skip(destination.getTipo());
      }
    });
  }
  
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
    
    List<String> errors = hasErrors(formacionDto, result);

    if (!errors.isEmpty()) {
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

  @GetMapping("/formacion/{id}/edit")
  public String editPage(@PathVariable Long id, WebRequest request, Model model) {

    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    UserEntity currentUser = (UserEntity) authentication.getPrincipal();

    FormacionDTO formacionDto;

    if (model.getAttribute("formacion") != null) {
      formacionDto = (FormacionDTO) model.getAttribute("formacion");
    } else {
      final FormacionEntity formacion = formacionRepository.findById(id).get();
      formacionDto = modelMapper.map(formacion, FormacionDTO.class);
      formacionDto.setEntidad(formacion.getEntidad().getId());
      formacionDto.setTipo(formacion.getTipo().getId());
    }

    model.addAttribute("tipos", tipoRepository.findAll());
    model.addAttribute("entities", entityRepository.findUserEntities(currentUser));
    model.addAttribute("formacion", formacionDto);
    model.addAttribute("id", id);

    return "edit-formacion";
  }

  @PostMapping("/formacion/{id}/edit")
  public ModelAndView editFormacion(@PathVariable Long id,
    @ModelAttribute("formacion") @Valid FormacionDTO formacionDto, 
    BindingResult result, Model model, final RedirectAttributes redirectAttributes) {

    List<String> errors = hasErrors(formacionDto, result);

    if (!errors.isEmpty()) {
      redirectAttributes.addFlashAttribute("errors", errors);
      redirectAttributes.addFlashAttribute("formacion", formacionDto);
      return new ModelAndView("redirect:/formacion/" + id + "/edit");
    }
    
    FormacionEntity formacion = formacionRepository.findById(id).get();
    formacion.setDetalle(formacionDto.getDetalle());
    formacion.setAnioFin(formacionDto.getAnioFin());
    formacion.setVisible(formacionDto.getVisible());
    
    formacion.setTipo(
      tipoRepository.findById(formacionDto.getTipo()).get()
    );

    formacion.setEntidad(
      entityRepository.findById(formacionDto.getEntidad()).get()
    );

    formacionRepository.saveAndFlush(formacion);

    return new ModelAndView("redirect:/formacion");
  }

  private List<String> hasErrors(FormacionDTO formacionDto, BindingResult result) {
    List<String> errors = new ArrayList<String>();

    if (result.hasErrors()) {
      for (FieldError error : result.getFieldErrors()) {
        if (error.getField().equalsIgnoreCase("detalle") && formacionDto.getDetalle().length() > 250) {
          errors.add("El detalle supera los 250 caracteres");
        } else {
          errors.add("El campo " + error.getField() + " no ha sido completado correctamente");
        }
      }
    }
    if (formacionDto.getAnioFin() != null && formacionDto.getAnioFin() > Calendar.getInstance().get(Calendar.YEAR))
      errors.add("El año de fin no es del calendario vigente");

    return errors;
  }
}