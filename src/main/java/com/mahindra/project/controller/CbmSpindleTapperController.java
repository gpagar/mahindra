package com.mahindra.project.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
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
import com.mahindra.project.model.cbm.CbmMagazineChain;
import com.mahindra.project.model.cbm.CbmSchedule;
import com.mahindra.project.model.cbm.CbmSpindleClampingForce;
import com.mahindra.project.model.cbm.CbmSpindleTemper;
import com.mahindra.project.model.cbm.CbmYearEnd;

@Controller
@Scope("session")
public class CbmSpindleTapperController {
	
	
	
	List<CbmSpindleTemper> cbmSpindleTemperList = new ArrayList<CbmSpindleTemper>();
	List<CbmSpindleClampingForce> cbmSpindleClampingForceList = new ArrayList<CbmSpindleClampingForce>();
	List<CbmEarthingResistance> cbmEarthingResistanceList = new ArrayList<CbmEarthingResistance>(); 
	List<CbmMagazineChain> cbmMagazineChainList = new ArrayList<CbmMagazineChain>();
	CbmYearEnd cbmYearEnd=new CbmYearEnd();
	List<CbmSchedule> cbmMchineScheduleList = new ArrayList<CbmSchedule>();
	
	
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
			cbmMchineScheduleList = new ArrayList<CbmSchedule>(Arrays.asList(scheduleList));
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
			
			map = new LinkedMultiValueMap<String, Object>();
			map.add("deptId",deptId);
			map.add("cbmType",4);
			 cbmYearEnd = rest.postForObject(Constant.url + "/getYearEndByDeptIdAndCbmType",map,
					CbmYearEnd.class);
			String yearEndDate = new String();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			int yearEnd=0;
			int yearEndByDate=0;
			Date date = new Date();
			String modifiedDate= new SimpleDateFormat("yyyy-MM-dd").format(date);
			
			if(cbmYearEnd.getYearEndId()==0) {
				
				Calendar now = Calendar.getInstance();
				int year = now.get(Calendar.YEAR);
				int month = now.get(Calendar.MONTH) + 1; // Note: zero based!
				 
				yearEndDate= year+"-03-31";;
				System.out.println( sdf.parse(yearEndDate) +" "+sdf.parse(modifiedDate));
				 if (sdf.parse(yearEndDate).compareTo(sdf.parse(modifiedDate)) < 0) {
					 System.out.println("in if modifiedDate>yearEndDate" + sdf.parse(yearEndDate) +" "+sdf.parse(modifiedDate));
					 yearEndByDate=1;
			        }  
			}
			else {
				
				yearEndDate= cbmYearEnd.getToYear()+"-03-31";
				System.out.println( sdf.parse(yearEndDate) +" "+sdf.parse(modifiedDate));
				if (sdf.parse(yearEndDate).compareTo(sdf.parse(modifiedDate)) < 0) {
					System.out.println("in else modifiedDate>yearEndDate" + sdf.parse(yearEndDate) +" "+sdf.parse(modifiedDate));
					yearEndByDate=1;
			        }  
			}
			
			System.out.println("year end After Date check " + yearEnd);
			int flag=0;
			for(int i=0 ;i < cbmSpindleTemperList.size() ; i++) {
				 
				/*System.out.println("cbmSpindleTemperList.get(i).getPer1()" + cbmSpindleTemperList.get(i).getPer1());
				System.out.println("cbmSpindleTemperList.get(i).getPer2()" + cbmSpindleTemperList.get(i).getPer2());
				System.out.println("cbmSpindleTemperList.get(i).getRemark1()" + cbmSpindleTemperList.get(i).getRemark1());
				System.out.println("cbmSpindleTemperList.get(i).getPer2()" + cbmSpindleTemperList.get(i).getRemark2());*/
				
				if(!cbmSpindleTemperList.get(i).getPer1().trim().equals("") 
						&& !cbmSpindleTemperList.get(i).getPer2().trim().equals("")
						&& !cbmSpindleTemperList.get(i).getRemark1().trim().equals("") 
						&& !cbmSpindleTemperList.get(i).getRemark2().trim().equals("") ) {
					flag=1;
				}
				else {
					
					 
					flag=0;
					System.out.println(yearEnd + "find null " +flag);
					break;
				}
			}
			
			if(flag==1 && yearEndByDate==1) {
				yearEnd=1;
			}
			System.out.println("year end After list check " + yearEnd);
			
			model.addObject("yearEnd",yearEnd);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}
	
	@RequestMapping(value = "/yearEndSpandleTaperBlueMatching", method = RequestMethod.POST)
	public String yearEndSpandleTaperBlueMatching(HttpServletRequest request, HttpServletResponse response ) {
		
		RestTemplate rest=new RestTemplate();
		
		try {
		 
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yyyy");
			Calendar now = Calendar.getInstance();
			int year = now.get(Calendar.YEAR);
			
			if(cbmYearEnd.getYearEndId()!=0) {
				
				cbmYearEnd.setStatus(1);
			}
			else {
				HttpSession session = request.getSession(); 
				int deptId = (Integer) session.getAttribute("deptId");
				
				cbmYearEnd.setDate(sf.format(date));
				cbmYearEnd.setCbmType(4);
				cbmYearEnd.setDeptId(deptId);
				cbmYearEnd.setFromYear(String.valueOf(year-1));
				cbmYearEnd.setToYear(String.valueOf(year));
				cbmYearEnd.setStatus(1);
				cbmYearEnd.setYear(cbmYearEnd.getFromYear()+"-"+cbmYearEnd.getToYear().substring(2, cbmYearEnd.getToYear().length()));
				
			}
		 
			
			CbmYearEnd update = rest.postForObject(Constant.url + "/saveCbmYearEnd", cbmYearEnd, CbmYearEnd.class); 
			
			 if(update!=null) {
				 
				CbmYearEnd newEntry = new CbmYearEnd();
				newEntry.setDate(sf.format(date));
				newEntry.setCbmType(4);
				newEntry.setDeptId(update.getDeptId());
				newEntry.setFromYear(update.getToYear());
				newEntry.setToYear(String.valueOf(Integer.parseInt(newEntry.getFromYear())+1));
				newEntry.setYear(newEntry.getFromYear()+"-"+newEntry.getToYear().substring(2, newEntry.getToYear().length()));
				
				CbmYearEnd save = rest.postForObject(Constant.url + "/saveCbmYearEnd", newEntry, CbmYearEnd.class); 
				
				 if(save!=null) {
					
					 List<CbmSpindleTemper> newSpindleList = new ArrayList<CbmSpindleTemper>();
					 
					 for(int i=0 ; i<cbmSpindleTemperList.size() ; i++) {
						  
							cbmSpindleTemperList.get(i).setStatus(1);
							cbmSpindleTemperList.get(i).setYearEnd(String.valueOf(update.getYearEndId()));
						}
					 List<CbmSpindleTemper> res = rest.postForObject(Constant.url + "/saveCbmSpindleTemper", cbmSpindleTemperList, List.class); 
						
					 for(int i=0 ; i<cbmMchineScheduleList.size() ; i++) {
						  
						 	CbmSpindleTemper cbmSpindle = new CbmSpindleTemper();
							cbmSpindle.setSchId(cbmMchineScheduleList.get(i).getId());
							cbmSpindle.setMachineNo(cbmMchineScheduleList.get(i).getMachineNo());
							cbmSpindle.setMachineName(cbmMchineScheduleList.get(i).getMachineName()); 
							cbmSpindle.setDeptId(update.getDeptId());
							newSpindleList.add(cbmSpindle);
						}
					 List<CbmSpindleTemper> newEntryRes = rest.postForObject(Constant.url + "/saveCbmSpindleTemper", newSpindleList, List.class); 
					 
				 }
			} 
			
		 
			
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/showSpindleTapper";
	}
	
	@RequestMapping(value = "/spindleTapperHistory", method = RequestMethod.GET)
	public ModelAndView spindleTapperHistory(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("cbm/spindleTapperHistory");
		try
		{
			 
			RestTemplate rest = new RestTemplate();
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("deptId",deptId);
			map.add("cbmType",4);
			CbmYearEnd[] yearEnd = rest.postForObject(Constant.url + "/getYearEndList",map,
					CbmYearEnd[].class);
			List<CbmYearEnd> yearEndList = new ArrayList<CbmYearEnd>(Arrays.asList(yearEnd));
			model.addObject("yearEndList",yearEndList);
			
			if(request.getParameter("yearId") != null) {
				
				int yearId = Integer.parseInt(request.getParameter("yearId"));
				
				map = new LinkedMultiValueMap<String, Object>();
				map.add("yearId",yearId); 
				CbmSpindleTemper[] cbmSpindleTemper = rest.postForObject(Constant.url + "/getCbmSpindleTemperHistoryByYearId",map,
						CbmSpindleTemper[].class);
				List<CbmSpindleTemper> cbmSpindleTemperList = new ArrayList<CbmSpindleTemper>(Arrays.asList(cbmSpindleTemper));
				model.addObject("cbmSpindleTemperList",cbmSpindleTemperList);
				model.addObject("yearId",yearId);
				
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
			 cbmMchineScheduleList = new ArrayList<CbmSchedule>(Arrays.asList(scheduleList));
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
			
			map = new LinkedMultiValueMap<String, Object>();
			map.add("deptId",deptId);
			map.add("cbmType",1);
			 cbmYearEnd = rest.postForObject(Constant.url + "/getYearEndByDeptIdAndCbmType",map,
					CbmYearEnd.class);
			String yearEndDate = new String();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			int yearEnd=0;
			int yearEndByDate=0;
			Date date = new Date();
			String modifiedDate= new SimpleDateFormat("yyyy-MM-dd").format(date);
			
			if(cbmYearEnd.getYearEndId()==0) {
				
				Calendar now = Calendar.getInstance();
				int year = now.get(Calendar.YEAR);
				int month = now.get(Calendar.MONTH) + 1; // Note: zero based!
				 
				yearEndDate= year+"-03-31";;
				System.out.println( sdf.parse(yearEndDate) +" "+sdf.parse(modifiedDate));
				 if (sdf.parse(yearEndDate).compareTo(sdf.parse(modifiedDate)) < 0) {
					 System.out.println("in if modifiedDate>yearEndDate" + sdf.parse(yearEndDate) +" "+sdf.parse(modifiedDate));
					 yearEndByDate=1;
			        }  
			}
			else {
				
				yearEndDate= cbmYearEnd.getToYear()+"-03-31";
				System.out.println( sdf.parse(yearEndDate) +" "+sdf.parse(modifiedDate));
				if (sdf.parse(yearEndDate).compareTo(sdf.parse(modifiedDate)) < 0) {
					System.out.println("in else modifiedDate>yearEndDate" + sdf.parse(yearEndDate) +" "+sdf.parse(modifiedDate));
					yearEndByDate=1;
			        }  
			}
			
			System.out.println("year end After Date check " + yearEnd);
			int flag=0;
			for(int i=0 ;i < cbmSpindleClampingForceList.size() ; i++) {
				 
				/*System.out.println("cbmSpindleTemperList.get(i).getPer1()" + cbmSpindleTemperList.get(i).getPer1());
				System.out.println("cbmSpindleTemperList.get(i).getPer2()" + cbmSpindleTemperList.get(i).getPer2());
				System.out.println("cbmSpindleTemperList.get(i).getRemark1()" + cbmSpindleTemperList.get(i).getRemark1());
				System.out.println("cbmSpindleTemperList.get(i).getPer2()" + cbmSpindleTemperList.get(i).getRemark2());*/
				
				if(!cbmSpindleClampingForceList.get(i).getMinimumRequiredValue().trim().equals("") 
						&& !cbmSpindleClampingForceList.get(i).getQ1().trim().equals("")
						&& !cbmSpindleClampingForceList.get(i).getQ2().trim().equals("") 
						&& !cbmSpindleClampingForceList.get(i).getQ3().trim().equals("")
						&& !cbmSpindleClampingForceList.get(i).getQ4().trim().equals("")
						&& !cbmSpindleClampingForceList.get(i).getAvgValue().trim().equals("")
						&& !cbmSpindleClampingForceList.get(i).getStatusRemark().trim().equals("")) {
					flag=1;
				}
				else {
					
					 
					flag=0;
					System.out.println(yearEnd + "find null " +flag);
					break;
				}
			}
			
			if(flag==1 && yearEndByDate==1) {
				yearEnd=1;
			}
			System.out.println("year end After list check " + yearEnd);
			
			model.addObject("yearEnd",yearEnd);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}
	
	@RequestMapping(value = "/yearEndSpindleClampingForce", method = RequestMethod.POST)
	public String yearEndSpindleClampingForce(HttpServletRequest request, HttpServletResponse response ) {
		
		RestTemplate rest=new RestTemplate();
		
		try {
		 
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yyyy");
			Calendar now = Calendar.getInstance();
			int year = now.get(Calendar.YEAR);
			
			if(cbmYearEnd.getYearEndId()!=0) {
				
				cbmYearEnd.setStatus(1);
			}
			else {
				HttpSession session = request.getSession(); 
				int deptId = (Integer) session.getAttribute("deptId");
				
				cbmYearEnd.setDate(sf.format(date));
				cbmYearEnd.setCbmType(1);
				cbmYearEnd.setDeptId(deptId);
				cbmYearEnd.setFromYear(String.valueOf(year-1));
				cbmYearEnd.setToYear(String.valueOf(year));
				cbmYearEnd.setStatus(1);
				cbmYearEnd.setYear(cbmYearEnd.getFromYear()+"-"+cbmYearEnd.getToYear().substring(2, cbmYearEnd.getToYear().length()));
				
			}
		 
			
			CbmYearEnd update = rest.postForObject(Constant.url + "/saveCbmYearEnd", cbmYearEnd, CbmYearEnd.class); 
			
			 if(update!=null) {
				 
				CbmYearEnd newEntry = new CbmYearEnd();
				newEntry.setDate(sf.format(date));
				newEntry.setCbmType(1);
				newEntry.setDeptId(update.getDeptId());
				newEntry.setFromYear(update.getToYear());
				newEntry.setToYear(String.valueOf(Integer.parseInt(newEntry.getFromYear())+1));
				newEntry.setYear(newEntry.getFromYear()+"-"+newEntry.getToYear().substring(2, newEntry.getToYear().length()));
				
				CbmYearEnd save = rest.postForObject(Constant.url + "/saveCbmYearEnd", newEntry, CbmYearEnd.class); 
				
				 if(save!=null) {
					
					 List<CbmSpindleClampingForce> newSpindleList = new ArrayList<CbmSpindleClampingForce>();
					 
					 for(int i=0 ; i<cbmSpindleClampingForceList.size() ; i++) {
						  
						 cbmSpindleClampingForceList.get(i).setStatus(1);
						 cbmSpindleClampingForceList.get(i).setYearEnd(String.valueOf(update.getYearEndId()));
						}
					 List<CbmSpindleTemper> res = rest.postForObject(Constant.url + "/saveCbmSpindleClimpingForce", cbmSpindleClampingForceList, List.class); 
						
					 for(int i=0 ; i<cbmMchineScheduleList.size() ; i++) {
						  
						 CbmSpindleClampingForce cbmSpindleClamping = new CbmSpindleClampingForce();
							cbmSpindleClamping.setSchId(cbmMchineScheduleList.get(i).getId());
							cbmSpindleClamping.setMachineNo(cbmMchineScheduleList.get(i).getMachineNo());
							cbmSpindleClamping.setMachineName(cbmMchineScheduleList.get(i).getMachineName()); 
							cbmSpindleClamping.setFrequency("Quarterly"); 
							cbmSpindleClamping.setDeptId(save.getDeptId());
							newSpindleList.add(cbmSpindleClamping);
						}
					 List<CbmSpindleTemper> newEntryRes = rest.postForObject(Constant.url + "/saveCbmSpindleClimpingForce", newSpindleList, List.class); 
					 
				 }
			} 
			
		 
			
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/showSpindleClimpingForce";
	}
	
	@RequestMapping(value = "/spindleClampingForceHistory", method = RequestMethod.GET)
	public ModelAndView spindleClampingForceHistory(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("cbm/spindleClampingForceHistory");
		try
		{
			 
			
			RestTemplate rest = new RestTemplate();
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("deptId",deptId);
			map.add("cbmType",1);
			CbmYearEnd[] yearEnd = rest.postForObject(Constant.url + "/getYearEndList",map,
					CbmYearEnd[].class);
			List<CbmYearEnd> yearEndList = new ArrayList<CbmYearEnd>(Arrays.asList(yearEnd));
			model.addObject("yearEndList",yearEndList);
			
			if(request.getParameter("yearId") != null) {
				
				int yearId = Integer.parseInt(request.getParameter("yearId"));
				
				map = new LinkedMultiValueMap<String, Object>();
				map.add("yearId",yearId); 
				CbmSpindleClampingForce[] cbmSpindleClampingForce = rest.postForObject(Constant.url + "/getCbmSpindleClimpingForceHistoryByYearId",map,
						CbmSpindleClampingForce[].class);
				List<CbmSpindleClampingForce> cbmSpindleClampingForceList = new ArrayList<CbmSpindleClampingForce>(Arrays.asList(cbmSpindleClampingForce));
				model.addObject("cbmSpindleClampingForceList",cbmSpindleClampingForceList);
				model.addObject("yearId",yearId);
				
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
			 
		}
		
 
		RestTemplate rest=new RestTemplate();
		 
		List<CbmEarthingResistance> res = rest.postForObject(Constant.url + "/saveCbmEarthingResistance", cbmEarthingResistanceList, List.class); 
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/showrEarthingResistance";
	}
	
	@RequestMapping(value = "/showCbmMagazineChain", method = RequestMethod.GET)
	public ModelAndView showCbmMagazineChain(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("cbm/showrCbmMagazineChain");
		try
		{
			cbmMagazineChainList = new ArrayList<>();
			RestTemplate rest = new RestTemplate();
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("deptId",deptId);
			CbmSchedule[] scheduleList = rest.postForObject(Constant.url + "/getCbmScheduleListForCbmMagazineChain",map,
					CbmSchedule[].class);
			List<CbmSchedule> cbmMchineScheduleList = new ArrayList<CbmSchedule>(Arrays.asList(scheduleList));
			model.addObject("cbmMchineScheduleList",cbmMchineScheduleList);
			
			CbmMagazineChain[] cbmMagazineChain = rest.postForObject(Constant.url + "/getCbmMagazineChain",map,
					CbmMagazineChain[].class);
			cbmMagazineChainList = new ArrayList<CbmMagazineChain>(Arrays.asList(cbmMagazineChain));
			
			for(int i=0 ;i < cbmMchineScheduleList.size() ; i++) {
				 
				int flag=0;
				
				for(int j=0 ;j < cbmMagazineChainList.size() ; j++) {
					
					if(cbmMagazineChainList.get(j).getSchId()==cbmMchineScheduleList.get(i).getId()) {
						flag=1;
						break;
					}
					
				}
				
				if(flag==0) {
					
					CbmMagazineChain cbmMagazine = new CbmMagazineChain();
					cbmMagazine.setSchId(cbmMchineScheduleList.get(i).getId());
					cbmMagazine.setMachineNo(cbmMchineScheduleList.get(i).getMachineNo());
					cbmMagazine.setMachineName(cbmMchineScheduleList.get(i).getMachineName());
					cbmMagazine.setRequiredValue("Max 145 MM");
					cbmMagazineChainList.add(cbmMagazine);
				}
				
			}
			
			model.addObject("cbmMagazineChainList",cbmMagazineChainList);
			
			try {
			String[] str = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"}; 
			String monthName1 = str[Integer.parseInt(cbmMchineScheduleList.get(0).getMmcH1())-1];
			String monthName2 = str[Integer.parseInt(cbmMchineScheduleList.get(0).getMmcH2())-1]; 
			model.addObject("monthName1",monthName1);
			model.addObject("monthName2",monthName2); 
			}catch(Exception e) {
				 
			}
			
			try {
				  
				 String date1 = DateConvertor.convertToYMD(cbmMagazineChainList.get(0).getDate1())  ; 
				 String date2 = DateConvertor.convertToYMD(cbmMagazineChainList.get(0).getDate2())  ; 
				 
				model.addObject("date1",date1);
				model.addObject("date2",date2); 
				}catch(Exception e) {
					 //e.printStackTrace();
				}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}
	
	@RequestMapping(value = "/submitCbmMagazineChain", method = RequestMethod.POST)
	public String submitCbmMagazineChain(HttpServletRequest request, HttpServletResponse response ) {
		
		try {
		 
		String date1 =  request.getParameter("date1") ;
		String date2 =  request.getParameter("date2") ; 
		 
		HttpSession session = request.getSession();  
		int deptId = (Integer) session.getAttribute("deptId") ; 
		UserDetails userDetail = (UserDetails) session.getAttribute("userDetail"); 
		 
		for(int i=0 ; i<cbmMagazineChainList.size() ; i++) {
			 
			cbmMagazineChainList.get(i).setDate1(DateConvertor.convertToDMY(date1));
			cbmMagazineChainList.get(i).setDate2(DateConvertor.convertToDMY(date2));
			cbmMagazineChainList.get(i).setRequiredValue(request.getParameter("requiredValue"+cbmMagazineChainList.get(i).getSchId()));
			cbmMagazineChainList.get(i).setActualValue1(request.getParameter("actualValue1"+cbmMagazineChainList.get(i).getSchId()));
			cbmMagazineChainList.get(i).setRemark1(request.getParameter("remark1"+cbmMagazineChainList.get(i).getSchId()));
			cbmMagazineChainList.get(i).setActualValue2(request.getParameter("actualValue2"+cbmMagazineChainList.get(i).getSchId()));
			cbmMagazineChainList.get(i).setRemark2(request.getParameter("remark2"+cbmMagazineChainList.get(i).getSchId()));
	 
			cbmMagazineChainList.get(i).setDeptId(deptId);
			cbmMagazineChainList.get(i).setExtra1(userDetail.getUserId());
			 
		}
		
 
		RestTemplate rest=new RestTemplate();
		 
		List<CbmMagazineChain> res = rest.postForObject(Constant.url + "/saveCbmMagazineChain", cbmMagazineChainList, List.class); 
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/showCbmMagazineChain";
	}

}
