package pe.edu.ulima.pw.g2.mvc.dao.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import pe.edu.ulima.pw.g2.mvc.dao.entities.EntityEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.OcupationEntity;

public interface OcupationRepository extends JpaRepository<OcupationEntity, Long> {
    @Query("SELECT u FROM OcupationEntity u WHERE u.entidad = ?1")
    public List<OcupationEntity> sacarOcupacionesDeEntidades(EntityEntity entidad);

    @Query("Select u FROM OcupationEntity u WHERE u.entidad = ?1 ORDER BY u.anioF DESC")
    public List<OcupationEntity> sacarOcupacionesDeEntidadesOrdenadas(EntityEntity entidad);
}