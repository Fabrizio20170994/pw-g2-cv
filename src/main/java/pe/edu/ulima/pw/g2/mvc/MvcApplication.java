package pe.edu.ulima.pw.g2.mvc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class MvcApplication {

  public static void main(String[] args) {
    SpringApplication.run(MvcApplication.class, args);
  }


  /*
    Descomentar el metodo de abajo, importar todo y correrlo una vez
    para limpiar la db y crear la data de prueba.
    Agrega lo que creas conveniente
  */

  /* @Bean
  public CommandLineRunner starterData(UserRepository repoU, RoleRepository repoR) {
    return new CommandLineRunner(){
    
      @Override
      public void run(String... args) throws Exception {
        repoU.deleteAll();
        repoR.deleteAll();

        RoleEntity admin = repoR.save(new RoleEntity(null, "Administrador"));
        RoleEntity pro = repoR.save(new RoleEntity(null, "Profesional"));

        repoU.saveAndFlush(
          new UserEntity(null, "Marselo", "marcelo@gmail.com", "123", "Inocente", 
            "123456789", "https://www.linkedin.com/in/marcelo-inocente", true, "gaa", pro)
        );

        repoU.saveAndFlush(
          new UserEntity(null, "Fabrizio", "fabrizio@gmail.com", "123", "MC", 
            "987654321", "https://www.linkedin.com/in/fab", true, "chulls", admin)
        );

        repoR.flush();
      }
    };
  } */
}
