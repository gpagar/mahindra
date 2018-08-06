package com.mahindra.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.formula.udf.UDFFinder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.mahindra.project.constant.Constant;
import com.mahindra.project.model.MachinDetailsList;
import com.mahindra.project.model.UserDetails;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	UserDetails userDetail=null;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "login2";
	}
	
	@RequestMapping(value = "loginProcess" , method = RequestMethod.POST)
	public String loginProcess(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView();
		String maping;
		try
		{
			String username = request.getParameter("username");
			String password = request.getParameter("pass");
			
			System.out.println("username"+username);
			System.out.println("password"+password);
			
			
			RestTemplate rest = new RestTemplate();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("email",username);
			map.add("password",password);
			userDetail  = rest.postForObject(Constant.url + "login", map,
					UserDetails.class);
			System.out.println("login " + userDetail);
			if(userDetail!=null)
			{
				//model=new ModelAndView("home/index");
				 model=new ModelAndView("primitiveMaintenance");
				 HttpSession session = request.getSession();
				 session.setAttribute("userDetail", userDetail);
				 maping="home";
			}
			else
			{

				model=new ModelAndView("login2");
				maping="/";
				
			}
		}catch(Exception e)
		{
			e.printStackTrace();
			model=new ModelAndView("login2");
			maping="/";
		}
		
		 
		return "redirect:/"+maping;
	}
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("home");
		try
		{
			HttpSession session = request.getSession();
			UserDetails userDetail = (UserDetails) session.getAttribute("userDetail"); 
			 model.addObject("userDetail", userDetail);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(value = "primitiveMaintenance", method = RequestMethod.GET)
	public ModelAndView primitiveMaintenance(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("primitiveMaintenance");
		return model;
	}
	
	
	
	@RequestMapping(value = "breakDown", method = RequestMethod.GET)
	public ModelAndView breakDown(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("breakDown");
		return model;
	}
	
	@RequestMapping(value = "history", method = RequestMethod.GET)
	public ModelAndView history(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("history");
		return model;
	}
	
	@RequestMapping(value = "graph", method = RequestMethod.GET)
	public ModelAndView graph(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("graph");
		return model;
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("login2");
		return "redirect:/";
	}
	
	@RequestMapping(value = "mail", method = RequestMethod.GET)
	public ModelAndView mail(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("mail");
		return model;
	}
}
