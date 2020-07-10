package pe.edu.ulima.pw.g2.mvc.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import pe.edu.ulima.pw.g2.mvc.dao.entities.UserEntity;
import pe.edu.ulima.pw.g2.mvc.dao.repositories.UserRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
  @Autowired
  UserRepository userRepository;

  @Override
  public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
  
    UserEntity appUser = userRepository.findByEmail(email).orElseThrow(
      () -> new UsernameNotFoundException("No existe usuario")
    );
    
    UserDetails user = (UserDetails) appUser;
    
    for (GrantedAuthority authority : user.getAuthorities()) {
      System.out.println(authority.getAuthority());
    }
    return user;
  }
}