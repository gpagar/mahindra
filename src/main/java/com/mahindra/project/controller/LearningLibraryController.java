package com.mahindra.project.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
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

import com.itextpdf.text.log.SysoLogger;
import com.mahindra.project.constant.Constant;
import com.mahindra.project.constant.DateConvertor;
import com.mahindra.project.constant.SendMail;
import com.mahindra.project.constant.VpsImageUpload;
import com.mahindra.project.model.Info;
import com.mahindra.project.model.LearningLibrary;
import com.mahindra.project.model.PmRequiredValue;
import com.mahindra.project.model.UserDetails;
import com.mahindra.project.model.calibration.CalibrationDetails;
import com.mahindra.project.model.calibration.TCalibaration;
 

@Controller
@Scope("session")
public class LearningLibraryController {
	
	
	@RequestMapping(value = "/selectSectionforAddFile", method = RequestMethod.GET)
	public ModelAndView selectSectionforAddFile(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("learningLibrary/sectionMenu");
		
		try
		{
			 

		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}
	
	@RequestMapping(value = "/addFile/{sectionId}", method = RequestMethod.GET)
	public ModelAndView addFile(@PathVariable int sectionId, HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("learningLibrary/addFile");
		
		try
		{
			HttpSession session = request.getSession();  
			 int deptId = (Integer) session.getAttribute("deptId") ;
			 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			 map.add("deptId", deptId);
			 map.add("sectionId", sectionId);
			RestTemplate rest = new RestTemplate();
			LearningLibrary[] learningLibrary = rest.postForObject(Constant.url + "/getFileList",map,
					LearningLibrary[].class);
			List<LearningLibrary> list = new ArrayList<LearningLibrary>(Arrays.asList(learningLibrary));
			
			model.addObject("list",list);
			model.addObject("URL", Constant.PDF_URL);
			model.addObject("sectionId",sectionId);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}
	
	@RequestMapping(value = "/insertFile", method = RequestMethod.POST)
	public String insertFile(HttpServletRequest request, HttpServletResponse response,@RequestParam(value = "fileName", required = false)List<MultipartFile> fileName) {
		
		String sectionId =  request.getParameter("sectionId") ;
		try {
			
		 
		String fileDesc =  request.getParameter("fileDesc") ;
		
		
		HttpSession session = request.getSession();  
		 int deptId = (Integer) session.getAttribute("deptId") ;
		  
		VpsImageUpload vpsImageUpload=new VpsImageUpload();
		
		String fileNme=""; 
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1; // Note: zero based!
		int day = now.get(Calendar.DAY_OF_MONTH);
		int hour = now.get(Calendar.HOUR);
		int minute = now.get(Calendar.MINUTE);
		int second = now.get(Calendar.SECOND);
		int millis = now.get(Calendar.MILLISECOND);
		  
		System.err.println(fileName.get(0).getOriginalFilename());
		if(fileName.get(0).getOriginalFilename()!="") {
			 
			fileNme=day+""+month+""+year+""+hour+""+minute+""+second+""+millis+""+fileName.get(0).getOriginalFilename();
		}

		try {
			vpsImageUpload.saveUploadedFiles(fileName,2,fileNme); 

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		LearningLibrary save = new LearningLibrary();
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yyyy");
		
		save.setDate(sf.format(date));
		save.setFileName(fileNme);
		save.setFileDesc(fileDesc);
		save.setVarchar1(String.valueOf(deptId));
		save.setVarchar2(String.valueOf(sectionId));
		RestTemplate rest=new RestTemplate();
		
		System.err.println("save " + save); 
		LearningLibrary res = rest.postForObject(Constant.url + "/saveFile", save, LearningLibrary.class); 
		 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/addFile/"+sectionId;
	}
	
	@RequestMapping(value = "/deleteFile/{fileId}/{sectionId}", method = RequestMethod.GET)
	public String deleteFile(@PathVariable int fileId,@PathVariable int sectionId, HttpServletRequest request, HttpServletResponse response) {
		 
		try
		{
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("fileId", fileId);
 			RestTemplate rest = new RestTemplate();
			Info info = rest.postForObject(Constant.url + "/deleteFile",map,
					Info.class); 
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return "redirect:/addFile/"+sectionId;
	}
	
	List<UserDetails> userList = new ArrayList<UserDetails>( );
	
	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public ModelAndView addUser(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("addUser");
		
		try
		{
			HttpSession session = request.getSession();  
			 int deptId = (Integer) session.getAttribute("deptId") ;
			 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			 map.add("deptId", deptId);
			RestTemplate rest = new RestTemplate();
			UserDetails[] userDetails = rest.postForObject(Constant.url + "/getAllUsers",map,
					UserDetails[].class);
			userList = new ArrayList<UserDetails>(Arrays.asList(userDetails));
			
			model.addObject("list",userList);

		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}
	
	@RequestMapping(value = "/checkUser", method = RequestMethod.GET)
	@ResponseBody
	public UserDetails checkUser(HttpServletRequest request, HttpServletResponse response) {
		 
		UserDetails userDetails = new UserDetails();
		
		try
		{
			String userName =  request.getParameter("name") ;
			
			System.out.println("userName " + userName);
			
			for(int i=0 ; i<userList.size() ; i++ ) {
				
				if(userList.get(i).getEmail().equalsIgnoreCase(userName.trim())) {
					
					userDetails = userList.get(i);
					break;
				}
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return userDetails;
	}
	
	@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
	public String insertUser(HttpServletRequest request, HttpServletResponse response) {
		
		 
		try {
			
		 
		String userId =  request.getParameter("userId") ;
		String name =  request.getParameter("name") ;
		String userName =  request.getParameter("userName") ;
		String pass =  request.getParameter("pass") ;
		
		int type = Integer.parseInt(request.getParameter("type"));
		
		HttpSession session = request.getSession();  
		 int deptId = (Integer) session.getAttribute("deptId") ;
		  
		  
		 UserDetails save = new UserDetails();
		 
		 if(userId.equalsIgnoreCase("") || userId.equalsIgnoreCase(null)){
			 save.setUserId(0);
		 }
		 else {
			 save.setUserId(Integer.parseInt(userId));
		 }
		save.setName(name);
		save.setEmail(userName);
		save.setPassword(pass);
		save.setType(type);
		save.setInt1(deptId);
		save.setContact("");
		RestTemplate rest=new RestTemplate();
		
		System.err.println("save " + save); 
		Info res = rest.postForObject(Constant.url + "/insertNewUser", save, Info.class); 
		 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/getUserList";
	}
	
	@RequestMapping(value = "/getUserList", method = RequestMethod.GET)
	public ModelAndView getUserList(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("userList");
		
		try
		{
			HttpSession session = request.getSession();  
			 int deptId = (Integer) session.getAttribute("deptId") ;
			 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			 map.add("deptId", deptId);
			RestTemplate rest = new RestTemplate();
			UserDetails[] userDetails = rest.postForObject(Constant.url + "/getAllUsers",map,
					UserDetails[].class);
			userList = new ArrayList<UserDetails>(Arrays.asList(userDetails));
			
			model.addObject("list",userList);

		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}
	
	@RequestMapping(value = "/deleteUser/{userId}", method = RequestMethod.GET)
	public String deleteUser(@PathVariable int userId,  HttpServletRequest request, HttpServletResponse response) {
		 
		try
		{
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("userId", userId);
 			RestTemplate rest = new RestTemplate();
			Info info = rest.postForObject(Constant.url + "/deleteUser",map,
					Info.class); 
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return "redirect:/getUserList";
	}
	
	@RequestMapping(value = "/editUser/{userId}", method = RequestMethod.GET)
	public ModelAndView editUser(@PathVariable int userId,HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("addUser");
		
		try
		{
			 
			 MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			 map.add("userId", userId);
			RestTemplate rest = new RestTemplate();
			UserDetails  userDetails = rest.postForObject(Constant.url + "/getUserById",map,
					UserDetails .class); 
			
			model.addObject("userDetails",userDetails);
			model.addObject("isEdit",1);

		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}

}
