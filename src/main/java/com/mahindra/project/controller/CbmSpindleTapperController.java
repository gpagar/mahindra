package com.mahindra.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mahindra.project.constant.Constant;
import com.mahindra.project.constant.DateConvertor;
import com.mahindra.project.constant.VpsImageUpload;
import com.mahindra.project.model.UserDetails;
import com.mahindra.project.model.calibration.CalibrationDetails;
import com.mahindra.project.model.calibration.TCalibaration;
import com.mahindra.project.model.cbm.CbmEarthingResistance;
import com.mahindra.project.model.cbm.CbmSchedule;
import com.mahindra.project.model.cbm.CbmSpindleClampingForce;
import com.mahindra.project.model.cbm.CbmSpindleTemper;

@Controller
@Scope("session")
public class CbmSpindleTapperController {
	
	List<CbmSpindleTemper> cbmSpindleTemperList = new ArrayList<>();
	List<CbmSpindleClampingForce> cbmSpindleClampingForceList = new ArrayList<>();
	List<CbmEarthingResistance> cbmEarthingResistanceList = new ArrayList<CbmEarthingResistance>();
	
	@RequestMapping(value = "/showSpindleTapper", method = RequestMethod.GET)
	public ModelAndView showSpindleTapper(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("cbm/showSpindleTapper");
		try
		{
			cbmSpindleTemperList = new ArrayList<>();
			RestTemplate rest = new RestTemplate();
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("deptId",deptId);
			CbmSchedule[] scheduleList = rest.postForObject(Constant.url + "/getCbmScheduleListForSpindleTemper",map,
					CbmSchedule[].class);
			List<CbmSchedule> cbmMchineScheduleList = new ArrayList<CbmSchedule>(Arrays.asList(scheduleList));
			model.addObject("cbmMchineScheduleList",cbmMchineScheduleList);
			
			CbmSpindleTemper[] cbmSpindleTemper = rest.postForObject(Constant.url + "/getCbmSpindleTemper",map,
					CbmSpindleTemper[].class);
			cbmSpindleTemperList = new ArrayList<CbmSpindleTemper>(Arrays.asList(cbmSpindleTemper));
			
			for(int i=0 ;i < cbmMchineScheduleList.size() ; i++) {
				 
				int flag=0;
				
				for(int j=0 ;j < cbmSpindleTemperList.size() ; j++) {
					
					if(cbmSpindleTemperList.get(j).getSchId()==cbmMchineScheduleList.get(i).getId()) {
						flag=1;
						break;
					}
					
				}
				
				if(flag==0) {
					
					CbmSpindleTemper cbmSpindle = new CbmSpindleTemper();
					cbmSpindle.setSchId(cbmMchineScheduleList.get(i).getId());
					cbmSpindle.setMachineNo(cbmMchineScheduleList.get(i).getMachineNo());
					cbmSpindle.setMachineName(cbmMchineScheduleList.get(i).getMachineName()); 
					cbmSpindleTemperList.add(cbmSpindle);
				}
				
			}
			
			model.addObject("cbmSpindleTemperList",cbmSpindleTemperList);
			
			try {
			String[] str = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"}; 
			String monthName1 = str[Integer.parseInt(cbmMchineScheduleList.get(0).getStcQ1())-1];
			String monthName2 = str[Integer.parseInt(cbmMchineScheduleList.get(0).getStcQ3())-1];
			model.addObject("monthName1",monthName1);
			model.addObject("monthName2",monthName2);
			}catch(Exception e) {
				 
			}
			
			try {
				  
				 String date1 = DateConvertor.convertToYMD(cbmSpindleTemperList.get(0).getDate1())  ; 
				 String date2 = DateConvertor.convertToYMD(cbmSpindleTemperList.get(0).getDate2())  ;
				//String date1 = DateConvertor.convertToYMD("01-10-2018")  ;
				//String date2 = DateConvertor.convertToYMD("01-10-2018")  ;
				
				System.out.println(date1);
				model.addObject("date1",date1);
				model.addObject("date2",date2);
				}catch(Exception e) {
					 e.printStackTrace();
				}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}
	
	
	@RequestMapping(value = "/submitSpandleTaperBlueMatching", method = RequestMethod.POST)
	public String submitSpandleTaperBlueMatching(HttpServletRequest request, HttpServletResponse response ) {
		
		try {
		 
		String firstDate =  request.getParameter("firstDate") ;
		String secondDate =  request.getParameter("secondDate") ;
		 
		HttpSession session = request.getSession();  
		int deptId = (Integer) session.getAttribute("deptId") ; 
		UserDetails userDetail = (UserDetails) session.getAttribute("userDetail"); 
		 
		for(int i=0 ; i<cbmSpindleTemperList.size() ; i++) {
			 
			cbmSpindleTemperList.get(i).setDate1(DateConvertor.convertToDMY(firstDate));
			cbmSpindleTemperList.get(i).setDate2(DateConvertor.convertToDMY(secondDate));
			cbmSpindleTemperList.get(i).setPer1(request.getParameter("per1"+cbmSpindleTemperList.get(i).getSchId()));
			cbmSpindleTemperList.get(i).setPer2(request.getParameter("per2"+cbmSpindleTemperList.get(i).getSchId()));
			cbmSpindleTemperList.get(i).setRemark1(request.getParameter("remark1"+cbmSpindleTemperList.get(i).getSchId()));
			cbmSpindleTemperList.get(i).setRemark2(request.getParameter("remark2"+cbmSpindleTemperList.get(i).getSchId()));
			cbmSpindleTemperList.get(i).setDeptId(deptId);
			cbmSpindleTemperList.get(i).setExtra1(userDetail.getUserId());
			
		}
		
 
		RestTemplate rest=new RestTemplate();
		 
		List<CbmSpindleTemper> res = rest.postForObject(Constant.url + "/saveCbmSpindleTemper", cbmSpindleTemperList, List.class); 
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/showSpindleTapper";
	}
	
	
	@RequestMapping(value = "/showSpindleClimpingForce", method = RequestMethod.GET)
	public ModelAndView showSpindleClimpingForce(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("cbm/showSpindleClimpingForce");
		try
		{
			cbmSpindleClampingForceList = new ArrayList<>();
			RestTemplate rest = new RestTemplate();
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("deptId",deptId);
			CbmSchedule[] scheduleList = rest.postForObject(Constant.url + "/getCbmScheduleListForSpindleClimpingForce",map,
					CbmSchedule[].class);
			List<CbmSchedule> cbmMchineScheduleList = new ArrayList<CbmSchedule>(Arrays.asList(scheduleList));
			model.addObject("cbmMchineScheduleList",cbmMchineScheduleList);
			
			CbmSpindleClampingForce[] cbmSpindleClampingForce = rest.postForObject(Constant.url + "/getCbmSpindleClimpingForce",map,
					CbmSpindleClampingForce[].class);
			cbmSpindleClampingForceList = new ArrayList<CbmSpindleClampingForce>(Arrays.asList(cbmSpindleClampingForce));
			
			for(int i=0 ;i < cbmMchineScheduleList.size() ; i++) {
				 
				int flag=0;
				
				for(int j=0 ;j < cbmSpindleClampingForceList.size() ; j++) {
					
					if(cbmSpindleClampingForceList.get(j).getSchId()==cbmMchineScheduleList.get(i).getId()) {
						flag=1;
						break;
					}
					
				}
				
				if(flag==0) {
					
					CbmSpindleClampingForce cbmSpindleClamping = new CbmSpindleClampingForce();
					cbmSpindleClamping.setSchId(cbmMchineScheduleList.get(i).getId());
					cbmSpindleClamping.setMachineNo(cbmMchineScheduleList.get(i).getMachineNo());
					cbmSpindleClamping.setMachineName(cbmMchineScheduleList.get(i).getMachineName()); 
					cbmSpindleClamping.setFrequency("Quarterly"); 
					cbmSpindleClampingForceList.add(cbmSpindleClamping);
				}
				
			}
			
			model.addObject("cbmSpindleClampingForceList",cbmSpindleClampingForceList);
			
			try {
			String[] str = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"}; 
			String monthName1 = str[Integer.parseInt(cbmMchineScheduleList.get(0).getScfQ1())-1];
			String monthName2 = str[Integer.parseInt(cbmMchineScheduleList.get(0).getScfQ2())-1];
			String monthName3 = str[Integer.parseInt(cbmMchineScheduleList.get(0).getScfQ3())-1];
			String monthName4 = str[Integer.parseInt(cbmMchineScheduleList.get(0).getScfQ4())-1];
			model.addObject("monthName1",monthName1);
			model.addObject("monthName2",monthName2);
			model.addObject("monthName3",monthName3);
			model.addObject("monthName4",monthName4);
			}catch(Exception e) {
				 
			}
			
			try {
				  
				 String date1 = DateConvertor.convertToYMD(cbmSpindleClampingForceList.get(0).getDate1())  ; 
				 String date2 = DateConvertor.convertToYMD(cbmSpindleClampingForceList.get(0).getDate2())  ;
				 String date3 = DateConvertor.convertToYMD(cbmSpindleClampingForceList.get(0).getDate3())  ; 
				 String date4 = DateConvertor.convertToYMD(cbmSpindleClampingForceList.get(0).getDate4())  ;
				 
				model.addObject("date1",date1);
				model.addObject("date2",date2);
				model.addObject("date3",date3);
				model.addObject("date4",date4);
				}catch(Exception e) {
					 e.printStackTrace();
				}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}
	
	@RequestMapping(value = "/submitSpindleClampingForce", method = RequestMethod.POST)
	public String submitSpindleClampingForce(HttpServletRequest request, HttpServletResponse response ) {
		
		try {
		 
		String date1 =  request.getParameter("date1") ;
		String date2 =  request.getParameter("date2") ;
		String date3 =  request.getParameter("date3") ;
		String date4 =  request.getParameter("date4") ;
		 
		HttpSession session = request.getSession();  
		int deptId = (Integer) session.getAttribute("deptId") ; 
		UserDetails userDetail = (UserDetails) session.getAttribute("userDetail"); 
		 
		for(int i=0 ; i<cbmSpindleClampingForceList.size() ; i++) {
			 
			cbmSpindleClampingForceList.get(i).setDate1(DateConvertor.convertToDMY(date1));
			cbmSpindleClampingForceList.get(i).setDate2(DateConvertor.convertToDMY(date2));
			cbmSpindleClampingForceList.get(i).setDate3(DateConvertor.convertToDMY(date3));
			cbmSpindleClampingForceList.get(i).setDate4(DateConvertor.convertToDMY(date4));
			cbmSpindleClampingForceList.get(i).setMinimumRequiredValue(request.getParameter("minimumRequiredValue"+cbmSpindleClampingForceList.get(i).getSchId()));
			cbmSpindleClampingForceList.get(i).setQ1(request.getParameter("q1"+cbmSpindleClampingForceList.get(i).getSchId()));
			cbmSpindleClampingForceList.get(i).setQ2(request.getParameter("q2"+cbmSpindleClampingForceList.get(i).getSchId()));
			cbmSpindleClampingForceList.get(i).setQ3(request.getParameter("q3"+cbmSpindleClampingForceList.get(i).getSchId()));
			cbmSpindleClampingForceList.get(i).setQ4(request.getParameter("q4"+cbmSpindleClampingForceList.get(i).getSchId()));
			cbmSpindleClampingForceList.get(i).setAvgValue(request.getParameter("avgValue"+cbmSpindleClampingForceList.get(i).getSchId()));
			cbmSpindleClampingForceList.get(i).setStatusRemark(request.getParameter("statusRemark"+cbmSpindleClampingForceList.get(i).getSchId()));
			cbmSpindleClampingForceList.get(i).setDeptId(deptId);
			cbmSpindleClampingForceList.get(i).setExtra1(userDetail.getUserId());
			
		}
		
 
		RestTemplate rest=new RestTemplate();
		 
		List<CbmSpindleClampingForce> res = rest.postForObject(Constant.url + "/saveCbmSpindleClimpingForce", cbmSpindleClampingForceList, List.class); 
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/showSpindleClimpingForce";
	}
	
	@RequestMapping(value = "/showrEarthingResistance", method = RequestMethod.GET)
	public ModelAndView showrEarthingResistance(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("cbm/showrEarthingResistance");
		try
		{
			cbmSpindleClampingForceList = new ArrayList<>();
			RestTemplate rest = new RestTemplate();
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("deptId",deptId);
			CbmSchedule[] scheduleList = rest.postForObject(Constant.url + "/getCbmScheduleListForEarthingResistance",map,
					CbmSchedule[].class);
			List<CbmSchedule> cbmMchineScheduleList = new ArrayList<CbmSchedule>(Arrays.asList(scheduleList));
			model.addObject("cbmMchineScheduleList",cbmMchineScheduleList);
			
			CbmEarthingResistance[] cbmEarthingResistance = rest.postForObject(Constant.url + "/getCbmEarthingResistance",map,
					CbmEarthingResistance[].class);
			cbmEarthingResistanceList = new ArrayList<CbmEarthingResistance>(Arrays.asList(cbmEarthingResistance));
			
			for(int i=0 ;i < cbmMchineScheduleList.size() ; i++) {
				 
				int flag=0;
				
				for(int j=0 ;j < cbmEarthingResistanceList.size() ; j++) {
					
					if(cbmEarthingResistanceList.get(j).getSchId()==cbmMchineScheduleList.get(i).getId()) {
						flag=1;
						break;
					}
					
				}
				
				if(flag==0) {
					
					CbmEarthingResistance cbmEarthingResistanc = new CbmEarthingResistance();
					cbmEarthingResistanc.setSchId(cbmMchineScheduleList.get(i).getId());
					cbmEarthingResistanc.setMachineNo(cbmMchineScheduleList.get(i).getMachineNo());
					cbmEarthingResistanc.setMachineName(cbmMchineScheduleList.get(i).getMachineName()); 
					cbmEarthingResistanc.setDept(cbmMchineScheduleList.get(i).getLine());
					cbmEarthingResistanceList.add(cbmEarthingResistanc);
				}
				
			}
			
			model.addObject("cbmEarthingResistanceList",cbmEarthingResistanceList);
			
			try {
			String[] str = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"}; 
			String monthName1 = str[Integer.parseInt(cbmMchineScheduleList.get(0).getErH1())-1];
			String monthName2 = str[Integer.parseInt(cbmMchineScheduleList.get(0).getErH2())-1]; 
			model.addObject("monthName1",monthName1);
			model.addObject("monthName2",monthName2); 
			}catch(Exception e) {
				 
			}
			
			try {
				  
				 String date1 = DateConvertor.convertToYMD(cbmEarthingResistanceList.get(0).getDate1())  ; 
				 String date2 = DateConvertor.convertToYMD(cbmEarthingResistanceList.get(0).getDate2())  ; 
				 
				model.addObject("date1",date1);
				model.addObject("date2",date2); 
				}catch(Exception e) {
					 e.printStackTrace();
				}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}
	
	@RequestMapping(value = "/submitEarthingResistance", method = RequestMethod.POST)
	public String submitEarthingResistance(HttpServletRequest request, HttpServletResponse response ) {
		
		try {
		 
		String date1 =  request.getParameter("date1") ;
		String date2 =  request.getParameter("date2") ; 
		 
		HttpSession session = request.getSession();  
		int deptId = (Integer) session.getAttribute("deptId") ; 
		UserDetails userDetail = (UserDetails) session.getAttribute("userDetail"); 
		 
		for(int i=0 ; i<cbmEarthingResistanceList.size() ; i++) {
			 
			cbmEarthingResistanceList.get(i).setDate1(DateConvertor.convertToDMY(date1));
			cbmEarthingResistanceList.get(i).setDate2(DateConvertor.convertToDMY(date2));
			cbmEarthingResistanceList.get(i).setResistance1(request.getParameter("resistance1"+cbmEarthingResistanceList.get(i).getSchId()));
			cbmEarthingResistanceList.get(i).setResistance2(request.getParameter("resistance2"+cbmEarthingResistanceList.get(i).getSchId()));
			cbmEarthingResistanceList.get(i).setObsrvn1(request.getParameter("obsrvn1"+cbmEarthingResistanceList.get(i).getSchId()));
			cbmEarthingResistanceList.get(i).setObsrvn2(request.getParameter("obsrvn2"+cbmEarthingResistanceList.get(i).getSchId()));
			cbmEarthingResistanceList.get(i).setRemark1(request.getParameter("remark1"+cbmEarthingResistanceList.get(i).getSchId()));
			cbmEarthingResistanceList.get(i).setRemark2(request.getParameter("remark2"+cbmEarthingResistanceList.get(i).getSchId()));
			cbmEarthingResistanceList.get(i).setStatus1(request.getParameter("status1"+cbmEarthingResistanceList.get(i).getSchId()));
			cbmEarthingResistanceList.get(i).setStatus2(request.getParameter("status2"+cbmEarthingResistanceList.get(i).getSchId()));
			cbmEarthingResistanceList.get(i).setDeptId(deptId);
			cbmEarthingResistanceList.get(i).setExtra1(userDetail.getUserId());
			System.out.println(cbmEarthingResistanceList.get(i));
		}
		
 
		RestTemplate rest=new RestTemplate();
		 
		List<CbmEarthingResistance> res = rest.postForObject(Constant.url + "/saveCbmEarthingResistance", cbmEarthingResistanceList, List.class); 
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/showrEarthingResistance";
	}

}
