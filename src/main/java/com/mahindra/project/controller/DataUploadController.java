package com.mahindra.project.controller;



import java.text.SimpleDateFormat; 
import java.util.ArrayList;
import java.util.Calendar; 
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam; 
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mahindra.project.constant.Constant;
import com.mahindra.project.model.DailyGraphData;
import com.mahindra.project.model.MaintenanceData;
import com.mahindra.project.model.SocData;
import com.mahindra.project.model.calibration.EqCalDetails;
 
@Controller
@Scope("session")
public class DataUploadController {
	
	@Autowired
	private JavaMailSender mailSender;

	private static final Logger logger = LoggerFactory.getLogger(DataUploadController.class);
	List<MaintenanceData> dataList=new ArrayList<MaintenanceData>();
 
	

	/*@RequestMapping(value="/uploadFile2007",method=RequestMethod.POST)
	  public String addNewMessage(HttpServletRequest request, HttpServletResponse response,
			  @RequestParam("file") MultipartFile excelfile) {
		  
		
		  try {
		
			  logger.info("File Name "+excelfile.getOriginalFilename());
			  
			  
			  RestTemplate restTemplate=new RestTemplate();
			  
			  MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
			  
			    mvm.add("file", excelfile); // MultipartFile

			    Info result = restTemplate.postForObject(Constant.URL+"/insertSocDataByFile", mvm, Info.class);
			    
			    System.out.println("Info result "+result.toString());
			  
		  }
		  catch(Exception e) {
			System.out.println("exce in msg con: "+ e.getMessage()); 
			  e.printStackTrace();
			  
			  
		  }
  
		  return "redirect:/uploadSocData"; 

	  }
	
	*/
	 
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String processExcel2007(Model model, @RequestParam("file") MultipartFile excelfile,HttpServletRequest request, HttpServletResponse response) {	
		try {
 
			int i = 1;
			
			System.out.println("Excel File name "+excelfile.getOriginalFilename()); 
			XSSFWorkbook workbook = new XSSFWorkbook(excelfile.getInputStream()); 
			XSSFSheet worksheet = workbook.getSheetAt(0);
			 
			 
			List<SocData> farmerList=new ArrayList<SocData>();
			while (i <= worksheet.getLastRowNum()) {
				// Creates an object for the UserInfo Model
				
				SocData farmerData =new SocData();
				
				// Creates an object representing a single row in excel
				XSSFRow row = worksheet.getRow(i++);
				// Sets the Read data to the model class
				//user.setId((int) row.getCell(0).getNumericCellValue());
				
				
				 
			 
				farmerData.setSocId(0);               //Society no Hardcoded
				 
				farmerData.setFarmerFname(row.getCell(1).getStringCellValue());
				System.out.println("F NAme   "+worksheet.getRow(i++).getCell(1).getStringCellValue());
				
				farmerData.setFarmerMname(row.getCell(2).getStringCellValue());
				 
				
				farmerData.setFarmerLname(row.getCell(3).getStringCellValue());
			 
				
				farmerData.setFarmerAddr(row.getCell(7).getStringCellValue());
				 
				
				farmerData.setFarmerVillege(row.getCell(6).getStringCellValue());
				 
				
				farmerData.setFarmerTal(row.getCell(5).getStringCellValue());
				 
				farmerData.setFarmerDist(row.getCell(4).getStringCellValue());
				 
				
				farmerData.setFarmerMobile(row.getCell(8).getStringCellValue());
			 
				farmerData.setFarmerMobile2(row.getCell(9).getStringCellValue());
				 
				farmerData.setFarmerAreaAcre(row.getCell(11).getStringCellValue());
				
				farmerData.setFarmerGatNo(row.getCell(10).getStringCellValue());
				
			 
				
				farmerData.setEnterBy(0);   //-----Enter By 0   
			 
				//farmerData.setEnterDatetime(""+(int) row.getCell(7).getNumericCellValue());
			 
				farmerData.setEnterMode(2);
		 
				farmerData.setVisitBy(0);
				 
				farmerData.setVisitDatetime("1993-02-06 11:11:11");
			 
				farmerData.setTempStatus(0);
				 
				farmerData.setVisitRemarks("");
			 
				 
				 System.out.println( new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()) );
				   // System.out.println(now);
				    farmerData.setEnterDatetime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()));
				// persist data into database in here
				farmerList.add(farmerData);
			}			
			workbook.close();
			
			//userService.addListUser(lstUser);
			
		   // model.addAttribute("bean", bean);
			
			System.out.println("Excel File Arraylist "+farmerList.toString());
			RestTemplate rest=new RestTemplate();
			//FarmerDataList farmerDataList=rest.postForObject(Constant.URL+"/insertSocData", farmerList, FarmerDataList.class);
			//System.out.println("Response "+farmerDataList.toString());
			
		    
		} catch (Exception e) {
			e.printStackTrace();
		}
	 
		return "redirect:/primitiveMaintenance";
	}
	
	@RequestMapping(value = "/importExcel2", method = RequestMethod.POST) 
	public ModelAndView importExcel2( @RequestParam("file") MultipartFile excelfile,HttpServletRequest request, HttpServletResponse response) 
	{	
		ModelAndView model= new ModelAndView("data");
		
		try {
 
			int i = 7; 
			System.out.println("Excel File name "+excelfile.getOriginalFilename()); 
			XSSFWorkbook workbook = new XSSFWorkbook(excelfile.getInputStream()); 
			XSSFSheet worksheet = workbook.getSheetAt(0);
			 
			 
			dataList=new ArrayList<MaintenanceData>();
			while (i <= worksheet.getLastRowNum()) {
				
				
				MaintenanceData data =new MaintenanceData();
				 
				XSSFRow row = worksheet.getRow(i++); 
				data.setItemId(0);          
				data.setActivity(row.getCell(1).getStringCellValue());
				//System.out.println("1st "+row.getCell(2).getStringCellValue());
				data.setItem(row.getCell(2).getStringCellValue());
				//System.out.println("1st "+row.getCell(3).getStringCellValue());
				data.setCheckpoint(row.getCell(3).getStringCellValue());
				//System.out.println("1st "+row.getCell(4).getStringCellValue());
				data.setMethod(row.getCell(4).getStringCellValue());
				//System.out.println("1st "+row.getCell(5).getStringCellValue());
				data.setRequiredValue(row.getCell(5).getStringCellValue());
				//System.out.println("1st "+row.getCell(6).getStringCellValue());
				data.setMonth1(row.getCell(6).getStringCellValue());
				//System.out.println("1st "+row.getCell(7).getStringCellValue());
				data.setMonth2(row.getCell(7).getStringCellValue());
				//System.out.println("1st "+row.getCell(8).getStringCellValue());
				data.setMonth3(row.getCell(8).getStringCellValue());
				//System.out.println("1st "+row.getCell(9).getStringCellValue());
				data.setRemark(row.getCell(9).getStringCellValue());
				//System.out.println("1st "+row.getCell(9).getStringCellValue());
				
				dataList.add(data);
			}			
			workbook.close(); 
			
			System.out.println("Excel File Arraylist "+dataList.toString());
			/*RestTemplate rest=new RestTemplate();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("username", "Ganesh");
			map.add("password", "Ganesh");
			String username=rest.postForObject(Constant.url+"/login", map, String.class);
			System.out.println("username"+username);
			
			//System.out.println("Response "+info.toString());
			Info info=rest.postForObject(Constant.url+"/insertPreventiveMaintenance", dataList, Info.class);
			System.out.println("Response "+info.toString());*/
			
			model.addObject("dataList", dataList);
		    
		} catch (Exception e) {
			e.printStackTrace();
		}
	 
		return model;
	}
	
	@RequestMapping(value = "/importExcelCal", method = RequestMethod.POST) 
	public ModelAndView importExcelCal( @RequestParam("file") MultipartFile excelfile,HttpServletRequest request, HttpServletResponse response) 
	{	
		ModelAndView model= new ModelAndView("calibration/calibration");
		
		try {
 
			int i = 1; 
			System.out.println("Excel File name "+excelfile.getOriginalFilename()); 
			XSSFWorkbook workbook = new XSSFWorkbook(excelfile.getInputStream()); 
			XSSFSheet worksheet = workbook.getSheetAt(0);
			 
			 
		    List<EqCalDetails>	dataLists=new ArrayList<EqCalDetails>();
			while (i <= worksheet.getLastRowNum()) {
				
				
				EqCalDetails data =new EqCalDetails();
				 
				XSSFRow row = worksheet.getRow(i++); 
				data.setId(0);     
				
				data.setEqName(row.getCell(0).getStringCellValue());
				data.setSrNo(row.getCell(1).getStringCellValue());
				System.out.println("row.getCell(2)  "+row.getCell(2).getStringCellValue());
				//System.out.println("1st "+row.getCell(3).getStringCellValue());
				data.setCardNo(""+row.getCell(2).getStringCellValue());
				//System.out.println("1st "+row.getCell(4).getStringCellValue());
				data.setMachineNo(""+row.getCell(3).getNumericCellValue());
				//System.out.println("1st "+row.getCell(5).getStringCellValue());
				data.setLine(row.getCell(4).getStringCellValue());
				//System.out.println("1st "+row.getCell(6).getStringCellValue());
				data.setFrequency((int)row.getCell(3).getNumericCellValue());
				//System.out.println("1st "+row.getCell(7).getStringCellValue());
				data.setLastCalDate(""+row.getCell(5).getDateCellValue());

				dataLists.add(data);
			}			
			workbook.close(); 
			RestTemplate rest = new RestTemplate();

			System.out.println("Excel File Arraylist "+dataLists.toString());
	 		  List<EqCalDetails> calDetails= rest.postForObject(Constant.url + "/insertMachineEqCal",
					  dataLists,List.class);
				System.out.println("Excel File Arraylist "+calDetails.toString());

			model.addObject("dataLists", dataLists);
		    
		} catch (Exception e) {
			e.printStackTrace();
		}
	 
		return model;
	}
	
	
	@RequestMapping(value = "/mail", method = RequestMethod.POST)
	public String mail(HttpServletRequest request, HttpServletResponse response) {
		try
		{
			String email = request.getParameter("email");
			final String e_mail=email;
			System.out.println(email+e_mail);
			mailSender.send(new MimeMessagePreparator() {

				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					messageHelper.setTo(e_mail); 
					messageHelper.setSubject("Email Testing");
					messageHelper.setText("Mail Testing");

				}

			});
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return "mail";
	}


		@RequestMapping(value = "/upload", method = RequestMethod.GET)
		public String Upload(Model model) {
			return "excel";
		}
	
}
