package pe.edu.ulima.pw.g2.mvc;

import org.modelmapper.ModelMapper;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import pe.edu.ulima.pw.g2.mvc.dao.entities.EntityEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.RoleEntity;
import pe.edu.ulima.pw.g2.mvc.dao.entities.UserEntity;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.EntityRepository;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.RoleRepository;
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
   * 
   * Descomentar el metodo de abajo, importar todo y correrlo una vez para limpiar
   * la db y crear la data de prueba. Agrega lo que creas conveniente//
   */

   /*

  @Bean
  public CommandLineRunner starterData(final UserRepository repoU, final RoleRepository repoR,
      final EntityRepository repoE) {
    return new CommandLineRunner() {

      @Override
      public void run(final String... args) throws Exception {
        repoE.deleteAll();
        repoU.deleteAll();
        repoR.deleteAll();

        final RoleEntity admin = repoR.save(new RoleEntity(null, "Administrador"));
        final RoleEntity pro = repoR.save(new RoleEntity(null, "Profesional"));

        final UserEntity marselo = repoU.save(new UserEntity(null, "Marselo", "marcelo@gmail.com", "123", "Inocente",
            "123456789", "https://www.linkedin.com/in/marcelo-inocente", true, "gaa", pro));

        final UserEntity fabrizio = repoU.save(new UserEntity(null, "Fabrizio", "fabrizio@gmail.com", "123", "MC",
            "987654321", "https://www.linkedin.com/in/fab", true, "chulls", admin));

        repoE.saveAndFlush(new EntityEntity(null, "Ulima", "Universidad de Lima", marselo));
        repoE.saveAndFlush(new EntityEntity(null, "Belcorp", "F", marselo));
        repoE.saveAndFlush(new EntityEntity(null, "DUIS", "Soporte Blackboard :'v", fabrizio));
        repoE.saveAndFlush(new EntityEntity(null, "Ulima", "Universidad de Lima", fabrizio));

        repoR.flush();
        repoU.flush();
      }
    };
  }*/
}
