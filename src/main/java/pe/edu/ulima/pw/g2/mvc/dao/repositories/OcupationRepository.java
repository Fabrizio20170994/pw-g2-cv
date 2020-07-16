package pe.edu.ulima.pw.g2.mvc.dao.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import pe.edu.ulima.pw.g2.mvc.dao.entities.OcupationEntity;

public interface OcupationRepository extends JpaRepository<OcupationEntity, Long> {
    
}