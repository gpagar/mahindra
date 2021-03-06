package com.mahindra.project.controller;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mahindra.project.constant.Constant;
import com.mahindra.project.model.GetTbmHistory;
import com.mahindra.project.model.PmRequiredValue;
import com.mahindra.project.model.tbm.PostTbm;
import com.mahindra.project.model.tbm.TbmData;
import com.mahindra.project.model.tbm.TbmMachine;
import com.mahindra.project.model.tbm.UpdateTbm;

@Controller
@Scope("session")
public class TbmController implements Serializable{

	@RequestMapping(value = "/showTbm", method = RequestMethod.GET)
	public ModelAndView showTbm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("tbm/tbm");
		try
		{
			RestTemplate rest = new RestTemplate();
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
            map.add("deptId", deptId);
			List<TbmMachine> tbmMachineList=rest.postForObject(Constant.url+"getAllTbmMachines",map,List.class);
			model.addObject("tbmMachineList", tbmMachineList);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}
	@RequestMapping(value = "/showTbmSchedule", method = RequestMethod.GET)
	public ModelAndView showTbmSchedule(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("tbm/tbmSchedule");
		try
		{
			RestTemplate rest = new RestTemplate();
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
            map.add("deptId", deptId);
			List<TbmMachine> tbmMachineList=rest.postForObject(Constant.url+"getAllTbmMachines",map,List.class);
			model.addObject("tbmMachineList", tbmMachineList);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}
	
	@RequestMapping(value = "/showTbmHistory", method = RequestMethod.GET)
	public ModelAndView showTbmHistory(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("tbm/tbmHistory");
		try
		{
			RestTemplate rest = new RestTemplate();
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			int year = Calendar.getInstance().get(Calendar.YEAR);
			map.add("deptId",deptId);
			map.add("fromYear",year);
			map.add("toYear",year);
			List<GetTbmHistory> tbmMachineList=rest.postForObject(Constant.url+"getTbmHistory",map,List.class);
			model.addObject("tbmDataList", tbmMachineList);
			model.addObject("fromYear", year);
			model.addObject("toYear", year);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return model;
	}
	@RequestMapping(value = "/searchTbmHistory", method = RequestMethod.POST)
	public ModelAndView searchTbmHistory(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("tbm/tbmHistory");

		try {
			 String fromYear =request.getParameter("yearpicker");
			 String toYear =request.getParameter("yearpicker1");
			 HttpSession session = request.getSession(); 
				int deptId = (Integer) session.getAttribute("deptId"); 
			RestTemplate rest = new RestTemplate();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("deptId",deptId);

			map.add("fromYear",fromYear);
			map.add("toYear",toYear);
			List<GetTbmHistory> tbmMachineList=rest.postForObject(Constant.url+"getTbmHistory",map,List.class);
			model.addObject("tbmDataList", tbmMachineList);
			model.addObject("fromYear", fromYear);
			model.addObject("toYear", toYear);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return model;
	}
	int machineId = 0;
	@RequestMapping(value = "/searchTbmData", method = RequestMethod.GET)
	public ModelAndView searchTbmData(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("tbm/tbm");
		try
		{    try {
			 machineId = Integer.parseInt(request.getParameter("machineId"));
		     }
		catch (Exception e) {
			// TODO: handle exception
		}
		 HttpSession session = request.getSession(); 
		int deptId = (Integer) session.getAttribute("deptId");
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("machineId",machineId);
		List<TbmData> tbmDataList=rest.postForObject(Constant.url+"getTbmDataByMachineId", map, List.class);
    	System.err.println(tbmDataList.toString());
    	map = new LinkedMultiValueMap<String, Object>();
    	map.add("deptId",deptId);
		List<TbmMachine> tbmMachineList=rest.postForObject(Constant.url+"getAllTbmMachines",map,List.class);
		model.addObject("tbmMachineList", tbmMachineList);
		model.addObject("tbmDataList", tbmDataList);
		model.addObject("machineId", machineId);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return model;
	}
	@RequestMapping(value = "/searchTbmSchedule", method = RequestMethod.GET)
	public ModelAndView searchTbmSchedule(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("tbm/tbmSchedule");
		try
		{    try {
			 machineId = Integer.parseInt(request.getParameter("machineId"));
		     }
		catch (Exception e) {
			// TODO: handle exception
		}
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("machineId",machineId);
		
		List<TbmData> tbmDataList=rest.postForObject(Constant.url+"getTbmDataByMachineId", map, List.class);
    	
		HttpSession session = request.getSession(); 
		int deptId = (Integer) session.getAttribute("deptId");
    	map = new LinkedMultiValueMap<String, Object>();
    	map.add("deptId",deptId);
		List<TbmMachine> tbmMachineList=rest.postForObject(Constant.url+"getAllTbmMachines",map,List.class);
		model.addObject("tbmMachineList", tbmMachineList);
		model.addObject("tbmDataList", tbmDataList);
		model.addObject("machineId", machineId);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return model;
	}
	@RequestMapping(value = "/insertTbmData", method = RequestMethod.POST)
	public  String insertTbmData(HttpServletRequest request, HttpServletResponse response) {
		PostTbm postTbmRes=null;
		try
		{  
			 HttpSession session = request.getSession(); 
				int deptId = (Integer) session.getAttribute("deptId");
			int machineId = Integer.parseInt(request.getParameter("machineId"));
			int tTbmId = Integer.parseInt(request.getParameter("tTbmId"));
			int locationId = Integer.parseInt(request.getParameter("locationId"));
			int itemId = Integer.parseInt(request.getParameter("itemId"));
			int frequency = Integer.parseInt(request.getParameter("frequency"));
			String lastDoneDate =request.getParameter("lastDoneDate");
			String lastObservation = request.getParameter("lastObservation");
			String lastObDate =request.getParameter("lastObDate");
/*			String nextDoneDate =request.getParameter("nextDoneDate");
*/			String nextObservation = request.getParameter("nextObservation");
			String nextObDate =request.getParameter("nextObDate");
			
		   PostTbm postTbm=new PostTbm();
		  // postTbm.settTbmId(tTbmId);
		   postTbm.setItemId(itemId);
		   postTbm.setMachineId(machineId);
		   postTbm.setLocationId(locationId);
		   postTbm.setLastDoneDate(lastDoneDate);
		   postTbm.setLastObservation(lastObservation);
		   postTbm.setLastObDate(lastObDate);
		   postTbm.setNextDoneDate(nextObDate);
		   postTbm.setNextObDate(nextObDate);
		   postTbm.setNextObservation(nextObservation);
		   postTbm.setFrequency(frequency);
		   postTbm.setStatus(deptId);
		   postTbm.setDelStatus(0);
			RestTemplate rest = new RestTemplate();

			 postTbmRes=rest.postForObject(Constant.url+"insertTbm", postTbm, PostTbm.class); 
			System.err.println("postTbmRes"+postTbmRes.toString());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/searchTbmData?machineId="+machineId;
	}
	
	@RequestMapping(value = "/updateTbmData", method = RequestMethod.GET)
	public @ResponseBody UpdateTbm updateTbmData(HttpServletRequest request, HttpServletResponse response) {
		
		UpdateTbm postTbmRes=null;
		try
		{  
			int tTbmId = Integer.parseInt(request.getParameter("tTbmIdLast"));
			String nextDoneDate =request.getParameter("nextDoneDate");
			String nextObservation = request.getParameter("nextObservation");
			String nextObDate =request.getParameter("nextObDate");
			
			UpdateTbm postTbm=new UpdateTbm();
		    postTbm.settTbmId(tTbmId);
		   postTbm.setNextDoneDate(nextDoneDate);
		   postTbm.setNextObDate(nextObDate);
		   postTbm.setNextObservation(nextObservation);
		   postTbm.setDelStatus(0);
			RestTemplate rest = new RestTemplate();

			 postTbmRes=rest.postForObject(Constant.url+"updateTbm", postTbm, UpdateTbm.class); 
			System.err.println("postTbmRes"+postTbmRes.toString());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return postTbmRes;
	}
}
