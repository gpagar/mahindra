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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mahindra.project.constant.Constant;
import com.mahindra.project.model.Info;
import com.mahindra.project.model.MachinDetails;
import com.mahindra.project.model.MachinDetailsList;
import com.mahindra.project.model.MachinMaintanaceSchedule;
import com.mahindra.project.model.PMActivityDetails;
import com.mahindra.project.model.PMCheckPoints;
import com.mahindra.project.model.PMItemDetails;
import com.mahindra.project.model.PmRequiredValue;

@Controller
@Scope("session")
public class PmMastersController {
	
	MachinDetails machDetails=null;
	PMActivityDetails pMActivityDetailsRes=null;
	PMItemDetails pMItemDetailsRes=null;	int machineType;

	@RequestMapping(value = "/showAddMachine", method = RequestMethod.GET)
	public ModelAndView showAddMachine(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmMasters/addMachine");
		 
		

		return model;
	}
	@RequestMapping(value = "/updateMachine/{machineId}", method = RequestMethod.GET)
	public ModelAndView updateMachine(@PathVariable("machineId")int machineId,HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmMasters/addMachine");
		try {
			RestTemplate rest=new RestTemplate();
		MultiValueMap<String, Object>	map = new LinkedMultiValueMap<String, Object>();
			map.add("machineId", ""+machineId);
		MachinDetails pmMachine=rest.postForObject(Constant.url + "getMachineById", map,MachinDetails.class);
	       model.addObject("machine", pmMachine);
           model.addObject("machineType", pmMachine.getType());
		}catch (Exception e) {
			// TODO: handle exception
		}
		

		return model;
	}
	@RequestMapping(value = "/showAllMachines", method = RequestMethod.GET)
	public ModelAndView showAllMachines(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmMasters/machineList");
		 try {
				RestTemplate rest = new RestTemplate();

		HttpSession session = request.getSession(); 
		int deptId = (Integer) session.getAttribute("deptId"); 
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("deptId",deptId);
		MachinDetailsList	 machinDetailsList = rest.postForObject(Constant.url + "getMachineByDeptId", map,
				MachinDetailsList.class);
		 model.addObject("machineList", machinDetailsList.getMachinDetailsList());
		 }
		 catch (Exception e) {
		e.printStackTrace();
		}
		return model;
	}
	@RequestMapping(value = "/getAllActivities/{machineId}", method = RequestMethod.GET)
	public ModelAndView getAllActivities(@PathVariable("machineId")int machineId,HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmMasters/activityList");

		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("machinId", ""+machineId);
		List<PMActivityDetails> pMActivityDetailsList = rest.postForObject(Constant.url + "getActivityByMachin", map,
				List.class);
		
		try {
			map = new LinkedMultiValueMap<String, Object>();
			map.add("machineId", ""+machineId);
		MachinDetails pmMachine=rest.postForObject(Constant.url + "getMachineById", map,MachinDetails.class);
	       model.addObject("pmMachine", pmMachine);

		}catch (Exception e) {
			// TODO: handle exception
		}
       model.addObject("pMActivityDetailsList", pMActivityDetailsList);

		return model;
	}
	@RequestMapping(value = "/getAllItems/{activityId}", method = RequestMethod.GET)
	public ModelAndView getAllItems(@PathVariable("activityId")int activityId,HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmMasters/itemList");


	RestTemplate rest = new RestTemplate();
	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
	map.add("activityId", "" + activityId);
	List<PMItemDetails> pMItemDetailsList = new ArrayList<>();
	try {
		pMItemDetailsList = rest.postForObject(Constant.url + "getItemsByActivityId", map, List.class);
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
   model.addObject("itemList", pMItemDetailsList);
   try {
	PMActivityDetails	activityRes= rest.postForObject(Constant.url + "getPmActivity", map, PMActivityDetails.class);
	model.addObject("activity", activityRes);
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
   return model;
	}
	
	@RequestMapping(value = "/getAllCheckpoints/{itemId}", method = RequestMethod.GET)
	public ModelAndView getAllCheckpoints(@PathVariable("itemId")int itemId,HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmMasters/checkpointList");


	RestTemplate rest = new RestTemplate();
	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
	map.add("itemId", "" + itemId);
	List<PMCheckPoints> pMCheckPoints = new ArrayList<>();
	try {
		pMCheckPoints = rest.postForObject(Constant.url + "getCheckPointsByItemId", map, List.class);
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
   model.addObject("checkpointList", pMCheckPoints);
   try {
	   PMItemDetails item = rest.postForObject(Constant.url + "getPmItem", map, PMItemDetails.class);
	   model.addObject("item", item);

	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
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
	@RequestMapping(value = "/deletePmMachineById/{machineId}", method = RequestMethod.GET)
	public String deletePmMachineById(@PathVariable("machineId")int machineId,HttpServletRequest request, HttpServletResponse response) {
		
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("machinId", ""+machineId);
		RestTemplate rest=new RestTemplate();
		try {
			Info info=rest.postForObject(Constant.url + "deleteMachinId", map, Info.class);
			System.out.println(info.toString());
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/showAllMachines";
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
	@RequestMapping(value = "/deletePmActivityById/{machinActivity}", method = RequestMethod.GET)
	public String deletePmActivity(@PathVariable("machinActivity")int machinActivity,HttpServletRequest request, HttpServletResponse response) {
		
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("activityId", ""+machinActivity);
		RestTemplate rest=new RestTemplate();
		try {
			Info info=rest.postForObject(Constant.url + "deletePmActivity", map, Info.class);
			System.out.println(info.toString());
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/showAllMachines";
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
	
	@RequestMapping(value = "/deletePmItemById/{itemId}", method = RequestMethod.GET)
	public String deletePmItem(@PathVariable("itemId")int itemId,HttpServletRequest request, HttpServletResponse response) {
		
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("itemId", ""+itemId);
		RestTemplate rest=new RestTemplate();
		try {
			Info info=rest.postForObject(Constant.url + "deletePmItem", map, Info.class);
			System.out.println(info.toString());
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/showAllMachines";
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
	@RequestMapping(value = "/deletePmCheckpointById/{machinCheckPoint}", method = RequestMethod.GET)
	public String deletePmCheckpoints(@PathVariable("machinCheckPoint")int machinCheckPoint,HttpServletRequest request, HttpServletResponse response) {
		
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("machinCheckPoint", ""+machinCheckPoint);
		RestTemplate rest=new RestTemplate();
		try {
			Info info=rest.postForObject(Constant.url + "deletePmCheckpoints", map, Info.class);
			System.out.println(info.toString());
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/showAllMachines";
	}
	
	
	
	
	@RequestMapping(value = "/showAddActivity", method = RequestMethod.GET)
	public ModelAndView showAddActivity(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmMasters/addActivity");
		 
		if(machDetails!=null)
		{
			model.addObject("machineType", machDetails.getType());
			model.addObject("machineId", machDetails.getMachinId());

		}

		return model;
	}
	@RequestMapping(value = "/updateActivity/{activityId}/{type}", method = RequestMethod.GET)
	public ModelAndView updateActivity(@PathVariable("activityId")int activityId,@PathVariable("type")int type,HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmMasters/addActivity");
		 
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("activityId", "" + activityId);
		RestTemplate rest=new RestTemplate();
		 try {
				PMActivityDetails	activityRes= rest.postForObject(Constant.url + "getPmActivity", map, PMActivityDetails.class);
				model.addObject("activity", activityRes);
				model.addObject("machineType", type);
				model.addObject("machineId", activityRes.getMachinId());
			} catch (Exception e) {
					System.out.println(e.getMessage());
			}
			


		return model;
	}
	
	@RequestMapping(value = "/showAddItem", method = RequestMethod.GET)
	public ModelAndView showAddItem(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmMasters/addItem");
		 if(pMActivityDetailsRes!=null)
		 {
			 model.addObject("machineId", pMActivityDetailsRes.getMachinId());
			 model.addObject("machineType", pMActivityDetailsRes.getInt1());
			 model.addObject("activityId", pMActivityDetailsRes.getActivityId());
		 }
		

		return model;
	}
	@RequestMapping(value = "/updateItem/{itemId}", method = RequestMethod.GET)
	public ModelAndView updateItem(@PathVariable("itemId")int itemId,HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmMasters/addItem");
		try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("itemId", "" + itemId);
			 try {
				 RestTemplate rest=new RestTemplate();
				   PMItemDetails item = rest.postForObject(Constant.url + "getPmItem", map, PMItemDetails.class);
				   map = new LinkedMultiValueMap<String, Object>();
					map.add("machineId", ""+item.getMachinId());
				MachinDetails pmMachine=rest.postForObject(Constant.url + "getMachineById", map,MachinDetails.class);
				   model.addObject("item", item);
					 model.addObject("machineId", item.getMachinId());
					 model.addObject("machineType", pmMachine.getType());
					 model.addObject("activityId", item.getActivityId());
				
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	@RequestMapping(value = "/showAddCheckpoint", method = RequestMethod.GET)
	public ModelAndView showAddCheckpoint(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmMasters/addCheckpoint");
		 
		
		if(pMItemDetailsRes!=null)
		 {
			 model.addObject("machineId", pMItemDetailsRes.getMachinId());
			 model.addObject("activityId", pMItemDetailsRes.getActivityId());
			 model.addObject("itemId", pMItemDetailsRes.getItemId());
				RestTemplate rest=new RestTemplate();
				try {
					MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
					map.add("machineId", ""+pMItemDetailsRes.getMachinId());
				    MachinDetails pmMachine=rest.postForObject(Constant.url + "getMachineById", map,MachinDetails.class);
					model.addObject("machineType", pmMachine.getType());

                   }catch (Exception e) {
  					 model.addObject("machineType", machineType);

					System.out.println(e.getMessage());
				}
		 }
		return model;
	}
	@RequestMapping(value = "/updateCheckpoint/{checkpointId}", method = RequestMethod.GET)
	public ModelAndView updateCheckpoint(@PathVariable("checkpointId")int checkpointId,HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("pmMasters/addCheckpoint");
		RestTemplate rest=new RestTemplate();

		try {
			
				    MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				    map.add("checkpointId", "" +checkpointId);
				  
				    PMCheckPoints pmCheckPoint = rest.postForObject(Constant.url + "getPmCheckpoints", map, PMCheckPoints.class);
				    model.addObject("pmCheckPoint", pmCheckPoint);
				    
				    map = new LinkedMultiValueMap<String, Object>();
					map.add("itemId", "" + pmCheckPoint.getItemId());
				    PMItemDetails item = rest.postForObject(Constant.url + "getPmItem", map, PMItemDetails.class);
				    
				     model.addObject("machineId", pmCheckPoint.getMachineId());
					 model.addObject("activityId", item.getActivityId());
					 model.addObject("itemId", pmCheckPoint.getItemId());

				try {
				     
					map = new LinkedMultiValueMap<String, Object>();
					map.add("machineId", ""+pmCheckPoint.getMachineId());
				    MachinDetails pmMachine=rest.postForObject(Constant.url + "getMachineById", map,MachinDetails.class);
					model.addObject("machineType", pmMachine.getType());

                   }catch (Exception e) {
  					 model.addObject("machineType", machineType);
				}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	

	@RequestMapping(value = "/insertPmMachine", method = RequestMethod.POST)
	public String insertPmMachine(HttpServletRequest request, HttpServletResponse response) {
		
		int machineId=0;

		HttpSession session = request.getSession(); 
		int deptId = (Integer) session.getAttribute("deptId"); 
		String machineName=request.getParameter("machineName");
		String machineNo=request.getParameter("machineNo");
		int saveType=Integer.parseInt(request.getParameter("saveType"));
		 machineType=Integer.parseInt(request.getParameter("machineType"));
		try {
			machineId=Integer.parseInt(request.getParameter("machineId"));

		}catch (Exception e) {
			machineId=0;
		}
		MachinDetails machinDetails=new MachinDetails();
		machinDetails.setMachinId(machineId);
		machinDetails.setMachinName(machineName);
		machinDetails.setMachinNo(machineNo);
		machinDetails.setType(machineType);
		machinDetails.setInt1(deptId);
		machinDetails.setString1("");
		machinDetails.setString2("");
		machinDetails.setString3("");
		RestTemplate rest=new RestTemplate();
		try {
			 machDetails=rest.postForObject(Constant.url + "insertPmMachine", machinDetails, MachinDetails.class);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		String mapping="";
		if(saveType==0)
		{
			mapping="redirect:/showAddMachine";
		}
		else
		{
			mapping="redirect:/showAddActivity";
		}
		return mapping;
	}

	
	
	@RequestMapping(value = "/insertPmActivity", method = RequestMethod.POST)
	public String insertPmActivity(HttpServletRequest request, HttpServletResponse response) {
		
		int activityId=0;
		int machineId=Integer.parseInt(request.getParameter("machineId"));
		int eleMechanecal=Integer.parseInt(request.getParameter("eleMechanecal"));
		int onlineOffline=Integer.parseInt(request.getParameter("onlineOffline"));
		int saveType=Integer.parseInt(request.getParameter("saveType"));
       try {
    	   activityId=Integer.parseInt(request.getParameter("activityId"));
       }catch (Exception e) {
		activityId=0;
	}
		String activityName=request.getParameter("activityName");
		
		PMActivityDetails pMActivityDetails=new PMActivityDetails();
		pMActivityDetails.setActivityId(activityId);
		pMActivityDetails.setActivityName(activityName);
		pMActivityDetails.setInt1(eleMechanecal);        //Electrical   //Mechanical
		pMActivityDetails.setInt2(onlineOffline);       //Online    //Offline
		pMActivityDetails.setMachinId(machineId);
		pMActivityDetails.setString1("");
		pMActivityDetails.setString2("");
		
		RestTemplate rest=new RestTemplate();
		try {
			 pMActivityDetailsRes=rest.postForObject(Constant.url + "insertPmActivity", pMActivityDetails, PMActivityDetails.class);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		String mapping="";
		if(saveType==0)
		{
			mapping="redirect:/showAddActivity";
		}
		else
		{
			mapping="redirect:/showAddItem";
		}
		return mapping;
	}
	
	@RequestMapping(value = "/insertPmItem", method = RequestMethod.POST)
	public String insertPmItem(HttpServletRequest request, HttpServletResponse response) {
		
		
		int itemId=0;
		int machineId=Integer.parseInt(request.getParameter("machineId"));
		int machinActivity=Integer.parseInt(request.getParameter("machinActivity"));
		int saveType=Integer.parseInt(request.getParameter("saveType"));
       try {
    	   
    	   itemId=Integer.parseInt(request.getParameter("itemId"));
       }catch (Exception e) {
    	   itemId=0;
	}
		
		String itemName=request.getParameter("itemName");
		
		PMItemDetails pMItemDetails=new PMItemDetails();
		
		pMItemDetails.setItemId(itemId);
		pMItemDetails.setActivityId(machinActivity);
		pMItemDetails.setItemDesc(itemName);
		pMItemDetails.setItemName(itemName);
		pMItemDetails.setMachinId(machineId);
		pMItemDetails.setString1("");
		pMItemDetails.setString2("");
		
		
		RestTemplate rest=new RestTemplate();
		try {
			 pMItemDetailsRes=rest.postForObject(Constant.url + "insertPmItem", pMItemDetails, PMItemDetails.class);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		String mapping="";
		if(saveType==0)
		{
			mapping="redirect:/showAddItem";
		}
		else
		{
			mapping="redirect:/showAddCheckpoint";
		}
		return mapping;
	}
	
	@RequestMapping(value = "/insertCheckPoint", method = RequestMethod.POST)
	public String insertCheckPoint(HttpServletRequest request, HttpServletResponse response) {
		
		
		int checkpointId=0;
		int machineId=Integer.parseInt(request.getParameter("machineId"));
		int machinItem=Integer.parseInt(request.getParameter("machinItem"));
		int method=Integer.parseInt(request.getParameter("method"));
        try {
        	checkpointId=Integer.parseInt(request.getParameter("checkpointId"));
        }catch (Exception e) {
			checkpointId=0;
		}
		
		String checkpoint=request.getParameter("checkpoint");
		
		
		PMCheckPoints pMCheckPoints=new PMCheckPoints();
		pMCheckPoints.setCheckPointId(checkpointId);
		pMCheckPoints.setCheckPointDesc(checkpoint);
		pMCheckPoints.setCheckPointName(checkpoint);
		pMCheckPoints.setItemId(machinItem);
		pMCheckPoints.setMachineId(machineId);
		pMCheckPoints.setString1("");
		pMCheckPoints.setString2("");
		pMCheckPoints.setInt1(method);
		
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
	@RequestMapping(value = "/getScheduleById", method = RequestMethod.GET)
	@ResponseBody
	public MachinMaintanaceSchedule getScheduleById(HttpServletRequest request, HttpServletResponse response) {
		MachinMaintanaceSchedule machinMaintanaceSchedule = new MachinMaintanaceSchedule();
		try {
			int machineId = Integer.parseInt(request.getParameter("machineId"));
			RestTemplate rest=new RestTemplate();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("machineId",machineId);
			 machinMaintanaceSchedule=rest.postForObject(Constant.url + "getPmMachinePlanById",map, MachinMaintanaceSchedule.class);
			
			System.out.println("machinMaintanaceSchedule" + machinMaintanaceSchedule);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return machinMaintanaceSchedule;

	}
	
	@RequestMapping(value = "/submitInsertPmPlan", method = RequestMethod.POST)
	public String submitInsertPmPlan(HttpServletRequest request, HttpServletResponse response) {
		
		
		MachinMaintanaceSchedule machinMaintanaceSchedule =new MachinMaintanaceSchedule();
		machinMaintanaceSchedule.setMaintId(Integer.parseInt(request.getParameter("maintId")));
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
