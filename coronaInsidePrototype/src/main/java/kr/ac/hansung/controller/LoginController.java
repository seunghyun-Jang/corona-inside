package kr.ac.hansung.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.hansung.dao.UserDAO;
import kr.ac.hansung.dto.UserVO;
import kr.ac.hansung.model.User;


@Controller
public class LoginController {

	@Autowired
	private UserDAO userdao;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error, Model model) {
		if (error != null) {
			model.addAttribute("errorMsg", "invalid username or password");
		}
		return "login";
	}

	@RequestMapping(value = "/signup", method = { RequestMethod.GET, RequestMethod.POST })
	public String signUp() {
		return "signup";
	}

	@RequestMapping(value = "/insert-user", method = { RequestMethod.GET, RequestMethod.POST })
	public String insertUser(@RequestParam(value = "user_id",required=false) String user_id,
			@RequestParam(value = "user_pw",required=false) String user_pw, 
			@RequestParam(value = "username",required=false)String username) throws IOException {
			
			User user = new User();
			user.setUser_id(user_id);
			user.setUser_pw(user_pw);
			user.setUsername(username);
			userdao.signUp(user);
		return "redirect:/login";
	}

//	�α���(POST)	
	@RequestMapping(value = "/login-success", method = RequestMethod.POST)
	public String loginSuccess(HttpSession session, UserVO vo, Model model) {
		/*
		 * if(session.getAttribute("login") != null) { session.removeAttribute("login");
		 * } UserDAO loginUser = new UserDAO();
		 * 
		 * if(loginUser.loginCheck(vo)==1) { // ����
		 * session.setAttribute("username",vo.getUser_id());
		 * logger.info("success login"); return "redirect:/home"; } else {
		 * if(loginUser.loginCheck(vo)==0)// ���� logger.info("wrong pw"); else
		 * if(loginUser.loginCheck(vo)==-1) logger.info("Id doesn't exist"); else
		 * if(loginUser.loginCheck(vo)==-2) logger.info("database error");
		 * //logger.info(Integer.toString((loginUser.loginCheck(vo))));
		 */ return "redirect:/login";
		// }
	}

	// �α׾ƿ�
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		UserDAO logout = new UserDAO();
		logout.logout(session);
		logger.info("ByeBye Logout success");
		return "redirect:/home";
	}

}
