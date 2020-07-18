package pe.edu.ulima.pw.g2.mvc;

import org.modelmapper.ModelMapper;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import pe.edu.ulima.pw.g2.mvc.dao.entities.EntityEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.FormacionEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.RoleEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.TipoFormacionEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.UserEntity;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.EntityRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.FormacionRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.OcupationRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.RoleRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.TipoFormacionRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.UserRepository;

@SpringBootApplication
public class MvcApplication {

  public static void main(final String[] args) {
    SpringApplication.run(MvcApplication.class, args);
  }

  @Bean
  public ModelMapper modelMapper() {
    return new ModelMapper();
  }

  /*
   * Descomentar el metodo de abajo, importar todo y correrlo una vez para limpiar
   * la db y crear la data de prueba. Agrega lo que creas conveniente
   */
  
  /* @Bean
  public CommandLineRunner starterData(final UserRepository repoU,
    final RoleRepository repoR, final EntityRepository repoE, TipoFormacionRepository repoTF,
    FormacionRepository repoF, OcupationRepository repoO) {
    
    return new CommandLineRunner() {
  
      @Override public void run(final String... args) throws Exception {
        repoF.deleteAll();
        repoTF.deleteAll();
        repoO.deleteAll();
        repoE.deleteAll();
        repoU.deleteAll();
        repoR.deleteAll();
        
        final RoleEntity admin = repoR.saveAndFlush(new RoleEntity(null, "Administrador"));
        final RoleEntity pro = repoR.saveAndFlush(new RoleEntity(null, "Profesional"));
        
        final UserEntity marselo = repoU.saveAndFlush(
          new UserEntity(null, "Marselo", "marcelo@gmail.com", "123", "Inocente", "123456789",
          "https://www.linkedin.com/in/marcelo-inocente", true, "gaa", pro)
        );
        
        final UserEntity fabrizio = repoU.saveAndFlush(
          new UserEntity(null, "Fabrizio", "fabrizio@gmail.com", "123", "MC", "987654321",
          "https://www.linkedin.com/in/fab", true, "chulls", admin)
        );
        
        EntityEntity ulima = repoE.saveAndFlush(new EntityEntity(null, "Ulima", "Universidad de Lima", marselo));
        repoE.saveAndFlush(new EntityEntity(null, "Belcorp", "F", marselo));
        repoE.saveAndFlush(new EntityEntity(null, "DUIS", "Soporte Blackboard :'v", fabrizio));
        repoE.saveAndFlush(new EntityEntity(null, "Ulima", "Universidad de Lima", fabrizio));

        // formaciones
        TipoFormacionEntity estudio = repoTF.saveAndFlush(new TipoFormacionEntity(null, "Estudio"));
        TipoFormacionEntity curso = repoTF.saveAndFlush(new TipoFormacionEntity(null, "Curso"));

        repoF.saveAndFlush(new FormacionEntity(null, "carrera de inge", 2020L, true, estudio, ulima));
        repoF.saveAndFlush(new FormacionEntity(null, "cursillo de ML", 2017L, true, curso, ulima));
      } 
    };
  } */
}
