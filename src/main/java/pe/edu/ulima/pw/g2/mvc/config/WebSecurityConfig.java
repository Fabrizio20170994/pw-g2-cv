package pe.edu.ulima.pw.g2.mvc.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import pe.edu.ulima.pw.g2.mvc.services.UserDetailsServiceImpl;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
  
  //Necesario para evitar que la seguridad se aplique a los resources
  //Como los css, imagenes y javascripts
  String[] resources = new String[] {
    "/include/**","/css/**","/icons/**","/img/**","/js/**","/layer/**", "/", "/formacion"
  };

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http
      .authorizeRequests()
        .antMatchers(resources).permitAll()
        .anyRequest().authenticated()
        .and()
      .formLogin()
        .loginPage("/login")
        .permitAll()
        .defaultSuccessUrl("/me")
        .and()
      .logout()
        .permitAll();
  }

  BCryptPasswordEncoder bCryptPasswordEncoder;

  @Bean
  public BCryptPasswordEncoder passwordEncoder() {
    bCryptPasswordEncoder = new BCryptPasswordEncoder(4);
    return bCryptPasswordEncoder;
  }

  @Autowired
  UserDetailsServiceImpl userDetailsService;

  @Autowired
  public void configureAuth(AuthenticationManagerBuilder auth) throws Exception { 
    auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
  }
}