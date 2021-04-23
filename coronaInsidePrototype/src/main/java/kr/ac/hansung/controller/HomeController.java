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
	
	@RequestMapping(value = "/ex", method = RequestMethod.GET)
	public String exhome() {
		return "exhome";
	}
	

	@RequestMapping(value = "/coronaCurrent", method = RequestMethod.GET)
	public String coronaCurrent(Model model, HttpServletRequest request) throws Exception {
			
		
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd");			// ����
		Date today = new Date();		
		String toDay = format1.format(today);		
		System.out.println(toDay);
		
		Calendar cal = Calendar.getInstance();
	    cal.setTime(today);
	    cal.add(Calendar.HOUR, -1);
	    
	    SimpleDateFormat sdformat = new SimpleDateFormat("yyyyMMdd");
	    sdformat.setTimeZone(TimeZone.getTimeZone("UTC"));

	    String beforeHour = sdformat.format(cal.getTime());
	    System.out.println("1�ð� �� : " + beforeHour);

	    Calendar day = Calendar.getInstance();
	    day.add(Calendar.DATE , -1);
	    String beforeDate = new java.text.SimpleDateFormat("yyyyMMdd").format(day.getTime());
	    System.out.println(beforeDate);

	    Calendar week = Calendar.getInstance();
	    week.add(Calendar.DATE , -13);
	    String beforeWeek = new java.text.SimpleDateFormat("yyyyMMdd").format(week.getTime());
	    System.out.println(beforeWeek);

	    Calendar month = Calendar.getInstance();
	    month.add(Calendar.DATE , -31);
	    String beforeMonth = new java.text.SimpleDateFormat("yyyyMMdd").format(month.getTime());
	    System.out.println(beforeMonth);

	    if(InfDTO==null) {		
			System.out.println("InfDTO is null.");
			//InfDTO = getCovid19Inf(beforeDate, beforeWeek);
			InfDTO = getCovid19Inf(beforeHour, beforeMonth);
			model.addAttribute("InfDTO", InfDTO.getResponse().getBody().getItems());
			InfDTO.getResponse().getBody().getItems().getItem()[0].getDecideCnt();
		}

		if(SidoDTO==null) {		
			System.out.println("SidoDTO is null.");
			SidoDTO = getCovid19Sido(beforeHour);
			model.addAttribute("SidoDTO", SidoDTO.getResponse().getBody().getItems());
			
			
			
			
			ItemDTO[] list = SidoDTO.getResponse().getBody().getItems().getItem();
			
			
			if (list != null && list.length != 0) {
				for (kr.ac.hansung.dto.Covid19Sido.ItemDTO item : list) {
					if (!(item.getGubun().equals("�˿�") || item.getGubun().equals("�հ�"))) {
						//System.out.println(item.getGubun());
						map.put(item.getGubun(), item.getDefCnt());
					}
				}
			}
			
			
			
			
		}
		model.addAttribute("InfDTO", InfDTO.getResponse().getBody().getItems());
		model.addAttribute("SidoDTO", SidoDTO.getResponse().getBody().getItems());
		model.addAttribute("map", map);
		System.out.println("now, dto is not null.");
		
		
		
		//String korea = readJson(request);
		//String point = readJson2(request);
		
		List<List<String>> codeMap= readCsv(request);
		
		List<List<String>> pointMap = readCsv2(request);
					
		//System.out.println(codeMap.get(0).get(1));
		
		model.addAttribute("codeMap", codeMap);
		model.addAttribute("pointMap", pointMap);
		//model.addAttribute("korea",korea);
		//model.addAttribute("point",point);
		
		crawler();
		crawler2();
		crawler3();
		
		String[] arr = strArray[0].split("\r");
		String[] arr2 = strArray[1].split("\r");
		String[] arr3 = strArray[2].split("\r");
		String[] str;
		String[][] arr4 = new String[18][5];
		
		
		String[] arr5 = strArray[3].split("\r");
		
		for(int i=6; i<24; i++) {
			str = arr3[i].split(" ");
			for(int j=0; j<5; j++) {
			
				arr4[i-6][j] = str[j];
			}
		}
		
		
		
		
		model.addAttribute("item0",arr[0]);
		model.addAttribute("item1",arr[1]);
		model.addAttribute("item2",arr[2]);
		model.addAttribute("item3",arr[3]);
		model.addAttribute("item4",arr[4]);
		model.addAttribute("item5",arr[5]);
		model.addAttribute("item6",arr[6]);
		model.addAttribute("item7",arr[7]);
		model.addAttribute("item8",arr[8]);
		model.addAttribute("item9",arr[9]);
		
		model.addAttribute("href0",arr2[0]);
		model.addAttribute("href1",arr2[1]);
		model.addAttribute("href2",arr2[2]);
		model.addAttribute("href3",arr2[3]);
		model.addAttribute("href4",arr2[4]);
		model.addAttribute("href5",arr2[5]);
		model.addAttribute("href6",arr2[6]);
		model.addAttribute("href7",arr2[7]);
		model.addAttribute("href8",arr2[8]);
		model.addAttribute("href9",arr2[9]);
		
		model.addAttribute("sd0",arr5[0]);
		model.addAttribute("sd1",arr5[1]);
		model.addAttribute("sd2",arr5[2]);
		model.addAttribute("sd3",arr5[3]);
		model.addAttribute("sd4",arr5[4]);
		model.addAttribute("sd5",arr5[5]);
		model.addAttribute("sd6",arr5[6]);
		model.addAttribute("sd7",arr5[7]);
		model.addAttribute("sd8",arr5[8]);
		model.addAttribute("sd9",arr5[9]);
		model.addAttribute("sd10",arr5[10]);
		model.addAttribute("sd11",arr5[11]);
		model.addAttribute("sd12",arr5[12]);
		model.addAttribute("sd13",arr5[13]);
		model.addAttribute("sd14",arr5[14]);
		model.addAttribute("sd15",arr5[15]);
		model.addAttribute("sd16",arr5[16]);
		
		
		System.out.println(arr4[0][0]);
		System.out.println(arr4[0][1]);
		System.out.println(arr4[0][2]);
		System.out.println(arr4[0][3]);
		System.out.println(arr4[0][4]);
		
		model.addAttribute("vaccineCurrent",arr4);
		
		
		
		
		
		
		
		//System.out.println(dto.getResponse().getBody().getItems().getItem()[0].getExamCnt()+", "+dto.getResponse().getBody().getItems().getItem()[1].getExamCnt()+", "+dto.getResponse().getBody().getItems().getItem()[2].getExamCnt());
		
		return "coronaCurrent";
	}
	
	@RequestMapping(value = "/vaccine", method = RequestMethod.GET)
	public String vaccine() {
		return "vaccine";
	}
	
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq() {
		return "faq";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(){
		return "login";
	}
	
	@RequestMapping(value = "/signUp", method = {RequestMethod.GET,RequestMethod.POST})
	public String signUp(){
		return "signUp";
	}
	
	@RequestMapping(value = "/insertUser", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertUser(){
		return "insertUser";
	}
	
	@RequestMapping(value = "/dbtest", method = {RequestMethod.GET,RequestMethod.POST})
	public String dbtest() {
		return "dbtest";
	}

	//	�α���(POST)	
	@RequestMapping(value = "/loginSuccess", method = RequestMethod.POST)
	public String loginSuccess(HttpSession session, UserVO vo, Model model) {
		if(session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
		UserDAO loginUser = new UserDAO();
		
		if(loginUser.loginCheck(vo)==1) {				//	����
			session.setAttribute("username",vo.getUsername());
			logger.info("success login");
			return "redirect:/home";
		}		
		else {
		if(loginUser.loginCheck(vo)==0)//	����
			logger.info("��й�ȣ ����ġ");
		else if(loginUser.loginCheck(vo)==-1)
			logger.info("���̵� �������� ����");
		else if(loginUser.loginCheck(vo)==-2)
			logger.info("�����ͺ��̽� ����");
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
	
	
	public ApiDTO getCovid19Inf(String toDay, String beforeMonth) throws Exception { // �׽�Ʈ��

		try {
			String serviceKeyDecoded = URLDecoder.decode(
					"0OhBU7ZCGIobDVKDeBJDpmDRqK3IRNF6jlf%2FJB2diFAf%2FfR2czYO9A4UTGcsOwppV6W2HVUeho%2FFPwXoL6DwqA%3D%3D",
					"UTF-8");
			StringBuilder urlBuilder = new StringBuilder(
					"http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson"); /* URL */
			// urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") +
			// "=gdV4T70HlOTqis98q%2FvzD0cd0%2BVcdZiWpY2H86q3bPpKeUnuY7Jb4xBG%2FjoXBmtzhiXtp932xZhCC7GXi%2BF5Kg%3D%3D");
			// /*Service Key*/
			// urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" +
			// URLEncoder.encode(serviceKeyDecoded, "UTF-8")); /*�������������п��� ���� ����Ű*/
			urlBuilder.append(
					"?" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* ��������ȣ */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
					+ URLEncoder.encode("10", "UTF-8")); /* �� ������ ��� �� */
			urlBuilder.append("&" + URLEncoder.encode("startCreateDt", "UTF-8") + "="
					+ URLEncoder.encode(beforeMonth, "UTF-8")); /* �˻��� ������ ������ ���� */
			urlBuilder.append("&" + URLEncoder.encode("endCreateDt", "UTF-8") + "="
					+ URLEncoder.encode(toDay, "UTF-8")); /* �˻��� ������ ������ ���� */
			urlBuilder.append("&" + URLEncoder.encode("serviceKey", "UTF-8") + "="
					+ URLEncoder.encode(serviceKeyDecoded, "UTF-8")); /* �������������п��� ���� ����Ű */
			urlBuilder.append("&" + URLEncoder.encode("_returnType", "UTF-8") + "=" + "json");

			System.out.println("today is" + toDay);
			URL url = new URL(urlBuilder.toString());

			System.out.println(url.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			System.out.println(sb.toString());

			org.json.JSONObject jObject = XML.toJSONObject(sb.toString());
			ObjectMapper mapper = new ObjectMapper();
			mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
			mapper.enable(SerializationFeature.INDENT_OUTPUT);
			ApiDTO api = mapper.readValue(jObject.toString(), ApiDTO.class);

			return api;

		} catch (Exception e) {
			throw e;
		}
	}
	
	
	
	public kr.ac.hansung.dto.Covid19Sido.ApiDTO getCovid19Sido(String toDay) throws Exception { // �׽�Ʈ��

		try {
			String serviceKeyDecoded = URLDecoder.decode(
					"0OhBU7ZCGIobDVKDeBJDpmDRqK3IRNF6jlf%2FJB2diFAf%2FfR2czYO9A4UTGcsOwppV6W2HVUeho%2FFPwXoL6DwqA%3D%3D",
					"UTF-8");
			StringBuilder urlBuilder = new StringBuilder(
					"http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson"); /* URL */
			// urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") +
			// "=gdV4T70HlOTqis98q%2FvzD0cd0%2BVcdZiWpY2H86q3bPpKeUnuY7Jb4xBG%2FjoXBmtzhiXtp932xZhCC7GXi%2BF5Kg%3D%3D");
			// /*Service Key*/
			// urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" +
			// URLEncoder.encode(serviceKeyDecoded, "UTF-8")); /*�������������п��� ���� ����Ű*/
			urlBuilder.append(
					"?" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* ��������ȣ */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
					+ URLEncoder.encode("10", "UTF-8")); /* �� ������ ��� �� */
			urlBuilder.append("&" + URLEncoder.encode("startCreateDt", "UTF-8") + "="
					+ URLEncoder.encode(toDay, "UTF-8")); /* �˻��� ������ ������ ���� */
			urlBuilder.append("&" + URLEncoder.encode("endCreateDt", "UTF-8") + "="
					+ URLEncoder.encode(toDay, "UTF-8")); /* �˻��� ������ ������ ���� */
			urlBuilder.append("&" + URLEncoder.encode("serviceKey", "UTF-8") + "="
					+ URLEncoder.encode(serviceKeyDecoded, "UTF-8")); /* �������������п��� ���� ����Ű */
			urlBuilder.append("&" + URLEncoder.encode("_returnType", "UTF-8") + "=" + "json");

			URL url = new URL(urlBuilder.toString());

			System.out.println(url.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			System.out.println(sb.toString());
			System.out.println("������������������������");

			org.json.JSONObject jObject = XML.toJSONObject(sb.toString());
			ObjectMapper mapper = new ObjectMapper();
			mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
			mapper.enable(SerializationFeature.INDENT_OUTPUT);
			kr.ac.hansung.dto.Covid19Sido.ApiDTO api = mapper.readValue(jObject.toString(), kr.ac.hansung.dto.Covid19Sido.ApiDTO.class);

			return api;

		} catch (Exception e) {
			throw e;
		}
	}
	
	public List<List<String>> readCsv(HttpServletRequest request) throws Exception{
		List<List<String>> ret = new ArrayList<List<String>>();
		BufferedReader br = null;
		
		
		String path = request.getSession().getServletContext().getRealPath("/resources/hospitallist.csv");
		

		//System.out.println(path);

		//File f = new File(".\\src\\main\\webapp\\resources\\hospitallist.csv");
		
		//System.out.println(f.getCanonicalPath());
		//System.out.println(f.getAbsolutePath());
		
		try {
			br = Files.newBufferedReader(Paths.get(path));
			//br = Files.newBufferedReader(Paths.get("C:\\Users\\radiuslab\\Desktop\\hospitallist.csv"));
			//br = new BufferedReader(new FileReader(f));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// Charset.forName("UTF-8");
		String line = "";

		HashMap<String, String> map = new HashMap<String, String>();

		try {
			while ((line = br.readLine()) != null) {
				// CSV 1���� �����ϴ� ����Ʈ
				List<String> tmpList = new ArrayList<String>();
				String array[] = line.split(",");
				// �迭���� ����Ʈ ��ȯ
				tmpList = Arrays.asList(array);
				//System.out.println(tmpList);

				map.put("name", tmpList.get(0));
				map.put("address", tmpList.get(1));
				if (tmpList.size() > 2) {
					map.put("CID", tmpList.get(2));

					map.put("CityType", tmpList.get(3));
				} else {
					map.put("CID", "");
					map.put("CityType", "");
				}
				ret.add(tmpList);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//System.out.println(ret);
		return ret;

	}
	
	
	public List<List<String>> readCsv2(HttpServletRequest request) throws Exception{
		List<List<String>> ret = new ArrayList<List<String>>();
		BufferedReader br = null;

		
		String path = request.getSession().getServletContext().getRealPath("/resources/pointlist.csv");

		//File f = new File(".\\src\\main\\webapp\\resources\\hospitallist.csv");
		
		//System.out.println(f.getCanonicalPath());
		//System.out.println(f.getAbsolutePath());
		
		try {
			br = Files.newBufferedReader(Paths.get(path));
			//br = new BufferedReader(new FileReader(f));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// Charset.forName("UTF-8");
		String line = "";

		HashMap<String, String> map = new HashMap<String, String>();

		try {
			while ((line = br.readLine()) != null) {
				// CSV 1���� �����ϴ� ����Ʈ
				List<String> tmpList = new ArrayList<String>();
				String array[] = line.split(",");
				// �迭���� ����Ʈ ��ȯ
				tmpList = Arrays.asList(array);
				//System.out.println(tmpList);

				map.put("name", tmpList.get(0));
				map.put("address", tmpList.get(1));
				map.put("address", tmpList.get(2));
				if (tmpList.size() > 2) {
					
				} else {
					map.put("CID", "");
					map.put("CityType", "");
				}
				ret.add(tmpList);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(ret);
		return ret;

	}
	
	public String readJson(HttpServletRequest request) throws Exception{
		BufferedReader br = null;
	
		String path = request.getSession().getServletContext().getRealPath("/resources/korea.json");
			
		try {
			br = Files.newBufferedReader(Paths.get(path));

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		String result = "";
		StringBuilder sb = new StringBuilder(result);
		String line = "";

		HashMap<String, String> map = new HashMap<String, String>();

		try {
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//System.out.println(ret);
		System.out.println(sb.toString());
		return sb.toString();

	}
	
	public String readJson2(HttpServletRequest request) throws Exception{
		BufferedReader br = null;
	
		String path = request.getSession().getServletContext().getRealPath("/resources/point.json");
			
		try {
			br = Files.newBufferedReader(Paths.get(path));

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		String result = "";
		StringBuilder sb = new StringBuilder(result);
		String line = "";

		HashMap<String, String> map = new HashMap<String, String>();

		try {
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//System.out.println(ret);
		//System.out.println(sb.toString());
		return sb.toString();

	}
	
	public void crawler() {
		try {
		String URL = "https://search.naver.com/search.naver?where=news&query=%EC%BD%94%EB%A1%9C%EB%82%98&sm=tab_srt&sort=0&photo=0&field=0&reporter_article=&pd=0&ds=&de=&docid=&nso=so%3Ar%2Cp%3Aall%2Ca%3Aall&mynews=0&refresh_start=0&related=0";
		
		Connection conn = Jsoup.connect(URL);
		String[] array = new String[2];
        // 3. HTML �Ľ�.
        Document html = conn.get(); // conn.post();
        
        Elements fileblocks = html.getElementsByClass("news_area");
        
        String title, href, time="";
        
        StringBuilder sb = new StringBuilder("");
        StringBuilder sb2 = new StringBuilder("");
        for( Element fileblock : fileblocks ) {
            
            Elements files = fileblock.getElementsByTag("a");
            Elements files2 = fileblock.getElementsByTag("span");
            
            for (Element elm : files2) {
				time = elm.text();
				
				//System.out.println(text);
			}
        
			for (Element elm : files) {
				title = elm.attr("title");
				href = elm.attr("href");
				

				if (title != "") {
					//System.out.println(title + " > " + href + " ( "+ time +" ) ");
					String result = title + " > " + " ( "+ time +" )\r";
					String result2 = href + "\r";
					sb.append(result);
					sb2.append(result2);
				}
			}
				
        }
        
        strArray[0] = sb.toString();
        strArray[1] = sb2.toString();
        //System.out.println(sb.toString());
        
        //System.out.println(html.toString()); 
      
				
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public void crawler2() {
		try {
		String URL = "https://ncv.kdca.go.kr/mainStatus.es?mid=a11702000000";
		
		Connection conn = Jsoup.connect(URL);
		String[] array = new String[2];
        // 3. HTML �Ľ�.
        Document html = conn.get(); // conn.post();
        
        
        Elements fileblocks = html.getElementsByClass("data_table tbl_scrl_mini");
        
        String current, city="";
        
        StringBuilder sb = new StringBuilder("");
        StringBuilder sb2 = new StringBuilder("");
        for( Element fileblock : fileblocks ) {
            
            Elements files = fileblock.getElementsByTag("tr");
            Elements files2 = fileblock.getElementsByTag("tr");
            
           //for (Element elm : files2) {
				//city = elm.text();
				
				//System.out.println(text);
			//}
        
			for (Element elm : files) {
				//title = elm.attr("title");
				//href = elm.attr("href");
				
				current = elm.text();

				String result = current + "\r";
					//System.out.println(title + " > " + href + " ( "+ time +" ) ");
					
				
				sb.append(result);
					//sb2.append(result2);
				
			
			}
				
        }
        
        
      
        //System.out.println(sb.toString());
        
        //strArray[0] = sb.toString();
        //strArray[1] = sb2.toString();
        strArray[2] = sb.toString();
        //System.out.println(sb.toString());
        
        //System.out.println(html.toString()); 
      
				
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public void crawler3() {
		try {
		String URL = "http://ncov.mohw.go.kr/regSocdisBoardView.do";
		
		Connection conn = Jsoup.connect(URL);
		String[] array = new String[2];
        // 3. HTML �Ľ�.
        Document html = conn.get(); // conn.post();
        
        
        Elements fileblocks = html.getElementsByClass("rssm_graph");
        
        String city;
        
        StringBuilder sb = new StringBuilder("");
        StringBuilder sb2 = new StringBuilder("");
        for( Element fileblock : fileblocks ) {
            
            Elements files = fileblock.getElementsByTag("span");
           
            
           //for (Element elm : files2) {
				//city = elm.text();
				
				//System.out.println(text);
			//}
            
			for (Element elm : files) {
				//title = elm.attr("title");
				//href = elm.attr("href");
				
				String result = "";
				city = elm.text();
				if(city.equals("1")||city.equals("1.5")||city.equals("2")||city.equals("2.5")||city.equals("3")) {
					result = city + "\r";
				}
				
				
				sb.append(result);
					//sb2.append(result2);
				
			
			}
				
        }
        
        System.out.println(sb.toString());
      
        //System.out.println(sb.toString());
        
        //strArray[0] = sb.toString();
        //strArray[1] = sb2.toString();
        //strArray[2] = sb.toString();
        strArray[3] = sb.toString();
        //System.out.println(sb.toString());
        
        //System.out.println(html.toString()); 
      
				
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
