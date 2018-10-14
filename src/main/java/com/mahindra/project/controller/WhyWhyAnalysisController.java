package com.mahindra.project.controller;

import java.awt.Dimension;
import java.awt.Insets;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
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
import org.zefer.pd4ml.PD4Constants;
import org.zefer.pd4ml.PD4ML;
import org.zefer.pd4ml.PD4PageMark;

import com.mahindra.project.constant.Constant;
import com.mahindra.project.model.BreakdownDetail;
import com.mahindra.project.model.BreakdownMonthwise;
import com.mahindra.project.model.BreakdownTarget;
import com.mahindra.project.model.BreakdownTimeMonthwise;
import com.mahindra.project.model.BreakdownTimeYearly;
import com.mahindra.project.model.BreakdownYearly;
import com.mahindra.project.model.DailyBreakdowns;
import com.mahindra.project.model.DailyGraphData;
import com.mahindra.project.model.GetBreakdown;
import com.mahindra.project.model.GetPMData;
import com.mahindra.project.model.GetPaMaintainence;
import com.mahindra.project.model.GetWhyWhyF18;
import com.mahindra.project.model.GraphBCData;
import com.mahindra.project.model.GraphData;
import com.mahindra.project.model.GraphType;
import com.mahindra.project.model.Info;
import com.mahindra.project.model.MachinDetails;
import com.mahindra.project.model.MachinDetailsList;
import com.mahindra.project.model.MachinMaintanaceSchedule;
import com.mahindra.project.model.PaMaintananceDetails;
import com.mahindra.project.model.PmRequiredValue;
import com.mahindra.project.model.TSetting;
import com.mahindra.project.model.UserDetails;
import com.mahindra.project.model.WhyWhyF18;
import com.mahindra.project.model.YearlyMachinBreakdownList;
import com.mahindra.project.model.YearlyMachineBdTimeList;

@Controller
@Scope("session")
public class WhyWhyAnalysisController {
	int machineType;
	int machineId;
	@RequestMapping(value = "/searchWhyWhyList", method = RequestMethod.GET)
	public ModelAndView searchWhyWhyList(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("whywhyanalysis/whywhyf18");
		try
		{
			String machineIdList="";
			  try {
				/* machineType = Integer.parseInt(request.getParameter("machineType"));*/
				String[] machineIdStr = request.getParameterValues("machineId[]");
				

				StringBuilder sb = new StringBuilder();

				for (int i = 0; i < machineIdStr.length; i++) {
					sb = sb.append(machineIdStr[i] + ",");

				}
				 machineIdList = sb.toString();
				machineIdList = machineIdList.substring(0, machineIdList.length() - 1);

				System.out.println("machineIdList" + machineIdList);
			     }
			catch (Exception e) {
				// TODO: handle exception
			}
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
			
			map1.add("settingKey", "breakdown_ref_no");
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
	          
			/*map1 = new LinkedMultiValueMap<String,Object>();
			map1.add("machineId", machineId);
			MachinDetails machinDetails=rest.postForObject(Constant.url + "/getMachineById",map1, MachinDetails.class);
*/
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("deptId",deptId);
			MachinDetailsList machinDetailsList = rest.postForObject(Constant.url + "getMachineByDeptId", map,
					MachinDetailsList.class);
			 model.addObject("machineList", machinDetailsList.getMachinDetailsList());
			
			 map = new LinkedMultiValueMap<String, Object>();
			map.add("machineIdList",machineIdList);
			WhyWhyF18[] whyWhyF18ListRes = rest.postForObject(Constant.url + "getAllWhyWhyF18",map,
					WhyWhyF18[].class);
			ArrayList<WhyWhyF18> whyWhyF18List=new ArrayList<WhyWhyF18>(Arrays.asList(whyWhyF18ListRes));
            System.out.println("whyWhyF18List"+whyWhyF18List.toString());
			model.addObject("whyWhyF18List",whyWhyF18List);
			model.addObject("deptId", deptId);
			
			List<String> prevSel = Arrays.asList(machineIdList.split("\\s*,\\s*"));

			List<MachinDetails> selMachines = new ArrayList<MachinDetails>();

			for (int i = 0; i < prevSel.size(); i++) {
				for (int j = 0; j <machinDetailsList.getMachinDetailsList().size(); j++) {
					if (Integer.parseInt(prevSel.get(i)) == machinDetailsList.getMachinDetailsList().get(j)
							.getMachinId()) {
						selMachines.add(machinDetailsList.getMachinDetailsList().get(j));

					}
				}

			}
			model.addObject("selMachines", selMachines);
			/*model.addObject("machineType", machineType);
			model.addObject("machineId", machineId);*/
			
		/*	  Map<String,String> clarificationOfCause=new HashMap<String,String>();  
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
              model.addObject("failureCodeList", failureCodeList);	*/
              
              model.addObject("refNo", refNo);
             /* model.addObject("machinDetails", machinDetails);*/
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return model;
	}
	@RequestMapping(value = "/insertTarget", method = RequestMethod.POST)
	public  String insertTarget(HttpServletRequest request, HttpServletResponse response) {
		RestTemplate rest = new RestTemplate();
		int graphType=0;
		ModelAndView model = new ModelAndView("whywhyanalysis/showTarget");
		try
		{ 
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			int targetId=0;
			try {
				targetId=Integer.parseInt(request.getParameter("targetId"));
			}catch (Exception e) {
				targetId=0;
			}
			int year=Integer.parseInt(request.getParameter("yearpicker"));
			float l3Target=Float.parseFloat(request.getParameter("l3Target"));
			float l5Target=Float.parseFloat(request.getParameter("l5Target"));
			int actual=Integer.parseInt(request.getParameter("actual"));
			 graphType=Integer.parseInt(request.getParameter("graphType"));
			BreakdownTarget brTarget=new BreakdownTarget();
			brTarget.setTargetId(targetId);
			brTarget.setYear(year);
			brTarget.setAssignedBy(1);
			brTarget.setGraphType(graphType);
			brTarget.setRemark("");
            brTarget.setTargetL3(l3Target);
            brTarget.setTargetL5(l5Target);
            brTarget.setStatus(1);
            brTarget.setExString(""+actual);
            brTarget.setExInt(deptId);
			BreakdownTarget breakdownTargetRes=rest.postForObject(Constant.url + "/insertBreakdownTarget",brTarget, BreakdownTarget.class);
			System.err.println(breakdownTargetRes.toString());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/showTargetG"+graphType;
	}
	@RequestMapping(value = "/deleteTarget/{targetId}/{graphType}", method = RequestMethod.GET)
	public String deleteTarget(@PathVariable int targetId,@PathVariable int graphType, HttpServletRequest request, HttpServletResponse response) {
 
		
		try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("targetId", targetId); 
			RestTemplate rest = new RestTemplate();
			  
			Info info = rest.postForObject(Constant.url + "deleteTarget",map,
					Info.class);
			 
			System.out.println("info " + info);
		 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return "redirect:/showTargetG"+graphType;
	}
	@RequestMapping(value = "/saveWhyWhy", method = RequestMethod.POST)
	public  String saveWhyWhy(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/whywhyf18");
		try
		{ 
			RestTemplate rest = new RestTemplate();

			int key=Integer.parseInt(request.getParameter("key"));		

			int id=0;
			try {
				 id=Integer.parseInt(request.getParameter("id"+key));		
                 System.out.println("Id"+id);
			}catch(Exception e)
			{
				id=0;
				e.printStackTrace();
			}
			String month=request.getParameter("month"+key);
            System.out.println("month"+month);

			String date=request.getParameter("date"+key);
            System.out.println("date"+date);

			String dept=request.getParameter("dept"+key);
            System.out.println("dept"+dept);

			String cellCircle=request.getParameter("cellcircle"+key);
            System.out.println("cellCircle"+cellCircle);

            System.out.println("machineId"+key);

			int machineId=Integer.parseInt(request.getParameter("machine_id"+key));		
            System.out.println("machineId"+machineId);
            
            MultiValueMap<String,Object> map1 = new LinkedMultiValueMap<String,Object>();
			map1.add("machineId", machineId);
			MachinDetails machinDetails=rest.postForObject(Constant.url + "/getMachineById",map1, MachinDetails.class);
           int type=machinDetails.getType();
			
			String machineNo=machinDetails.getMachinNo();/*request.getParameter("machine_no"+key);*/
            System.out.println("machineNo"+machineNo);
            
            int rank=Integer.parseInt(request.getParameter("rank"+key));

			String problemReported=request.getParameter("problem_reported"+key);
            System.out.println("problemReported"+problemReported);

            String bdTimeLoss=request.getParameter("bd_time_loss"+key);
            System.out.println("bdTimeLoss"+bdTimeLoss);

			String engineLoss=request.getParameter("engine_loss"+key);
            System.out.println("engineLoss"+engineLoss);

			String partStatus=request.getParameter("part"+key);
            System.out.println("partStatus"+partStatus);

			String partDesc=request.getParameter("part_desc"+key);
            System.out.println("partDesc"+partDesc);

			String bdMsPt=request.getParameter("bd_ms_pt"+key);
            System.out.println("bdMsPt"+bdMsPt);

			String action=request.getParameter("action"+key);
            System.out.println("action"+action);

			String why1=request.getParameter("why1"+key);
            System.out.println("why1"+why1);

			String why2=request.getParameter("why2"+key);
            System.out.println("why2"+why2);

			String why3=request.getParameter("why3"+key);
            System.out.println("why3"+why3);

			String why4=request.getParameter("why4"+key);
            System.out.println("why4"+why4);

			String why5=request.getParameter("why5"+key);
            System.out.println("why5"+why5);

			String rootCause=request.getParameter("root_cause"+key);
            System.out.println("rootCause"+rootCause);

			String clarificationOfCause=request.getParameter("clarification_cause"+key);
            System.out.println("clarificationOfCause"+clarificationOfCause);

			String failureCode=request.getParameter("failure_code"+key);
            System.out.println("failureCode"+failureCode);

			String counterMeasure=request.getParameter("counter_measure"+key);
            System.out.println("counterMeasure"+counterMeasure);

			String category=request.getParameter("category"+key);
            System.out.println("category"+category);

			String recurNonRecurr=request.getParameter("recurnonrecurr"+key);
            System.out.println("recurNonRecurr"+recurNonRecurr);

			String linkageWith=request.getParameter("linkage_with"+key);
            System.out.println("linkageWith"+linkageWith);

			int status=Integer.parseInt(request.getParameter("status"+key));
            System.out.println("status"+status);

			String refNo=request.getParameter("ref_no"+key);
            System.out.println("refNo"+refNo);

			String sapNotifNo=request.getParameter("sap_notif_no"+key);
            System.out.println("sapNotifNo"+sapNotifNo);

            String repairedBy=request.getParameter("repairedBy"+key);	
			String repairStartTime=request.getParameter("repairStartTime"+key);	
			String repairFinishTime=request.getParameter("repairFinishTime"+key);	
			String idea=request.getParameter("idea"+key);
			String preparedBy=request.getParameter("preparedBy"+key);	
			String mgrorhead=request.getParameter("mgrorhead"+key);	
			String subcommMember=request.getParameter("subcommMember"+key);	
			String prevOccDate=request.getParameter("prevOccDate"+key);

			WhyWhyF18 whyWhyF18=new WhyWhyF18();
			whyWhyF18.setId(id);
			whyWhyF18.setMachineType(type);
			whyWhyF18.setMachineId(machineId);
			whyWhyF18.setRank(rank);
			whyWhyF18.setAction(action);
			whyWhyF18.setBdMsPt(bdMsPt);
			whyWhyF18.setBdTimeLoss(bdTimeLoss);
			whyWhyF18.setCategory(category);
			whyWhyF18.setCellCircle(cellCircle);
			whyWhyF18.setClarificationOfCause(clarificationOfCause);
			whyWhyF18.setCounterMeasure(counterMeasure);
			whyWhyF18.setDate(date);
			whyWhyF18.setDept(dept);
			whyWhyF18.setEngineLoss(engineLoss);
			whyWhyF18.setFailureCode(failureCode);
			whyWhyF18.setLinkageWith(linkageWith);
			whyWhyF18.setMachineNo(machineNo);
			whyWhyF18.setMonth(month);
			whyWhyF18.setPartDesc(partDesc);
			whyWhyF18.setPartStatus(partStatus);
			whyWhyF18.setProblemReported(problemReported);
			whyWhyF18.setRecurNonRecurr(recurNonRecurr);
			whyWhyF18.setRefNo(refNo);
			whyWhyF18.setRootCause(rootCause);
			whyWhyF18.setSapNotifNo(sapNotifNo);
			whyWhyF18.setStatus(status);
			whyWhyF18.setWhy1(why1);
			whyWhyF18.setWhy2(why2);
			whyWhyF18.setWhy3(why3);
			whyWhyF18.setWhy4(why4);
			whyWhyF18.setWhy5(why5);
			whyWhyF18.setDelStatus(0);
			whyWhyF18.setRepairedBy(repairedBy);
			whyWhyF18.setRepairStartTime(repairStartTime);
			whyWhyF18.setRepairFinishTime(repairFinishTime);
			whyWhyF18.setSubcommMember(subcommMember);
			whyWhyF18.setPreparedBy(preparedBy);
			whyWhyF18.setPrevOccDate(prevOccDate);
			whyWhyF18.setIdea(idea);
			whyWhyF18.setMgrorhead(mgrorhead);
			
			if(key==-1)
			{
				MultiValueMap<String, Object>  map = new LinkedMultiValueMap<String,Object>();
				map.add("settingKey", "breakdown_ref_no");
				TSetting tSettingRes=rest.postForObject(Constant.url + "/getSettingValue",map, TSetting.class);
				int refValue=tSettingRes.getSettingValue()+1;
				
				map = new LinkedMultiValueMap<String,Object>();
				map.add("settingValue",refValue);
				map.add("settingKey","breakdown_ref_no");
				Info settingRes=rest.postForObject(Constant.url+"/updateSetingValue",map,Info.class);
			}
			WhyWhyF18 whyWhyF18Res = rest.postForObject(Constant.url + "insertWhyWhyF18", whyWhyF18,WhyWhyF18.class);
			
			System.out.println("whyWhyF18Res " + whyWhyF18Res);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/showWhyWhyf18";
	}
	@RequestMapping(value = "/getMachineById", method = RequestMethod.GET)
	@ResponseBody
	public MachinDetails getMachineById(HttpServletRequest request, HttpServletResponse response) {
         MachinDetails machinDetails=new MachinDetails();
		try {
			RestTemplate rest = new RestTemplate();

			MultiValueMap<String,Object> map1 = new LinkedMultiValueMap<String,Object>();
			map1.add("machineId", machineId);
			machinDetails=rest.postForObject(Constant.url + "/getMachineById",map1, MachinDetails.class);
            
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return machinDetails;
		
		}
	@RequestMapping(value = "/showWhyWhyGraph", method = RequestMethod.GET)
	public ModelAndView showPmPlan(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/whywhygraph");
		String currentMonth =new SimpleDateFormat("yyyy-MM").format(new Date());
		HttpSession session = request.getSession(); 
		int deptId = (Integer) session.getAttribute("deptId"); 
		RestTemplate rest = new RestTemplate();

		MultiValueMap<String,Object> map1 = new LinkedMultiValueMap<String,Object>();
		map1.add("graphType",1);
		map1.add("deptId",deptId);
		GraphType graphTypeRes=rest.postForObject(Constant.url + "/getGraphOwner",map1, GraphType.class);
		
		map1 = new LinkedMultiValueMap<String,Object>();
		map1.add("deptId",deptId);
		List<UserDetails> userRes=rest.postForObject(Constant.url + "/getAllUsers",map1, List.class);
		
		model.addObject("graphType", graphTypeRes);
		model.addObject("userRes", userRes);
        model.addObject("currentMonth", currentMonth);
		return model;
	}
	@RequestMapping(value = "/updateGraphOwner", method = RequestMethod.GET)
    public @ResponseBody Info updateGraphOwner(HttpServletRequest request, HttpServletResponse response) {
	
		Info infoRes=new Info();
		try {
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			int graphType=Integer.parseInt(request.getParameter("graphType"));
			int userId=Integer.parseInt(request.getParameter("userId"));
			
			RestTemplate rest = new RestTemplate();
			MultiValueMap<String,Object> map = new LinkedMultiValueMap<String,Object>();
			map.add("deptId", deptId);
			map.add("graphType",graphType);
			map.add("userId", userId);
			 infoRes = rest.postForObject(Constant.url + "/updateGraphOwner",
					map,Info.class);
			System.err.println(infoRes.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}	
			
		return infoRes;
		}
	//Minor stoppage Graph
	@RequestMapping(value = "/searchDailyGraph", method = RequestMethod.GET)
     public @ResponseBody DailyGraphData searchDailyGraph(HttpServletRequest request, HttpServletResponse response) {
	
		DailyGraphData dailyBreakdownsRes=new DailyGraphData();
		try {
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			String month=request.getParameter("month");
			RestTemplate rest = new RestTemplate();
			MultiValueMap<String,Object> map = new LinkedMultiValueMap<String,Object>();
			map.add("month", month);
			map.add("graphType", 1);
			map.add("deptId", deptId);
			 dailyBreakdownsRes = rest.postForObject(Constant.url + "/getDailyBreakdowns",
					map,DailyGraphData.class);
			System.err.println(dailyBreakdownsRes.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}	
			
		return dailyBreakdownsRes;
		}
	
	@RequestMapping(value = "/searchGraphData", method = RequestMethod.GET)
	public @ResponseBody GraphData searchGraphData(HttpServletRequest request, HttpServletResponse response) {
		
		GraphData graphData=new GraphData();
		
		try
		{  
			
			
			RestTemplate rest = new RestTemplate();
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
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
			}
			else
			{
				toMonth = new SimpleDateFormat("yyyy").format(new Date());
				int intYear =Integer.parseInt(toMonth);
				fromMonth=(intYear-1)+"";
				currentYear=Integer.parseInt(year);
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
			
			BreakdownMonthwise breakdownMothwiseList = rest.postForObject(Constant.url + "/getMonthwiseBreakdowns",
					map,BreakdownMonthwise.class);
            System.err.println("breakdownMothwiseList:"+breakdownMothwiseList.toString());
			
          /*  map = new LinkedMultiValueMap<String,Object>();
			map.add("fromYear", currentYear-1);
			map.add("toYear", currentYear);
			BreakdownMonthwise breakdownMothwiseL5Target = rest.postForObject(Constant.url + "/getMonthwiseL5Target",
					map,BreakdownMonthwise.class);
			*/
            map = new LinkedMultiValueMap<String,Object>();
            map.add("graphType", 1);
			map.add("year", year);
			map.add("month", month);
			map.add("deptId", deptId);
			YearlyMachinBreakdownList breakdownYearlyList = rest.postForObject(Constant.url + "/getYearwiseBreakdowns",
					map,YearlyMachinBreakdownList.class);
			
            System.err.println("breakdownYearlyList:"+breakdownYearlyList.toString());

            graphData.setBreakdownMothwiseRes(breakdownMothwiseList);
            graphData.setBreakdownYearlyListRes(breakdownYearlyList);
           
		    graphData.setYear(currentYear);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return graphData;
	}
	@RequestMapping(value = "/showBreakdownList", method = RequestMethod.GET)
	public ModelAndView showBreakdownList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/breakdownList");
	
		return model;
	}
	@RequestMapping(value = "/viewBreakdown/{id}/{machineType}", method = RequestMethod.GET)
	public ModelAndView viewBreakdown(@PathVariable int id,@PathVariable int machineType,HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/breakdownReport");
	    try {
			RestTemplate rest = new RestTemplate();

	    	MultiValueMap<String,Object> map = new LinkedMultiValueMap<String,Object>();
			map.add("id", id);
			GetBreakdown whyWhyF18=rest.postForObject(Constant.url + "/getWhyWhyById",map, GetBreakdown.class);
			System.err.println(whyWhyF18.toString());
			BreakdownDetail breakdownDetail=rest.postForObject(Constant.url + "/getBreakdownDetail",map, BreakdownDetail.class);
			System.err.println(breakdownDetail.toString());
			DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			 DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");

			 Date date = new Date();
			 date = df1.parse(whyWhyF18.getDate());
			 whyWhyF18.setDate(df.format(date));
			 if(machineType==1)
			 {
				 model.addObject("machineType", "Electrical");
			 }
			 else if(machineType==2)
			 {
				 model.addObject("machineType", "Mechanical");
			 }
			model.addObject("whyWhyF18", whyWhyF18);
			model.addObject("breakdownDetail", breakdownDetail);
			model.addObject("machineType", machineType);
	    }
	    catch (Exception e) {
			e.printStackTrace();
		}
		
		return model;
	}
	@RequestMapping(value = "/searchBreakdowns", method = RequestMethod.GET)
	public ModelAndView searchBreakdowns(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("whywhyanalysis/breakdownList");
		try
		{
			  try {
				 machineType = Integer.parseInt(request.getParameter("machineType"));
				 machineId = Integer.parseInt(request.getParameter("machineId"));
			     }
			catch (Exception e) {
				// TODO: handle exception
			}
				RestTemplate rest = new RestTemplate();

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("machineIdList",machineId);
				WhyWhyF18[] whyWhyF18ListRes = rest.postForObject(Constant.url + "getAllWhyWhyF18",map,
						WhyWhyF18[].class);
				ArrayList<WhyWhyF18> whyWhyF18List=new ArrayList<WhyWhyF18>(Arrays.asList(whyWhyF18ListRes));
	            System.out.println("whyWhyF18List"+whyWhyF18List.toString());
				model.addObject("whyWhyF18List",whyWhyF18List);

				model.addObject("machineType", machineType);
				model.addObject("machineId", machineId);
				
				}catch(Exception e)
				{
					e.printStackTrace();
				}
				return model;
			}
	
	@RequestMapping(value = "/saveBreakdown", method = RequestMethod.POST)
	public  String saveBreakdown(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/breakdownReport");
		int id=0;int mcType=0;
		try
		{ 
			RestTemplate rest = new RestTemplate();

			id=Integer.parseInt(request.getParameter("id"));	
		 mcType=Integer.parseInt(request.getParameter("mcType"));	
			String hdp=request.getParameter("hdp");	
			String breakdownPhenomenon=request.getParameter("breakdownPhenomenon");
			String prevenReccur=request.getParameter("prevenReccur");
			System.err.println(breakdownPhenomenon);
			String ishdp=request.getParameter("ishdp");
			String systemclassif=request.getParameter("systemclassif");

			BreakdownDetail breakdownDetail=new BreakdownDetail();
			breakdownDetail.setId(id);
			if(breakdownPhenomenon==null||breakdownPhenomenon=="")
				breakdownDetail.setBreakdownPhenomenon(0);
			else 
			breakdownDetail.setBreakdownPhenomenon(Integer.parseInt(breakdownPhenomenon));
			
			if(ishdp==null||ishdp=="")
				breakdownDetail.setIsHdp(0);
			else 
				breakdownDetail.setIsHdp(Integer.parseInt(ishdp));

			breakdownDetail.setHdp(hdp);
			breakdownDetail.setPrevenReccurId(1);
			breakdownDetail.setPrevenReccur(prevenReccur);
			if(systemclassif==null||systemclassif=="")
				breakdownDetail.setSystemclassif(0);
			else
			breakdownDetail.setSystemclassif(Integer.parseInt(systemclassif));
			
			BreakdownDetail breakDownDetails=rest.postForObject(Constant.url + "insertBreakdownDetail",breakdownDetail,BreakdownDetail.class);
			
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/viewBreakdown/"+id+"/"+mcType;
	}
	@RequestMapping(value = "/showBreakdownHistory", method = RequestMethod.GET)
	public ModelAndView showBreakdownHistory(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/breakdownHistory");
	    try {
	    	RestTemplate rest = new RestTemplate();
	    	HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
	    	DateFormat df = new SimpleDateFormat("yyyy"); // Just the year, with 2 digits
			String year = df.format(Calendar.getInstance().getTime());
			java.util.Date date= new Date();
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			int month = cal.get(Calendar.MONTH);
			System.err.println(month);
			if(month>3)
			{
				year=(Integer.parseInt(year)+1)+"";
			}
			System.err.println(year);

			MultiValueMap<String, Object>  map = new LinkedMultiValueMap<String,Object>();
			map.add("year", Integer.parseInt(year));
			map.add("deptId", deptId);
			WhyWhyF18[] whyWhyF18ListRes = rest.postForObject(Constant.url + "getAllBreakdownHistory",map,
					WhyWhyF18[].class);
			ArrayList<WhyWhyF18> whyWhyF18List=new ArrayList<WhyWhyF18>(Arrays.asList(whyWhyF18ListRes));
            System.out.println("whyWhyF18List"+whyWhyF18List.toString());
			model.addObject("whyWhyF18List",whyWhyF18List);
			model.addObject("year", year);
	    }catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
		return model;
	}
	@RequestMapping(value = "/searchBreakdownsHistory", method = RequestMethod.POST)
	public ModelAndView searchBreakdownsHistory(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("whywhyanalysis/breakdownHistory");
		try
		{
			    String year =request.getParameter("yearpicker");
			    HttpSession session = request.getSession(); 
				int deptId = (Integer) session.getAttribute("deptId"); 
				RestTemplate rest = new RestTemplate();
				MultiValueMap<String, Object>  map = new LinkedMultiValueMap<String,Object>();
				map.add("year", Integer.parseInt(year));
				map.add("deptId", deptId);
				WhyWhyF18[] whyWhyF18ListRes = rest.postForObject(Constant.url + "getAllBreakdownHistory",map,
						WhyWhyF18[].class);
				ArrayList<WhyWhyF18> whyWhyF18List=new ArrayList<WhyWhyF18>(Arrays.asList(whyWhyF18ListRes));
	            System.out.println("whyWhyF18List"+whyWhyF18List.toString());
				model.addObject("whyWhyF18List",whyWhyF18List);
				model.addObject("year", year);
		}
		catch (Exception e) {
         e.printStackTrace();
       }
	return model;
	
	}		
	@RequestMapping(value = "pdf/showWhyWhyPdf/{id}", method = RequestMethod.GET)
	public ModelAndView showBillsPdf(@PathVariable("id")int id,HttpServletRequest request, HttpServletResponse response) {
      System.out.println("IN Show  PDF Method :/");
		ModelAndView model = new ModelAndView("whywhyanalysis/breakdownPdf");
   		
   		try {
   			RestTemplate rest = new RestTemplate();
		
   	    	MultiValueMap<String,Object> map = new LinkedMultiValueMap<String,Object>();
   				map.add("id", id);
   				GetBreakdown whyWhyF18=rest.postForObject(Constant.url + "/getWhyWhyById",map, GetBreakdown.class);
   				System.err.println(whyWhyF18.toString());
   				BreakdownDetail breakdownDetail=rest.postForObject(Constant.url + "/getBreakdownDetail",map, BreakdownDetail.class);
   				System.err.println(breakdownDetail.toString());
   				DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
   				 DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");

   		 		 Date date = new Date();
   		 		 try {
   				 
   		 			 date = df1.parse(whyWhyF18.getDate());
   				     whyWhyF18.setDate(df.format(date));
   		 		 }catch (Exception e) {
					e.printStackTrace();
				}
   		 		 try {
   				     date = df1.parse(whyWhyF18.getPrevOccDate());
   				     whyWhyF18.setPrevOccDate(df.format(date));
   		 		 }
   		 		 catch (Exception e) {
					e.printStackTrace();
				}
   				 if(machineType==1)
   				 {
   					 model.addObject("machineType", "Electrical");
   				 }
   				 else if(machineType==2)
   				 {
   					 model.addObject("machineType", "Mechanical");
   				 }
   				model.addObject("whyWhyF18", whyWhyF18);
   				model.addObject("breakdownDetail", breakdownDetail);
   		}
   		catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	@RequestMapping(value = "/showTargetG1", method = RequestMethod.GET)
	public ModelAndView showTargetG1(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/showTarget");
		RestTemplate rest=new RestTemplate();
		try {
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("graphType",1);
			map.add("deptId", deptId);
			List<BreakdownTarget> brTargetList = rest.postForObject(Constant.url + "getBreakdownTargetById",map,
					List.class);		
			model.addObject("brTargetList", brTargetList);
			model.addObject("graphType", 1);
			model.addObject("graph", "Minor Stoppage Incidences");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return model;
	}
	@RequestMapping(value = "/showTargetG2", method = RequestMethod.GET)
	public ModelAndView showTargetG2(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/showTarget");
		RestTemplate rest=new RestTemplate();
		try {
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("graphType",2);
			map.add("deptId", deptId);
			List<BreakdownTarget> brTargetList = rest.postForObject(Constant.url + "getBreakdownTargetById",map,
					List.class);		
			model.addObject("brTargetList", brTargetList);
			model.addObject("graphType", 2);
			model.addObject("graph", "A-Rank Machines Breakdown Incidences");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return model;
	}
	@RequestMapping(value = "/showTargetG3", method = RequestMethod.GET)
	public ModelAndView showTargetG3(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/showTarget");
		RestTemplate rest=new RestTemplate();
		try {
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("graphType",3);
			map.add("deptId", deptId);
			List<BreakdownTarget> brTargetList = rest.postForObject(Constant.url + "getBreakdownTargetById",map,
					List.class);		
			model.addObject("brTargetList", brTargetList);
			model.addObject("graphType", 3);
			model.addObject("graph", "All  Machines Breakdown Incidences");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return model;
	}
	@RequestMapping(value = "/showTargetG4", method = RequestMethod.GET)
	public ModelAndView showTargetG4(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/showTarget");
		RestTemplate rest=new RestTemplate();
		try {
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("graphType",4);
			map.add("deptId", deptId);
			List<BreakdownTarget> brTargetList = rest.postForObject(Constant.url + "getBreakdownTargetById",map,
					List.class);		
			model.addObject("brTargetList", brTargetList);
			model.addObject("graphType", 4);
			model.addObject("graph", "BREAKDOWN MONITORING TREND");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return model;
	}
	@RequestMapping(value = "/showTargetG5", method = RequestMethod.GET)
	public ModelAndView showTargetG5(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/showTarget");
		RestTemplate rest=new RestTemplate();
		try {
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("graphType",5);
			map.add("deptId", deptId);
			List<BreakdownTarget> brTargetList = rest.postForObject(Constant.url + "getBreakdownTargetById",map,
					List.class);		
			model.addObject("brTargetList", brTargetList);
			model.addObject("graphType", 5);
			model.addObject("graph", "MTBF");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return model;
	}
	@RequestMapping(value = "/showTargetG6", method = RequestMethod.GET)
	public ModelAndView showTargetG6(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/showTarget");
		RestTemplate rest=new RestTemplate();
		try {
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("graphType",6);
			map.add("deptId", deptId);
			List<BreakdownTarget> brTargetList = rest.postForObject(Constant.url + "getBreakdownTargetById",map,
					List.class);		
			model.addObject("brTargetList", brTargetList);
			model.addObject("graphType", 6);
			model.addObject("graph", "MTTR");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return model;
	}
	@RequestMapping(value = "/showTargetG7", method = RequestMethod.GET)
	public ModelAndView showTargetG7(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/showTarget");
		RestTemplate rest=new RestTemplate();
		try {
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("graphType",7);
			map.add("deptId", deptId);
			List<BreakdownTarget> brTargetList = rest.postForObject(Constant.url + "getBreakdownTargetById",map,
					List.class);		
			model.addObject("brTargetList", brTargetList);
			model.addObject("graphType",7);
			model.addObject("graph", "Engine loss due to machine break down");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return model;
	}
	@RequestMapping(value = "/showArankBreakdownGraph", method = RequestMethod.GET)
	public ModelAndView showArankBreakdownGraph(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/aRankGraph");
		String currentMonth =new SimpleDateFormat("yyyy-MM").format(new Date());
		
		HttpSession session = request.getSession(); 
		int deptId = (Integer) session.getAttribute("deptId"); 
		RestTemplate rest = new RestTemplate();

		MultiValueMap<String,Object> map1 = new LinkedMultiValueMap<String,Object>();
		map1.add("graphType",2);
		map1.add("deptId",deptId);
		GraphType graphTypeRes=rest.postForObject(Constant.url + "/getGraphOwner",map1, GraphType.class);
		
		map1 = new LinkedMultiValueMap<String,Object>();
		map1.add("deptId",deptId);
		List<UserDetails> userRes=rest.postForObject(Constant.url + "/getAllUsers",map1, List.class);
		
		model.addObject("graphType", graphTypeRes);
		model.addObject("userRes", userRes);
        model.addObject("currentMonth", currentMonth);
		return model;
	}
	@RequestMapping(value = "/showAllBreakdownGraph", method = RequestMethod.GET)
	public ModelAndView showAllBreakdownGraph(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/allBreakdownsGraph");
		String currentMonth =new SimpleDateFormat("yyyy-MM").format(new Date());
		HttpSession session = request.getSession(); 
		int deptId = (Integer) session.getAttribute("deptId"); 
		RestTemplate rest = new RestTemplate();

		MultiValueMap<String,Object> map1 = new LinkedMultiValueMap<String,Object>();
		map1.add("graphType",3);
		map1.add("deptId",deptId);
		GraphType graphTypeRes=rest.postForObject(Constant.url + "/getGraphOwner",map1, GraphType.class);
		
		map1 = new LinkedMultiValueMap<String,Object>();
		map1.add("deptId",deptId);
		List<UserDetails> userRes=rest.postForObject(Constant.url + "/getAllUsers",map1, List.class);
		
		model.addObject("graphType", graphTypeRes);
		model.addObject("userRes", userRes);
        model.addObject("currentMonth", currentMonth);
		return model;
	}
	@RequestMapping(value = "/showBreakdownTimeGraph", method = RequestMethod.GET)
	public ModelAndView showBreakdownTimeGraph(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/breakdownTimeGraph");
		String currentMonth =new SimpleDateFormat("yyyy-MM").format(new Date());
		HttpSession session = request.getSession(); 
		int deptId = (Integer) session.getAttribute("deptId"); 
		RestTemplate rest = new RestTemplate();

		MultiValueMap<String,Object> map1 = new LinkedMultiValueMap<String,Object>();
		map1.add("graphType",4);
		map1.add("deptId",deptId);
		GraphType graphTypeRes=rest.postForObject(Constant.url + "/getGraphOwner",map1, GraphType.class);
		
		map1 = new LinkedMultiValueMap<String,Object>();
		map1.add("deptId",deptId);
		List<UserDetails> userRes=rest.postForObject(Constant.url + "/getAllUsers",map1, List.class);
		
		model.addObject("graphType", graphTypeRes);
		model.addObject("userRes", userRes);
        model.addObject("currentMonth", currentMonth);
		return model;
	}
	@RequestMapping(value = "/showMtbfGraph", method = RequestMethod.GET)
	public ModelAndView showMtbfGraph(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/mtbfGraph");
		String currentMonth =new SimpleDateFormat("yyyy-MM").format(new Date());
		HttpSession session = request.getSession(); 
		int deptId = (Integer) session.getAttribute("deptId"); 
		RestTemplate rest = new RestTemplate();

		MultiValueMap<String,Object> map1 = new LinkedMultiValueMap<String,Object>();
		map1.add("graphType",5);
		map1.add("deptId",deptId);
		GraphType graphTypeRes=rest.postForObject(Constant.url + "/getGraphOwner",map1, GraphType.class);
		
		map1 = new LinkedMultiValueMap<String,Object>();
		map1.add("deptId",deptId);
		List<UserDetails> userRes=rest.postForObject(Constant.url + "/getAllUsers",map1, List.class);
		
		model.addObject("graphType", graphTypeRes);
		model.addObject("userRes", userRes);
        model.addObject("currentMonth", currentMonth);
		return model;
	}
	@RequestMapping(value = "/showMttrGraph", method = RequestMethod.GET)
	public ModelAndView showMttrGraph(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/mttrGraph");
		String currentMonth =new SimpleDateFormat("yyyy-MM").format(new Date());
		HttpSession session = request.getSession(); 
		int deptId = (Integer) session.getAttribute("deptId"); 
		RestTemplate rest = new RestTemplate();

		MultiValueMap<String,Object> map1 = new LinkedMultiValueMap<String,Object>();
		map1.add("graphType",6);
		map1.add("deptId",deptId);
		GraphType graphTypeRes=rest.postForObject(Constant.url + "/getGraphOwner",map1, GraphType.class);
		
		map1 = new LinkedMultiValueMap<String,Object>();
		map1.add("deptId",deptId);
		List<UserDetails> userRes=rest.postForObject(Constant.url + "/getAllUsers",map1, List.class);
		
		model.addObject("graphType", graphTypeRes);
		model.addObject("userRes", userRes);
        model.addObject("currentMonth", currentMonth);
		return model;
	}
	@RequestMapping(value = "/showEngineLossGraph", method = RequestMethod.GET)
	public ModelAndView showEngineLossGraph(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/engineLossGraph");
		String currentMonth =new SimpleDateFormat("yyyy-MM").format(new Date());
		HttpSession session = request.getSession(); 
		int deptId = (Integer) session.getAttribute("deptId"); 
		RestTemplate rest = new RestTemplate();

		MultiValueMap<String,Object> map1 = new LinkedMultiValueMap<String,Object>();
		map1.add("graphType",7);
		map1.add("deptId",deptId);
		GraphType graphTypeRes=rest.postForObject(Constant.url + "/getGraphOwner",map1, GraphType.class);
		
		map1 = new LinkedMultiValueMap<String,Object>();
		map1.add("deptId",deptId);
		List<UserDetails> userRes=rest.postForObject(Constant.url + "/getAllUsers",map1, List.class);
		
		model.addObject("graphType", graphTypeRes);
		model.addObject("userRes", userRes);
        model.addObject("currentMonth", currentMonth);
		return model;
	}
	@RequestMapping(value = "/searchARankGraphData", method = RequestMethod.GET)
	public @ResponseBody GraphData searchARankGraphData(HttpServletRequest request, HttpServletResponse response) {
		
		GraphData graphData=new GraphData();
		
		try
		{  
			RestTemplate rest = new RestTemplate();
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			
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
			}
			else
			{
				toMonth = new SimpleDateFormat("yyyy").format(new Date());
				int intYear =Integer.parseInt(toMonth);
				fromMonth=(intYear-1)+"";
				currentYear=Integer.parseInt(year);
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
			
			BreakdownMonthwise breakdownMothwiseList = rest.postForObject(Constant.url + "/getARankMonthwiseBreakdowns",
					map,BreakdownMonthwise.class);
            System.err.println("breakdownMothwiseList:"+breakdownMothwiseList.toString());
			
          /*  map = new LinkedMultiValueMap<String,Object>();
			map.add("fromYear", currentYear-1);
			map.add("toYear", currentYear);
			BreakdownMonthwise breakdownMothwiseL5Target = rest.postForObject(Constant.url + "/getMonthwiseL5Target",
					map,BreakdownMonthwise.class);
			*/
            map = new LinkedMultiValueMap<String,Object>();
            map.add("graphType",2);
			map.add("year", year);
			map.add("month", month);
			map.add("deptId", deptId);
			YearlyMachinBreakdownList breakdownYearlyList = rest.postForObject(Constant.url + "/getARankYearwiseBreakdowns",
					map,YearlyMachinBreakdownList.class);
			
            System.err.println("breakdownYearlyList:"+breakdownYearlyList.toString());

            graphData.setBreakdownMothwiseRes(breakdownMothwiseList);
            graphData.setBreakdownYearlyListRes(breakdownYearlyList);
           
		    graphData.setYear(currentYear);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return graphData;
	}
	@RequestMapping(value = "/searchAllBrekGraphData", method = RequestMethod.GET)
	public @ResponseBody GraphData searchAllBrekGraphData(HttpServletRequest request, HttpServletResponse response) {
		
		GraphData graphData=new GraphData();
		
		try
		{  
			RestTemplate rest = new RestTemplate();
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			
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
			}
			else
			{
				toMonth = new SimpleDateFormat("yyyy").format(new Date());
				int intYear =Integer.parseInt(toMonth);
				fromMonth=(intYear-1)+"";
				currentYear=Integer.parseInt(year);
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
			
			BreakdownMonthwise breakdownMothwiseList = rest.postForObject(Constant.url + "/getAllBrekMonthwiseBreakdowns",
					map,BreakdownMonthwise.class);
            System.err.println("breakdownMothwiseList:"+breakdownMothwiseList.toString());
			
          /*  map = new LinkedMultiValueMap<String,Object>();
			map.add("fromYear", currentYear-1);
			map.add("toYear", currentYear);
			BreakdownMonthwise breakdownMothwiseL5Target = rest.postForObject(Constant.url + "/getMonthwiseL5Target",
					map,BreakdownMonthwise.class);
			*/
            map = new LinkedMultiValueMap<String,Object>();
            map.add("graphType",3);
			map.add("year", year);
			map.add("month", month);
			map.add("deptId", deptId);
			YearlyMachinBreakdownList breakdownYearlyList = rest.postForObject(Constant.url + "/getAllBrekYearwiseBreakdowns",
					map,YearlyMachinBreakdownList.class);
			
            System.err.println("breakdownYearlyList:"+breakdownYearlyList.toString());

            graphData.setBreakdownMothwiseRes(breakdownMothwiseList);
            graphData.setBreakdownYearlyListRes(breakdownYearlyList);
           
		    graphData.setYear(currentYear);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return graphData;
	}
	@RequestMapping(value = "/searchBrekTimeGraphData", method = RequestMethod.GET)
	public @ResponseBody GraphBCData searchBrekTimeGraphData(HttpServletRequest request, HttpServletResponse response) {
		
		GraphBCData graphData=new GraphBCData();
		
		try
		{  
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			
			RestTemplate rest = new RestTemplate();
			int graphType=Integer.parseInt(request.getParameter("graphType"));
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
			}
			else
			{
				toMonth = new SimpleDateFormat("yyyy").format(new Date());
				int intYear =Integer.parseInt(toMonth);
				fromMonth=(intYear-1)+"";
				currentYear=Integer.parseInt(year);
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
			
			BreakdownTimeMonthwise breakdownMothwiseList = rest.postForObject(Constant.url + "/getAllBrekMonthwiseBreakdownTime",
					map,BreakdownTimeMonthwise.class);
            System.err.println("breakdownMothwiseList:"+breakdownMothwiseList.toString());
			
          /*  map = new LinkedMultiValueMap<String,Object>();
			map.add("fromYear", currentYear-1);
			map.add("toYear", currentYear);
			BreakdownMonthwise breakdownMothwiseL5Target = rest.postForObject(Constant.url + "/getMonthwiseL5Target",
					map,BreakdownMonthwise.class);
			*/
            map = new LinkedMultiValueMap<String,Object>();
            map.add("graphType",graphType);
			map.add("year", year);
			map.add("month", month);
			map.add("deptId", deptId);
			YearlyMachineBdTimeList yearlyMachinBreakdownList = rest.postForObject(Constant.url + "/getYearwiseBreakdownTime",
					map,YearlyMachineBdTimeList.class);
			
            System.err.println("breakdownYearlyList:"+yearlyMachinBreakdownList.toString());

            graphData.setBreakdownTimeMonthwise(breakdownMothwiseList);
            graphData.setYearlyMachineBdTimeList(yearlyMachinBreakdownList);
           
		    graphData.setYear(currentYear);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return graphData;
	}
	@RequestMapping(value = "/searchBrekELossGraphData", method = RequestMethod.GET)
	public @ResponseBody GraphBCData searchBrekELossGraphData(HttpServletRequest request, HttpServletResponse response) {
		
		GraphBCData graphData=new GraphBCData();
		
		try
		{  
			RestTemplate rest = new RestTemplate();
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			
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
			}
			else
			{
				toMonth = new SimpleDateFormat("yyyy").format(new Date());
				int intYear =Integer.parseInt(toMonth);
				fromMonth=(intYear-1)+"";
				currentYear=Integer.parseInt(year);
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
			
			BreakdownTimeMonthwise breakdownMothwiseList = rest.postForObject(Constant.url + "/getAllBrekMonthwiseBreakdownELoss",
					map,BreakdownTimeMonthwise.class);
            System.err.println("breakdownMothwiseList:"+breakdownMothwiseList.toString());
			
          /*  map = new LinkedMultiValueMap<String,Object>();
			map.add("fromYear", currentYear-1);
			map.add("toYear", currentYear);
			BreakdownMonthwise breakdownMothwiseL5Target = rest.postForObject(Constant.url + "/getMonthwiseL5Target",
					map,BreakdownMonthwise.class);
			*/
            map = new LinkedMultiValueMap<String,Object>();
            map.add("graphType",7);
			map.add("year", year);
			map.add("month", month);
			map.add("deptId", deptId);
			YearlyMachineBdTimeList yearlyMachinBreakdownList = rest.postForObject(Constant.url + "/getYearwiseBreakdownELoss",
					map,YearlyMachineBdTimeList.class);
			
            System.err.println("breakdownYearlyList:"+yearlyMachinBreakdownList.toString());

            graphData.setBreakdownTimeMonthwise(breakdownMothwiseList);
            graphData.setYearlyMachineBdTimeList(yearlyMachinBreakdownList);
           
		    graphData.setYear(currentYear);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return graphData;
	}
	@RequestMapping(value = "/searchBrekMtbfGraphData", method = RequestMethod.GET)
	public @ResponseBody GraphBCData searchBrekMtbfGraphData(HttpServletRequest request, HttpServletResponse response)throws ArithmeticException {
		
		GraphBCData graphData=new GraphBCData();
		
		try
		{  
			RestTemplate rest = new RestTemplate();
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			
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
			}
			else
			{
				toMonth = new SimpleDateFormat("yyyy").format(new Date());
				int intYear =Integer.parseInt(toMonth);
				fromMonth=(intYear-1)+"";
				currentYear=Integer.parseInt(year);
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
			
			BreakdownTimeMonthwise breakdownMothwiseList = rest.postForObject(Constant.url + "/getAllBrekMonthwiseBreakdownTime",
					map,BreakdownTimeMonthwise.class);
            System.err.println("breakdownMothwiseList:"+breakdownMothwiseList.toString());
			
            int fromMonth1=Integer.parseInt(fromMonth)-1;
            int toMonth1=Integer.parseInt(toMonth)-1;
            map = new LinkedMultiValueMap<String,Object>();
			map.add("first", fromMonth1+"-04");
			map.add("second", fromMonth1+"-05");
			map.add("third", fromMonth1+"-06");
			map.add("fourth", fromMonth1+"-07");
			map.add("fifth", fromMonth1+"-08");
			map.add("sixth", fromMonth1+"-09");
			map.add("seventh", fromMonth1+"-10");
			map.add("eighth", fromMonth1+"-11");
			map.add("ninth", fromMonth1+"-12");
			map.add("tenth", toMonth1+"-01");
			map.add("eleventh", toMonth1+"-02");
			map.add("twelvth", toMonth1+"-03");
            map.add("deptId", deptId);
			
			BreakdownTimeMonthwise breakdownMothwiseList1 = rest.postForObject(Constant.url + "/getAllBrekMonthwiseBreakdownTime",
					map,BreakdownTimeMonthwise.class);
            System.err.println("breakdownMothwiseList1:"+breakdownMothwiseList1.toString());

			 int fromMonth2=Integer.parseInt(fromMonth)-2;
	            int toMonth2=Integer.parseInt(toMonth)-2;
	            map = new LinkedMultiValueMap<String,Object>();
				map.add("first", fromMonth2+"-04");
				map.add("second", fromMonth2+"-05");
				map.add("third", fromMonth2+"-06");
				map.add("fourth", fromMonth2+"-07");
				map.add("fifth", fromMonth2+"-08");
				map.add("sixth", fromMonth2+"-09");
				map.add("seventh", fromMonth2+"-10");
				map.add("eighth", fromMonth2+"-11");
				map.add("ninth", fromMonth2+"-12");
				map.add("tenth", toMonth2+"-01");
				map.add("eleventh", toMonth2+"-02");
				map.add("twelvth", toMonth2+"-03");
                map.add("deptId", deptId);
				
				BreakdownTimeMonthwise breakdownMothwiseList2 = rest.postForObject(Constant.url + "/getAllBrekMonthwiseBreakdownTime",
						map,BreakdownTimeMonthwise.class);
	            System.err.println("breakdownMothwiseList2:"+breakdownMothwiseList2.toString());

				
				 int fromMonth3=Integer.parseInt(fromMonth)-3;
		            int toMonth3=Integer.parseInt(toMonth)-3;
		            map = new LinkedMultiValueMap<String,Object>();
					map.add("first", fromMonth3+"-04");
					map.add("second", fromMonth3+"-05");
					map.add("third", fromMonth3+"-06");
					map.add("fourth", fromMonth3+"-07");
					map.add("fifth", fromMonth3+"-08");
					map.add("sixth", fromMonth3+"-09");
					map.add("seventh", fromMonth3+"-10");
					map.add("eighth", fromMonth3+"-11");
					map.add("ninth", fromMonth3+"-12");
					map.add("tenth", toMonth3+"-01");
					map.add("eleventh", toMonth3+"-02");
					map.add("twelvth", toMonth3+"-03");
                    map.add("deptId", deptId);
					
					BreakdownTimeMonthwise breakdownMothwiseList3 = rest.postForObject(Constant.url + "/getAllBrekMonthwiseBreakdownTime",
							map,BreakdownTimeMonthwise.class);
		            System.err.println("breakdownMothwiseList3:"+breakdownMothwiseList3.toString());
		            
		            int monthNo = cal.get(Calendar.MONTH);
		            int[] myMonthArray = {10,11,12,1,2,3,4,5,6,7,8,9};

					float breakdownListCount1=0;
					try {
						breakdownListCount1=(720/breakdownMothwiseList.getBreakdownCnt1());
					}catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownListCount2=0;
					try {
						breakdownListCount2=(744/breakdownMothwiseList.getBreakdownCnt2());
					}catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownListCount3=0;
					try {
					breakdownListCount3=(720/breakdownMothwiseList.getBreakdownCnt3());
					}catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownListCount4=0;
					try {
					breakdownListCount4=(744/breakdownMothwiseList.getBreakdownCnt4());
					}catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownListCount5=0;
					try {
					breakdownListCount5=(744/breakdownMothwiseList.getBreakdownCnt5());
					}catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownListCount6=0;
					try {
					breakdownListCount6=(720/breakdownMothwiseList.getBreakdownCnt6());
					}catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownListCount7=0;
					try {
					breakdownListCount7=(744/breakdownMothwiseList.getBreakdownCnt7());
					}catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownListCount8=0;
					try {
					breakdownListCount8=(720/breakdownMothwiseList.getBreakdownCnt8());
					}catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownListCount9=0;
					try {
					breakdownListCount9=(744/breakdownMothwiseList.getBreakdownCnt9());
					}catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownListCount10=0;
					try{
						breakdownListCount10=(744/breakdownMothwiseList.getBreakdownCnt10());
					}catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownListCount11=0;
					try{
					breakdownListCount11=(720/breakdownMothwiseList.getBreakdownCnt11());
					}catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownListCount12=0;
					try{
						breakdownListCount12=(744/breakdownMothwiseList.getBreakdownCnt12());
					}catch (Exception e) {
						// TODO: handle exception
					}
                    float year4=roundUp((breakdownListCount1+breakdownListCount2+breakdownListCount3+breakdownListCount4+breakdownListCount5+breakdownListCount6+breakdownListCount7+breakdownListCount8+breakdownListCount9+breakdownListCount10+breakdownListCount11+breakdownListCount12)/(myMonthArray[monthNo]));
					
					float breakdownList1Count1 = 0;
					try {
						breakdownList1Count1 = (720 / breakdownMothwiseList1.getBreakdownCnt1());
					} catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownList1Count2=0;
					try {
						breakdownList1Count2 = (744 / breakdownMothwiseList1.getBreakdownCnt2());
					} catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownList1Count3=0;
					try {
						breakdownList1Count3 = (720 / breakdownMothwiseList1.getBreakdownCnt3());
					} catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownList1Count4=0;
					try {
						breakdownList1Count4 = (744 / breakdownMothwiseList1.getBreakdownCnt4());
					} catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownList1Count5=0;
					try {
						breakdownList1Count5 = (744 / breakdownMothwiseList1.getBreakdownCnt5());
					} catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownList1Count6=0;
					try {
						breakdownList1Count6 = (720 / breakdownMothwiseList1.getBreakdownCnt6());
					} catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownList1Count7=0;
					try {
						breakdownList1Count7 = (744 / breakdownMothwiseList1.getBreakdownCnt7());
					} catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownList1Count8=0;
					try {
						breakdownList1Count8 = (720 / breakdownMothwiseList1.getBreakdownCnt8());
					} catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownList1Count9=0;
					try {
						breakdownList1Count9 = roundUp(744 / breakdownMothwiseList1.getBreakdownCnt9());
					} catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownList1Count10=0;
					try {
						breakdownList1Count10 = (744 / breakdownMothwiseList1.getBreakdownCnt10());
					} catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownList1Count11=0;
					try {
						breakdownList1Count11 = (720 / breakdownMothwiseList1.getBreakdownCnt11());
					} catch (Exception e) {
						// TODO: handle exception
					}
					float breakdownList1Count12=0;
					try {
						breakdownList1Count12 = (744 / breakdownMothwiseList1.getBreakdownCnt12());
					} catch (Exception e) {
						// TODO: handle exception
					}
                    float year3=roundUp((breakdownList1Count1+breakdownList1Count2+breakdownList1Count3+breakdownList1Count4+breakdownList1Count5+breakdownList1Count6+breakdownList1Count7+breakdownList1Count8+breakdownList1Count9+breakdownList1Count10+breakdownList1Count11+breakdownList1Count12)/(myMonthArray[monthNo]));
					
                     
                    float breakdownList2Count1=0;
					try {
						breakdownList2Count1 = (720 / breakdownMothwiseList2.getBreakdownCnt1());
					} catch (Exception e) {
						// TODO: handle exception
					}
 					float breakdownList2Count2=0;
					try {
						breakdownList2Count2 = (744 / breakdownMothwiseList2.getBreakdownCnt2());
					} catch (Exception e) {
						// TODO: handle exception
					}
 					float breakdownList2Count3=0;
					try {
						breakdownList2Count3 = (720 / breakdownMothwiseList2.getBreakdownCnt3());
					} catch (Exception e) {
						// TODO: handle exception
					}
 					float breakdownList2Count4=0;
					try {
						breakdownList2Count4 = (744 / breakdownMothwiseList2.getBreakdownCnt4());
					} catch (Exception e) {
						// TODO: handle exception
					}
 					float breakdownList2Count5=0;
					try {
						breakdownList2Count5 = (744 / breakdownMothwiseList2.getBreakdownCnt5());
					} catch (Exception e) {
						// TODO: handle exception
					}
 					float breakdownList2Count6=0;
					try {
						breakdownList2Count6 = (720 / breakdownMothwiseList2.getBreakdownCnt6());
					} catch (Exception e) {
						// TODO: handle exception
					}
 					float breakdownList2Count7=0;
					try {
						breakdownList2Count7 = (744 / breakdownMothwiseList2.getBreakdownCnt7());
					} catch (Exception e) {
						// TODO: handle exception
					}
 					float breakdownList2Count8=0;
					try {
						breakdownList2Count8 = (720 / breakdownMothwiseList2.getBreakdownCnt8());
					} catch (Exception e) {
						// TODO: handle exception
					}
 					float breakdownList2Count9=0;
					try {
						breakdownList2Count9 = (744 / breakdownMothwiseList2.getBreakdownCnt9());
					} catch (Exception e) {
						// TODO: handle exception
					}
 					float breakdownList2Count10=0;
					try {
						breakdownList2Count10 = (744 / breakdownMothwiseList2.getBreakdownCnt10());
					} catch (Exception e) {
						// TODO: handle exception
					}
 					float breakdownList2Count11=0;
					try {
						breakdownList2Count11 = (720 / breakdownMothwiseList2.getBreakdownCnt11());
					} catch (Exception e) {
						// TODO: handle exception
					}
 					float breakdownList2Count12=0;
					try {
						breakdownList2Count12 = (744 / breakdownMothwiseList2.getBreakdownCnt12());
					} catch (Exception e) {
						breakdownList2Count12=0;
					}
                    float year2=roundUp((breakdownList2Count1+breakdownList2Count2+breakdownList2Count3+breakdownList2Count4+breakdownList2Count5+breakdownList2Count6+breakdownList2Count7+breakdownList2Count8+breakdownList2Count9+breakdownList2Count10+breakdownList2Count11+breakdownList2Count12)/(myMonthArray[monthNo]));
 					
                      
                    float breakdownList3Count1 = 0;
					try {
						breakdownList3Count1 = (720 / breakdownMothwiseList3.getBreakdownCnt1());
					} catch (Exception e) {
						breakdownList3Count1 = 0;
					}
  					float breakdownList3Count2=0;
					try {
						breakdownList3Count2 = (744 / breakdownMothwiseList3.getBreakdownCnt2());
					} catch (Exception e) {
						breakdownList3Count2=0;
					}
  					float breakdownList3Count3=0;
					try {
						breakdownList3Count3 = (720 / breakdownMothwiseList3.getBreakdownCnt3());
					} catch (Exception e) {
						breakdownList3Count3=0;
					}
  					float breakdownList3Count4=0;
					try {
						breakdownList3Count4 = (744 / breakdownMothwiseList3.getBreakdownCnt4());
					} catch (Exception e) {
						breakdownList3Count4=0;
					}
  					float breakdownList3Count5=0;
					try {
						breakdownList3Count5 = (744 / breakdownMothwiseList3.getBreakdownCnt5());
					} catch (Exception e) {
						breakdownList3Count5=0;
					}
  					float breakdownList3Count6=0;
					try {
						breakdownList3Count6 = (720 / breakdownMothwiseList3.getBreakdownCnt6());
					} catch (Exception e) {
						 breakdownList3Count6=0;
					}
  					float breakdownList3Count7=0;
					try {
						breakdownList3Count7 = (744 / breakdownMothwiseList3.getBreakdownCnt7());
					} catch (Exception e) {
						breakdownList3Count7=0;
					}
  					float breakdownList3Count8=0;
					try {
						breakdownList3Count8 = (720 / breakdownMothwiseList3.getBreakdownCnt8());
					} catch (Exception e) {
						breakdownList3Count8=0;
					}
  					float breakdownList3Count9=0;
					try {
						breakdownList3Count9 = (744 / breakdownMothwiseList3.getBreakdownCnt9());
					} catch (Exception e) {
						breakdownList3Count9=0;
					}
  					float breakdownList3Count10=0;
					try {
						breakdownList3Count10 = (744 / breakdownMothwiseList3.getBreakdownCnt10());
					} catch (Exception e) {
						breakdownList3Count10=0;
					}
  					float breakdownList3Count11=0;
					try {
						breakdownList3Count11 = (720 / breakdownMothwiseList3.getBreakdownCnt11());
					} catch (Exception e) {
						breakdownList3Count11=0;
					}
  					float breakdownList3Count12=0;
					try {
						breakdownList3Count12 = (744 / breakdownMothwiseList3.getBreakdownCnt12());
					} catch (Exception e) {
						breakdownList3Count12=0;
					}
                    float year1=roundUp((breakdownList3Count1+breakdownList3Count2+breakdownList3Count3+breakdownList3Count4+breakdownList3Count5+breakdownList3Count6+breakdownList3Count7+breakdownList3Count8+breakdownList3Count9+breakdownList3Count10+breakdownList3Count11+breakdownList3Count12)/(myMonthArray[monthNo]));
  					System.err.println(year1);
            map = new LinkedMultiValueMap<String,Object>();
            map.add("graphType",5);
			map.add("year", year);
			map.add("month", month);
			map.add("deptId", deptId);
			YearlyMachineBdTimeList yearlyMachinBreakdownList = rest.postForObject(Constant.url + "/getYearwiseBreakdownTime",
					map,YearlyMachineBdTimeList.class);
			BreakdownTimeYearly breakdownYearly=yearlyMachinBreakdownList.getBreakdownYearly();
			
			breakdownYearly.setFirstYearTime(year1);
			breakdownYearly.setSecondYearTime(year2);
			breakdownYearly.setThirdYearTime(year3);
			breakdownYearly.setFourthYearTime(year4);
			
            System.err.println("breakdownYearlyList:"+yearlyMachinBreakdownList.toString());

            graphData.setBreakdownTimeMonthwise(breakdownMothwiseList);
            graphData.setYearlyMachineBdTimeList(yearlyMachinBreakdownList);
           
		    graphData.setYear(currentYear);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return graphData;
	}

	public static float roundUp(float d) {
		return BigDecimal.valueOf(d).setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
	}

	@RequestMapping(value = "/searchBrekDailyTimeGraph", method = RequestMethod.GET)
    public @ResponseBody DailyGraphData searchBrekDailyTimeGraph(HttpServletRequest request, HttpServletResponse response) {
	
		DailyGraphData dailyBreakdownsRes=new DailyGraphData();
		try {
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			
			String month=request.getParameter("month");
			RestTemplate rest = new RestTemplate();
			MultiValueMap<String,Object> map = new LinkedMultiValueMap<String,Object>();
			map.add("month", month);
			map.add("graphType", 4);
            map.add("deptId", deptId);
			 dailyBreakdownsRes = rest.postForObject(Constant.url + "/getDailyBreakdownsTime",
					map,DailyGraphData.class);
			System.err.println(dailyBreakdownsRes.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}	
			
		return dailyBreakdownsRes;
		}
	@RequestMapping(value = "/searchBrekDailyELossGraph", method = RequestMethod.GET)
    public @ResponseBody DailyGraphData searchBrekDailyELossGraph(HttpServletRequest request, HttpServletResponse response) {
	
		DailyGraphData dailyBreakdownsRes=new DailyGraphData();
		try {
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			
			String month=request.getParameter("month");
			RestTemplate rest = new RestTemplate();
			MultiValueMap<String,Object> map = new LinkedMultiValueMap<String,Object>();
			map.add("month", month);
			map.add("graphType", 7);
            map.add("deptId", deptId);
			 dailyBreakdownsRes = rest.postForObject(Constant.url + "/getDailyBreakdownsELoss",
					map,DailyGraphData.class);
			System.err.println(dailyBreakdownsRes.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}	
			
		return dailyBreakdownsRes;
		}
	@RequestMapping(value = "/searchARankDailyGraph", method = RequestMethod.GET)
    public @ResponseBody DailyGraphData searchARankDailyGraph(HttpServletRequest request, HttpServletResponse response) {
	
		DailyGraphData dailyBreakdownsRes=new DailyGraphData();
		try {
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			
			String month=request.getParameter("month");
			RestTemplate rest = new RestTemplate();
			MultiValueMap<String,Object> map = new LinkedMultiValueMap<String,Object>();
			map.add("month", month);
			map.add("graphType", 2);
            map.add("deptId", deptId);
			 dailyBreakdownsRes = rest.postForObject(Constant.url + "/getARankDailyBreakdowns",
					map,DailyGraphData.class);
			System.err.println(dailyBreakdownsRes.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}	
			
		return dailyBreakdownsRes;
		}
	@RequestMapping(value = "/searchAllBrekDailyGraph", method = RequestMethod.GET)
    public @ResponseBody DailyGraphData searchAllBrekDailyGraph(HttpServletRequest request, HttpServletResponse response) {
	
		DailyGraphData dailyBreakdownsRes=new DailyGraphData();
		try {
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			
			String month=request.getParameter("month");
			RestTemplate rest = new RestTemplate();
			MultiValueMap<String,Object> map = new LinkedMultiValueMap<String,Object>();
			map.add("month", month);
			map.add("graphType", 3);
			map.add("deptId", deptId);
			 dailyBreakdownsRes = rest.postForObject(Constant.url + "/getAllBrekDailyBreakdowns",
					map,DailyGraphData.class);
			System.err.println(dailyBreakdownsRes.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}	
			
		return dailyBreakdownsRes;
		}
	
	
	@RequestMapping(value = "/showBreakdownManual", method = RequestMethod.GET)
	public ModelAndView showBreakdownManual(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/breakdownManual");
		RestTemplate rest = new RestTemplate();

		HttpSession session = request.getSession(); 
		int deptId = (Integer) session.getAttribute("deptId"); 
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("deptId",deptId);
		MachinDetailsList machinDetailsList = rest.postForObject(Constant.url + "getMachineByDeptId", map,
				MachinDetailsList.class);
		 model.addObject("machineList", machinDetailsList.getMachinDetailsList());
		
		return model;
	}
	@RequestMapping(value = "/searchBreakdownManual", method = RequestMethod.GET)
	public ModelAndView searchBreakdownManual(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("whywhyanalysis/breakdownManual");
		try
		{
			String machineIdList="";
			  try {
				/* machineType = Integer.parseInt(request.getParameter("machineType"));*/
				String[] machineIdStr = request.getParameterValues("machineId[]");
				

				StringBuilder sb = new StringBuilder();

				for (int i = 0; i < machineIdStr.length; i++) {
					sb = sb.append(machineIdStr[i] + ",");

				}
				 machineIdList = sb.toString();
				machineIdList = machineIdList.substring(0, machineIdList.length() - 1);

				System.out.println("machineIdList" + machineIdList);
			     }
			catch (Exception e) {
				// TODO: handle exception
			}
				RestTemplate rest = new RestTemplate();
			
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("machineIdList",machineIdList);
			WhyWhyF18[] whyWhyF18ListRes = rest.postForObject(Constant.url + "getAllWhyWhyF18",map,
					WhyWhyF18[].class);
			ArrayList<WhyWhyF18> whyWhyF18List=new ArrayList<WhyWhyF18>(Arrays.asList(whyWhyF18ListRes));
            System.out.println("whyWhyF18List"+whyWhyF18List.toString());
			model.addObject("whyWhyF18List",whyWhyF18List);
			//------------------------------------
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			map = new LinkedMultiValueMap<String, Object>();
			map.add("deptId",deptId);
			MachinDetailsList machinDetailsList = rest.postForObject(Constant.url + "getMachineByDeptId", map,
					MachinDetailsList.class);
			 model.addObject("machineList", machinDetailsList.getMachinDetailsList());
			//-----------------------------------
			//model.addObject("machineType", machineType);
			model.addObject("machineId", machineId);
			List<String> prevSel = Arrays.asList(machineIdList.split("\\s*,\\s*"));

			List<MachinDetails> selMachines = new ArrayList<MachinDetails>();

			for (int i = 0; i < prevSel.size(); i++) {
				for (int j = 0; j <machinDetailsList.getMachinDetailsList().size(); j++) {
					if (Integer.parseInt(prevSel.get(i)) == machinDetailsList.getMachinDetailsList().get(j)
							.getMachinId()) {
						selMachines.add(machinDetailsList.getMachinDetailsList().get(j));

					}
				}

			}
			model.addObject("selMachines", selMachines);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return model;
	}
	@RequestMapping(value = "/showBreakdownData", method = RequestMethod.GET)
	public ModelAndView showBreakdownData(HttpServletRequest request, HttpServletResponse response) {
		RestTemplate rest = new RestTemplate();

		ModelAndView model = new ModelAndView("whywhyanalysis/newBreakdown");
		try
		{
			String machineIdList="";
			String bdMsPt="";
			 String month=""; 
		  try {
			String[] machineIdStr = request.getParameterValues("machineId[]");
			if(machineIdStr!=null) {
			StringBuilder sb = new StringBuilder();
            
			for (int i = 0; i < machineIdStr.length; i++) {
				sb = sb.append(machineIdStr[i] + ",");

			}
			 machineIdList = sb.toString();
			machineIdList = machineIdList.substring(0, machineIdList.length() - 1);

			System.out.println("machineIdList" + machineIdList);
			}
		     }
		catch (Exception e) {
			e.printStackTrace();
		}try {
		   bdMsPt = request.getParameter("bd_ms_pt");
		   month = request.getParameter("month");
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			
			if(bdMsPt.equals("")) {
				map.add("bdMsPt",0);

			}else {
				map.add("bdMsPt",bdMsPt);

			}
			if(month.equals("")) {
				map.add("month",0);

			}else {
				map.add("month",month);

			}
			map.add("machineIdList",machineIdList);
			GetWhyWhyF18[] whyWhyF18ListRes = rest.postForObject(Constant.url + "getBreakdownData",map,
					GetWhyWhyF18[].class);
			ArrayList<GetWhyWhyF18> whyWhyF18List=new ArrayList<GetWhyWhyF18>(Arrays.asList(whyWhyF18ListRes));
           System.out.println("whyWhyF18List"+whyWhyF18List.toString());
			model.addObject("whyWhyF18List",whyWhyF18List);
		}catch (Exception e) {
			// TODO: handle exception
		}

			//------------------------------------
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> 	map = new LinkedMultiValueMap<String, Object>();
			map.add("deptId",deptId);
			MachinDetailsList machinDetailsList = rest.postForObject(Constant.url + "getMachineByDeptId", map,
					MachinDetailsList.class);
			 model.addObject("machineList", machinDetailsList.getMachinDetailsList());
			//-----------------------------------
				model.addObject("machineId", machineId);
				model.addObject("month", month);
				model.addObject("bdMsPt", bdMsPt);
				try {
					if(machineIdList!="") {
  			List<String> prevSel = Arrays.asList(machineIdList.split("\\s*,\\s*"));

  			List<MachinDetails> selMachines = new ArrayList<MachinDetails>();

  			for (int i = 0; i < prevSel.size(); i++) {
  				for (int j = 0; j <machinDetailsList.getMachinDetailsList().size(); j++) {
  					if (Integer.parseInt(prevSel.get(i)) == machinDetailsList.getMachinDetailsList().get(j)
  							.getMachinId()) {
  						selMachines.add(machinDetailsList.getMachinDetailsList().get(j));

  					}
  				}

  			}
  			model.addObject("selMachines", selMachines);
					}
				}catch (Exception e) {
					e.printStackTrace();
				}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(value = "/getTarget", method = RequestMethod.GET)
	@ResponseBody
	public BreakdownTarget getTarget(HttpServletRequest request, HttpServletResponse response) {
		BreakdownTarget breakdownTarget = new BreakdownTarget();
		try {
			int targetId = Integer.parseInt(request.getParameter("targetId"));
			RestTemplate rest=new RestTemplate();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("targetId",targetId);
			breakdownTarget=rest.postForObject(Constant.url + "getBreakdownTargetByTargetId",map, BreakdownTarget.class);
			
			System.out.println("breakdownTarget" + breakdownTarget);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return breakdownTarget;

	}
	
	private Dimension format = PD4Constants.A4;
	private boolean landscapeValue = false;
	private int topValue = 8;
	private int leftValue = 0;
	private int rightValue = 0;
	private int bottomValue = 8;
	private String unitsValue = "m";
	private String proxyHost = "";
	private int proxyPort = 0;

	private int userSpaceWidth = 750;
	private static int BUFFER_SIZE = 1024;
	
	@RequestMapping(value = "/pdf", method = RequestMethod.GET)
	public void showPDF(HttpServletRequest request, HttpServletResponse response) {

		String url = request.getParameter("url");
		System.out.println("URL " + url);
		// http://monginis.ap-south-1.elasticbeanstalk.com
	   File f = new File("E:/tomcat/webapps/Emaintanance/report.pdf");
	   //File f = new File("D:/apache-tomcat-9.0.12/webapps/Emaintanance/report.pdf");
		//File f = new File("/Users/MIRACLEINFOTAINMENT/ATS/uplaods/reports/ordermemo221.pdf");

		System.out.println("I am here " + f.toString());
		try {
			runConverter(Constant.ReportURL + url, f, request, response);
			System.out.println("Come on lets get ");
		} catch (IOException e) {
			// TODO Auto-generated catch block

			System.out.println("Pdf conversion exception " + e.getMessage());
		}

		// get absolute path of the application
		ServletContext context = request.getSession().getServletContext();
		String appPath = context.getRealPath("");
		String filename = "ordermemo221.pdf";
		// String filePath = "/usr/local/tomcat7/webapps/report.pdf";
		 //String filePath = "D:/apache-tomcat-9.0.12/webapps/Emaintanance/report.pdf";
		String filePath = "E:/tomcat/webapps/Emaintanance/report.pdf";

		// construct the complete absolute path of the file
		String fullPath = appPath + filePath;
		File downloadFile = new File(filePath);
		FileInputStream inputStream = null;
		try {
			inputStream = new FileInputStream(downloadFile);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			// get MIME type of the file
			String mimeType = context.getMimeType(fullPath);
			if (mimeType == null) {
				// set to binary type if MIME mapping not found
				mimeType = "application/pdf";
			}
			System.out.println("MIME type: " + mimeType);

			String headerKey = "Content-Disposition";

			// response.addHeader("Content-Disposition", "attachment;filename=report.pdf");
			response.setContentType("application/pdf");

			// get output stream of the response
			OutputStream outStream;

			outStream = response.getOutputStream();

			byte[] buffer = new byte[BUFFER_SIZE];
			int bytesRead = -1;

			// write bytes read from the input stream into the output stream

			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}

			inputStream.close();
			outStream.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void runConverter(String urlstring, File output, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		if (urlstring.length() > 0) {
			if (!urlstring.startsWith("http://") && !urlstring.startsWith("file:")) {
				urlstring = "http://" + urlstring;
			}
			System.out.println("PDF URL " + urlstring);
			java.io.FileOutputStream fos = new java.io.FileOutputStream(output);

			PD4ML pd4ml = new PD4ML();

			try {

				PD4PageMark footer = new PD4PageMark();  
				footer.setPageNumberTemplate("page $[page] of $[total]");  
				footer.setTitleAlignment(PD4PageMark.LEFT_ALIGN);  
				footer.setPageNumberAlignment(PD4PageMark.RIGHT_ALIGN);  
				footer.setInitialPageNumber(1);  
				footer.setFontSize(8);  
				footer.setAreaHeight(15); 
			
				pd4ml.setPageFooter(footer);

			} catch (Exception e) {
				System.out.println("Pdf conversion method excep " + e.getMessage());
			}
			try {
				pd4ml.setPageSize(landscapeValue ? pd4ml.changePageOrientation(format) : format);
			} catch (Exception e) {
				System.out.println("Pdf conversion ethod excep " + e.getMessage());
			}

			if (unitsValue.equals("mm")) {
				pd4ml.setPageInsetsMM(new Insets(topValue, leftValue, bottomValue, rightValue));
			} else {
				pd4ml.setPageInsets(new Insets(topValue, leftValue, bottomValue, rightValue));
			}

			pd4ml.setHtmlWidth(userSpaceWidth);

			
			

			pd4ml.render(urlstring, fos);

		}
	}
}
