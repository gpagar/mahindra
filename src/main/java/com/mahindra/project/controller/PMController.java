package com.mahindra.project.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mahindra.project.constant.Constant;
import com.mahindra.project.constant.VpsImageUpload;
import com.mahindra.project.model.GetPMData;
import com.mahindra.project.model.GetPaMaintainence;
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
	List<GetPMData> paMaintainenceList=new ArrayList<>();
	public static MachinDetailsList machinDetailsList;
	int machineType;
	int machineId;
	
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
	@RequestMapping(value = "/showPmPlanList", method = RequestMethod.GET)
	public ModelAndView showPmPlanList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pMaintanance/showPmPlanList");
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
	@RequestMapping(value = "/showPmPlanHistory", method = RequestMethod.GET)
	public ModelAndView showPmPlanHistory(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pMaintanance/showPmHistory");
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
		ModelAndView model = new ModelAndView("pMaintanance/showPmPlan");
		return model;
	}
	@RequestMapping(value = "/showWhyWhyf18", method = RequestMethod.GET)
	public ModelAndView showWhyWhyf18(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/whywhyf18");
	
		return model;
	}
	
	@RequestMapping(value = "/searchPaMaintainenceList", method = RequestMethod.GET)
	public ModelAndView searchPaMaintainenceList(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("pMaintanance/showPmPlanList");
		try
		{    try {
			 machineType = Integer.parseInt(request.getParameter("machineType"));
			 machineId = Integer.parseInt(request.getParameter("machineId"));
		     }
		catch (Exception e) {
			// TODO: handle exception
		}
		

			RestTemplate rest = new RestTemplate();
			List<PmRequiredValue> requiredValueList = rest.getForObject(Constant.url + "getAllPmRequiredValue",
					List.class);
		
			
			//-------------------------------------PM Schedule---------------------------------------
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("machineId",machineId);
			MachinMaintanaceSchedule machinMaintanaceSchedule = rest.postForObject(Constant.url + "getPmMaintenancePlan", map,
					MachinMaintanaceSchedule.class);
			System.out.println("MachinMaintanaceSchedule " + machinMaintanaceSchedule);
			Calendar c = Calendar.getInstance();

			int currentMonth=(c.get(Calendar.MONTH))+1;
			int status=0;
			if(machinMaintanaceSchedule.getMaintId()!=0)
			{
            if(currentMonth>=4)
            {
            	if(machinMaintanaceSchedule.getfMonth()<currentMonth&&machinMaintanaceSchedule.getsMonth()<currentMonth&&machinMaintanaceSchedule.gettMonth()==currentMonth)
            	{
            		status=1;	
            	}else if(machinMaintanaceSchedule.getfMonth()<currentMonth&&machinMaintanaceSchedule.getsMonth()<=currentMonth)
            	{
            		status=2;
            	}
            	else if(machinMaintanaceSchedule.getfMonth()<=currentMonth)
            	{
            		status=3;
            	}
            }
            else
            {
               if(currentMonth==3)
               {
            	    status=1;
               }else if(currentMonth==2)
               {
            	   if(machinMaintanaceSchedule.gettMonth()<=2||machinMaintanaceSchedule.gettMonth()>=4)
               	   {
            		   status=1;
               	   }
            	   else
            	   {
            		   status=2;
            	   }
               }
               else
               {
            	   if(machinMaintanaceSchedule.gettMonth()==1||machinMaintanaceSchedule.gettMonth()>=4)
               	   {
            		   status=1;
               	   }
            	   else
            	   {
            		   status=2;
            	   }
               }
            }
			}
            System.err.println(status+"status"+currentMonth);
			model.addObject("status", status);
			model.addObject("schedule",machinMaintanaceSchedule);
			//---------------------------------------------------------------------------------------
			 map = new LinkedMultiValueMap<String, Object>();
			map.add("machinId",machineId);
				GetPMData[] paMaintainenceList = rest.postForObject(Constant.url + "getPMList",map,
						GetPMData[].class);
					ArrayList<GetPMData> pmList=new ArrayList<GetPMData>(Arrays.asList(paMaintainenceList));

				 map = new LinkedMultiValueMap<String, Object>();
					map.add("machineId",machineId);
					
					GetPaMaintainence[] paMaintainList = rest.postForObject(Constant.url + "/getPmMaintainenceList",map,
							GetPaMaintainence[].class);
					ArrayList<GetPaMaintainence> pmDbList=new ArrayList<GetPaMaintainence>(Arrays.asList(paMaintainList));

					
					for(int i=0;i<pmDbList.size();i++)
					{
						for(int j=0;j<pmList.size();j++)
						{
							if(pmDbList.get(i).getCheckPointId()==pmList.get(j).getCheckPointId())
							{
								pmList.get(j).setPaMaintId(pmDbList.get(i).getPaMaintId());
								pmList.get(j).setDate1(pmDbList.get(i).getDate1());
								pmList.get(j).setDate1Obervation(pmDbList.get(i).getDate1Obervation());
								pmList.get(j).setDate1Photo(pmDbList.get(i).getDate1Photo());
								pmList.get(j).setDate2(pmDbList.get(i).getDate2());
								pmList.get(j).setDate2Obervation(pmDbList.get(i).getDate2Obervation());
								pmList.get(j).setDate2Photo(pmDbList.get(i).getDate2Photo());
								pmList.get(j).setDate3(pmDbList.get(i).getDate3());
								pmList.get(j).setDate3Photo(pmDbList.get(i).getDate3Photo());
								pmList.get(j).setDate3Obervation(pmDbList.get(i).getDate3Obervation());
								pmList.get(j).setRemark(pmDbList.get(i).getRemark());
								pmList.get(j).setRquiredValure(pmDbList.get(i).getRquiredValure());
								pmList.get(j).setStatus(pmDbList.get(i).getStatus());
								pmList.get(j).setMethod(pmDbList.get(i).getMethod());
							}
							
						}
					}
					System.out.println("pmList"+pmList.toString());
			model.addObject("paMaintainenceList",pmList);
			  Map<Integer,String> actType=new HashMap<Integer,String>();  
			  actType.put(0,"On Line Activity Points");  
			  actType.put(1,"Offline Activty");  
			  actType.put(2,"Safty Points");  
			model.addObject("actTypes",actType);  
			model.addObject("requiredValueList",requiredValueList);
			model.addObject("machineType", machineType);
			model.addObject("machineId", machineId);
			model.addObject("url",Constant.IMAGE_URL);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return model;
	}
	@RequestMapping(value = "/searchPaMaintainenceHistory", method = RequestMethod.GET)
	public ModelAndView searchPaMaintainenceHistory(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("pMaintanance/showPmHistory");
		try
		{    try {
			 machineType = Integer.parseInt(request.getParameter("machineType"));
			 machineId = Integer.parseInt(request.getParameter("machineId"));
		     }
		catch (Exception e) {
			// TODO: handle exception
		}
		

			RestTemplate rest = new RestTemplate();
			List<PmRequiredValue> requiredValueList = rest.getForObject(Constant.url + "getAllPmRequiredValue",
					List.class);
		
			
			//-------------------------------------PM Schedule---------------------------------------
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("machineId",machineId);
			MachinMaintanaceSchedule machinMaintanaceSchedule = rest.postForObject(Constant.url + "getPmMaintenancePlan", map,
					MachinMaintanaceSchedule.class);
			System.out.println("MachinMaintanaceSchedule " + machinMaintanaceSchedule);
			if(machinMaintanaceSchedule.getMaintId()==0)
			{
				machinMaintanaceSchedule.setfMonth(1);
				machinMaintanaceSchedule.setsMonth(1);
				machinMaintanaceSchedule.settMonth(1);
			}
			model.addObject("schedule",machinMaintanaceSchedule);
			//---------------------------------------------------------------------------------------
			 map = new LinkedMultiValueMap<String, Object>();
			map.add("machinId",machineId);
				GetPMData[] paMaintainenceList = rest.postForObject(Constant.url + "getPMList",map,
						GetPMData[].class);
					ArrayList<GetPMData> pmList=new ArrayList<GetPMData>(Arrays.asList(paMaintainenceList));

				 map = new LinkedMultiValueMap<String, Object>();
					map.add("machineId",machineId);
					
					GetPaMaintainence[] paMaintainList = rest.postForObject(Constant.url + "/getPmMaintainenceList",map,
							GetPaMaintainence[].class);
					ArrayList<GetPaMaintainence> pmDbList=new ArrayList<GetPaMaintainence>(Arrays.asList(paMaintainList));

					
			model.addObject("paMaintainenceList",pmDbList);
			  Map<Integer,String> actType=new HashMap<Integer,String>();  
			  actType.put(0,"On Line Activity Points");  
			  actType.put(1,"Offline Activty");  
			  actType.put(2,"Safty Points");  
			model.addObject("actTypes",actType);  
			model.addObject("requiredValueList",requiredValueList);
			model.addObject("machineType", machineType);
			model.addObject("machineId", machineId);
			model.addObject("url",Constant.IMAGE_URL);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
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
		  machinDetailsList=new MachinDetailsList();
		try {
		int type = Integer.parseInt(request.getParameter("machineType"));
		System.out.println(type);
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("type", "" + type);
		 machinDetailsList = rest.postForObject(Constant.url + "getMachineByType", map,
				MachinDetailsList.class);
		}
		 catch (Exception e) {
			e.printStackTrace();
		}
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

	@RequestMapping(value = "/insertPMRecord", method = RequestMethod.POST)
	public  String insertPMaintananceDetails(HttpServletRequest request, HttpServletResponse response,@RequestParam(value = "myFile1", required = false) List<MultipartFile> photo1,@RequestParam(value = "myFile2", required = false) List<MultipartFile> photo2,@RequestParam(value = "myFile3", required = false) List<MultipartFile> photo3) {
		ModelAndView model = new ModelAndView("pMaintanance/showPmPlanList");
		try
		{  
			//int key = Integer.parseInt(request.getParameter("key"));
		   // System.err.println(key+"key");
			int paMaintId = Integer.parseInt(request.getParameter("pa_maint_id"));
		     System.err.println(paMaintId);
			int machinType = Integer.parseInt(request.getParameter("machine_type"));
			//System.err.println(machinType);
			int machineId = Integer.parseInt(request.getParameter("machine_id"));
			//System.err.println(machineId);
			int machinActivity = Integer.parseInt(request.getParameter("activity_id"));
			//System.err.println(machinActivity);
			int machinItem = Integer.parseInt(request.getParameter("item_id"));
			//System.err.println(machinItem);
			int machinCheckPoint = Integer.parseInt(request.getParameter("check_point_id"));
			//System.err.println(machinCheckPoint);
			int methodId = Integer.parseInt(request.getParameter("method_id"));
			//System.err.println(methodId);
			//int requiredValueId = Integer.parseInt(request.getParameter("req_value"));
			//System.err.println(requiredValueId);
			String date1=request.getParameter("date1");
			//System.err.println(date1);
			String observation1=request.getParameter("date1ob");
			//System.err.println(observation1);
			String remark=request.getParameter("remark");

			String date1Photo=request.getParameter("ph1");
		    //System.err.println("QQ"+date1Photo);
			String date2=request.getParameter("date2");
			String observation2=request.getParameter("date2ob");
			
			
			
		  String date2Photo=request.getParameter("ph2");

			String date3=request.getParameter("date3");
			String observation3=request.getParameter("date3ob");
			String date3Photo=request.getParameter("ph3");
			String timeStamp = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss").format(new Date());
            System.out.println("llll"+photo1.get(0).getOriginalFilename());
			VpsImageUpload vpsImageUpload=new VpsImageUpload();
			String imageName1="";String imageName2="";String imageName3="";
			if(photo1.get(0).getOriginalFilename()!="")
				imageName1=timeStamp+""+photo1.get(0).getOriginalFilename();
			else
				imageName1=date1Photo;
			if(photo2.get(0).getOriginalFilename()!="")
				imageName2=timeStamp+""+photo2.get(0).getOriginalFilename();
			else
				imageName2=date2Photo;
			if(photo3.get(0).getOriginalFilename()!="")
				imageName3=timeStamp+""+photo3.get(0).getOriginalFilename();
			else
				imageName3=date3Photo;

			try {
				vpsImageUpload.saveUploadedFiles(photo1, 1,imageName1);
				vpsImageUpload.saveUploadedFiles(photo2, 1,imageName2);
				vpsImageUpload.saveUploadedFiles(photo3, 1,imageName3);

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			System.err.println("date2" + date2);
			System.err.println("date3 " + date3);
			if(paMaintId!=0 && String.valueOf(paMaintId)!="")
			{
				System.out.println("in if for Edit ");
				paMaintananceDetails.setPaMaintId(paMaintId);
				paMaintananceDetails.setMachinId(machineId);
				paMaintananceDetails.setActivityId(machinActivity);
				paMaintananceDetails.setItemId(machinItem);
				paMaintananceDetails.setCheckPointId(machinCheckPoint);
				paMaintananceDetails.setMethod(methodId);
				paMaintananceDetails.setRquiredValure(1);//hardcoded
				paMaintananceDetails.setDate1(date1);
				paMaintananceDetails.setDate1Obervation(observation1);
				paMaintananceDetails.setDate1Photo(imageName1);
				paMaintananceDetails.setDate2(date2);
				paMaintananceDetails.setDate2Obervation(observation2); 
				paMaintananceDetails.setDate2Photo(imageName2);
				paMaintananceDetails.setDate3(date3);
				paMaintananceDetails.setDate3Obervation(observation3);
				paMaintananceDetails.setDate3Photo(imageName3);
				paMaintananceDetails.setType(machinType);
				paMaintananceDetails.setRemark(remark);
				paMaintananceDetails.setStatus(1);
				if(date2!=null || !date2.equals(""))
				{
					paMaintananceDetails.setStatus(2);
				}
				if(date3!=null || !date3.equals(""))
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
				paMaintananceDetails.setRquiredValure(1);//hardcoded
				paMaintananceDetails.setDate1(date1);
				paMaintananceDetails.setDate1Obervation(observation1);
		     	paMaintananceDetails.setDate1Photo(imageName1);
				paMaintananceDetails.setDate2(date2);
				paMaintananceDetails.setDate2Obervation(observation2); 
				paMaintananceDetails.setDate2Photo(imageName2);
				paMaintananceDetails.setDate3(date3);
				paMaintananceDetails.setDate3Obervation(observation3);
				paMaintananceDetails.setDate3Photo(imageName3);
				paMaintananceDetails.setStatus(1);
				if(date2!=null || !date2.equals(""))
				{
					paMaintananceDetails.setStatus(2);
				}
				if(date3!=null || !date3.equals(""))
				{
					paMaintananceDetails.setStatus(3);
				}
				paMaintananceDetails.setType(machinType);
				paMaintananceDetails.setRemark(remark);

				RestTemplate rest = new RestTemplate();
				paMaintananceDetails = rest.postForObject(Constant.url + "insertPMaintananceDetails", paMaintananceDetails,
						PaMaintananceDetails.class);
				System.out.println("paMaintananceDetails " + paMaintananceDetails);
			}
			/*  RestTemplate rest = new RestTemplate();
			  List<PmRequiredValue> requiredValueList = rest.getForObject(Constant.url + "getAllPmRequiredValue",
					List.class);
			  MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			  map.add("machinId",machineId);
			
			  GetPMData[] paMaintainenceList = rest.postForObject(Constant.url + "getPMList",map,
					GetPMData[].class);
				ArrayList<GetPMData> pmList=new ArrayList<GetPMData>(Arrays.asList(paMaintainenceList));
               System.out.println("pmList"+pmList.toString());
			   map = new LinkedMultiValueMap<String, Object>();
			   map.add("machineId",machineId);
				
				GetPaMaintainence[] paMaintainList = rest.postForObject(Constant.url + "/getPmMaintainenceList",map,
						GetPaMaintainence[].class);
				ArrayList<GetPaMaintainence> pmDbList=new ArrayList<GetPaMaintainence>(Arrays.asList(paMaintainList));

				for(int i=0;i<pmDbList.size();i++)
				{
					for(int j=0;j<pmList.size();j++)
					{
						if(pmDbList.get(i).getCheckPointId()==pmList.get(j).getCheckPointId())
						{
							pmList.get(j).setPaMaintId(pmDbList.get(i).getPaMaintId());
							pmList.get(j).setDate1(pmDbList.get(i).getDate1());
							pmList.get(j).setDate1Obervation(pmDbList.get(i).getDate1Obervation());
							pmList.get(j).setDate1Photo(pmDbList.get(i).getDate1Photo());
							pmList.get(j).setDate2(pmDbList.get(i).getDate2());
							pmList.get(j).setDate2Obervation(pmDbList.get(i).getDate2Obervation());
							pmList.get(j).setDate2Photo(pmDbList.get(i).getDate2Photo());
							pmList.get(j).setDate3(pmDbList.get(i).getDate3());
							pmList.get(j).setDate3Photo(pmDbList.get(i).getDate3Photo());
							pmList.get(j).setDate3Obervation(pmDbList.get(i).getDate3Obervation());
							pmList.get(j).setRemark(pmDbList.get(i).getRemark());
							pmList.get(j).setRquiredValure(pmDbList.get(i).getRquiredValure());
							pmList.get(j).setStatus(pmDbList.get(i).getStatus());
							pmList.get(j).setMethod(pmDbList.get(i).getMethod());
						}
						
					}
				}
				model.addObject("paMaintainenceList",pmList);
				Map<Integer,String> actType=new HashMap<Integer,String>();  
				actType.put(0,"On Line Activity Points");  
				actType.put(1,"Offline Activty");  
				actType.put(2,"Safty Points");    
				model.addObject("actTypes",actType);  
				model.addObject("requiredValueList",requiredValueList);
				model.addObject("machineType", machinType);
				model.addObject("machineId", machineId);
				model.addObject("url", "/home/ats-12/");*/
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return "redirect:/searchPaMaintainenceList";
		
	//	return "gg";
	}
	
	@RequestMapping(value = "/generateCalender", method = RequestMethod.POST)
	public ModelAndView generateCalender(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("pMaintanance/generateCalender");
		try
		{
			
			int machineType = Integer.parseInt(request.getParameter("machineType"));
			int machinId = Integer.parseInt(request.getParameter("machineId"));
			System.out.println("machineType " + machineType);
			System.out.println("machinId " + machinId);
			
			Date date = new Date(); // your date
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH);
			int day = cal.get(Calendar.DAY_OF_MONTH);
			
			System.out.println("cal "+ cal);
			System.out.println("year "+ year);
			System.out.println("month "+ month);
			System.out.println("day "+ day);
			
			java.util.Date fromDate = null;
			java.util.Date toDate = null;
			
			if(month==1 || month==2 || month==3)
			{
				String fr = year-1 + "-" + 04 + "-" + 01;
				String to = year + "-" + 03 + "-" + 31;

			    try {
			      SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			      fromDate = formatter.parse(fr);
			      String from_date = formatter.format(fromDate);
			      System.out.println("fromDate:" + fromDate);
			      System.out.println("from_date:" + from_date);
			      
			      toDate = formatter.parse(to);
			      String to_date = formatter.format(toDate);
			      System.out.println("toDate:" + toDate);
			      System.out.println("to_date:" + to_date);
			      
			    } catch (Exception e) {
			      System.out.println(e.toString());
			      e.printStackTrace();
			    }
			}
			else
			{
				String fr = year + "-" + 04 + "-" + 01;
				String to = (year+1) + "-" + 03 + "-" + 31;

			    try {
			      SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			      fromDate = formatter.parse(fr);
			      String from_date = formatter.format(fromDate);
			      System.out.println("fromDate:" + fromDate);
			      System.out.println("from_date:" + from_date);
			      
			      toDate = formatter.parse(to);
			      String to_date = formatter.format(toDate);
			      System.out.println("toDate:" + toDate);
			      System.out.println("to_date:" + to_date);
			      
			    } catch (Exception e) {
			      System.out.println(e.toString());
			      e.printStackTrace();
			    }
			}
			
			
			RestTemplate rest = new RestTemplate();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("machineId", machinId);
			MachinMaintanaceSchedule machinMaintanaceSchedule = rest.postForObject(Constant.url + "getPmMaintenancePlan", map,
					MachinMaintanaceSchedule.class);
			System.out.println("MachinMaintanaceSchedule " + machinMaintanaceSchedule);
			model.addObject("planList",machinMaintanaceSchedule);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return model;
	}
}
