package com.mahindra.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mahindra.project.constant.Constant;
import com.mahindra.project.model.Info;
import com.mahindra.project.model.MachinDetails;
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
		
}
