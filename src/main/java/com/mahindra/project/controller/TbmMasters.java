package com.mahindra.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.mahindra.project.constant.Constant;
import com.mahindra.project.model.tbm.TbmMachineDetails;
import com.mahindra.project.model.tbm.TbmMachineItem;
import com.mahindra.project.model.tbm.TbmMachineLocation;
 
@Controller
@Scope("session")
public class TbmMasters {

	RestTemplate rest = new RestTemplate();
	
	@RequestMapping(value = "/showAddTbmMachine", method = RequestMethod.GET)
	public ModelAndView showAddTbmMachine(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("tbmMasters/addMachine");
		
		
		return model;
	}
	
	@RequestMapping(value = "/submitAddTbmMachine", method = RequestMethod.POST)
	public String submitAddTbmMachine(HttpServletRequest request, HttpServletResponse response) {
		 
		
		
		TbmMachineDetails tbmMachineDetails=new TbmMachineDetails();
		tbmMachineDetails.setDelStatus(0);
		tbmMachineDetails.setInt1(0);
		tbmMachineDetails.setInt2(0);
		tbmMachineDetails.setMachineName(request.getParameter("machine"));
		tbmMachineDetails.setMachineNo(request.getParameter("machineNo"));
		tbmMachineDetails.setString1("");
		tbmMachineDetails.setString2("");
		
		try
		{
			TbmMachineDetails tbmMachineDetailsRes=new TbmMachineDetails();
			
			tbmMachineDetailsRes=rest.postForObject(Constant.url+"insertTbmMachine", tbmMachineDetails, TbmMachineDetails.class);
		}catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		
		
		return "redirect:/showAddTbmMachine";
	}
	
	@RequestMapping(value = "/showAddTbmLocation", method = RequestMethod.GET)
	public ModelAndView showAddTbmLocation(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("tbmMasters/addMachineLocation");
		
		List<TbmMachineDetails> tbmMachineDetailsList=new ArrayList<TbmMachineDetails>();
		try {
			tbmMachineDetailsList=rest.getForObject(Constant.url+"getTbmMachine", List.class);
			model.addObject("tbmMachineDetailsList",tbmMachineDetailsList);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		return model;
	}
	
	
	
	
	@RequestMapping(value = "/submitAddTbmMachineLocation", method = RequestMethod.POST)
	public String submitAddTbmMachineLocation(HttpServletRequest request, HttpServletResponse response) {
	
		TbmMachineLocation tbmMachineLocation=new TbmMachineLocation();
		
		
		tbmMachineLocation.setDelStatus(0);
		tbmMachineLocation.setInt1(0);
		tbmMachineLocation.setInt2(0);
		tbmMachineLocation.setLocation(request.getParameter("location"));
		tbmMachineLocation.setMachineId(Integer.parseInt(request.getParameter("machine")));
		tbmMachineLocation.setString1("");
		tbmMachineLocation.setString2("");
		
		
		try {
			TbmMachineLocation tbmMachineLocationRes=new TbmMachineLocation();
			tbmMachineLocationRes=rest.postForObject(Constant.url+"insertTbmMachineLocation", tbmMachineLocation, TbmMachineLocation.class);
		}catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		
		return "redirect:/showAddTbmLocation";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/showAddTbmItem", method = RequestMethod.GET)
	public ModelAndView showAddMachine(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("tbmMasters/addMachineItem");
		 
		
		
		List<TbmMachineDetails> tbmMachineDetailsList=new ArrayList<TbmMachineDetails>();
	 
		try {
			tbmMachineDetailsList=rest.getForObject(Constant.url+"getTbmMachine", List.class);
			model.addObject("tbmMachineDetailsList",tbmMachineDetailsList);
			
			
		}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}

		return model;
	}
	
	@RequestMapping(value = "/submitAddTbmItem", method = RequestMethod.POST)
	public String submitAddTbmItem(HttpServletRequest request, HttpServletResponse response) {
		 
		TbmMachineItem tbmMachineItem=new TbmMachineItem();
		
		tbmMachineItem.setDelStatus(0);
		tbmMachineItem.setFrequency(Integer.parseInt(request.getParameter("frequency")));
		tbmMachineItem.setInt1(0);
		tbmMachineItem.setInt2(0);
		tbmMachineItem.setItemName(request.getParameter("item"));
		tbmMachineItem.setLastDate(request.getParameter("lastDate"));
		tbmMachineItem.setLocationId(Integer.parseInt(request.getParameter("location")));
		tbmMachineItem.setMachineId(Integer.parseInt(request.getParameter("machine")));
		tbmMachineItem.setString1("");
		tbmMachineItem.setString2("");
		
		try {
			TbmMachineItem tbmMachineItemRes=new TbmMachineItem();
			tbmMachineItemRes=rest.postForObject(Constant.url+"insertTbmMachineitem", tbmMachineItem, TbmMachineItem.class);
			}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		return "redirect:/showAddTbmItem";
	}
	
	
	@RequestMapping(value = "/getTbmMachineLocation", method = RequestMethod.GET)
	@ResponseBody
	public List<TbmMachineLocation> getTbmMachineLocation(HttpServletRequest request, HttpServletResponse response)
	{
		
		List<TbmMachineLocation> tbmMachineLocationList=new ArrayList<TbmMachineLocation>();
		int machineId=Integer.parseInt(request.getParameter("machine"));
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		
		map.add("machineId", ""+machineId);
		try {
			tbmMachineLocationList=rest.postForObject(Constant.url+"getLocationByMachineId", map, List.class);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		return tbmMachineLocationList;
	}
	
}
