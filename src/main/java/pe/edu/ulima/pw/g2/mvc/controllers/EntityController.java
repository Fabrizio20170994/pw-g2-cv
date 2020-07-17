package pe.edu.ulima.pw.g2.mvc.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import pe.edu.ulima.pw.g2.mvc.dao.entities.EntityEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.UserEntity;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.EntityRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.UserRepository;
import pe.edu.ulima.pw.g2.mvc.dto.EntityDTO;

@Controller
public class EntityController {

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EntityRepository entityRepository;

    @GetMapping("/entidades")
    public String getEntities(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserEntity customUser = (UserEntity) authentication.getPrincipal();

        EntityDTO entityDTO = new EntityDTO();

        if (model.getAttribute("entity") != null) {
            entityDTO = (EntityDTO) model.getAttribute("entity");
        }

        model.addAttribute("entities", entityRepository.findUserEntities(customUser));
        model.addAttribute("entity", entityDTO);
        model.addAttribute("usuario", customUser);
        return "entidades";
    }

    @PostMapping("/entidades")
    public ModelAndView registrarEntidad(@ModelAttribute("entity") @Valid EntityDTO entityDto, BindingResult result,
            Model model, final RedirectAttributes redirectAttributes) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserEntity customUser = (UserEntity) authentication.getPrincipal();

        List<String> errors = new ArrayList<String>();

        final EntityEntity entityEntity = modelMapper.map(entityDto, EntityEntity.class);

        entityEntity.setUser(customUser);

        try {
            entityRepository.saveAndFlush(entityEntity);
        } catch (DataIntegrityViolationException e) {
            errors.add("La entidad ya ha sido registrada");

            redirectAttributes.addFlashAttribute("errors", errors);
            redirectAttributes.addFlashAttribute("entity", entityDto);

            return new ModelAndView("redirect:/entidades");
        }

        redirectAttributes.addFlashAttribute("errores", 0);
        return new ModelAndView("redirect:/entidades");
    }

}