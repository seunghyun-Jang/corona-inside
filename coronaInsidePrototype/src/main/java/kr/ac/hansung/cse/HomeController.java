package kr.ac.hansung.cse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/ex", method = RequestMethod.GET)
	public String exhome() {
		return "exhome";
	}
	
	@RequestMapping(value = "/coronaCurrent", method = RequestMethod.GET)
	public String coronaCurrent() {
		return "coronaCurrent";
	}
	
	@RequestMapping(value = "/community", method = RequestMethod.GET)
	public String community() {
		return "community";
	}
	
	@RequestMapping(value = "/selfcheck", method = RequestMethod.GET)
	public String selfcheck() {
		return "selfcheck";
	}
	
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq() {
		return "faq";
	}
	
}
