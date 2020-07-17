package pe.edu.ulima.pw.g2.mvc.dao.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import pe.edu.ulima.pw.g2.mvc.dao.entities.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
  @Query("SELECT u FROM UserEntity u WHERE u.email=?1")
  public Optional<UserEntity> findByEmail(String email);

  @Query("SELECT u FROM UserEntity u WHERE u.active = ?1")
  public List<UserEntity> findByActive(Boolean active);
}