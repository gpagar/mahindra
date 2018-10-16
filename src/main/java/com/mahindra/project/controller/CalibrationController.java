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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mahindra.project.constant.Constant;
import com.mahindra.project.constant.DateConvertor;
import com.mahindra.project.constant.VpsImageUpload;
import com.mahindra.project.model.Info;
import com.mahindra.project.model.TCalibration;
import com.mahindra.project.model.calibration.CalibrationDetails;
import com.mahindra.project.model.calibration.EqCalDetails;
import com.mahindra.project.model.calibration.TCalibaration;


@Controller
@Scope("session")
public class CalibrationController {

	List<CalibrationDetails> eqCalDetailsRes = new ArrayList<CalibrationDetails>();

	@RequestMapping(value = "/showEqCal", method = RequestMethod.GET)
	public ModelAndView showEqCal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("calibration/eqCal");
		try
		{
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}
	
	@RequestMapping(value = "/editEqCal", method = RequestMethod.GET)
	public ModelAndView editEqCal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("calibration/editEqCal");
		try
		{

			RestTemplate rest=new RestTemplate();
			HttpSession session = request.getSession(); 
            MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,Object>();

			map.add("deptId", (Integer) session.getAttribute("deptId"));
		    List<EqCalDetails> eqList=rest.postForObject(Constant.url + "getAllEquipments",map, List.class);
		    model.addObject("eqList", eqList);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return model;
	}
	
	@RequestMapping(value = "/getEqById", method = RequestMethod.GET)
	public @ResponseBody EqCalDetails getEqById(HttpServletRequest request, HttpServletResponse response) {
		EqCalDetails equipmentRes=null;
		try
		{
             int id=Integer.parseInt(request.getParameter("id"));
             MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,Object>();
             map.add("id", id);
			RestTemplate rest=new RestTemplate();
			
		     equipmentRes=rest.postForObject(Constant.url + "getEquipment", map,EqCalDetails.class);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		return equipmentRes;
	}
	@RequestMapping(value = "/showCalibration", method = RequestMethod.GET)
	public ModelAndView showCalibration(HttpServletRequest request, HttpServletResponse response) {
	
		ModelAndView model = new ModelAndView("calibration/caliDetails");
		try
		{
			RestTemplate rest=new RestTemplate();
			
			HttpSession session = request.getSession(); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,Object>();
			map.add("deptId", (Integer) session.getAttribute("deptId"));
			CalibrationDetails[] calibrationDetails=rest.postForObject(Constant.url + "getCalibrationData",map, CalibrationDetails[].class);
	
			 eqCalDetailsRes = new ArrayList<CalibrationDetails>(Arrays.asList(calibrationDetails));
			 
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yyyy");
			model.addObject("today", sf.format(date));
			 
			for(int i = 0 ; i< eqCalDetailsRes.size() ; i++) {
				 
				Date date1 = sf.parse(sf.format(date));
				Date date2 = sf.parse(eqCalDetailsRes.get(i).getNextCalDate());
				 
				 
				/*if (date1.compareTo(date2) == 0)
			    {
			       
			        eqCalDetailsRes.get(i).setInta(1);
			    }*/
  
			    //how to check if date1 is greater than date2 in java
			    if (date1.compareTo(date2) >= 0)
			    {
			         
			        eqCalDetailsRes.get(i).setInta(1);
			    }
				
			}
			
			model.addObject("eqCalDetailList", eqCalDetailsRes);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(value = "/submitCalibarationEqupment", method = RequestMethod.POST)
	public String submitCalibarationEqupment(HttpServletRequest request, HttpServletResponse response,@RequestParam(value = "caliFile", required = false)List<MultipartFile> caliFile) {
		
		try {
		int id=Integer.parseInt(request.getParameter("mEqupId"));
		String doneDate =  request.getParameter("calibrationDoneDate") ;
		
		System.out.println(doneDate);
		
		HttpSession session = request.getSession();  
		 int deptId = (Integer) session.getAttribute("deptId") ;
		
		CalibrationDetails calibrationDetails = new CalibrationDetails();
		
		for(int i=0 ; i<eqCalDetailsRes.size() ; i++) {
			
			if(id==eqCalDetailsRes.get(i).getId()) {
				calibrationDetails = eqCalDetailsRes.get(i);
				break;
			}
			
		}
		
		VpsImageUpload vpsImageUpload=new VpsImageUpload();
		
		String fileNme=""; 
		
		if(caliFile.get(0).getOriginalFilename()!="")
			fileNme=caliFile.get(0).getOriginalFilename();
		 

		try {
			vpsImageUpload.saveUploadedFiles(caliFile,2,fileNme); 

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		TCalibaration save = new TCalibaration();
		save.setmCalId(id);
		save.setEqName(calibrationDetails.getEqName());
		save.setSrNo(calibrationDetails.getSrNo());
		save.setCardNo(calibrationDetails.getCardNo());
		save.setMachineNo(calibrationDetails.getMachineNo());
		save.setLine(calibrationDetails.getLine());
		save.setLastCalDate(calibrationDetails.getLastCalDate());
		save.setCalibrationDoneDate(DateConvertor.convertToDMY(doneDate));
		save.setDeptId(deptId);
		save.setFrequency(calibrationDetails.getFrequency());
		save.setFileName(fileNme);
		
		RestTemplate rest=new RestTemplate();
		System.err.println("save " + save);
		 TCalibaration res = rest.postForObject(Constant.url + "saveTCalibaratoin", save, TCalibaration.class); 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/showCalibration";
	}
	
	List<TCalibaration> lastRecordList = new ArrayList<TCalibaration>();
	
	@RequestMapping(value = "/getlastRecordOfCalibreationEqumt", method = RequestMethod.GET)
	public ModelAndView getlastRecordOfCalibreationEqumt(HttpServletRequest request, HttpServletResponse response) {
	
		ModelAndView model = new ModelAndView("calibration/lastRecordListOfEqump");
		try
		{
			RestTemplate rest=new RestTemplate();
			
			HttpSession session = request.getSession(); 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,Object>();
			map.add("deptId", (Integer) session.getAttribute("deptId"));
			TCalibaration[] tCalibaration=rest.postForObject(Constant.url + "getLastRecordOfEquepmentFroEdit",map, TCalibaration[].class);
	
			  lastRecordList = new ArrayList<TCalibaration>(Arrays.asList(tCalibaration));
		  
			model.addObject("equmpList", lastRecordList);
			model.addObject("URL", Constant.PDF_URL);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(value = "/submitEditCalibarationEqupment", method = RequestMethod.POST)
	public String submitEditCalibarationEqupment(HttpServletRequest request, HttpServletResponse response,@RequestParam(value = "caliFile", required = false)List<MultipartFile> caliFile) {
		
		try {
		int id=Integer.parseInt(request.getParameter("tEqupId"));
		String doneDate =  request.getParameter("calibrationDoneDate") ;
		
		System.out.println(doneDate);
		
		HttpSession session = request.getSession();  
		 int deptId = (Integer) session.getAttribute("deptId") ;
		
		 TCalibaration editTCalibaration = new TCalibaration();
		
		for(int i=0 ; i<lastRecordList.size() ; i++) {
			
			if(id==lastRecordList.get(i).getId()) {
				editTCalibaration = lastRecordList.get(i);
				break;
			}
			
		}
		
		VpsImageUpload vpsImageUpload=new VpsImageUpload();
		
		String fileNme=""; 
		
		if(caliFile.get(0).getOriginalFilename()!="") {
			fileNme=caliFile.get(0).getOriginalFilename();
			try {
				vpsImageUpload.saveUploadedFiles(caliFile, 1,fileNme); 

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			editTCalibaration.setFileName(fileNme);
		}
 
		if(doneDate.equalsIgnoreCase("") || doneDate.equalsIgnoreCase(null)) {
			
		}
		else {
			editTCalibaration.setCalibrationDoneDate(DateConvertor.convertToDMY(doneDate));
		}
		
		RestTemplate rest=new RestTemplate();
		System.err.println("save " + editTCalibaration);
		 TCalibaration res = rest.postForObject(Constant.url + "saveTCalibaratoin", editTCalibaration, TCalibaration.class); 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/getlastRecordOfCalibreationEqumt";
	}
	
	@RequestMapping(value = "/deleteCalibarationEqupmentRecord/{id}", method = RequestMethod.GET)
	public String deleteCalibarationEqupmentRecord(@PathVariable int id, HttpServletRequest request, HttpServletResponse response) {
	
		 
		try
		{
			RestTemplate rest=new RestTemplate();
			 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,Object>();
			map.add("id", id);
			
			Info info=rest.postForObject(Constant.url + "deleteCalibarationRecord",map, Info.class);
	 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return "redirect:/getlastRecordOfCalibreationEqumt";
	}
	
	@RequestMapping(value = "/historyOfCalibreationEqumt", method = RequestMethod.GET)
	public ModelAndView historyOfCalibreationEqumt(HttpServletRequest request, HttpServletResponse response) {
	
		ModelAndView model = new ModelAndView("calibration/historyOfCalibreationEqumt");
		try
		{
			RestTemplate rest=new RestTemplate();
			if(request.getParameter("fromDate")==null || request.getParameter("toDate")==null) {
				
			}
			else {
				String fromDate = request.getParameter("fromDate");
				String toDate = request.getParameter("toDate");
				
				HttpSession session = request.getSession(); 
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,Object>();
				map.add("deptId", (Integer) session.getAttribute("deptId"));
				map.add("fromDate", fromDate);
				map.add("toDate", toDate);
				TCalibaration[] tCalibaration=rest.postForObject(Constant.url + "getHistoryOfCablibaration",map, TCalibaration[].class);
		
				 List<TCalibaration> equmpList = new ArrayList<TCalibaration>(Arrays.asList(tCalibaration)); 
				model.addObject("equmpList", equmpList);
				
				model.addObject("fromDate", fromDate);
				model.addObject("toDate", toDate);
				model.addObject("URL", Constant.PDF_URL);
			}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return model;
	}
	

	@RequestMapping(value = "/insertMhaWkEqDetails", method = RequestMethod.POST)
	public String insertMhaWkEqDetails(HttpServletRequest request, HttpServletResponse response) {
		int id=0;
		try {
			HttpSession session = request.getSession(); 
			try {
				id=Integer.parseInt(request.getParameter("id"));
			}catch (Exception e) {
				id=0;
			}
			System.err.println(id);
		String eqName=request.getParameter("eqName");
		String eqSrNo=request.getParameter("eqSrNo");
		String cardNo=request.getParameter("cardNo");
		String machineNo=request.getParameter("machineNo");
		String line=request.getParameter("line");
		int frequency=Integer.parseInt(request.getParameter("frequency"));
		String lastCalDate=request.getParameter("lastCalDate");
		
		EqCalDetails eqCalDetails=new EqCalDetails();
		eqCalDetails.setId(id);
		eqCalDetails.setEqName(eqName);
		eqCalDetails.setSrNo(eqSrNo);
		eqCalDetails.setCardNo(cardNo);
		eqCalDetails.setFrequency(frequency);
		eqCalDetails.setLastCalDate(lastCalDate);
		eqCalDetails.setDeptId((Integer) session.getAttribute("deptId"));
		eqCalDetails.setLine(line);
		eqCalDetails.setMachineNo(machineNo);
		eqCalDetails.setDelStatus(0);
		List<EqCalDetails> saveList=new ArrayList<EqCalDetails>();
		saveList.add(eqCalDetails);
		RestTemplate rest=new RestTemplate();
		
			List<EqCalDetails> eqCalDetailsRes=rest.postForObject(Constant.url + "insertMachineEqCal", saveList, List.class);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		String mapping="redirect:/showEqCal";
		if(id==0)
		{
			mapping="redirect:/showEqCal";
		}else
		{
			mapping="redirect:/editEqCal";
		}
		return mapping;
	}
	
	@RequestMapping(value = "/insertCalibration/{key}", method = RequestMethod.POST)
	public String insertCalibration(@PathVariable int key,HttpServletRequest request, HttpServletResponse response) {
		
		try {
		String eqName=request.getParameter("eqName"+key);
		String eqSrNo=request.getParameter("eqSrNo"+key);
		String cardNo=request.getParameter("cardNo"+key);
		String machineNo=request.getParameter("machineNo"+key);
		String line=request.getParameter("line"+key);
		int frequency=Integer.parseInt(request.getParameter("frequency"+key));
		String lastCalDate=request.getParameter("lastCalDate"+key);
		String calibrationDoneDate=request.getParameter("calibrationDoneDate"+key);
		int mCalId=Integer.parseInt(request.getParameter("mCalId"));
		
		TCalibration tCalibration=new TCalibration();
		
		tCalibration.setEqName(eqName);
		tCalibration.setSrNo(eqSrNo);
		tCalibration.setCardNo(cardNo);
		tCalibration.setFrequency(frequency);
		tCalibration.setId(0);
		tCalibration.setmCalId(mCalId);
		tCalibration.setLastCalDate(lastCalDate);
		tCalibration.setCalibrationDoneDate(calibrationDoneDate);
		tCalibration.setLine(line);
		tCalibration.setMachineNo(machineNo);
		tCalibration.setStatus(0);
		tCalibration.setDelStatus(0);

		RestTemplate rest=new RestTemplate();
		
			TCalibration tCalibrationRes=rest.postForObject(Constant.url + "insertCalibration", tCalibration, TCalibration.class);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/showCalibration";
	}
	@RequestMapping(value = "/showEqCalList", method = RequestMethod.GET)
	public ModelAndView showEqCalList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("calibration/eqCalList");
		try
		{
			RestTemplate rest = new RestTemplate();
			//List<PmRequiredValue> requiredValueList = rest.getForObject(Constant.url + "getAllPmRequiredValue",
			///		List.class);
			//model.addObject("requiredValueList",requiredValueList);
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return model;
	}
	@RequestMapping(value = "/calibration", method = RequestMethod.GET)
	public ModelAndView calibration(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("calibration/calibration");
		try
		{
			RestTemplate rest = new RestTemplate();
			//List<PmRequiredValue> requiredValueList = rest.getForObject(Constant.url + "getAllPmRequiredValue",
			///		List.class);
			//model.addObject("requiredValueList",requiredValueList);
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return model;
	}
}
