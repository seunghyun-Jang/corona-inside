package kr.ac.hansung.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.XML;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

import kr.ac.hansung.dao.UserDAO;
import kr.ac.hansung.dto.UserVO;
import kr.ac.hansung.dto.Covid19Inf.ApiDTO;
import kr.ac.hansung.dto.Covid19Sido.ItemDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static HashMap<String, String> map = new HashMap<String, String>();
	private static kr.ac.hansung.dto.Covid19Inf.ApiDTO InfDTO = null;
	private static kr.ac.hansung.dto.Covid19Sido.ApiDTO SidoDTO = null;
	private static String[] strArray= new String[4];
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home2() {
		return "home";
	}
	
	@RequestMapping(value = "/vaccine", method = RequestMethod.GET)
	public String vaccine() {
		return "vaccine";
	}
}