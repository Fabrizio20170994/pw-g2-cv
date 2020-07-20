package pe.edu.ulima.pw.g2.mvc.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import pe.edu.ulima.pw.g2.mvc.dao.entities.EntityEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.UserEntity;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.EntityRepository;
import pe.edu.ulima.pw.g2.mvc.dto.EntityDTO;

@Controller
public class EntityController {

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
        return "entidades";
    }

    @PostMapping("/entidades")
    public ModelAndView registrarEntidad(@ModelAttribute("entity") @Valid EntityDTO entityDto, BindingResult result,
            Model model, final RedirectAttributes redirectAttributes) {

        List<String> errors = new ArrayList<String>();

        if (result.hasErrors()) {
            for (FieldError error : result.getFieldErrors()) {
                errors.add(error.getDefaultMessage());
            }

            redirectAttributes.addFlashAttribute("errors", errors);
            redirectAttributes.addFlashAttribute("entity", entityDto);

            return new ModelAndView("redirect:/entidades/save");
        }

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserEntity customUser = (UserEntity) authentication.getPrincipal();

        final EntityEntity entityEntity = new EntityEntity(null, entityDto.getNombre(), entityDto.getDescripcion(),
                customUser);

        try {
            entityRepository.save(entityEntity);
        } catch (DataIntegrityViolationException e) {
            errors.add("La entidad ya ha sido registrada");

            redirectAttributes.addFlashAttribute("errors", errors);
            redirectAttributes.addFlashAttribute("entity", entityDto);

            return new ModelAndView("redirect:/entidades/save");
        }

        entityRepository.deleteById(entityEntity.getId());
        redirectAttributes.addFlashAttribute("entity", entityDto);
        redirectAttributes.addFlashAttribute("errores", 0);
        redirectAttributes.addFlashAttribute("entidad", entityEntity);
        return new ModelAndView("redirect:/entidades/save");
    }

    @GetMapping("/entidades/save")
    public String guardarEntidad(Model model) {

        if (model.getAttribute("entity") == null) {
            return "redirect:/entidades";
        }

        EntityDTO entitySend = (EntityDTO) model.getAttribute("entity");

        model.addAttribute("entity", entitySend);
        return "guardar-entidades";
    }

    @PostMapping("/entidades/save")
    public ModelAndView saveEntidad(@ModelAttribute("entity") EntityDTO entityDTO, Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserEntity customUser = (UserEntity) authentication.getPrincipal();

        EntityEntity entidadGuardar = new EntityEntity(null, entityDTO.getNombre(), entityDTO.getDescripcion(),
                customUser);

        entityRepository.saveAndFlush(entidadGuardar);

        return new ModelAndView("redirect:/entidades");
    }

    @GetMapping("/entidades/edit/{id}")
    public String editEntities(@PathVariable String id, Model model) {


        Optional<EntityEntity> entityEntity = entityRepository.findById(Long.parseLong(id));

        EntityDTO entityDTO = new EntityDTO();

        entityDTO.setDescripcion(entityEntity.get().getDescripcion());
        entityDTO.setNombre(entityEntity.get().getNombre());

        model.addAttribute("entity", entityDTO);
        model.addAttribute("id", id);
        return "edit-entidades";
    }

    @PostMapping("/entidades/edit/{id}")
    public ModelAndView validarEntidad(@ModelAttribute("entity") @Valid EntityDTO entityDto, BindingResult result,
    Model model, final RedirectAttributes redirectAttributes, @PathVariable String id) {

        List<String> errors = new ArrayList<String>();

        if (result.hasErrors()) {
            for (FieldError error : result.getFieldErrors()) {
                errors.add(error.getDefaultMessage());
            }

            redirectAttributes.addFlashAttribute("errors", errors);
            redirectAttributes.addFlashAttribute("entity", entityDto);

            return new ModelAndView("redirect:/entidades/edit/save/{id}");
        }
        
        Optional<EntityEntity> entityEntity = entityRepository.findById(Long.parseLong(id));

 
        // Entidad usada para regresarla a la normalidad
        EntityEntity entidadOriginal = entityEntity.get();
        // Entidad cambiada para la validación
        EntityEntity entidadValidar = entityEntity.get();

        entidadValidar.setDescripcion(entityDto.getDescripcion());
        entidadValidar.setNombre(entityDto.getNombre());

        try {
            entityRepository.save(entidadValidar);
        } catch (DataIntegrityViolationException e) {
            errors.add("La entidad ya ha sido registrada");

            redirectAttributes.addFlashAttribute("errors", errors);
            redirectAttributes.addFlashAttribute("entity", entityDto);

            return new ModelAndView("redirect:/entidades/edit/save/{id}");
        }


        entityRepository.save(entidadOriginal);
        redirectAttributes.addFlashAttribute("entity", entityDto);
        redirectAttributes.addFlashAttribute("errores", 0);
        return new ModelAndView("redirect:/entidades/edit/save/{id}");
    }

    @GetMapping("entidades/edit/save/{id}")
    public String saveEntidad(Model model, @PathVariable String id) {
        if (model.getAttribute("entity") == null) {
            return "redirect:/entidades";
        }

        
        EntityDTO entitySend = (EntityDTO) model.getAttribute("entity");

        model.addAttribute("entity", entitySend);
        return "save-edit-entidades";
    }

    @PostMapping("entidades/edit/save/{id}")
    public ModelAndView saveEditEntidad(@ModelAttribute("entity") EntityDTO entityDTO, Model model, @PathVariable String id) {

        Optional<EntityEntity> entityEntity = entityRepository.findById(Long.parseLong(id));

        EntityEntity entitySave = entityEntity.get();

        entitySave.setDescripcion(entityDTO.getDescripcion());
        entitySave.setNombre(entityDTO.getNombre());

        entityRepository.saveAndFlush(entitySave);

        return new ModelAndView("redirect:/entidades"); 
    }
}