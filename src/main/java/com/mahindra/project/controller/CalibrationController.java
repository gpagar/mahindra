package com.mahindra.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.mahindra.project.constant.Constant;
import com.mahindra.project.model.TCalibration;
import com.mahindra.project.model.calibration.CalibrationDetails;
import com.mahindra.project.model.calibration.EqCalDetails;


@Controller
public class CalibrationController {

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
	@RequestMapping(value = "/showCalibration", method = RequestMethod.GET)
	public ModelAndView showCalibration(HttpServletRequest request, HttpServletResponse response) {
	
		ModelAndView model = new ModelAndView("calibration/caliDetails");
		try
		{
			RestTemplate rest=new RestTemplate();
			
			List<CalibrationDetails> eqCalDetailsRes=rest.getForObject(Constant.url + "getCalibrationData", List.class);
	
			model.addObject("eqCalDetailList", eqCalDetailsRes);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return model;
	}
	

	@RequestMapping(value = "/insertMhaWkEqDetails", method = RequestMethod.POST)
	public String insertMhaWkEqDetails(HttpServletRequest request, HttpServletResponse response) {
		
		try {
		String eqName=request.getParameter("eqName");
		String eqSrNo=request.getParameter("eqSrNo");
		String cardNo=request.getParameter("cardNo");
		String machineNo=request.getParameter("machineNo");
		String line=request.getParameter("line");
		int frequency=Integer.parseInt(request.getParameter("frequency"));
		String lastCalDate=request.getParameter("lastCalDate");
		
		EqCalDetails eqCalDetails=new EqCalDetails();
		
		eqCalDetails.setEqName(eqName);
		eqCalDetails.setSrNo(eqSrNo);
		eqCalDetails.setCardNo(cardNo);
		eqCalDetails.setFrequency(frequency);
		eqCalDetails.setId(0);
		//eqCalDetails.setLastCalDate(lastCalDate);
		eqCalDetails.setLine(line);
		eqCalDetails.setMachineNo(machineNo);
		eqCalDetails.setDelStatus(0);

		RestTemplate rest=new RestTemplate();
		
			EqCalDetails eqCalDetailsRes=rest.postForObject(Constant.url + "insertMachineEqCal", eqCalDetails, EqCalDetails.class);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/showEqCal";
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
