package pe.edu.ulima.pw.g2.mvc.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pe.edu.ulima.pw.g2.mvc.dao.entities.RoleEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.UserEntity;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.RoleRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.UserRepository;
import pe.edu.ulima.pw.g2.mvc.dto.UserDTO;
import pe.edu.ulima.pw.g2.mvc.forms.EditUserForm;

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
      int len = listaUsuarios.size();
      String cuenta = "Total: " + len + " usuarios"; 
      model.addAttribute("listaUsuarios", listaUsuarios);
      model.addAttribute("cuenta", cuenta);
      return "usuarios";
    }else {
      if (filter.equals("Ambos")){
        List<UserEntity> listaUsuarios = userRepository.findAll();
        int len = listaUsuarios.size();
        String cuenta = "Total: " + len + " usuarios"; 
        model.addAttribute("listaUsuarios", listaUsuarios);
        model.addAttribute("cuenta", cuenta);
        return "usuarios";        
      } else if (filter.equals("Activo")){
        List<UserEntity> listaUsuarios = userRepository.findByActive(true);
        int len = listaUsuarios.size();
        String cuenta = "Total: " + len + " usuarios"; 
        model.addAttribute("cuenta", cuenta);
        model.addAttribute("listaUsuarios", listaUsuarios);
        return "usuarios"; 
      } else {
        List<UserEntity> listaUsuarios = userRepository.findByActive(false);
        int len = listaUsuarios.size();
        String cuenta = "Total: " + len + " usuarios"; 
        model.addAttribute("listaUsuarios", listaUsuarios);
        model.addAttribute("cuenta", cuenta);
        return "usuarios"; 
      }
    }
  }

  @GetMapping("/admin/user/{id}")
  public String editUserPage(@PathVariable String id, Model model) {
    // TODO: Pagina donde el admin edita el rol y estado de un user

    Long Id = Long.parseLong(id);
    Optional<UserEntity> opUser = userRepository.findById(Id); 
    if(opUser.isPresent()){
      UserEntity user = opUser.get();
      Long idRole = user.getRole().getId();
      model.addAttribute("usuarioEditar", user);
      model.addAttribute("idRole", idRole);
    }
    EditUserForm editUserForm = new EditUserForm();
    model.addAttribute("roles", roleRepository.findAll());
    model.addAttribute("userId", id);
    model.addAttribute("UserForm", editUserForm);
    
    return "update-user";

  }

  @PostMapping("/admin/user/{id}/edit")
  public String editUser(@PathVariable String id, EditUserForm editUserForm){
    // TODO: editar usuario con id

    Long idUser = Long.parseLong(id);
    Optional<UserEntity> opUser = userRepository.findById(idUser);
    if(opUser.isPresent()){
      UserEntity usuario = opUser.get();
      Optional<RoleEntity> opRole = roleRepository.findById(Long.parseLong(editUserForm.getUser_role()));
      if(opRole.isPresent()){
        RoleEntity rol = opRole.get();
        usuario.setRole(rol);  
        usuario.setActive(Boolean.parseBoolean(editUserForm.getUser_active()));
        userRepository.saveAndFlush(usuario);
      }
    }else{
      System.out.println("No se encuentra usuario para modificacion");
    }
    
    
    
    return "redirect:/admin/users";

  }

  @GetMapping(value = "/me")
  public String accountPage(Model model) {
    // El usuario actual se obtiene en la vista
    return "mi-cuenta";
  }

  @GetMapping("/me/edit")
  public String editInfoPage() {
    // TODO: Pagina donde el user edita sus datos
    return "usuarios";
  }

  @PutMapping("/me/edit")
  public String editMydata(Long id) {
    // El usuario actualmente logueado se obtiene asi:
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    UserEntity customUser = (UserEntity) authentication.getPrincipal();
    // TODO: logica para editar usuario
    return "usuarios";
  }
}