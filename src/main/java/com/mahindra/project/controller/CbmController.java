package com.mahindra.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.mahindra.project.constant.Constant;
import com.mahindra.project.model.PmRequiredValue;
import com.mahindra.project.model.cbm.CbmSchedule;

@Controller
public class CbmController {
	
	@RequestMapping(value = "/showCbmSchedule", method = RequestMethod.GET)
	public ModelAndView showCbmSchedule(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("cbm/cbmSchedule");
		try
		{
			RestTemplate rest = new RestTemplate();
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("deptId",deptId);
			List<CbmSchedule> scheduleList = rest.postForObject(Constant.url + "getCbmSchedule",map,
					List.class);
			model.addObject("scheduleList",scheduleList);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}

}
