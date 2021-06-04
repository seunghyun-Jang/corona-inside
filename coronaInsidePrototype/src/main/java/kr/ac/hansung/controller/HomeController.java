package kr.ac.hansung.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	private static kr.ac.hansung.dto.Covid19Inf.ApiDTO InfDTO = null;
	private static String[] strArray= new String[4];
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		setup(model);
		
		return "home";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home2(Model model) {
		setup(model);
		
		return "home";
	}
	
	public void setup(Model model) {
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd");			
		Date today = new Date();		
		String toDay = format1.format(today);		
		
		Calendar cal = Calendar.getInstance();
	    cal.setTime(today);
	    cal.add(Calendar.HOUR, -1);
	    
	    SimpleDateFormat sdformat = new SimpleDateFormat("yyyy/MM/dd");
	    sdformat.setTimeZone(TimeZone.getTimeZone("UTC"));
	    
	    String BeforeHour = sdformat.format(cal.getTime());
	    
	    model.addAttribute("beforeHour",BeforeHour);
	      
	    sdformat = new SimpleDateFormat("yyyyMMdd");
	    sdformat.setTimeZone(TimeZone.getTimeZone("UTC"));

	    String beforeHour = sdformat.format(cal.getTime());

	    Calendar day = Calendar.getInstance();
	    day.add(Calendar.DATE , -1);
	    String beforeDate = new java.text.SimpleDateFormat("yyyy/MM/dd").format(day.getTime());

	    day.add(Calendar.DATE , -1);
	    String beforeDate2 = new java.text.SimpleDateFormat("yyyy/MM/dd").format(day.getTime());
	    
	    model.addAttribute("beforeDate2", beforeDate2);
	    
	    Calendar month = Calendar.getInstance();
	    month.add(Calendar.DATE , -31);
	    String beforeMonth = new java.text.SimpleDateFormat("yyyyMMdd").format(month.getTime());

	    if(InfDTO==null) {		
			try {
				InfDTO = CoronaController.getCovid19Inf(beforeHour, beforeMonth);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("InfDTO", InfDTO.getResponse().getBody().getItems());
			InfDTO.getResponse().getBody().getItems().getItem()[0].getDecideCnt();
		}
	    model.addAttribute("InfDTO", InfDTO.getResponse().getBody().getItems());
	    
	    
	    
	    strArray = CoronaController.crawler();
	    String s = VaccineController.crawler();
	    strArray[2] = s;
	    
	    String[] arr = strArray[0].split("\r");
		String[] arr2 = strArray[1].split("\r");
		
		String[] arr3 = strArray[2].split("\r");
		String[] str;
		String[][] arr4 = new String[18][5];
		
		for(int i=6; i<24; i++) {
			str = arr3[i].split(" ");
			for(int j=0; j<5; j++) {
			
				arr4[i-6][j] = str[j];
			}
		}	
	
		model.addAttribute("vaccineCurrent0",arr4[0][0]);
		model.addAttribute("vaccineCurrent1",arr4[0][1]);
		model.addAttribute("vaccineCurrent2",arr4[0][2]);
		model.addAttribute("vaccineCurrent3",arr4[0][3]);
		model.addAttribute("vaccineCurrent4",arr4[0][4]);
		
		model.addAttribute("item0",arr[0]);
		model.addAttribute("item1",arr[1]);
		model.addAttribute("item2",arr[2]);
		
		model.addAttribute("href0",arr2[0]);
		model.addAttribute("href1",arr2[1]);
		model.addAttribute("href2",arr2[2]);

	}
}
