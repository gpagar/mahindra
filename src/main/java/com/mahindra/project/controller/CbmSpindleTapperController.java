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
import com.mahindra.project.model.cbm.CbmSchedule;
import com.mahindra.project.model.cbm.CbmSpindleTemper;

@Controller
@Scope("session")
public class CbmSpindleTapperController {
	
	List<CbmSpindleTemper> cbmSpindleTemperList = new ArrayList<>();
	
	@RequestMapping(value = "/showSpindleTapper", method = RequestMethod.GET)
	public ModelAndView showSpindleTapper(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("cbm/showSpindleTapper");
		try
		{
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

}
