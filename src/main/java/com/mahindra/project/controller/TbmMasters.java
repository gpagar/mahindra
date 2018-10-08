package com.mahindra.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.mahindra.project.constant.Constant;
import com.mahindra.project.model.Info;
import com.mahindra.project.model.tbm.TbmMachineDetails;
import com.mahindra.project.model.tbm.TbmMachineItem;
import com.mahindra.project.model.tbm.TbmMachineLocation;
 
@Controller
@Scope("session")
public class TbmMasters {

	RestTemplate rest = new RestTemplate();
	
	
	@RequestMapping(value = "/showAllTbmMachine", method = RequestMethod.GET)
	public ModelAndView showAllTbmMachine(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("tbmMasters/tbmMachineList");
		
		List<TbmMachineDetails> tbmMachineDetailsList=new ArrayList<TbmMachineDetails>();
		try {
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map =new LinkedMultiValueMap<>();
			map.add("deptId", deptId);
			tbmMachineDetailsList=rest.postForObject(Constant.url+"getTbmMachine",map, List.class);
			model.addObject("tbmMachineDetailsList",tbmMachineDetailsList);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		
		return model;
	}
	
	
	
	@RequestMapping(value = "/deleteTbmMachineById/{machineId}", method = RequestMethod.GET)
	public String deleteTbmMachineById(@PathVariable("machineId")int machineId,HttpServletRequest request, HttpServletResponse response) {
		 
		ModelAndView model = new ModelAndView("tbmMasters/tbmMachineList");
		List<TbmMachineDetails> tbmMachineDetailsList=new ArrayList<TbmMachineDetails>();
		try {
			MultiValueMap<String, Object> map =new LinkedMultiValueMap<>();
			map.add("machineId", machineId);
			TbmMachineDetails tbmMachineDetails=rest.postForObject(Constant.url+"getTbmByMachineId",map, TbmMachineDetails.class);
			tbmMachineDetails.setDelStatus(1);
			rest.postForObject(Constant.url+"insertTbmMachine", tbmMachineDetails, TbmMachineDetails.class);

		 
		}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		
		return "redirect:/showAllTbmMachine";
	}
	@RequestMapping(value = "/updateMAchine/{machineId}", method = RequestMethod.GET)
	public ModelAndView updateMAchine(@PathVariable("machineId")int machineId,HttpServletRequest request, HttpServletResponse response) {
		 
		ModelAndView model = new ModelAndView("tbmMasters/addMachine");
		try {
			MultiValueMap<String, Object> map =new LinkedMultiValueMap<>();
			map.add("machineId", machineId);
			TbmMachineDetails tbmMachineDetails=rest.postForObject(Constant.url+"getTbmByMachineId",map, TbmMachineDetails.class);
			model.addObject("tbmMachineDetails",tbmMachineDetails);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		
		return model;
	}
	
	@RequestMapping(value = "/showAddTbmMachine", method = RequestMethod.GET)
	public ModelAndView showAddTbmMachine(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("tbmMasters/addMachine");
		
		
		return model;
	}
	
	@RequestMapping(value = "/submitAddTbmMachine", method = RequestMethod.POST)
	public String submitAddTbmMachine(HttpServletRequest request, HttpServletResponse response) {
		 
		String machine_id=request.getParameter("machineId");
		TbmMachineDetails tbmMachineDetails=new TbmMachineDetails();
		HttpSession session = request.getSession(); 
		int deptId = (Integer) session.getAttribute("deptId"); 
		 try
		 {
			 int machineId=Integer.parseInt(machine_id);
			 tbmMachineDetails.setMachineId(machineId);
		 }
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		 tbmMachineDetails.setInt1(deptId);
		tbmMachineDetails.setDelStatus(0);
	 
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
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map =new LinkedMultiValueMap<>();
			map.add("deptId", deptId);
			tbmMachineDetailsList=rest.postForObject(Constant.url+"getTbmMachine",map, List.class);
			model.addObject("tbmMachineDetailsList",tbmMachineDetailsList);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		return model;
	}
	
	@RequestMapping(value = "/showTbmLocationById/{machineId}", method = RequestMethod.GET)
	public ModelAndView showTbmLocationById(@PathVariable("machineId")int machineId,HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("tbmMasters/tbmMachineLocationList");
		
		List<TbmMachineLocation> tbmMachineLocationList=new ArrayList<TbmMachineLocation>();
		try {
			MultiValueMap<String, Object> map =new LinkedMultiValueMap<>();
			map.add("machineId", machineId);
			
			tbmMachineLocationList=rest.postForObject(Constant.url+"getLocationByMachineId",map, List.class);
			model.addObject("tbmMachineLocationList",tbmMachineLocationList);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		return model;
	}
	
	
	
	@RequestMapping(value = "/submitAddTbmMachineLocation", method = RequestMethod.POST)
	public String submitAddTbmMachineLocation(HttpServletRequest request, HttpServletResponse response) {
	
		TbmMachineLocation tbmMachineLocation=new TbmMachineLocation();
		
		String location_id=request.getParameter("locationId");
		try {
			int locationId=Integer.parseInt(location_id);
			tbmMachineLocation.setLocationId(locationId);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
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
	
	
	@RequestMapping(value = "/updateTbmLocation/{locationId}", method = RequestMethod.GET)
	public ModelAndView updateTbmLocation(@PathVariable("locationId")int locationId,HttpServletRequest request, HttpServletResponse response) {
		 
		ModelAndView model = new ModelAndView("tbmMasters/addMachineLocation");
		List<TbmMachineDetails> tbmMachineDetailsList=new ArrayList<TbmMachineDetails>();

		try {
			
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map =new LinkedMultiValueMap<>();
			map.add("deptId", deptId);
			tbmMachineDetailsList=rest.postForObject(Constant.url+"getTbmMachine",map, List.class);
			model.addObject("tbmMachineDetailsList",tbmMachineDetailsList);
			
			 map =new LinkedMultiValueMap<>();
			map.add("locationId", locationId);
			TbmMachineLocation tbmMachineLocation=rest.postForObject(Constant.url+"getLocationByLocationId",map, TbmMachineLocation.class);
			model.addObject("tbmMachineLocation",tbmMachineLocation);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		
		return model;
	}
	
	
	
	
	@RequestMapping(value = "/deleteTbmLocationById/{locationId}", method = RequestMethod.GET)
	public String deleteTbmLocationById(@PathVariable("locationId")int locationId,HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("tbmMasters/tbmMachineLocationList");
		
		 
		try {
			MultiValueMap<String, Object> map =new LinkedMultiValueMap<>();
			map.add("locationId", locationId);
			TbmMachineLocation tbmMachineLocation=rest.postForObject(Constant.url+"getLocationByLocationId",map, TbmMachineLocation.class);
			tbmMachineLocation.setDelStatus(1);
			 rest.postForObject(Constant.url+"insertTbmMachineLocation", tbmMachineLocation, TbmMachineLocation.class);

		}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		return "redirect:/showAllTbmMachine";
	}
	
	
	@RequestMapping(value = "/showAddTbmItem", method = RequestMethod.GET)
	public ModelAndView showAddMachine(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("tbmMasters/addMachineItem");
		 
		
		
		List<TbmMachineDetails> tbmMachineDetailsList=new ArrayList<TbmMachineDetails>();
	 
		try {
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map =new LinkedMultiValueMap<>();
			map.add("deptId", deptId);
			tbmMachineDetailsList=rest.postForObject(Constant.url+"getTbmMachine",map, List.class);
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
		
		String item_id=request.getParameter("itemId");
		try {
			int itemId=Integer.parseInt(item_id);
			tbmMachineItem.setItemId(itemId);
		}catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		
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
	
	@RequestMapping(value = "/updateTbmItemById/{itemId}", method = RequestMethod.GET)
	public ModelAndView updateTbmItemById(@PathVariable("itemId")int itemId,HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("tbmMasters/addMachineItem");
		
		List<TbmMachineItem> tbmMachineItemList=new ArrayList<TbmMachineItem>();
		try {
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map2 =new LinkedMultiValueMap<>();
			map2.add("deptId", deptId);
			List<TbmMachineDetails> tbmMachineDetailsList=rest.postForObject(Constant.url+"getTbmMachine",map2, List.class);
			model.addObject("tbmMachineDetailsList",tbmMachineDetailsList);
			MultiValueMap<String, Object> map =new LinkedMultiValueMap<>();
			map.add("itemId", itemId);
			
			TbmMachineItem tbmMachineItem =rest.postForObject(Constant.url+"getTbmMachineItemByItemId",map, TbmMachineItem.class);
			model.addObject("tbmMachineItem",tbmMachineItem);
			System.out.println("tbmMachineItem "+tbmMachineItem.toString());
			
		 
MultiValueMap<String, Object> map1=new LinkedMultiValueMap<String, Object>();
		
		map1.add("machineId", ""+tbmMachineItem.getMachineId());
	 
		List<TbmMachineLocation> tbmMachineLocationList=rest.postForObject(Constant.url+"getLocationByMachineId", map1, List.class);
	System.out.println("tbmMachineLocationList "+tbmMachineLocationList.toString());
		model.addObject("tbmMachineLocationList",tbmMachineLocationList);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		return model;
	}
	
	@RequestMapping(value = "/showTbmItemById/{locationId}", method = RequestMethod.GET)
	public ModelAndView showTbmItemById(@PathVariable("locationId")int locationId,HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("tbmMasters/tbmMachineItemList");
		
		List<TbmMachineItem> tbmMachineItemList=new ArrayList<TbmMachineItem>();
		try {
			 
			MultiValueMap<String, Object> map =new LinkedMultiValueMap<>();
			map.add("locationId", locationId);
			
			tbmMachineItemList =rest.postForObject(Constant.url+"getTbmMachineitem",map, List.class);
			model.addObject("tbmMachineItemList",tbmMachineItemList);
			
			
		  
		}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		return model;
	}
	
	
	
	@RequestMapping(value = "/deleteTbmItemById/{itemId}", method = RequestMethod.GET)
	public String deleteTbmItemById(@PathVariable("itemId")int itemId,HttpServletRequest request, HttpServletResponse response) {
	 

		 
		try {
			MultiValueMap<String, Object> map =new LinkedMultiValueMap<>();
			map.add("itemId", itemId);
			TbmMachineItem tbmMachineItemRes=rest.postForObject(Constant.url+"getTbmMachineItemByItemId",map, TbmMachineItem.class);
			tbmMachineItemRes.setDelStatus(1);
			System.out.println(tbmMachineItemRes.toString());// TODO: handle exception

			TbmMachineItem TbmMachineItemres=rest.postForObject(Constant.url+"insertTbmMachineitem", tbmMachineItemRes, TbmMachineItem.class);

		}
		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		return "redirect:/showAllTbmMachine";
	}
	
	
}
