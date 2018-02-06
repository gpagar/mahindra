package com.mahindra.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PMController {

	
	@RequestMapping(value = "addPredictiveMaintenance", method = RequestMethod.GET)
	public ModelAndView predictiveMaintenance(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("pMaintanance/addPMaintanance");
		return model;
	}
	
	@RequestMapping(value = "showPmPlan", method = RequestMethod.GET)
	public ModelAndView showPmPlan(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("pMaintanance/showPmPlan");
		return model;
	}
	
	
}
