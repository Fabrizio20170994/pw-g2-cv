package pe.edu.ulima.pw.g2.mvc.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pe.edu.ulima.pw.g2.mvc.dao.entities.UserEntity;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.RoleRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.UserRepository;
import pe.edu.ulima.pw.g2.mvc.dto.UserDTO;

@Controller
public class UserController {

  @Autowired
  private ModelMapper modelMapper;

  @Autowired
  private UserRepository userRepository;

  @Autowired
  private RoleRepository roleRepository;
  
  @GetMapping("/admin/create-user")
  public String newUserForm(WebRequest request, Model model) {
    
    UserDTO userDTO = new UserDTO();

    if (model.getAttribute("user") != null) {
      userDTO = (UserDTO) model.getAttribute("user");
    }
    
    model.addAttribute("roles", roleRepository.findAll());
    model.addAttribute("user", userDTO);

    return "create-user";
  }

  @PostMapping("/admin/user")
  public ModelAndView registerUserAccount(
    @ModelAttribute("user") @Valid UserDTO userDto, BindingResult result,
    Model model, final RedirectAttributes redirectAttributes) { 
    
    List<String> errors = new ArrayList<String>();

    if (result.hasErrors()) {
      for (FieldError error : result.getFieldErrors()) {
        errors.add("Error en el campo " + error.getField());
      }

      redirectAttributes.addFlashAttribute("errors", errors);
      redirectAttributes.addFlashAttribute("user", userDto);

      return new ModelAndView("redirect:/admin/create-user");
    }
    
    final UserEntity userEntity = modelMapper.map(userDto, UserEntity.class);
    
    userEntity.setRole(
      roleRepository.findById(userDto.getRole()).get()
    );

    try {
      userRepository.saveAndFlush(userEntity);
    } catch (DataIntegrityViolationException e) {
      errors.add("El correo ya está registrado");

      redirectAttributes.addFlashAttribute("errors", errors);
      redirectAttributes.addFlashAttribute("user", userDto);

      return new ModelAndView("redirect:/admin/create-user");
    }
    /* TODO: agregar alerta de exito*/
    String errores = "no";
    redirectAttributes.addFlashAttribute("errores", errores);
    return new ModelAndView("redirect:/admin/users");
  }

  @GetMapping("/admin/users")
  public String getUsers(Model model, @RequestParam(name = "filter", required = false) String filter){
    //TODO: mostrar la lista de usuarios en usuarios
    if (filter == null){
      List<UserEntity> listaUsuarios = userRepository.findAll();
      model.addAttribute("listaUsuarios", listaUsuarios);
      return "usuarios";
    }else {
      if (filter.equals("Ambos")){
        List<UserEntity> listaUsuarios = userRepository.findAll();
        model.addAttribute("listaUsuarios", listaUsuarios);
        return "usuarios";        
      } else if (filter.equals("Activo")){
        List<UserEntity> listaUsuarios = userRepository.findByActive(true);
        model.addAttribute("listaUsuarios", listaUsuarios);
        return "usuarios"; 
      } else {
        List<UserEntity> listaUsuarios = userRepository.findByActive(false);
        model.addAttribute("listaUsuarios", listaUsuarios);
        return "usuarios"; 
      }
    }
  }

  @GetMapping("/admin/user/{id}")
  public String editUserPage(Long id) {
    // TODO: Pagina donde el admin edita el rol y estado de un user
    return "usuario";
  }

  @PutMapping("/admin/user/{id}/edit")
  public String editUser(Long id) {
    // TODO: editar usuario con id
    return "usuario";
  }

  @GetMapping(value = "/me")
  public String accountPage(Model model) {
    // El usuario actual se obtiene en la vista
    return "mi-cuenta";
  }

  @GetMapping("/me/edit")
  public String editInfoPage() {
    // TODO: Pagina donde el user edita sus datos
    return "usuario";
  }

  @PutMapping("/me/edit")
  public String editMydata(Long id) {
    // El usuario actualmente logueado se obtiene asi:
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    UserEntity customUser = (UserEntity) authentication.getPrincipal();
    // TODO: logica para editar usuario
    return "usuario";
  }
}