package pe.edu.ulima.pw.g2.mvc.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.annotation.PostConstruct;
import javax.validation.Valid;

import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
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

  @PostConstruct
  public void initialize() {
    modelMapper.addMappings(new PropertyMap<UserEntity, UserDTO>() {
      @Override
      protected void configure() {
        skip(destination.getRole());
      }
    });
  }
  
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
    String errores = "no";
    redirectAttributes.addFlashAttribute("errores", errores);
    return new ModelAndView("redirect:/admin/users");
  }

  @GetMapping("/admin/users")
  public String getUsers(Model model, @RequestParam(name = "filter", required = false) String filter){
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
    return "mi-cuenta";
  }

  @GetMapping("/mis-datos")
  public String editInfoPage(WebRequest request, Model model) {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    UserEntity currentUser = (UserEntity) authentication.getPrincipal();

    UserDTO userDto;

    if (model.getAttribute("user") != null) {
      userDto = (UserDTO) model.getAttribute("user");
    } else {
      userDto = modelMapper.map(currentUser, UserDTO.class);
    }
    model.addAttribute("user", userDto);

    return "mis-datos";
  }

  @PostMapping("/mis-datos")
  public String editMydata(@ModelAttribute("user") UserDTO userDto,
    Model model, final RedirectAttributes redirectAttributes) {

    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    UserEntity currentUser = (UserEntity) authentication.getPrincipal();
    
    currentUser.setNombre(userDto.getNombre());
    currentUser.setApellido(userDto.getApellido());
    currentUser.setTelefono(userDto.getTelefono());
    currentUser.setLinkedinUrl(userDto.getLinkedinUrl());
    currentUser.setDatosRelevantes(userDto.getDatosRelevantes());
    
    userRepository.saveAndFlush(currentUser);

    model.addAttribute("success", true);

    return "mis-datos";
  }
}