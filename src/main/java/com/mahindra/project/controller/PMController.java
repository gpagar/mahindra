package com.mahindra.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mahindra.project.model.MachinMaintanaceSchedule;

@Controller
public class PMController {

	
	@RequestMapping(value = "/addPredictiveMaintenance", method = RequestMethod.GET)
	public ModelAndView predictiveMaintenance(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("pMaintanance/addPMaintanance");
		return model;
	}
	
	@RequestMapping(value = "/showPmPlan", method = RequestMethod.GET)
	public ModelAndView showPmPlan(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("pMaintanance/showPmPlan");
		return model;
	}
	
	@RequestMapping(value = "/getMonth", method = RequestMethod.GET)
	@ResponseBody
	public MachinMaintanaceSchedule getMonth(HttpServletRequest request, HttpServletResponse response)
	{
		MachinMaintanaceSchedule machinMaintanaceSchedule = new MachinMaintanaceSchedule();
		try {
			
			machinMaintanaceSchedule.setfMonth(2);
			machinMaintanaceSchedule.setfWeek(3);
			machinMaintanaceSchedule.setsMonth(6);
			machinMaintanaceSchedule.setsWeek(4);
			machinMaintanaceSchedule.settMonth(10);
			machinMaintanaceSchedule.setTweek(2);
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return machinMaintanaceSchedule;
	}
	
	
}
