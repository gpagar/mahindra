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
import com.mahindra.project.model.calibration.CalibrationDetails;
import com.mahindra.project.model.calibration.TCalibaration;
 

@Controller
@Scope("session")
public class LearningLibraryController {
	
	@RequestMapping(value = "/addFile", method = RequestMethod.GET)
	public ModelAndView addFile(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("learningLibrary/addFile");
		
		try
		{
			RestTemplate rest = new RestTemplate();
			LearningLibrary[] learningLibrary = rest.getForObject(Constant.url + "/getFileList",
					LearningLibrary[].class);
			List<LearningLibrary> list = new ArrayList<LearningLibrary>(Arrays.asList(learningLibrary));
			
			model.addObject("list",list);
			model.addObject("URL", Constant.PDF_URL);

		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}
	
	@RequestMapping(value = "/insertFile", method = RequestMethod.POST)
	public String insertFile(HttpServletRequest request, HttpServletResponse response,@RequestParam(value = "fileName", required = false)List<MultipartFile> fileName) {
		
		try {
			
		 
		String fileDesc =  request.getParameter("fileDesc") ;
		 
		HttpSession session = request.getSession();  
		 int deptId = (Integer) session.getAttribute("deptId") ;
		
		CalibrationDetails calibrationDetails = new CalibrationDetails();
		
		 
		
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
		RestTemplate rest=new RestTemplate();
		
		System.err.println("save " + save); 
		LearningLibrary res = rest.postForObject(Constant.url + "/saveFile", save, LearningLibrary.class); 
		 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/addFile";
	}
	
	@RequestMapping(value = "/deleteFile/{fileId}", method = RequestMethod.GET)
	public String deleteFile(@PathVariable int fileId, HttpServletRequest request, HttpServletResponse response) {
		 
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
		

		return "redirect:/addFile";
	}

}
