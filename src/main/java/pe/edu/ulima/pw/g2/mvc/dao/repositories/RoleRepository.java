package pe.edu.ulima.pw.g2.mvc.dao.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import pe.edu.ulima.pw.g2.mvc.dao.entities.RoleEntity;

public interface RoleRepository extends JpaRepository<RoleEntity, Long> {
  
}