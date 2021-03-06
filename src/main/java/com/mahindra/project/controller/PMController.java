package com.mahindra.project.controller;

import java.io.IOException;
import java.text.DateFormat;
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
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
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
import com.mahindra.project.model.BreakdownMonthwise;
import com.mahindra.project.model.BreakdownTarget;
import com.mahindra.project.model.BreakdownTimeMonthwise;
import com.mahindra.project.model.GetPMData;
import com.mahindra.project.model.GetPaMaintainence;
import com.mahindra.project.model.MachinDetails;
import com.mahindra.project.model.MachinDetailsList;
import com.mahindra.project.model.MachinMaintanaceSchedule;
import com.mahindra.project.model.MachineL3Target;
import com.mahindra.project.model.MachineL5Target;
import com.mahindra.project.model.PMActivityDetails;
import com.mahindra.project.model.PMCheckPoints;
import com.mahindra.project.model.PMItemDetails;
import com.mahindra.project.model.PaMaintananceDetails;
import com.mahindra.project.model.PmActualGData;
import com.mahindra.project.model.PmPlan;
import com.mahindra.project.model.PmRequiredValue;
import com.mahindra.project.model.PmTargetGData;
import com.mahindra.project.model.TSetting;
import com.mahindra.project.model.UserDetails;
import com.mahindra.project.model.WhyWhyF18;
import com.mahindra.project.model.calibration.CalibrationDetails;

@Controller
@Scope("session")
public class PMController {
	
	PaMaintananceDetails paMaintananceDetails = new PaMaintananceDetails();
	List<GetPMData> paMaintainenceList=new ArrayList<>();
	public static MachinDetailsList machinDetailsList;
	ArrayList<GetPMData> pmList=new ArrayList<GetPMData>();
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
	@RequestMapping(value = "/showPmTargets", method = RequestMethod.GET)
	public ModelAndView showPmTargets(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmTargets");
		try
		{
			String currYear="";
			RestTemplate rest = new RestTemplate();
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			UserDetails userDetailRes=(UserDetails)session.getAttribute("userDetail");
			java.util.Date date= new Date();
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			int month = cal.get(Calendar.MONTH)+1;
			String fromMonth="";
			String toMonth="";
			int currentYear=0;
			  String year = new SimpleDateFormat("yyyy").format(new Date());
			if(month>3)
			{
				fromMonth = new SimpleDateFormat("yyyy").format(new Date());
				int intYear =Integer.parseInt(fromMonth);
				toMonth=(intYear+1)+"";
				currentYear=Integer.parseInt(year);
				currentYear=currentYear+1;
				currYear=(Integer.parseInt(new SimpleDateFormat("yy").format(new Date()))+1)+"";
			}
			else
			{
				toMonth = new SimpleDateFormat("yyyy").format(new Date());
				int intYear =Integer.parseInt(toMonth);
				fromMonth=(intYear-1)+"";
				currentYear=Integer.parseInt(year);
				currYear=new SimpleDateFormat("yy").format(new Date());
			}
			System.out.println("year"+currentYear);
			MultiValueMap<String,Object> map = new LinkedMultiValueMap<String,Object>();
			map.add("first", fromMonth+"-04");
			map.add("second", fromMonth+"-05");
			map.add("third", fromMonth+"-06");
			map.add("fourth", fromMonth+"-07");
			map.add("fifth", fromMonth+"-08");
			map.add("sixth", fromMonth+"-09");
			map.add("seventh", fromMonth+"-10");
			map.add("eighth", fromMonth+"-11");
			map.add("ninth", fromMonth+"-12");
			map.add("tenth", toMonth+"-01");
			map.add("eleventh", toMonth+"-02");
			map.add("twelvth", toMonth+"-03");
            map.add("deptId", deptId);
			try {
			BreakdownMonthwise minorStoppages = rest.postForObject(Constant.url + "/getMonthwiseBreakdowns",
					map,BreakdownMonthwise.class);
            System.err.println("minorStoppages:"+minorStoppages.toString());
			
            model.addObject("minorStoppages", minorStoppages);
			}catch (Exception e) {
				// TODO: handle exception
			}
			try {
            BreakdownTimeMonthwise mtbf = rest.postForObject(Constant.url + "/getAllBrekMonthwiseBreakdownTime",
					map,BreakdownTimeMonthwise.class);
            System.err.println("mtbf:"+mtbf.toString());
            model.addObject("mtbf", mtbf);
			}catch (Exception e) {
				// TODO: handle exception
			}try {
            BreakdownTimeMonthwise engineLoss = rest.postForObject(Constant.url + "/getAllBrekMonthwiseBreakdownELoss",
					map,BreakdownTimeMonthwise.class);
            System.err.println("engineLoss:"+engineLoss.toString());
            model.addObject("engineLoss", engineLoss);
			}catch (Exception e) {
				// TODO: handle exception
			}
			try {
            BreakdownMonthwise allBreak = rest.postForObject(Constant.url + "/getAllBrekMonthwiseBreakdowns",
					map,BreakdownMonthwise.class);
            System.err.println("allBreak:"+allBreak.toString());
            model.addObject("allBreak", allBreak);
			}catch (Exception e) {
				// TODO: handle exception
			}
			try {
            map = new LinkedMultiValueMap<String, Object>();
			map.add("graphType",1);
			map.add("deptId", deptId);
			map.add("year", currentYear);
			BreakdownTarget minorTarget = rest.postForObject(Constant.url + "getBreakdownTargetByNo",map,
					BreakdownTarget.class);		
			model.addObject("minorTarget", minorTarget);
			}catch (Exception e) {
				// TODO: handle exception
			}
			try {
			   map = new LinkedMultiValueMap<String, Object>();
				map.add("graphType",2);
				map.add("deptId", deptId);
				map.add("year", currentYear);
				BreakdownTarget aRankTarget = rest.postForObject(Constant.url + "getBreakdownTargetByNo",map,
						BreakdownTarget.class);		
				model.addObject("aRankTarget", aRankTarget);
			}catch (Exception e) {
				// TODO: handle exception
			}
			try {
				map = new LinkedMultiValueMap<String, Object>();
				map.add("graphType",3);
				map.add("deptId", deptId);
				map.add("year", currentYear);
				BreakdownTarget allTarget = rest.postForObject(Constant.url + "getBreakdownTargetByNo",map,
						BreakdownTarget.class);		
				model.addObject("allTarget", allTarget);
			}catch (Exception e) {
				// TODO: handle exception
			}
			try {
				map = new LinkedMultiValueMap<String, Object>();
				map.add("graphType",4);
				map.add("deptId", deptId);
				map.add("year", currentYear);
				BreakdownTarget timeTarget = rest.postForObject(Constant.url + "getBreakdownTargetByNo",map,
						BreakdownTarget.class);		
				model.addObject("timeTarget", timeTarget);
			}catch (Exception e) {
				// TODO: handle exception
			}
			try {
				map = new LinkedMultiValueMap<String, Object>();
				map.add("graphType",5);
				map.add("deptId", deptId);
				map.add("year", currentYear);
				BreakdownTarget mtbfTarget = rest.postForObject(Constant.url + "getBreakdownTargetByNo",map,
						BreakdownTarget.class);		
				model.addObject("mtbfTarget", mtbfTarget);
			}catch (Exception e) {
				// TODO: handle exception
			}
			try {
				map = new LinkedMultiValueMap<String, Object>();
				map.add("graphType",6);
				map.add("deptId", deptId);
				map.add("year", currentYear);
				BreakdownTarget mttrTarget = rest.postForObject(Constant.url + "getBreakdownTargetByNo",map,
						BreakdownTarget.class);		
				model.addObject("mttrTarget", mttrTarget);
			}catch (Exception e) {
				// TODO: handle exception
			}
			try {
				map = new LinkedMultiValueMap<String, Object>();
				map.add("graphType",7);
				map.add("deptId", deptId);
				map.add("year", currentYear);
				BreakdownTarget elTarget = rest.postForObject(Constant.url + "getBreakdownTargetByNo",map,
						BreakdownTarget.class);		
				model.addObject("elTarget", elTarget);
			}catch (Exception e) {
				// TODO: handle exception
			}
			model.addObject("YEAR", currYear);
			//------------------------------------------PM Schedule---------------------------------------------
			try {
			map = new LinkedMultiValueMap<String,Object>();
			if(userDetailRes.getType()==1) {
			map.add("status1",1);
			map.add("status2",3);
			map.add("status3",5);
			}
			else
			{
				map.add("status1",2);
				map.add("status2",4);
				map.add("status3",6);
			}
            map.add("deptId", deptId);
			
            PmActualGData pmActualGDataRes = rest.postForObject(Constant.url + "/getPmPlanActualData",
					map,PmActualGData.class);
            System.err.println("pmActualGDataRes:"+pmActualGDataRes.toString());
            model.addObject("pmActualGDataRes", pmActualGDataRes);
			}catch (Exception e) {
				// TODO: handle exception
			}
			try {
            map = new LinkedMultiValueMap<String,Object>();
			
            map.add("deptId", deptId);
			
            PmTargetGData pmTargetGDataRes = rest.postForObject(Constant.url + "/getPmPlanTargetData",
					map,PmTargetGData.class);
            System.err.println("pmTargetGDataRes:"+pmTargetGDataRes.toString());
			
            model.addObject("pmTargetGDataRes", pmTargetGDataRes);
			}catch (Exception e) {
				// TODO: handle exception
			}
			try {
			map = new LinkedMultiValueMap<String,Object>();
	            map.add("graphType",8);
				map.add("year", year);
				map.add("month", month);
				map.add("deptId", deptId);
				MachineL5Target machineL5TargetRes = rest.postForObject(Constant.url + "/getMachineL5Target",
						map,MachineL5Target.class);
				model.addObject("machineL5TargetRes", machineL5TargetRes);
	            System.err.println("machineL5TargetRes:"+machineL5TargetRes.toString());
			}catch (Exception e) {
				// TODO: handle exception
			}
			try {
	            map = new LinkedMultiValueMap<String,Object>();
	            map.add("graphType", 8);
				map.add("year", year);
				map.add("month", month);
				map.add("deptId", deptId);
				MachineL3Target machineL3TargetRes = rest.postForObject(Constant.url + "/getMachineL3Target",
						map,MachineL3Target.class);
				model.addObject("machineL3TargetRes", machineL3TargetRes);
	            System.err.println("machineL3TargetRes:"+machineL3TargetRes.toString());
			}catch (Exception e) {
				// TODO: handle exception
			}
			
			Calendar c = Calendar.getInstance();
			int monthNo=c.get(Calendar.MONTH)+1;
			if(monthNo==1) {
            model.addObject("monthNo", 10);
			}else if(monthNo==2) {
	            model.addObject("monthNo", 11);
				}else if(monthNo==3) {
		            model.addObject("monthNo", 12);
				}else {
					 model.addObject("monthNo", monthNo-3);
				}
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
	@RequestMapping(value = "/showPm", method = RequestMethod.GET)
	public ModelAndView showPm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pMaintanance/pm");
		try
		{
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return model;
	}
	@RequestMapping(value = "/showTbmMenu", method = RequestMethod.GET)
	public ModelAndView showTBMMenu(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("tbm/tbMain");
		try
		{
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return model;
	}
	@RequestMapping(value = "/showPeriodicMaintainance", method = RequestMethod.GET)
	public ModelAndView showPeriodicMaintainance(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("tbm/periodic");
		try
		{
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return model;
	}
	@RequestMapping(value = "/showCalMenu", method = RequestMethod.GET)
	public ModelAndView showCalMenu(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("calibration/calMain");
		try
		{
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return model;
	}
	/*@RequestMapping(value = "/showPmPlanList/{type}/{machineId}", method = RequestMethod.GET)
	public ModelAndView showPmPlanSchedule(@PathVariable("type")int type,@PathVariable("machineId")int machineId ,HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pMaintanance/showPmPlanList");
		try
		{
			RestTemplate rest = new RestTemplate();
			List<PmRequiredValue> requiredValueList = rest.getForObject(Constant.url + "getAllPmRequiredValue",
					List.class);
			model.addObject("requiredValueList",requiredValueList);
			model.addObject("type", type);
			model.addObject("machineId", machineId);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return model;
	}*/
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
		MachinDetailsList machinDetailsList=new MachinDetailsList();
	try
	{
		HttpSession session = request.getSession(); 
		int deptId = (Integer) session.getAttribute("deptId"); 
		RestTemplate rest = new RestTemplate();
		
		MultiValueMap<String, Object>  map1 = new LinkedMultiValueMap<String,Object>();
		java.util.Date date= new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int month = cal.get(Calendar.MONTH);
		
   String refNo="EGL/WHY/F"; 
	DateFormat df = new SimpleDateFormat("yy"); // Just the year, with 2 digits
	String formattedDate="";
	int actYear=0;
	if(month>3)
	{
		formattedDate = new SimpleDateFormat("yy").format(new Date());
		int intYear =Integer.parseInt(formattedDate);
		actYear=intYear+1;
	}
	else if(month<=3)
	{
		formattedDate = new SimpleDateFormat("yy").format(new Date());
		int intYear =Integer.parseInt(formattedDate);
		actYear=intYear;
	}
	
	if(deptId==1)
	{
		map1.add("settingKey", "breakdown_ref_no1");
	}else
	if(deptId==2)
	{
			map1.add("settingKey", "breakdown_ref_no2");
	}else if(deptId==3)
		{
			map1.add("settingKey", "breakdown_ref_no3");
	}
	TSetting tSettingRes=rest.postForObject(Constant.url + "/getSettingValue",map1, TSetting.class);
	int refValue=tSettingRes.getSettingValue()+1;
	refNo=refNo+""+actYear+"/"+refValue;
	System.err.println(refNo);
	
		  Map<String,String> clarificationOfCause=new HashMap<String,String>();  
		  clarificationOfCause.put("Inadequate Operating condition","Inadequate Operating condition");  
		  clarificationOfCause.put("Deterioration","Deterioration");  
		  clarificationOfCause.put("Inadequate Design","Inadequate Design");  
		  clarificationOfCause.put("Inadequate Skill","Inadequate Skill");  
		  clarificationOfCause.put("Inadequate Basic Condition","Inadequate Basic Condition");  
		  clarificationOfCause.put("Open","Open");  
          model.addObject("clarificationOfCauseList", clarificationOfCause);
          Map<String,String> failureCodeList=new HashMap<String,String>(); 
          failureCodeList.put("Power Failure", "Power Failure");
          failureCodeList.put("Clogged", "Clogged");
          failureCodeList.put("Broken", "Broken");
          failureCodeList.put("Leak", "Leak");
          failureCodeList.put("Lack of Lubrication", "Lack of Lubrication");
          failureCodeList.put("Abnormal Condition", "Abnormal Condition");
          failureCodeList.put("Irregular temp.", "Irregular temp.");
          failureCodeList.put("Loose", "Loose");
          failureCodeList.put("Wear", "Wear");
          failureCodeList.put("Crack", "Crack");
          failureCodeList.put("Bend", "Bend");
          failureCodeList.put("Damaged", "Damaged");
          failureCodeList.put("Tight/Rusty/Jam", "Tight/Rusty/Jam");
          failureCodeList.put("Disengaged", "Disengaged");
          failureCodeList.put("Entangled", "Entangled");
          failureCodeList.put("Deteriation", "Deteriation");
          failureCodeList.put("Dry Solder", "Dry Solder");
          failureCodeList.put("PCB Failure", "PCB Failure");
          failureCodeList.put("Burnt", "Burnt");
          failureCodeList.put("Setting Error", "Setting Error");
          failureCodeList.put("Operating Error", "Operating Error");
          failureCodeList.put("Misalignment", "Misalignment");
          failureCodeList.put("Accident", "Accident");
          failureCodeList.put("Short Circuit", "Short Circuit");
          failureCodeList.put("Open Circuit", "Open Circuit");
          failureCodeList.put("Pressure Drop", "Pressure Drop");
          failureCodeList.put("Blown Off", "Blown Off");
          failureCodeList.put("Program Currupt", "Program Currupt");
          failureCodeList.put("Poor Contact", "Poor Contact");
          failureCodeList.put("Poor Insulation", "Poor Insulation");
          failureCodeList.put("Tripped", "Tripped");
          failureCodeList.put("Wire Broken", "Wire Broken");
          failureCodeList.put("Air Lock", "Air Lock");
          failureCodeList.put("Poor Adjustment", "Poor Adjustment");
          failureCodeList.put("Noisy", "Noisy");
          failureCodeList.put("Low Level", "Low Level");
          failureCodeList.put("Wrong Wiring", "Wrong Wiring");
          failureCodeList.put("Slip", "Slip");
          failureCodeList.put("Earthing", "Earthing");
          failureCodeList.put("M/c Level", "M/c Level");
          model.addObject("failureCodeList", failureCodeList);	
		
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("deptId",deptId);
		 machinDetailsList = rest.postForObject(Constant.url + "getMachineByDeptId", map,
				MachinDetailsList.class);
		 model.addObject("machineList", machinDetailsList.getMachinDetailsList());
		map = new LinkedMultiValueMap<String, Object>();
			if(deptId==0)
			{
				map.add("deptId","1,2,3");
			}else {
			map.add("deptId",deptId);
			}
			WhyWhyF18[] whyWhyF18ListRes = rest.postForObject(Constant.url + "getAllWhyWhyByDeptId",map,
					WhyWhyF18[].class);
			ArrayList<WhyWhyF18> whyWhyF18List=new ArrayList<WhyWhyF18>(Arrays.asList(whyWhyF18ListRes));
			model.addObject("whyWhyF18List",whyWhyF18List);
			model.addObject("deptId", deptId);
			 model.addObject("refNo", refNo);
			 List<MachinDetails> selMachines = new ArrayList<MachinDetails>();
				model.addObject("selMachines", selMachines);

		 System.err.println("machinDetailsList"+machinDetailsList.toString());
	}catch (Exception e) {
		e.printStackTrace();
	}
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
					pmList=new ArrayList<GetPMData>(Arrays.asList(paMaintainenceList));

					HttpSession session = request.getSession(); 
					int deptId = (Integer) session.getAttribute("deptId"); 
				 map = new LinkedMultiValueMap<String, Object>();
					map.add("machineId",machineId);
					map.add("deptId",deptId);
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
								pmList.get(j).setType(pmDbList.get(i).getType());
								pmList.get(j).setInt1(pmDbList.get(i).getInt1());
								pmList.get(j).setInt3(pmDbList.get(i).getInt3());
								//pmList.get(j).setInt2(pmDbList.get(i).getInt2());
								pmList.get(j).setString1(pmDbList.get(i).getString1());
								pmList.get(j).setString2(pmDbList.get(i).getString2());
							}
							
						}
					}
					System.out.println("pmList"+pmList.toString());
			model.addObject("paMaintainenceList",pmList);
			model.addObject("listSize",pmList.size());
			  Map<Integer,String> actType=new HashMap<Integer,String>();  
			  actType.put(0,"On Line Activity Points");  
			  actType.put(1,"Offline Activty");  
			  actType.put(2,"Safty Points");  
			model.addObject("actTypes",actType);  
			model.addObject("requiredValueList",requiredValueList);
			model.addObject("machineType", machineType);
			model.addObject("machineId", machineId);
			model.addObject("url",Constant.IMAGE_URL);
			
			if(pmList.get(0).getInt1()==0)
			{
				System.out.println("in if   "  +pmList.get(0).getInt1());
				int pmStatus = 1;
				for(int i = 0 ; i<pmList.size() ; i++)
				{
					if(pmList.get(i).getStatus()<1)
					{
						pmStatus=0;
						break;
					}
				}
				System.out.println("pmStatus  "  +pmStatus);
				model.addObject("approveStatus", pmList.get(0).getInt1());
				model.addObject("pmStatus", pmStatus);
			}
			else if(pmList.get(0).getInt1()==1)
			{
				System.out.println("in if else 1  "  +pmList.get(0).getInt1()); 
				model.addObject("approveStatus", pmList.get(0).getInt1()); 
			}
			else if(pmList.get(0).getInt1()==2)
			{
				System.out.println("in if else 2  "  +pmList.get(0).getInt1());
				int pmStatus = 2;
				for(int i = 0 ; i<pmList.size() ; i++)
				{
					if(pmList.get(i).getStatus()<2)
					{
						pmStatus=0;
						break;
					}
				}
				model.addObject("approveStatus", pmList.get(0).getInt1());
				model.addObject("pmStatus", pmStatus);
			}
			else if(pmList.get(0).getInt1()==3)
			{
				System.out.println("in if else 3  "  +pmList.get(0).getInt1()); 
				model.addObject("approveStatus", pmList.get(0).getInt1()); 
			}
			
			else if(pmList.get(0).getInt1()==4)
			{
				System.out.println("in if else 4  "  +pmList.get(0).getInt1());
				int pmStatus = 3;
				for(int i = 0 ; i<pmList.size() ; i++)
				{
					if(pmList.get(i).getStatus()<3)
					{
						pmStatus=0;
						break;
					}
				}
				model.addObject("approveStatus", pmList.get(0).getInt1());
				model.addObject("pmStatus", pmStatus);
			}
			else if(pmList.get(0).getInt1()==5)
			{
				System.out.println("in if else 5  "  +pmList.get(0).getInt1()); 
				model.addObject("approveStatus", pmList.get(0).getInt1()); 
			}
			else if(pmList.get(0).getInt1()==6)
			{
				System.out.println("in if else 6  "  +pmList.get(0).getInt1()); 
				model.addObject("approveStatus", pmList.get(0).getInt1()); 
			}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(value = "/approveList/{status}", method = RequestMethod.GET)
	public String approveList(@PathVariable int status, HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("pMaintanance/showPmPlanList");
		RestTemplate rest = new RestTemplate();
		
		try
		{    try {
			 machineType = Integer.parseInt(request.getParameter("machineType"));
			 machineId = Integer.parseInt(request.getParameter("machineId"));
		     }
		catch (Exception e) {
			// TODO: handle exception
		} 
		HttpSession session = request.getSession();
		UserDetails userDetail = (UserDetails) session.getAttribute("userDetail"); 
		
		for(int i = 0 ; i<pmList.size() ; i++)
		{
			pmList.get(i).setInt1(status);
			pmList.get(i).setString2(pmList.get(i).getString2()+", "+userDetail.getName());
		}
		
		System.out.println("pmList " + pmList.toString());
		
		GetPMData[] paMaintainenceList = rest.postForObject(Constant.url + "updatePmDetailList",pmList,
				GetPMData[].class);
			pmList=new ArrayList<GetPMData>(Arrays.asList(paMaintainenceList));
		
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return "redirect:/searchPaMaintainenceList";
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
					HttpSession session = request.getSession(); 
					int deptId = (Integer) session.getAttribute("deptId"); 
			
					map = new LinkedMultiValueMap<String, Object>();
					map.add("machineId",machineId);
					map.add("deptId",deptId);
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
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
		int type = Integer.parseInt(request.getParameter("machineType"));
		System.out.println(type);
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("type", "" + type);
		map.add("deptId",deptId);
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
			int int1 = Integer.parseInt(request.getParameter("int1"));
			int int3 = Integer.parseInt(request.getParameter("int3"));
			String string1=request.getParameter("string1");

			String string2=request.getParameter("string2");

			//System.err.println(methodId);
			//int requiredValueId = Integer.parseInt(request.getParameter("req_value"));
			//System.err.println(requiredValueId);
			String date1=request.getParameter("date1");
			System.err.println("date1"+date1);
			String observation1=request.getParameter("date1ob");
			//System.err.println(observation1);
			String remark=request.getParameter("remark");

			String date1Photo=request.getParameter("ph1");
		    //System.err.println("QQ"+date1Photo);
			String date2=request.getParameter("date2");
			System.err.println("date2"+date2);

			String observation2=request.getParameter("date2ob");
			
			
			
		  String date2Photo=request.getParameter("ph2");

			String date3=request.getParameter("date3");
			System.err.println("date3"+date3);
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
				paMaintananceDetails.setInt1(int1);
				paMaintananceDetails.setInt3(int3);
				paMaintananceDetails.setString1(string1);
				paMaintananceDetails.setString2(" ");
				HttpSession session = request.getSession(); 
				int deptId = (Integer) session.getAttribute("deptId"); 
				paMaintananceDetails.setInt3(deptId);
				
				if(!date2.equals(""))
				{
					paMaintananceDetails.setStatus(2);
				}
				if(!date3.equals(""))
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
				 
				HttpSession session = request.getSession(); 
				int deptId = (Integer) session.getAttribute("deptId"); 
				paMaintananceDetails.setInt3(deptId);
				if(!date2.equals(""))
				{
					paMaintananceDetails.setStatus(2);
				}
				if(!date3.equals(""))
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
		
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return "redirect:/searchPaMaintainenceList";
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
	
	@RequestMapping(value = "/showPmSchedule", method = RequestMethod.GET)
	public ModelAndView showCalibration(HttpServletRequest request, HttpServletResponse response) {
	
		ModelAndView model = new ModelAndView("pMaintanance/PmSchedule");
		int machineId=0;
		List<PmPlan> planList=new ArrayList<>(); 
		try
		{
			RestTemplate rest=new RestTemplate();
			Calendar now = Calendar.getInstance();
			int month=now.get(Calendar.MONTH) + 1; // Note: zero based!
		try {
				 month=Integer.parseInt(request.getParameter("month"));
				
			}catch (Exception e) {
				 month = now.get(Calendar.MONTH) + 1; // Note: zero based!
				
			}
		HttpSession session = request.getSession(); 
		int deptId = (Integer) session.getAttribute("deptId"); 
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("deptId",deptId);
		 machinDetailsList = rest.postForObject(Constant.url + "getMachineByDeptId", map,
				MachinDetailsList.class);
		 model.addObject("machineList", machinDetailsList.getMachinDetailsList());
			
			map = new LinkedMultiValueMap<String, Object>();
			map.add("month",month);
			map.add("deptId",deptId);
		     planList=rest.postForObject(Constant.url + "getPmMaintenancePlanList",map, List.class);
			PmPlan planRes=new PmPlan();
		try {
				 machineId=Integer.parseInt(request.getParameter("mach"));
				 System.err.println("machineId"+machineId);
				if(machineId!=0) {
					planList=new ArrayList<PmPlan>();
				 map = new LinkedMultiValueMap<String, Object>();
				map.add("machineId",machineId);
				 planRes=rest.postForObject(Constant.url + "getPmMaintenancePlanOfMc",map, PmPlan.class);
					planList.add(planRes);

				}
			}catch (Exception e) {
				
				 e.printStackTrace();
			}
			model.addObject("month", month);
			model.addObject("planListRes", planList);
			model.addObject("machineId", machineId);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return model;
	}
}
