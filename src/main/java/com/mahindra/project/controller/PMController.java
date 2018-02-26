package com.mahindra.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.mahindra.project.constant.VpsImageUpload;
import com.mahindra.project.model.MachinDetails;
import com.mahindra.project.model.MachinDetailsList;
import com.mahindra.project.model.MachinMaintanaceSchedule;
import com.mahindra.project.model.PMActivityDetails;
import com.mahindra.project.model.PMCheckPoints;
import com.mahindra.project.model.PMItemDetails;
import com.mahindra.project.model.PaMaintananceDetails;
import com.mahindra.project.model.PmRequiredValue;

@Controller
public class PMController {
	
	PaMaintananceDetails paMaintananceDetails = new PaMaintananceDetails();

	@RequestMapping(value = "/addPredictiveMaintenance", method = RequestMethod.GET)
	public ModelAndView predictiveMaintenance(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pMaintanance/addPMaintanance");
		try
		{
			RestTemplate rest = new RestTemplate();
			List<PmRequiredValue> requiredValueList = rest.getForObject(Constant.url + "getAllPmRequiredValue",
					List.class);
			model.addObject("requiredValueList",requiredValueList);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}

	@RequestMapping(value = "/showPmPlan", method = RequestMethod.GET)
	public ModelAndView showPmPlan(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pMaintanance/date");
		return model;
	}

	@RequestMapping(value = "/getMonth", method = RequestMethod.GET)
	@ResponseBody
	public MachinMaintanaceSchedule getMonth(HttpServletRequest request, HttpServletResponse response) {
		MachinMaintanaceSchedule machinMaintanaceSchedule = new MachinMaintanaceSchedule();
		try {
			int deptId = Integer.parseInt(request.getParameter("deptId"));
			System.out.println("deptId" + deptId);
			machinMaintanaceSchedule.setfMonth(2);
			machinMaintanaceSchedule.setfWeek(3);
			machinMaintanaceSchedule.setsMonth(6);
			machinMaintanaceSchedule.setsWeek(4);
			machinMaintanaceSchedule.settMonth(10);
			machinMaintanaceSchedule.setTweek(2);
			System.out.println("machinMaintanaceSchedule" + machinMaintanaceSchedule);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return machinMaintanaceSchedule;

	}

	@RequestMapping(value = "/getMachinByType", method = RequestMethod.GET)
	@ResponseBody
	public List<MachinDetails> getMachinByType(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Get MAchin By Type");
		int type = Integer.parseInt(request.getParameter("machineType"));
		System.out.println(type);
		// List<MachinDetails> machinDetailsList=new ArrayList<>();
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("type", "" + type);
		MachinDetailsList machinDetailsList = rest.postForObject(Constant.url + "getMachineByType", map,
				MachinDetailsList.class);

		return machinDetailsList.getMachinDetailsList();
	}

	@RequestMapping(value = "/getActivityByMachin", method = RequestMethod.GET)
	@ResponseBody
	public List<PMActivityDetails> getActivityByMachin(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Get Activity By Machin");
		int machinId = Integer.parseInt(request.getParameter("machinId"));

		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("machinId", "" + machinId);
		List<PMActivityDetails> pMActivityDetailsList = rest.postForObject(Constant.url + "getActivityByMachin", map,
				List.class);

		return pMActivityDetailsList;
	}

	@RequestMapping(value = "/getItemByActivity", method = RequestMethod.GET)
	@ResponseBody
	public List<PMItemDetails> getItemByActivity(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Get Items By Activity ");
		int activityId = Integer.parseInt(request.getParameter("activityId"));

		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("activityId", "" + activityId);
		List<PMItemDetails> pMItemDetailsList = new ArrayList<>();
		try {
			pMItemDetailsList = rest.postForObject(Constant.url + "getItemsByActivityId", map, List.class);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return pMItemDetailsList;
	}

	@RequestMapping(value = "/getCheckPointsByItem", method = RequestMethod.GET)
	@ResponseBody
	public List<PMCheckPoints> getCheckPointsByItem(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("Get Check Point By items");
		int itemId = Integer.parseInt(request.getParameter("itemId"));

		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("itemId", itemId);
		List<PMCheckPoints> pMCheckPointsList = rest.postForObject(Constant.url + "getCheckPointsByItemId", map,
				List.class);

		return pMCheckPointsList;
	}
	
	@RequestMapping(value = "/getCheckRecordAgistMachine", method = RequestMethod.GET)
	@ResponseBody
	public PaMaintananceDetails getCheckRecordAgistMachine(HttpServletRequest request, HttpServletResponse response) {

		 paMaintananceDetails = new PaMaintananceDetails();
		try
		{
			int checkPointId = Integer.parseInt(request.getParameter("checkPointId"));
			int machineId = Integer.parseInt(request.getParameter("machineId"));
			System.out.println("checkPointId " + checkPointId);
			System.out.println("machineId " + machineId);
			RestTemplate rest = new RestTemplate();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("checkPointId", checkPointId);
			map.add("machineId", machineId);
			paMaintananceDetails = rest.postForObject(Constant.url + "getCheckRecordAgistMachine", map,
					PaMaintananceDetails.class);
			System.out.println("paMaintananceDetails"+paMaintananceDetails);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		

		return paMaintananceDetails;
	}

	@RequestMapping(value = "/insertPMaintananceDetails", method = RequestMethod.POST)
	public String insertPMaintananceDetails(HttpServletRequest request, HttpServletResponse response, @RequestParam("photo1") List<MultipartFile> photo1) {

		try
		{
			int machinType = Integer.parseInt(request.getParameter("machineType"));
			int machineId = Integer.parseInt(request.getParameter("machineId"));
			int machinActivity = Integer.parseInt(request.getParameter("machinActivity"));
			int machinItem = Integer.parseInt(request.getParameter("machinItem"));
			int machinCheckPoint = Integer.parseInt(request.getParameter("machinCheckPoint"));
			int methodId = Integer.parseInt(request.getParameter("methodId"));
			int requiredValueId = Integer.parseInt(request.getParameter("requiredValueId"));
			String date1=request.getParameter("date1");
			String observation1=request.getParameter("observation1");
			
			request.getParameter("photo1");

			String date2=request.getParameter("date2");
			String observation2=request.getParameter("observation2");
			
			
			
			request.getParameter("photo2");

			String date3=request.getParameter("date3");
			String observation3=request.getParameter("observation3");
			
			request.getParameter("photo3");

			
			VpsImageUpload vpsImageUpload=new VpsImageUpload();
			String imageName=photo1.get(0).getOriginalFilename();
			try {
				vpsImageUpload.saveUploadedFiles(photo1, 1, imageName);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("date2" + date2);
			System.out.println("date3 " + date3);
			if(paMaintananceDetails.getPaMaintId()!=0)
			{
				System.out.println("in if for Edit ");
				paMaintananceDetails.setMachinId(machineId);
				paMaintananceDetails.setActivityId(machinActivity);
				paMaintananceDetails.setItemId(machinItem);
				paMaintananceDetails.setCheckPointId(machinCheckPoint);
				paMaintananceDetails.setMethod(methodId);
				paMaintananceDetails.setRquiredValure(requiredValueId);
				paMaintananceDetails.setDate1(date1);
				paMaintananceDetails.setDate1Obervation(observation1);
				paMaintananceDetails.setDate1Photo(imageName);
				paMaintananceDetails.setDate2(date2);
				paMaintananceDetails.setDate2Obervation(observation2); 
				paMaintananceDetails.setDate2Photo("");
				paMaintananceDetails.setDate3(date3);
				paMaintananceDetails.setDate3Obervation(observation3);
				paMaintananceDetails.setDate3Photo("");
				paMaintananceDetails.setType(machinType);
				if(date2==null || !date2.equals(""))
				{
					paMaintananceDetails.setStatus(2);
				}
				if(date3==null || !date3.equals(""))
				{
					paMaintananceDetails.setStatus(3);
				}
				
				RestTemplate rest = new RestTemplate();
				paMaintananceDetails = rest.postForObject(Constant.url + "insertPMaintananceDetails", paMaintananceDetails,
						PaMaintananceDetails.class);
				System.out.println("paMaintananceDetails " + paMaintananceDetails);
			}
			else
			{
				System.out.println("in else new insert ");
				PaMaintananceDetails paMaintananceDetails = new PaMaintananceDetails();
				paMaintananceDetails.setMachinId(machineId);
				paMaintananceDetails.setActivityId(machinActivity);
				paMaintananceDetails.setItemId(machinItem);
				paMaintananceDetails.setCheckPointId(machinCheckPoint);
				paMaintananceDetails.setMethod(methodId);
				paMaintananceDetails.setRquiredValure(requiredValueId);
				paMaintananceDetails.setDate1(date1);
				paMaintananceDetails.setDate1Obervation(observation1);
				paMaintananceDetails.setDate1Photo(imageName);
				paMaintananceDetails.setDate2(date2);
				paMaintananceDetails.setDate2Obervation(observation2); 
				paMaintananceDetails.setDate2Photo("");
				paMaintananceDetails.setDate3(date3);
				paMaintananceDetails.setDate3Obervation(observation3);
				paMaintananceDetails.setDate3Photo("");
				paMaintananceDetails.setStatus(1);
				paMaintananceDetails.setType(machinType);
				RestTemplate rest = new RestTemplate();
				paMaintananceDetails = rest.postForObject(Constant.url + "insertPMaintananceDetails", paMaintananceDetails,
						PaMaintananceDetails.class);
				System.out.println("paMaintananceDetails " + paMaintananceDetails);
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return "redirect:/addPredictiveMaintenance";
	}
}
