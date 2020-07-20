package pe.edu.ulima.pw.g2.mvc.dao.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import pe.edu.ulima.pw.g2.mvc.dao.entities.EntityEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.UserEntity;

public interface EntityRepository extends JpaRepository<EntityEntity, Long> {
    @Query("SELECT u FROM EntityEntity u WHERE u.user =?1")
    public List<EntityEntity> findUserEntities(UserEntity user);

    @Query("SELECT u FROM EntityEntity u WHERE u.user =?1")
    public Page<EntityEntity> findUserEntitiesPagination(UserEntity user, Pageable pageable);
}

