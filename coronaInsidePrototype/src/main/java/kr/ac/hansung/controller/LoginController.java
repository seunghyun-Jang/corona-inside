package kr.ac.hansung.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.hansung.dao.UserDAO;
import kr.ac.hansung.dto.UserVO;


@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(){
		return "login";
	}
	
	@RequestMapping(value = "/signup", method = {RequestMethod.GET,RequestMethod.POST})
	public String signUp(){
		return "signup";
	}
	
	@RequestMapping(value = "/insert-user", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertUser(){
		return "insert-user";
	}
//	�α���(POST)	
	@RequestMapping(value = "/login-success", method = RequestMethod.POST)
	public String loginSuccess(HttpSession session, UserVO vo, Model model) {
		if(session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
		UserDAO loginUser = new UserDAO();
		
		if(loginUser.loginCheck(vo)==1) {				//	����
			session.setAttribute("username",vo.getUser_id());
			logger.info("success login");
			return "redirect:/home";
		}		
		else {
		if(loginUser.loginCheck(vo)==0)//	����
			logger.info("wrong pw");
		else if(loginUser.loginCheck(vo)==-1)
			logger.info("Id doesn't exist");
		else if(loginUser.loginCheck(vo)==-2)
			logger.info("database error");
		//logger.info(Integer.toString((loginUser.loginCheck(vo))));
		return "redirect:/login";
		}
	}
	
	//	�α׾ƿ�	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		UserDAO logout = new UserDAO();
		logout.logout(session);
		logger.info("ByeBye Logout success");
		return "redirect:/home";
	}
	
	
	
}
