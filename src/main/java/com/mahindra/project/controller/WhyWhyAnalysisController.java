package com.mahindra.project.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.mahindra.project.constant.Constant;
import com.mahindra.project.model.GetPMData;
import com.mahindra.project.model.PaMaintananceDetails;
import com.mahindra.project.model.PmRequiredValue;
import com.mahindra.project.model.WhyWhyF18;

@Controller
public class WhyWhyAnalysisController {

	@RequestMapping(value = "/searchWhyWhyList", method = RequestMethod.POST)
	public ModelAndView searchWhyWhyList(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("whywhyanalysis/whywhyf18");
		try
		{
			int machineType = Integer.parseInt(request.getParameter("machineType"));
			int machineId = Integer.parseInt(request.getParameter("machineId"));

			RestTemplate rest = new RestTemplate();
		
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("machineId",machineId);
			WhyWhyF18[] whyWhyF18ListRes = rest.postForObject(Constant.url + "getAllWhyWhyF18",map,
					WhyWhyF18[].class);
			ArrayList<WhyWhyF18> whyWhyF18List=new ArrayList<WhyWhyF18>(Arrays.asList(whyWhyF18ListRes));

			model.addObject("whyWhyF18List",whyWhyF18List);

			model.addObject("machineType", machineType);
			model.addObject("machineId", machineId);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return model;
	}
	@RequestMapping(value = "/saveWhyWhy", method = RequestMethod.POST)
	public @ResponseBody ModelAndView saveWhyWhy(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("whywhyanalysis/whywhyf18");
		try
		{ 
			int id=0;
			try {
				 id=Integer.parseInt(request.getParameter("id"));		
                 System.out.println("Id"+id);
			}catch(Exception e)
			{
				id=0;
				e.printStackTrace();
			}
			String month=request.getParameter("month");
            System.out.println("month"+month);

			String date=request.getParameter("date");
            System.out.println("date"+date);

			String dept=request.getParameter("dept");
            System.out.println("dept"+dept);

			String cellCircle=request.getParameter("cellcircle");
            System.out.println("cellCircle"+cellCircle);

			int machineId=Integer.parseInt(request.getParameter("machine_id"));		
            System.out.println("machineId"+machineId);

			String machineNo=request.getParameter("machine_no");
            System.out.println("machineNo"+machineNo);

			String problemReported=request.getParameter("problem_reported");
            System.out.println("problemReported"+problemReported);

			String bdTimeLoss=request.getParameter("bd_time_loss");
            System.out.println("bdTimeLoss"+bdTimeLoss);

			String engineLoss=request.getParameter("engine_loss");
            System.out.println("engineLoss"+engineLoss);

			String partStatus=request.getParameter("part");
            System.out.println("partStatus"+partStatus);

			String partDesc=request.getParameter("part_desc");
            System.out.println("partDesc"+partDesc);

			String bdMsPt=request.getParameter("bd_ms_pt");
            System.out.println("bdMsPt"+bdMsPt);

			String action=request.getParameter("action");
            System.out.println("action"+action);

			String why1=request.getParameter("why1");
            System.out.println("why1"+why1);

			String why2=request.getParameter("why2");
            System.out.println("why2"+why2);

			String why3=request.getParameter("why3");
            System.out.println("why3"+why3);

			String why4=request.getParameter("why4");
            System.out.println("why4"+why4);

			String why5=request.getParameter("why5");
            System.out.println("why5"+why5);

			String rootCause=request.getParameter("root_cause");
            System.out.println("rootCause"+rootCause);

			String clarificationOfCause=request.getParameter("clarification_cause");
            System.out.println("clarificationOfCause"+clarificationOfCause);

			String failureCode=request.getParameter("failure_code");
            System.out.println("failureCode"+failureCode);

			String counterMeasure=request.getParameter("counter_measure");
            System.out.println("counterMeasure"+counterMeasure);

			String category=request.getParameter("category");
            System.out.println("category"+category);

			String recurNonRecurr=request.getParameter("recurnonrecurr");
            System.out.println("recurNonRecurr"+recurNonRecurr);

			String linkageWith=request.getParameter("linkage_with");
            System.out.println("linkageWith"+linkageWith);

			int status=Integer.parseInt(request.getParameter("status"));
            System.out.println("status"+status);

			String refNo=request.getParameter("ref_no");
            System.out.println("refNo"+refNo);

			String sapNotifNo=request.getParameter("sap_notif_no");
            System.out.println("sapNotifNo"+sapNotifNo);

			WhyWhyF18 whyWhyF18=new WhyWhyF18();
			whyWhyF18.setId(id);
			whyWhyF18.setMachineId(machineId);
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
			
			RestTemplate rest = new RestTemplate();
			WhyWhyF18 whyWhyF18Res = rest.postForObject(Constant.url + "insertWhyWhyF18", whyWhyF18,WhyWhyF18.class);
			
			System.out.println("whyWhyF18Res " + whyWhyF18Res);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
}
