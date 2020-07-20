package pe.edu.ulima.pw.g2.mvc.dao.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import pe.edu.ulima.pw.g2.mvc.dao.entities.EntityEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.ExperienciasEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.OcupationEntity;

public interface ExperienciasRepository extends JpaRepository<ExperienciasEntity,Long>{
    @Query("SELECT u FROM ExperienciasEntity u WHERE u.ocupacion =?1 ")
    public List<ExperienciasEntity> sacarExperienciasDeOcupaciones(OcupationEntity ocupacion);

    @Query("SELECT u FROM ExperienciasEntity u WHERE u.entidad =?1 ")
    public List<ExperienciasEntity> sacarExperienciasDeEntidades(EntityEntity entidad);
}