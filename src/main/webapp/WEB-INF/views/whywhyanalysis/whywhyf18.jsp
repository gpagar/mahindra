<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mahindra</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Pooled Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/home/css/table-style.css">
<script
	src="${pageContext.request.contextPath}/resources/home/js/lightbox.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/home/css/lightbox.css">
 <style type="text/css">select {
     padding: 0rem 0rem; 
    text-transform: uppercase;
}

</style> 
<style>
* {
  box-sizing: border-box;
}

#myInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#myTable {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}
</style>
   <script>
  $( function() {
    $( ".dp2" ).datepicker({
    	 autoclose: true, 
    	format: "dd-mm-yyyy"
    		
    });
 
  } );
  
  </script>
  
<!----------------------------------------Dropdown With Search----------------------------------------------- -->

<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/customerBill/chosen.css">
<!--------------------------------------------------------------------------------------- -->

</head>
<body>  <%-- onload="setMachineSelected(${machineType},${machineId})" --%>
   <div class="page-container">

         <c:url var="getMachinByType" value="/getMachinByType"></c:url>
         <c:url var="getMachineById" value="/getMachineById"></c:url>
   <!--/content-inner-->
<div class="left-content">
	   <div class="mother-grid-inner"> 
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

              <div id="main-content">
			<!-- BEGIN Page Title -->
			 <div class="box-title">
							<h3>
								<i class="fa fa-bars"></i> BREAKDOWN/WHY WHY ANALYSIS
							</h3>
							<div class="box-tool">
							
						</div>
			<!-- END Page Title -->
<form action="${pageContext.request.contextPath}/searchWhyWhyList">
				<div class="form-group">   <div class="col-md-1">Month :</div>   <div class="col-md-3">
<input type="month" id="myInput" onchange="myFunction()" style="border-radius: 25px;" placeholder="Search by date.." class="form-control" title="Type in a name">  
</div> <div class="col-md-1">M/C :</div><div class="col-md-3">
<select data-placeholder="Choose Machine"  style="width: 70% !important;"
								tabindex="6" id="machineId" class="chosen-select"
								name="machineId" onchange="myFunction1()"  >

							 <option value="">Choose Machine</option>
                                  <c:forEach items="${machineList}" var="machineList">
                                  <c:choose><c:when test="${machineId==machineList.machinId}">
                                  	<option value="${machineList.machinId}" selected>${machineList.machinNo}-${machineList.machinName}</option>
                                </c:when> 
                                <c:otherwise>
                                  	<option value="${machineList.machinId}" >${machineList.machinNo}-${machineList.machinName}</option>
                                </c:otherwise> 
                                 </c:choose>
                                  </c:forEach>   
							</select>
							<input type="hidden" value="0" id="machineType" name="machineType"/>
</div>  <div class="col-md-1">	<button type="submit" class="btn btn-info" id="search">Search</button></div>    </div>
	</form> </div>
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						

						
				<%-- <form action="${pageContext.request.contextPath}/searchWhyWhyList"  class="form-horizontal"
							 id="validation-form"
										enctype="multipart/form-data" method="get">
							<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Machine Type.</label>
									 
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine Type"
								class="form-control chosen" tabindex="6" id="machineType"
								name="machineType" required onchange="onMacTypeChange(this.value)">

								<option value="">Choose Machine Type</option>
                                   <c:choose>
                                   
                                   <c:when test="${machineType==1}">
                                   <option value="1" selected>Electrical</option>
								   <option value="2">Mechanical</option>
                                   </c:when>
                                     <c:when test="${machineType==2}">
                                   <option value="1" >Electrical</option>
								   <option value="2" selected>Mechanical</option>
                                   </c:when>
                                   <c:otherwise>
                                    <option value="1">Electrical</option>
								   <option value="2">Mechanical</option>
                                   </c:otherwise>
                                   
                                   </c:choose>
								
							</select>
						</div>
									
						</div>	
								
								<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Machine name & No.</label>
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine"
								class="form-control chosen" tabindex="6" id="machineId" onchange="onMachineChange(this.value)"
								name="machineId" required>

								<option value=""selected disabled="disabled">Choose Machine</option>

							</select>
						</div>
									
						</div>
						<div class="row" align="center">
						<div class="col-sm-9 col-sm-offset-3 col-lg-8 col-lg-offset-2">
							<button type="submit" class="btn btn-info" id="submitbtn">Search</button>  
			<!-- 	<button type="button" class="btn btn-info" id="addMaintenance2" onclick="unlockDate2Dive()">Search</button>   -->
		

						</div>
					</div>
				</form> --%><div class="box-content">	<form action="${pageContext.request.contextPath}/saveWhyWhy"  class="form-horizontal" name="breakdown_form"
							 id="validation-form" enctype="multipart/form-data" method="post">	
				        	<%-- <input type="hidden" name="machine_id-1" id="machine_id-1" value="${machineId}"/>
                           <input type="hidden" name="machine_type-1" id="machine_type-1" value="${machineType}"/>			
                          --%>  <input type="hidden" name="key" id="key"/>
                          
           
			<div class="agile-grids" >	
				<!-- tables -->
				<div class="agile-tables">
					<div class="w3l-table-info" style="overflow-x:auto;height:450px ">
					
					    <table id="table"  style="border: 1px;" >
						<thead>
						  <tr>
							<th>Sr.No</th>
							<th>Month</th>
							<th>Date</th>
							<th>Dept.</th>
							<th>Cell/Circle</th>
							<th>Machine_Name.</th>
							<th>Rank</th>
							<th>Problem Reported</th>
							<th>Repair Start Time</th>
							<th>Repair Finish Time</th>
							<th>BD time Loss (Min)</th> 
							<th>Engine Loss</th> 
							<th>Part Repalced/adjust/set/corrected etc</th> 
							<th>Part Description</th>
							<th>BD/MS/PT</th> 
							<th>Action</th> 
							<th>Why 1</th>
							<th>Why 2</th>
							<th>Why 3</th> 
							<th>Why 4</th>
							<th>Why 5</th>
							<th>Root Cause</th>
							<th>Classification of clause</th>
							<th>Failure Code</th>
							<th>Counter Measure</th>
							<th>Category</th>
							<th>Recur /Non Recurr</th>
							<th>Linkage with</th>
							<th>Previous Occurrence Date</th>
							<th>Repaired By</th>
							
							<th>Idea</th>
							<th>Prepared By</th>
							<th>PU Manager / Department Head </th>
							<th>Pillar Subcommittee Members</th>
							<th>Status</th>
							<th>Ref NO.</th>
							<th>SAP Notification Number</th>
							<th>Action</th>
						  </tr>
						</thead>
						<tbody>
						<tr>
						  <input type="hidden" name="id-1" id="id-1" value="0"/>			
						
						<td>Insert Breakdown</td>
						<td><input id="month-1" type="month" name="month-1" />
						</td>
						<td><input id="date-1" type="date" name="date-1" format="dd-MM-yyyy"/>
						</td>
						<td><!-- <textarea id="dept-1"   name="dept-1"></textarea> -->
						<select id="dept-1" name="dept-1" class="chosen-select"  required>
						 <option value="">Select Department</option>
						 <c:choose><c:when test="${deptId eq '1'}">
						         <option value="1" selected>M/C Shop</option>
                                 <option value="2" disabled>mHawk</option>
                                 <option value="3" disabled>NEF-mDI</option>
						 </c:when>
						 <c:when test="${deptId eq '2'}">
						         <option value="1" disabled >M/C Shop</option>
                                 <option value="2"selected>mHawk</option>
                                 <option value="3" disabled>NEF-mDI</option>
						 </c:when>
						 <c:when test="${deptId eq '3'}">
						         <option value="1" disabled>M/C Shop</option>
                                 <option value="2" disabled>mHawk</option>
                                 <option value="3"selected>NEF-mDI</option>
						 </c:when>
						 <c:otherwise>
						   <option value="1" >M/C Shop</option>
                                 <option value="2">mHawk</option>
                                 <option value="3">NEF-mDI</option>
						 </c:otherwise>
						 </c:choose>
                                
                        </select>
						</td>
						<td>
						<select id="cellcircle-1" name="cellcircle-1" class="chosen-select" onchange="calculateEngineLoss(-1)" required>
						 <option value="">Select Cell/Circle</option>
                                 <option value="HL">HeadLine</option>
                                 <option value="BL">BlockLine</option>
                                <option value="CL">CamLine</option>
                        </select>
						</td>
						<td><%-- <textarea id="machine_no-1"   name="machine_no-1">${machinDetails.machinNo}</textarea> --%>
						<select data-placeholder="Choose Machine" 
								tabindex="6" id="machine_id-1" class="chosen-select"
								name="machine_id-1"  required>

							 <option value="">Choose Machine</option>
                                  <c:forEach items="${machineList}" var="machineList">
                                  	<option value="${machineList.machinId}">${machineList.machinNo}-${machineList.machinName}</option>
                                  
                                  </c:forEach>   
							</select>
						
						</td>
						<td><select id="rank-1" name="rank-1" class="chosen-select" required>
						 <option value="">Select Rank</option>
                                 <option value="1">A</option>
                                 <option value="2">B</option>
                                <option value="3">C</option>
                        </select></td>
						<td><textarea id="problem_reported-1"   name="problem_reported-1"></textarea>
						</td>
							<td><input id="repairStartTime-1" type="time" name="repairStartTime-1" onblur="onTimeChange(-1)"/>
						</td>
						<td><input id="repairFinishTime-1" type="time" name="repairFinishTime-1" onblur="onTimeChange(-1)" />
						</td>
						<td><textarea id="bd_time_loss-1" name="bd_time_loss-1" onchange="calculateEngineLoss(-1)">0</textarea>
						</td>
						<td><textarea id="engine_loss-1"   name="engine_loss-1">0</textarea>
						</td>
						<td><select id="part-1" name="part-1" class="chosen-select">
                                 <option value="Adjusted">Adjusted</option>
                                 <option value="Corrected">Corrected</option>
                                <option value="Replaced">Replaced</option>
                        </select>
						</td>
						<td><textarea id="part_desc-1"   name="part_desc-1"></textarea>
						</td>
						<td><select id="bd_ms_pt-1" name="bd_ms_pt-1" class="chosen-select">
                                 <option value="BD">BD</option>
                                 <option value="MS">MS</option>
                                <option value="PT">PT</option>
                        </select>
						</td>
						<td><textarea id="action-1"   name="action-1"></textarea>
						</td>
						<td><textarea id="why1-1"   name="why1-1"></textarea>
						</td>
						<td><textarea id="why2-1"   name="why2-1"></textarea>
						</td>
						<td><textarea id="why3-1"   name="why3-1"></textarea>
						</td>
						<td><textarea id="why4-1"   name="why4-1"></textarea>
						</td>
						<td><textarea id="why5-1"   name="why5-1"></textarea>
						</td>
						<td><textarea id="root_cause-1"   name="root_cause-1"></textarea>
						</td>
						<td><select id="clarification_cause-1" name="clarification_cause-1" class="chosen-select">
                             <option value="Inadequate Operating condition">Inadequate Operating condition</option>
                             <option value="Neglect of completion of life">Neglect of completion of life</option>
                             <option value="Design Flaws">Design Flaws</option>
                             <option value="Skill up">Skill up</option>
                             <option value="Inadequate basic condition">Inadequate basic condition</option>
                             <option value="Open">Open</option>
                             
                             </select>
						</td>
						<td><select id="failure_code-1" name="failure_code-1" class="chosen-select">
                             <option value="Power Failure">Power Failure</option>
                             <option value="Clogged">Clogged</option>
                             <option value="Broken">Broken</option>
                             <option value="Leak">Leak</option>
                             <option value="Lack of Lubrication">Lack of Lubrication</option>
                             <option value="Abnormal Condition">Abnormal Condition</option>
                             <option value="Irregular temp.">Irregular temp.</option> 
                             <option value="Loose">Loose</option> 
                             <option value="Wear">Wear</option> 
                             <option value="Crack">Crack</option>
                             <option value="Bend">Bend</option>
                             <option value="Damaged">Damaged</option>
                             <option value="Tight/Rusty/Jam">Tight/Rusty/Jam</option>
                             <option value="Disengaged">Disengaged</option>
                             <option value="Entangled">Entangled</option>
                             <option value="Deteriation">Deteriation</option>
                             <option value="Dry Solder">Dry Solder</option>
                             <option value="PCB Failure">PCB Failure</option>
                             <option value="Burnt">Burnt</option> 
                             <option value="Setting Error">Setting Error</option> 
                             <option value="Operating Error">Operating Error</option> 
                             <option value="Misalignment">Misalignment</option> 
                             <option value="Accident">Accident</option> 
                             <option value="Short Circuit">Short Circuit</option> 
                             <option value="Open Circuit">Open Circuit</option> 
                             <option value="Pressure Drop">Pressure Drop</option> 
                             <option value="Blown Off">Blown Off</option> 
                             <option value="Program Currupt">Program Currupt</option> 
                            <option value="Poor Contact">Poor Contact</option>
                             <option value="Poor Insulation">Poor Insulation</option>
                            <option value="Tripped">Tripped</option>
                            <option value="Wire Broken">Wire Broken</option>
                           <option value="Air Lock">Air Lock</option>
                           <option value="Poor Adjustment">Poor Adjustment</option>
                           <option value="Noisy">Noisy</option>
                           <option value="Low Level">Low Level</option>
                           <option value="Wrong Wiring">Wrong Wiring</option>
                           <option value="Slip">Slip</option>
                          <option value="Earthing">Earthing</option>
                          <option value="M/c Level">M/c Level</option>
                      
                             </select>
						</td>
							<td><textarea id="counter_measure-1"   name="counter_measure-1"></textarea>
						</td>
						<td><select id="category-1" name="category-1" class="chosen-select">
                                 <option value="E">E</option>
                                 <option value="M">M</option>
                             
                         </select>
						</td>
						<td><select id="recurnonrecurr-1" name="recurnonrecurr-1" class="chosen-select">
                                 <option value="R">R</option>
                                 <option value="NR">NR</option>
                        </select>
						</td>
							<td><textarea id="linkage_with-1"   name="linkage_with-1"></textarea>
						</td>
						
						<td><input id="prevOccDate-1" type="date" name="prevOccDate-1" format="dd-MM-yyyy"/>
						</td>
						<td><input id="repairedBy-1" type="text" name="repairedBy-1" />
						</td>
					
						<td><textarea id="idea-1"   name="idea-1"></textarea>
						</td>
						<td><input id="preparedBy-1" type="text" name="preparedBy-1" />
						</td>
						<td><input id="mgrorhead-1" type="text" name="mgrorhead-1" />
						</td>
						<td><input id="subcommMember-1" type="text" name="subcommMember-1" />
						</td>
						<td><select id="status-1" name="status-1" class="chosen-select">
                                 <option value="0">Closed</option>
                                 <option value="1">Open</option>
                        </select>
						</td>
						<td><textarea id="ref_no-1"   name="ref_no-1">${refNo}</textarea>
						</td>
						<td><textarea id="sap_notif_no-1"   name="sap_notif_no-1"></textarea>
						</td>
						 <td>   <a href="#" onclick="addBreakdown(-1)"><i class="fa fa-save" style="font-size:24px"></i></a>

                          </td> 
						</tr>
						<c:forEach items="${whyWhyF18List}"  var="whyWhyF18" varStatus="count" >
						
						<tr>
						  <input type="hidden" name="id${count.index}" id="id${count.index}" value="${whyWhyF18.id}"/>			
<%-- 						<input type="hidden" name="machine_id${count.index}" id="machine_id${count.index}" value="${machineId}"/>
 --%>						
						<td>${count.index+1}</td>
						<td><input id="month${count.index}" type="month" name="month${count.index}" value="${whyWhyF18.month}"/>
						</td>
						<td><input id="date${count.index}" type="date" name="date${count.index}" value="${whyWhyF18.date}"/>
						</td>
						<td><%-- <textarea id="dept${count.index}"   name="dept${count.index}">${whyWhyF18.dept}</textarea> --%>
						<select id="dept${count.index}" name="dept${count.index}" class="chosen-select" required>
						 <option value="">Select Department</option>
						 <c:choose><c:when test="${whyWhyF18.dept eq '1'}">
						         <option value="1" selected>M/C Shop</option>
                                 <option value="2" disabled>mHawk</option>
                                 <option value="3" disabled>NEF-mDI</option>
						 </c:when>
						 <c:when test="${whyWhyF18.dept eq '2'}">
						         <option value="1" disabled>M/C Shop</option>
                                 <option value="2"selected>mHawk</option>
                                 <option value="3" disabled>NEF-mDI</option>
						 </c:when>
						 <c:when test="${whyWhyF18.dept eq '3'}">
						         <option value="1" disabled>M/C Shop</option>
                                 <option value="2" disabled>mHawk</option>
                                 <option value="3"selected>NEF-mDI</option>
						 </c:when>
						 <c:otherwise>
						   <option value="1" >M/C Shop</option>
                                 <option value="2" >mHawk</option>
                                 <option value="3">NEF-mDI</option>
						 </c:otherwise>
						 </c:choose>
                                
                        </select>
						</td>
						<td>
						<select id="cellcircle${count.index}" class="chosen-select" name="cellcircle${count.index}" onchange="calculateEngineLoss(${count.index})" required>
						 <option value="">Select Cell/Circle</option>
						 <c:choose><c:when test="${whyWhyF18.cellCircle eq 'HL'}">
						         <option value="HL" selected>HeadLine</option>
                                 <option value="BL">BlockLine</option>
                                 <option value="CL">CamLine</option>
						 </c:when>
						 <c:when test="${whyWhyF18.cellCircle eq 'BL'}">
						         <option value="HL" >HeadLine</option>
                                 <option value="BL"selected>BlockLine</option>
                                 <option value="CL">CamLine</option>
						 </c:when>
						 <c:when test="${whyWhyF18.cellCircle eq 'CL'}">
						         <option value="HL" >HeadLine</option>
                                 <option value="BL">BlockLine</option>
                                 <option value="CL"selected>CamLine</option>
						 </c:when>
						 <c:otherwise>
						   <option value="HL" >HeadLine</option>
                                 <option value="BL">BlockLine</option>
                                 <option value="CL">CamLine</option>
						 </c:otherwise>
						 </c:choose>
                                
                        </select>
						</td>
						<td><%-- <textarea id="machine_no${count.index}"   name="machine_no${count.index}">${whyWhyF18.machineNo}</textarea> --%>
						<select data-placeholder="Choose Machine" class="chosen-select"
								 tabindex="6" id="machine_id${count.index}"
								name="machine_id${count.index}" required>

								 <option value="">Choose Machine</option>
                                  <c:forEach items="${machineList}" var="machineList">
                                  <c:choose>
                                  <c:when test="${machineList.machinId==whyWhyF18.machineId}">
                                  <option value="${machineList.machinId}" selected>${machineList.machinNo}-${machineList.machinName}</option>
                                  
                                  </c:when>
                                  <c:otherwise>
                                  <option value="${machineList.machinId}">${machineList.machinNo}-${machineList.machinName}</option>
                                  
                                  </c:otherwise>
                                  </c:choose>
                                  
                                  </c:forEach>   
							</select>
						
						</td>
						<td><select id="rank${count.index}" name="rank${count.index}" class="chosen-select" required>
						 <option value="" >Select Rank</option>
						        <c:choose>
						        <c:when test="${whyWhyF18.rank==1}">
						         <option value="1" selected>A</option>
                                 <option value="2">B</option>
                                <option value="3">C</option>
						        </c:when>
						         <c:when test="${whyWhyF18.rank==2}">
						          <option value="1" >A</option>
                                 <option value="2"selected>B</option>
                                <option value="3">C</option>
						         </c:when>
						         <c:when test="${whyWhyF18.rank==3}">
						          <option value="1" >A</option>
                                 <option value="2">B</option>
                                <option value="3"selected>C</option>
						         </c:when>
						         <c:otherwise>
						         
						         <option value="1" >A</option>
                                 <option value="2">B</option>
                                <option value="3">C</option>
						         </c:otherwise>
						        </c:choose>
                                
                        </select></td>
						<td><textarea id="problem_reported${count.index}"   name="problem_reported${count.index}">${whyWhyF18.problemReported}</textarea>
						</td>
						<td><input id="repairStartTime${count.index}" onblur="onTimeChange(${count.index})" type="time" name="repairStartTime${count.index}" value="${whyWhyF18.repairStartTime}"/>
						</td>
						<td><input id="repairFinishTime${count.index}" onblur="onTimeChange(${count.index})" type="time" name="repairFinishTime${count.index}" value="${whyWhyF18.repairFinishTime}"/>
						</td>
						<td><textarea id="bd_time_loss${count.index}" name="bd_time_loss${count.index}" onchange="calculateEngineLoss(${count.index})">${whyWhyF18.bdTimeLoss}</textarea>
						</td>
						<td><textarea id="engine_loss${count.index}"   name="engine_loss${count.index}">${whyWhyF18.engineLoss}</textarea>
						</td>
						<td><select id="part${count.index}" class="chosen-select" name="part${count.index}">
						         <c:choose>
						         <c:when test="${whyWhyF18.partStatus eq 'Adjusted'}">
						          <option value="Adjusted" selected>Adjusted</option>
                                 <option value="Corrected">Corrected</option>
                                <option value="Replaced">Replaced</option>
						         </c:when>
						          <c:when test="${whyWhyF18.partStatus eq 'Corrected'}">
						          <option value="Adjusted" >Adjusted</option>
                                 <option value="Corrected"selected>Corrected</option>
                                <option value="Replaced">Replaced</option>
						         </c:when>
						          <c:when test="${whyWhyF18.partStatus eq 'Replaced'}">
						          <option value="Adjusted" >Adjusted</option>
                                 <option value="Corrected">Corrected</option>
                                <option value="Replaced" selected>Replaced</option>
						         </c:when>
						         <c:otherwise>
						           <option value="Adjusted">Adjusted</option>
                                   <option value="Corrected">Corrected</option>
                                   <option value="Replaced">Replaced</option>
						         </c:otherwise>
						         </c:choose>
                               
                        </select>
					
						</td>
						<td><textarea id="part_desc${count.index}"   name="part_desc${count.index}">${whyWhyF18.partDesc}</textarea>
						</td>
						<td><select id="bd_ms_pt${count.index}" class="chosen-select" name="bd_ms_pt${count.index}">
						         <c:choose>
						         <c:when test="${whyWhyF18.bdMsPt eq 'BD'}">
						            <option value="BD" selected>BD</option>
						            <option value="MS">MS</option>
						            <option value="PT">PT</option>
						         </c:when>
						           <c:when test="${whyWhyF18.bdMsPt eq 'MS'}">
						             <option value="BD" >BD</option>
						            <option value="MS" selected>MS</option>
						             <option value="PT">PT</option>
						         </c:when>
						          <c:when test="${whyWhyF18.bdMsPt eq 'PT'}">
						               <option value="BD" >BD</option>
						            <option value="MS">MS</option>
						            <option value="PT" selected>PT</option>
						         </c:when>
						         </c:choose>
                              
                        </select>
						</td>
						<td><textarea id="action${count.index}"   name="action${count.index}">${whyWhyF18.action}</textarea>
						</td>
						<td><textarea id="why1${count.index}"   name="why1${count.index}">${whyWhyF18.why1}</textarea>
						</td>
						<td><textarea id="why2${count.index}"   name="why2${count.index}">${whyWhyF18.why2}</textarea>
						</td>
						<td><textarea id="why3${count.index}"   name="why3${count.index}">${whyWhyF18.why3}</textarea>
						</td>
						<td><textarea id="why4${count.index}"   name="why4${count.index}">${whyWhyF18.why4}</textarea>
						</td>
						<td><textarea id="why5${count.index}"   name="why5${count.index}">${whyWhyF18.why5}</textarea>
						</td>
						<td><textarea id="root_cause${count.index}"   name="root_cause${count.index}">${whyWhyF18.rootCause}</textarea>
						</td>
						<td><select id="clarification_cause${count.index}" class="chosen-select" name="clarification_cause${count.index}">
						        <c:forEach var="entry" items="${clarificationOfCauseList}">
						        <c:choose>
						        <c:when test="${entry.key eq whyWhyF18.clarificationOfCause}">
                                <option value="${entry.key}" selected>${entry.value}</option>
                                </c:when>
                                <c:otherwise>
                                <option value="${entry.key}">${entry.value}</option>
                                </c:otherwise>
                             </c:choose>
                                
                          </c:forEach>
                             
                             </select>
						</td>
						<td><select id="failure_code${count.index}" class="chosen-select" name="failure_code${count.index}">
						
						<c:forEach var="entry" items="${failureCodeList}">
                            <c:choose>
						        <c:when test="${whyWhyF18.failureCode eq entry.key}">
                                <option value="${entry.key}" selected>${entry.value}</option>
                                </c:when>
                                <c:otherwise>
                                <option value="${entry.key}">${entry.value}</option>
                                </c:otherwise>
                       </c:choose>
                               
                        </c:forEach>

                      
                             </select>
						</td>
							<td><textarea id="counter_measure${count.index}"   name="counter_measure${count.index}">${whyWhyF18.counterMeasure}</textarea>
						</td>
						<td><select id="category${count.index}" class="chosen-select" name="category${count.index}">
						   <c:choose>
						        <c:when test="${whyWhyF18.category eq 'E'}">
                                 <option value="E" selected>E</option>
                                 <option value="M">M</option>
                                 </c:when>
                                   <c:when test="${whyWhyF18.category eq 'M'}">
                                   <option value="E" >E</option>
                                   <option value="M" selected>M</option>
                                 </c:when>
                              
                           </c:choose>
                             
                         </select>
						</td>
						<td><select id="recurnonrecurr${count.index}"  class="chosen-select" name="recurnonrecurr${count.index}">
						   <c:choose>
						        <c:when test="${whyWhyF18.recurNonRecurr eq 'R'}">
                                 <option value="R" selected>R</option>
                                 <option value="NR">NR</option>
                                 </c:when>
                                  <c:when test="${whyWhyF18.recurNonRecurr eq 'NR'}">
                                 <option value="R" >R</option>
                                 <option value="NR" selected>NR</option>
                                 </c:when>
                                 
                            </c:choose>     
                        </select>
						</td>
							<td><textarea id="linkage_with${count.index}"   name="linkage_with${count.index}">${whyWhyF18.linkageWith}</textarea>
						</td>
								<td><input id="prevOccDate${count.index}" type="date" name="prevOccDate${count.index}" format="dd-MM-yyyy" value="${whyWhyF18.prevOccDate}"/>
						</td>
						<td><input id="repairedBy${count.index}" type="text" name="repairedBy${count.index}" value="${whyWhyF18.repairedBy}"/>
						</td>
						
						<td><textarea id="idea${count.index}"   name="idea${count.index}">${whyWhyF18.idea}</textarea>
						</td>
						<td><input id="preparedBy${count.index}" type="text" name="preparedBy${count.index}" value="${whyWhyF18.preparedBy}" />
						</td>
						<td><input id="mgrorhead${count.index}" type="text" name="mgrorhead${count.index}" value="${whyWhyF18.mgrorhead}"/>
						</td>
						<td><input id="subcommMember${count.index}" type="text" name="subcommMember${count.index}" value="${whyWhyF18.subcommMember}"/>
						</td>
						<td><select id="status${count.index}"  class="chosen-select" name="status${count.index}">
						   <c:choose>
						         <c:when test="${whyWhyF18.status eq '0'}">
                                 <option value="0" selected>Closed</option>
                                 <option value="1">Open</option>
                                 </c:when>
                                 <c:when test="${whyWhyF18.status eq '1'}">
                                 <option value="0" >Closed</option>
                                 <option value="1" selected>Open</option>
                                 </c:when>
                            </c:choose>     
                        </select>
						</td>
						<td><textarea id="ref_no${count.index}"   name="ref_no${count.index}">${whyWhyF18.refNo}</textarea>
						</td>
						<td><textarea id="sap_notif_no${count.index}"   name="sap_notif_no${count.index}">${whyWhyF18.sapNotifNo}</textarea>
						</td>
						 <td>   <a href="#" onclick="addBreakdown(${count.index})"><i class="fa fa-save" style="font-size:24px"></i></a>
                               
                               <a href="${pageContext.request.contextPath}/viewBreakdown/${whyWhyF18.id}/${whyWhyF18.machineType}"><i class="glyphicon glyphicon-file" style="font-size:18px"></i></a>
                          </td> 
						</tr>
						
						</c:forEach>
						</tbody>
			
					  </table>
					</div>
				

				</div>
				<!-- //tables -->
			</div>			</form>	     
				</div>

			</div>

		</div>
	</div>
	<!-- END Main Content -->
	 


	<!-- <a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a> -->
	</div>
                    	 
						 
	 
		 
		   
	  <!--//w3-agileits-pane-->	
<!-- script-for sticky-nav -->
<!-- 		<script>
		$(document).ready(function() {
			 var navoffeset=$(".header-main").offset().top;
			 $(window).scroll(function(){
				var scrollpos=$(window).scrollTop(); 
				if(scrollpos >=navoffeset){
					$(".header-main").addClass("fixed");
				}else{
					$(".header-main").removeClass("fixed");
				}
			 });
			 
		});
		</script> -->
		<!-- /script-for sticky-nav -->
<!--inner block start here-->
<div class="inner-block">

</div>
<!--inner block end here-->
<!--copy rights start here-->
<!-- <div class="copyrights">
		 <p>© 2017-18 . All Rights Reserved |  <a href="www.mahindra.com/" target="_blank">Mahindra rise</a> </p></div>	
</div>	 -->
<!--COPY rights end here-->
</div>
</div>
  <!--//content-inner-->
			<!--/sidebar-menu-->
				
 <jsp:include page="/WEB-INF/views/include/left.jsp"></jsp:include>





							  <div class="clearfix"></div>		
							</div>
							<!-- <script>
							var toggle = true;
										
							$(".sidebar-icon").click(function() {                
							  if (toggle)
							  {
								$(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
								$("#menu span").css({"position":"absolute"});
							  }
							  else
							  {
								$(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
								setTimeout(function() {
								  $("#menu span").css({"position":"relative"});
								}, 400);
							  }
											
											toggle = !toggle;
										});
							</script> -->
<!--js -->
<script src="${pageContext.request.contextPath}/resources/home/js/jquery.nicescroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/home/js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
   <script src="${pageContext.request.contextPath}/resources/home/js/bootstrap.min.js"></script>
   <!-- /Bootstrap Core JavaScript -->	   
<!-- morris JavaScript -->	
<script src="${pageContext.request.contextPath}/resources/home/js/raphael-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/home/js/morris.js"></script>
<script type="text/javascript">
function addBreakdown(key)
{
	var isValid=validation(key);
	if(isValid==true)
	{
	 if (confirm("Do you want to Save this record?")) {
	
	    document.getElementById('key').value=key;
		document.forms["breakdown_form"].submit();
		}
	 }
}
</script>
<script type="text/javascript">
function validation(key) {
	var date = $("#date"+key).val();	

	var month = $("#month"+key).val();
	var dept = $("#dept"+key).val();
	var cellCircle=$("#cellcircle"+key).val();
	var machineNo=$("#machine_no"+key).val();
	var rank=$("#rank"+key).val();
	var problemReported=$("#problem_reported"+key).val();
	var bdTimeLoss=$("#bd_time_loss"+key).val();
	var engineLoss=$("#engine_loss"+key).val();
	var part=$("#part"+key).val();
	var partDesc=$("#part_desc"+key).val();
	var bdMsPt=$("#bd_ms_pt"+key).val();
	var action=$("#action"+key).val();
	var refNo=$("#ref_no"+key).val();
	
	var isValid = true;
	if (month==""||month==null) { 
		isValid = false;
		alert("Please Select Valid Month");
	} else if ( date==""||date==null) {
		isValid = false;
		alert("Please Select Valid Date");
	} else if ( dept==""||dept==null) {
		isValid = false;
		alert("Please Enter Valid Department");
	} else if ( cellCircle==""||cellCircle==null) {
		isValid = false;
		alert("Please Enter Valid Cell Circle");
	} else if (rank==""||rank==null) {
		isValid = false;
		alert("Please Select Rank");
	} else if ( problemReported==""||problemReported==null) {
		isValid = false;
		alert("Please Enter Valid Problem Reported");
	} else if (bdTimeLoss==""||bdTimeLoss==null||isNaN(bdTimeLoss)) {
		isValid = false;
		alert("Please Enter Valid BD/TIME/LOSS");
	} else if (engineLoss==""||engineLoss==null||isNaN(engineLoss)) {
		isValid = false;
		alert("Please Enter Valid Engine Loss");
	}
	return isValid;
}
</script>

<script type="text/javascript">
function onMacTypeChange(machineType) {

	$.getJSON('${getMachinByType}', {

		machineType : machineType,

		ajax : 'true'

	}, function(data) {

		var html = '<option value="" selected >Choose Machine</option>';

		

		var len = data.length;

		$('#machineId')

	    .find('option')

	    .remove()

	    .end()

			

	    	//alert(len);
	    $("#machineId").append(

                   $("<option ></option>").attr(

                       "value", "").text("Select Machine Name Or Number")

               );

		for ( var i = 0; i < len; i++) {

			

			 $("#machineId").append(

                       $("<option ></option>").attr(

                           "value", data[i].machinId).text(data[i].machinNo+" "+data[i].machinName)

                   );

		} 
		
		$("#machineId").trigger("chosen:updated");

	});

}


</script>
	<script type="text/javascript">
	function setMachineSelected(machineType,machineId)
	{
		
		$.getJSON('${getMachinByType}', {
			machineType : machineType,
			ajax : 'true'

		}, function(data) {
			var html = '<option value="" selected >Choose Machine</option>';

			var len = data.length;

			$('#machineId')

		    .find('option')

		    .remove()

		    .end()

		    $("#machineId").append(

                       $("<option ></option>").attr(

                           "value", "").text("Select Machine Name Or Number")

                   );

			for ( var i = 0; i < len; i++) {

				if(data[i].machinId==machineId)
					{
				 $("#machineId").append(

                           $("<option selected></option>").attr(

                               "value", data[i].machinId).text(data[i].machinNo+" "+data[i].machinName)

                       );
					}else{
					 $("#machineId").append(

	                           $("<option ></option>").attr(

	                               "value", data[i].machinId).text(data[i].machinNo+" "+data[i].machinName)

	                       );
					
					}
			} 
			
			$("#machineId").trigger("chosen:updated");

		});
		
		
	}
	</script>
	<script type="text/javascript">
	 function onMachineChange(machineId)
	{
		$.getJSON('${getMachineById}', {

			machineId : machineId,

			ajax : 'true'

		}, function(data) {
			
			document.getElementById('machine_no-1').value=data.machinNo;
		});
	} 
	</script>
	<script type="text/javascript">
	
	function calculateEngineLoss(key)
	{
		var cc=$("#cellcircle"+key).val();

		var bdTimeLoss=parseInt($("#bd_time_loss"+key).val());
		
		if(cc=='HL')
			{
			   var engineLoss=parseFloat((bdTimeLoss/2.27)*0.23);
			   document.getElementById('engine_loss'+key).value=engineLoss.toFixed(1);
			}
		else if(cc=='BL')
			{
			   var engineLoss=parseFloat((bdTimeLoss/2.30)*0.177);
			   document.getElementById('engine_loss'+key).value=engineLoss.toFixed(1);

			}
		else if(cc=='CL')
			{
			   var engineLoss=parseFloat((bdTimeLoss/2)*0.015);
			   document.getElementById('engine_loss'+key).value=engineLoss.toFixed(1);

			}
	
	}
	</script>
	

<!----------------------------------------Dropdown With Search----------------------------------------------- -->
	<%-- <script
		src="${pageContext.request.contextPath}/resources/customerBill/jquery-3.2.1.min.js"
		type="text/javascript"></script> --%>
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/chosen.jquery.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/init.js"
		type="text/javascript" charset="utf-8"></script>
		
<script>
function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("table");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}

</script>
<script type="text/javascript">
function onTimeChange(key) {

var repairStartTime=$("#repairStartTime"+key).val();
var repairFinishTime=$("#repairFinishTime"+key).val();

	var startDate = new Date("January 1, 1970 " + repairStartTime);
	var endDate = new Date("January 1, 1970 " + repairFinishTime);
	var timeDiff = Math.abs(startDate - endDate);
	var mm = Math.floor(timeDiff/1000/60);
    document.getElementById('bd_time_loss'+key).value=mm;

}
</script>
</body>

</html>