package pe.edu.ulima.pw.g2.mvc.dao.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import pe.edu.ulima.pw.g2.mvc.dao.entities.FormacionEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.UserEntity;

public interface FormacionRepository extends JpaRepository<FormacionEntity, Long> {

  @Query("SELECT f FROM FormacionEntity f WHERE f.entidad.user = ?1 AND f.tipo.id = ?2")
  public List<FormacionEntity> findByUserAndTypeId(UserEntity user, Long idTipo);

  @Query("SELECT f FROM FormacionEntity f WHERE f.entidad.user = ?1")
  public List<FormacionEntity> findByUser(UserEntity user);
}