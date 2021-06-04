package kr.ac.hansung.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.ac.hansung.dao.UserDAO;
import kr.ac.hansung.model.CustomUserDetails;

public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserDAO userDAO;
	

   @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        CustomUserDetails user = userDAO.getUserById(username);
        if(user==null) {
            throw new UsernameNotFoundException(username);
        }
        return user;
    }
}