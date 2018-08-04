package com.mahindra.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.mahindra.project.model.Info;
import com.mahindra.project.model.MachinDetails;
import com.mahindra.project.model.MachinMaintanaceSchedule;
import com.mahindra.project.model.PMActivityDetails;
import com.mahindra.project.model.PMCheckPoints;
import com.mahindra.project.model.PMItemDetails;
import com.mahindra.project.model.PmRequiredValue;

@Controller
@Scope("session")
public class PmMastersController {
	
	@RequestMapping(value = "/showAddMachine", method = RequestMethod.GET)
	public ModelAndView showAddMachine(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmMasters/addMachine");
		 
		

		return model;
	}
	
	@RequestMapping(value = "/showDeletePmData", method = RequestMethod.GET)
	public ModelAndView showDeletePmData(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmMasters/deleteData");
		 
		

		return model;
	}
	
	
	@RequestMapping(value = "/deletePmMachine", method = RequestMethod.POST)
	public String deletePmMachine(HttpServletRequest request, HttpServletResponse response) {
		
		int machineId=Integer.parseInt(request.getParameter("machineId"));
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("machinId", ""+machineId);
		RestTemplate rest=new RestTemplate();
		try {
			Info info=rest.postForObject(Constant.url + "deleteMachinId", map, Info.class);
			System.out.println(info.toString());
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/showDeletePmData";
	}
	
	@RequestMapping(value = "/deletePmActivity", method = RequestMethod.POST)
	public String deletePmActivity(HttpServletRequest request, HttpServletResponse response) {
		
		int machinActivity=Integer.parseInt(request.getParameter("machinActivity"));
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("activityId", ""+machinActivity);
		RestTemplate rest=new RestTemplate();
		try {
			Info info=rest.postForObject(Constant.url + "deletePmActivity", map, Info.class);
			System.out.println(info.toString());
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/showDeletePmData";
	}
	
	
	@RequestMapping(value = "/deletePmItem", method = RequestMethod.POST)
	public String deletePmItem(HttpServletRequest request, HttpServletResponse response) {
		
		int machinItem=Integer.parseInt(request.getParameter("machinItem"));
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("itemId", ""+machinItem);
		RestTemplate rest=new RestTemplate();
		try {
			Info info=rest.postForObject(Constant.url + "deletePmItem", map, Info.class);
			System.out.println(info.toString());
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/showDeletePmData";
	}
	
	
	@RequestMapping(value = "/deletePmCheckpoints", method = RequestMethod.POST)
	public String deletePmCheckpoints(HttpServletRequest request, HttpServletResponse response) {
		
		int machinCheckPoint=Integer.parseInt(request.getParameter("machinCheckPoint"));
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("machinCheckPoint", ""+machinCheckPoint);
		RestTemplate rest=new RestTemplate();
		try {
			Info info=rest.postForObject(Constant.url + "deletePmCheckpoints", map, Info.class);
			System.out.println(info.toString());
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/showDeletePmData";
	}
	
	
	
	
	@RequestMapping(value = "/showAddActivity", method = RequestMethod.GET)
	public ModelAndView showAddActivity(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmMasters/addActivity");
		 
		

		return model;
	}
	
	@RequestMapping(value = "/showAddItem", method = RequestMethod.GET)
	public ModelAndView showAddItem(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmMasters/addItem");
		 
		

		return model;
	}
	
	@RequestMapping(value = "/showAddCheckpoint", method = RequestMethod.GET)
	public ModelAndView showAddCheckpoint(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmMasters/addCheckpoint");
		 
		

		return model;
	}

	

	@RequestMapping(value = "/insertPmMachine", method = RequestMethod.POST)
	public String insertPmMachine(HttpServletRequest request, HttpServletResponse response) {
		
		String machineName=request.getParameter("machineName");
		String machineNo=request.getParameter("machineNo");
		int machineType=Integer.parseInt(request.getParameter("machineType"));
		
		MachinDetails machinDetails=new MachinDetails();
		
		machinDetails.setMachinName(machineName);
		machinDetails.setMachinNo(machineNo);
		machinDetails.setType(machineType);
		machinDetails.setString1("");
		machinDetails.setString2("");
		machinDetails.setString3("");
		RestTemplate rest=new RestTemplate();
		try {
			Info info=rest.postForObject(Constant.url + "insertPmMachine", machinDetails, Info.class);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/showAddMachine";
	}

	
	
	@RequestMapping(value = "/insertPmActivity", method = RequestMethod.POST)
	public String insertPmActivity(HttpServletRequest request, HttpServletResponse response) {
		
		
		int machineId=Integer.parseInt(request.getParameter("machineId"));
		int eleMechanecal=Integer.parseInt(request.getParameter("eleMechanecal"));
		int onlineOffline=Integer.parseInt(request.getParameter("onlineOffline"));
		
		String activityName=request.getParameter("activityName");
		
		PMActivityDetails pMActivityDetails=new PMActivityDetails();
		
		pMActivityDetails.setActivityName(activityName);
		pMActivityDetails.setInt1(eleMechanecal);        //Electrical   //Mechanical
		pMActivityDetails.setInt2(onlineOffline);       //Online    //Offline
		pMActivityDetails.setMachinId(machineId);
		pMActivityDetails.setString1("");
		pMActivityDetails.setString2("");
		
		RestTemplate rest=new RestTemplate();
		try {
			Info info=rest.postForObject(Constant.url + "insertPmActivity", pMActivityDetails, Info.class);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/showAddActivity";
	}
	
	@RequestMapping(value = "/insertPmItem", method = RequestMethod.POST)
	public String insertPmItem(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		int machineId=Integer.parseInt(request.getParameter("machineId"));
		int machinActivity=Integer.parseInt(request.getParameter("machinActivity"));
	 
		
		String itemName=request.getParameter("itemName");
		
		PMItemDetails pMItemDetails=new PMItemDetails();
		
		
		pMItemDetails.setActivityId(machinActivity);
		pMItemDetails.setItemDesc(itemName);
		pMItemDetails.setItemName(itemName);
		pMItemDetails.setMachinId(machineId);
		pMItemDetails.setString1("");
		pMItemDetails.setString2("");
		
		
		RestTemplate rest=new RestTemplate();
		try {
			Info info=rest.postForObject(Constant.url + "insertPmItem", pMItemDetails, Info.class);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "redirect:/showAddItem";
	}
	
	@RequestMapping(value = "/insertCheckPoint", method = RequestMethod.POST)
	public String insertCheckPoint(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		int machineId=Integer.parseInt(request.getParameter("machineId"));
		int machinItem=Integer.parseInt(request.getParameter("machinItem"));
	 
		
		String checkpoint=request.getParameter("checkpoint");
		
		
		PMCheckPoints pMCheckPoints=new PMCheckPoints();
		
		pMCheckPoints.setCheckPointDesc(checkpoint);
		pMCheckPoints.setCheckPointName(checkpoint);
		pMCheckPoints.setItemId(machinItem);
		pMCheckPoints.setMachineId(machineId);
		pMCheckPoints.setString1("");
		pMCheckPoints.setString2("");
		
		RestTemplate rest=new RestTemplate();
		try {
			Info info=rest.postForObject(Constant.url + "insertPmCheckpoint", pMCheckPoints, Info.class);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "redirect:/showAddCheckpoint";
	}
		
	
	
	
	
	@RequestMapping(value = "/showInsertPmPlan", method = RequestMethod.GET)
	public ModelAndView showInsertPmPlan(HttpServletRequest request, HttpServletResponse response) {
	
		ModelAndView model=new ModelAndView("pmMasters/insertPmPlan");
	
	
	
	
	
	MachinMaintanaceSchedule machinMaintanaceSchedule=new MachinMaintanaceSchedule();
	return model;
	}
	
	
	
	@RequestMapping(value = "/submitInsertPmPlan", method = RequestMethod.POST)
	public String submitInsertPmPlan(HttpServletRequest request, HttpServletResponse response) {
		
		
		MachinMaintanaceSchedule machinMaintanaceSchedule =new MachinMaintanaceSchedule();
		
		machinMaintanaceSchedule.setDelStatus(0);
		machinMaintanaceSchedule.setfMonth(Integer.parseInt(request.getParameter("fmonth")));
		machinMaintanaceSchedule.setfWeek(Integer.parseInt(request.getParameter("fweek")));
		
		machinMaintanaceSchedule.setsMonth(Integer.parseInt(request.getParameter("smonth")));
		machinMaintanaceSchedule.setsWeek(Integer.parseInt(request.getParameter("sweek")));
		
		machinMaintanaceSchedule.settMonth(Integer.parseInt(request.getParameter("tmonth")));
		machinMaintanaceSchedule.setTweek(Integer.parseInt(request.getParameter("tweek")));
		
		machinMaintanaceSchedule.setMachinId(Integer.parseInt(request.getParameter("machineId")));
		machinMaintanaceSchedule.setType(0);
		machinMaintanaceSchedule.settStatus(0);
		machinMaintanaceSchedule.setfStatus(0);
		machinMaintanaceSchedule.setsStatus(0);
		machinMaintanaceSchedule.setString1("");
		machinMaintanaceSchedule.setString2("");
		machinMaintanaceSchedule.setInt1(Integer.parseInt(request.getParameter("rank")));
		machinMaintanaceSchedule.setInt2(0);
		 try {
		RestTemplate rest=new RestTemplate();
		Info info=rest.postForObject(Constant.url + "insertPmMachinePlan", machinMaintanaceSchedule, Info.class);
		
		 }
		 catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		return "redirect:/showInsertPmPlan";
	}
	
	
	
	@RequestMapping(value = "/showUpdateMachine", method = RequestMethod.GET)
	public ModelAndView showUpdateMachine(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmMasters/editMachine");
		 
		

		return model;
	}
	
	
	
	public static MachinDetails machinDetails;
	@RequestMapping(value = "/getMachineDataById", method = RequestMethod.GET)
	@ResponseBody 
	public MachinDetails getMachineDataById(HttpServletRequest request, HttpServletResponse response) {
		
		  machinDetails=new MachinDetails();
		int machineId=Integer.parseInt(request.getParameter("machineId"));
		
		for(int i=0;i<PMController.machinDetailsList.getMachinDetailsList().size();i++)
		{
			if(machineId==PMController.machinDetailsList.getMachinDetailsList().get(i).getMachinId())
			{
				machinDetails=PMController.machinDetailsList.getMachinDetailsList().get(i);
			}
		}
		return machinDetails;
		
	}
	
	@RequestMapping(value = "/updatePmMachine", method = RequestMethod.POST)
	public String updatePmMachine(HttpServletRequest request, HttpServletResponse response) {
		
		String machineNo=request.getParameter("machineNo");
		String machineName=request.getParameter("machineName");
		machinDetails.setMachinNo(machineNo);
		machinDetails.setMachinName(machineName);
		
		
	RestTemplate rest=new RestTemplate();
	try {
		Info info=rest.postForObject(Constant.url + "insertPmMachine", machinDetails, Info.class);
	}catch (Exception e) {
		System.out.println(e.getMessage());
	}
	
	
	
	return "redirect:/showUpdateMachine";
	}
}
