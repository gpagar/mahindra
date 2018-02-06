package com.mahindra.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "login";
	}
	
	@RequestMapping(value = "loginProcess")
	public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView();
		String username = request.getParameter("Username");
		String password = request.getParameter("password");
		
		System.out.println("username"+username);
		System.out.println("password"+password);
		
		if(username.equals("Admin") && password.equals("admin"))
		{
			//model=new ModelAndView("home/index");
			 model=new ModelAndView("primitiveMaintenance");
		}
		else
		{

			model=new ModelAndView("login");
		}
		
		return model;
	}
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("home/index");
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
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("login");
		return model;
	}
	
	@RequestMapping(value = "mail", method = RequestMethod.GET)
	public ModelAndView mail(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("mail");
		return model;
	}
}
