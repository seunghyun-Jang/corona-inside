package kr.ac.hansung.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.hansung.dao.UserDAO;
import kr.ac.hansung.model.CustomUserDetails;


@Controller
public class LoginController { //login & signup

	@Inject
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private UserDAO userdao;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@RequestParam(value = "error", required = false) String error, Model model) {
		if (error != null) {
			model.addAttribute("errorMsg", "ID또는 PW가 일치하지 않습니다.");
		}
		return "login";
	}

	@RequestMapping(value = "/signup", method = { RequestMethod.GET, RequestMethod.POST })
	public String signUp() {
		return "signup";
	}

	@RequestMapping(value = "/insert-user", method = { RequestMethod.GET, RequestMethod.POST })
	public String insertUser(@RequestParam(value = "username",required=false) String username,
			@RequestParam(value = "password",required=false) String password, 
			@RequestParam(value = "nickname",required=false)String nickname) throws IOException {
			
			CustomUserDetails user = new CustomUserDetails();
			user.setUsername(username);
			String Bcrypt_pw = passwordEncoder.encode(password);
			user.setPassword(Bcrypt_pw);
			user.setNickname(nickname);
			user.setAUTHORITY("ROLE_USER");
		    user.setENABLED(true);
			
			userdao.signUp(user);
		return "redirect:/login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.getContext().getAuthentication());
	    return "redirect:/home";
	}

}
