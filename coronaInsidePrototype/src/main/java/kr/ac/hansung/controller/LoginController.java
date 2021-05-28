package kr.ac.hansung.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	public String insertUser(@RequestParam(value = "user_id",required=false) String user_id,
			@RequestParam(value = "password",required=false) String password, 
			@RequestParam(value = "username",required=false)String username) throws IOException {
			
			CustomUserDetails user = new CustomUserDetails();
			user.setUser_id(user_id);
			String Bcrypt_pw = passwordEncoder.encode(password);
			user.setPassword(Bcrypt_pw);
			user.setUsername(username);
			userdao.signUp(user);
		return "redirect:/login";
	}


	@RequestMapping(value = "/logincheck", method = RequestMethod.POST)
	public String loginCheck(@RequestParam(value = "user_id",required=false) String user_id,
			@RequestParam(value = "password",required=false) String password, 
			@RequestParam(value = "username",required=false)String username, Model model) throws IOException {
		
		if(userdao.loginCheck(user_id, password)) {
			return "redirect:/home";
		} else {
			model.addAttribute("errorMsg", "ID또는 PW가 일치하지 않습니다.");
			return "login";
		}
		 
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		UserDAO logout = new UserDAO();
		logout.logout(session);
		logger.info("ByeBye Logout success");
		return "redirect:/home";
	}

}
