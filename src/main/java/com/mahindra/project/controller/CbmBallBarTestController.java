package com.mahindra.project.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mahindra.project.constant.Constant;
import com.mahindra.project.constant.DateConvertor;
import com.mahindra.project.constant.VpsImageUpload;
import com.mahindra.project.model.UploadItem;
import com.mahindra.project.model.UserDetails;
import com.mahindra.project.model.cbm.BallBarTest;
import com.mahindra.project.model.cbm.CbmSchedule;
import com.mahindra.project.model.cbm.CbmSpindleTemper;

@Controller
@Scope("session")
public class CbmBallBarTestController {
	List<BallBarTest> ballBarTestList = new ArrayList<BallBarTest>();

	@RequestMapping(value = "/showBallBarTest", method = RequestMethod.GET)
	public ModelAndView showBallBarTest(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("cbm/ballBarTest");
		try
		{
			RestTemplate rest = new RestTemplate();
			HttpSession session = request.getSession(); 
			int deptId = (Integer) session.getAttribute("deptId"); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("deptId",deptId);
			CbmSchedule[] scheduleList = rest.postForObject(Constant.url + "/getCbmScheduleListForBallBarTest",map,
					CbmSchedule[].class);
			List<CbmSchedule> ballBarTestScheduleList = new ArrayList<CbmSchedule>(Arrays.asList(scheduleList));
			model.addObject("ballBarTestScheduleList",ballBarTestScheduleList);
			
			BallBarTest[] ballBarTestRes = rest.postForObject(Constant.url + "/getBallBarTest",map,
					BallBarTest[].class);
			ballBarTestList = new ArrayList<BallBarTest>(Arrays.asList(ballBarTestRes));
			
			for(int i=0 ;i < ballBarTestScheduleList.size() ; i++) {
				 
				int flag=0;
				
				for(int j=0 ;j < ballBarTestList.size() ; j++) {
					
					if(ballBarTestList.get(j).getSchId()==ballBarTestScheduleList.get(i).getId()) {
						flag=1;
						break;
					}
					
				}
				
				if(flag==0) {
					
					BallBarTest ballBarTest = new BallBarTest();
					ballBarTest.setSchId(ballBarTestScheduleList.get(i).getId());
					ballBarTest.setMachineNo(ballBarTestScheduleList.get(i).getMachineNo());
					ballBarTest.setMachineName(ballBarTestScheduleList.get(i).getMachineName()); 
					ballBarTest.setLine(ballBarTestScheduleList.get(i).getLine());
					ballBarTestList.add(ballBarTest);
				}
				
			}
			
			model.addObject("ballBarTestList",ballBarTestList);
			
			try {
			String[] str = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"}; 
			String monthName = str[Integer.parseInt(ballBarTestScheduleList.get(0).getBbtH2())-1];
			model.addObject("monthName",monthName);
			}catch(Exception e) {
				 
			}
			
			try {
				  
				 String date = DateConvertor.convertToYMD(ballBarTestList.get(0).getDate())  ; 
				
				model.addObject("date",date);
				}catch(Exception e) {
					 e.printStackTrace();
				}
			model.addObject("URL", Constant.PDF_URL);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}
	
	@RequestMapping(value = "/submitBallBarTest", method = RequestMethod.POST)
	public String submitSpandleTaperBlueMatching(UploadItem uploadItem, BindingResult result,
 HttpServletRequest request, HttpServletResponse response ) {
		
		try {
			VpsImageUpload vpsImageUpload=new VpsImageUpload();

		String date =  request.getParameter("date") ;
		 
		HttpSession session = request.getSession();  
		int deptId = (Integer) session.getAttribute("deptId") ; 
		UserDetails userDetail = (UserDetails) session.getAttribute("userDetail");
		String timeStamp = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss").format(new Date());

		for(MultipartFile file:uploadItem.getFileData()){
			
			List<MultipartFile> multipertList=new ArrayList<MultipartFile>();
			multipertList.add(file);
			System.out.println("fileName:" +timeStamp+""+file.getOriginalFilename());
			try {
				vpsImageUpload.saveUploadedFiles(multipertList, 2,timeStamp+""+file.getOriginalFilename());
				

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		for(int i=0 ; i<ballBarTestList.size() ; i++) {
			   
			ballBarTestList.get(i).setDate(DateConvertor.convertToDMY(date));
			if(uploadItem.getFileData().get(i).getOriginalFilename().equalsIgnoreCase("")||uploadItem.getFileData().get(i).getOriginalFilename()==null) {
				
			}else {
			ballBarTestList.get(i).setFile(timeStamp+""+uploadItem.getFileData().get(i).getOriginalFilename());
			}
			ballBarTestList.get(i).setRemark(request.getParameter("remark"+ballBarTestList.get(i).getSchId()));
			ballBarTestList.get(i).setDeptId(deptId);
			ballBarTestList.get(i).setExtra1(userDetail.getUserId());
			
		}
		
 
		RestTemplate rest=new RestTemplate();
		 
		List<BallBarTest> resList = rest.postForObject(Constant.url + "/saveBallBarTest", ballBarTestList, List.class); 
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/showBallBarTest";
	}

}
