<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
	
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
textarea{
overflow:auto;
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
  
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 60%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>


<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/customerBill/chosen.css">
  
</head>
<body onload="setMachineSelected(${machineType},${machineId},${listSize},${approveStatus},${sessionScope.userDetail.type})">
     <div class="page-container">
   
   <!--/content-inner-->
<div class="left-content">
	   <div class="mother-grid-inner"> 
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

 <c:url var="importExcel2" value="/importExcel2"></c:url>
    <c:url var="getMachinByType" value="/getMachinByType"></c:url>
    <c:url var="getActivityByMachin" value="/getActivityByMachin"></c:url>
    <c:url var="getItemByActivity" value="/getItemByActivity"></c:url>
    <c:url var="getCheckPointsByItem" value="/getCheckPointsByItem"></c:url>
    <c:url var="getCheckRecordAgistMachine" value="/getCheckRecordAgistMachine"></c:url>
    <c:url var="insertPMRecord" value="/insertPMRecord"></c:url> 
  
              <div id="main-content">
			<!-- BEGIN Page Title -->
			
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>  Preventive Maintenance
							</h3>
							<div class="box-tool">
						
						</div>

						<div class="box-content">
							<form action="${pageContext.request.contextPath}/searchPaMaintainenceList"  class="form-horizontal"
							 id="validation-form"
										enctype="multipart/form-data" method="get">
                   
					<div class="form-group">
									<label class="col-md-2">Machine Type</label>
									<div class="col-md-3">
							<select data-placeholder="Choose Machine Type"  
								 class="chosen-select"  id="machineType"
								name="machineType" required onchange="onMacTypeChange(this.value)">

								<option value="" >Choose Machine Type</option>
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
						<!-- </div>
								<div class="form-group"> -->
									<label class="col-md-2">Machine name/No.</label>
									<div class="col-md-3">
								<select data-placeholder="Choose Machine"
								 class="chosen-select" tabindex="6" id="machineId"
								name="machineId" required>
								<option value=""selected disabled="disabled">Choose Machine</option>

							</select>
						</div>
														<a href="${pageContext.request.contextPath}/showInsertPmPlan">	Insert M/C Schedule</a> 
									
						<!-- </div>
					
					<div class="row" align="center"> -->
						<div class="col-sm-9 col-sm-offset-4 col-lg-1 col-lg-offset-5">
							<button type="submit" class="btn btn-info" id="submitbtn">Search</button>  
							
						</div>
						<div class="ol-sm-9 col-sm-offset-4 col-lg-1 col-lg-offset-4">
						<a href="${pageContext.request.contextPath}/showPmPlanHistory">	<button type="button" class="btn btn-success">PM History</button> </a> 
						
						</div>
					</div>
		</form>
					<div class="agile-grids" >	
				
				<div class="agile-tables">
					<div class="w3l-table-info" style="overflow-x:auto; height:450px">
					
					    <table id="table"  style="border: 1px;"><!-- class="table table-inverse table-bordered" -->
						<thead>
						 <tr  style="height: 5px;">
                            <td colspan="5" bgcolor="#f3fafe"></td>
                            <td colspan="9"bgcolor="#f3fafe" style="text-align:center;">Frequency 4 Months</td>
                         
                         </tr>
						 <tr style="height: 5px;">
                            <td colspan="5" bgcolor="#f3fafe"></td>
                           <c:choose>
                           <c:when test="${status==1}">
                            <td colspan="3"bgcolor="#f3fafe" style="text-align:center;">
                            			
			<fmt:parseDate value="${schedule.fMonth}" dateStyle="long" pattern="M" var="monthDate"></fmt:parseDate> 
<fmt:formatDate value="${monthDate}" pattern="MMMM"></fmt:formatDate>
                            </td>
                             <td colspan="3" bgcolor="#f3fafe" style="text-align:center;">
                             <fmt:parseDate value="${schedule.sMonth}" dateStyle="long" pattern="M" var="monthDate1"></fmt:parseDate> 
<fmt:formatDate value="${monthDate1}" pattern="MMMM"></fmt:formatDate>
                             </td>
                            <td colspan="3" bgcolor="#f3fafe" style="text-align:center;">
                             <fmt:parseDate value="${schedule.tMonth}" dateStyle="long" pattern="M" var="monthDate2"></fmt:parseDate> 
<fmt:formatDate value="${monthDate2}" pattern="MMMM"></fmt:formatDate>
                            </td>
                           </c:when>
                             <c:when test="${status==2}">
                            <td colspan="3"bgcolor="#f3fafe" style="text-align:center;">
                             <fmt:parseDate value="${schedule.fMonth}" dateStyle="long" pattern="M" var="monthDate3"></fmt:parseDate> 
<fmt:formatDate value="${monthDate3}" pattern="MMMM"></fmt:formatDate>
                            </td>
                             <td colspan="3" bgcolor="#f3fafe" style="text-align:center;">
                             <fmt:parseDate value="${schedule.sMonth}" dateStyle="long" pattern="M" var="monthDate4"></fmt:parseDate> 
<fmt:formatDate value="${monthDate4}" pattern="MMMM"></fmt:formatDate>
                             </td>
                            <td colspan="3" bgcolor="#f3fafe" style="text-align:center;"hidden>
                              <fmt:parseDate value="${schedule.tMonth}" dateStyle="long" pattern="M" var="monthDate5"></fmt:parseDate> 
<fmt:formatDate value="${monthDate5}" pattern="MMMM"></fmt:formatDate>
                            </td>
                           </c:when>
                             <c:when test="${status==3}">
                            <td colspan="3"bgcolor="#f3fafe" style="text-align:center;">
                             <fmt:parseDate value="${schedule.fMonth}" dateStyle="long" pattern="M" var="monthDate6"></fmt:parseDate> 
<fmt:formatDate value="${monthDate6}" pattern="MMMM"></fmt:formatDate>
                            </td>
                             <td colspan="3" bgcolor="#f3fafe" style="text-align:center;"hidden>Month</td>
                            <td colspan="3" bgcolor="#f3fafe" style="text-align:center;"hidden>Month</td>
                           </c:when>
                           <c:otherwise>
                               <td colspan="3"bgcolor="#f3fafe" style="text-align:center;" hidden>Month</td>
                             <td colspan="3" bgcolor="#f3fafe" style="text-align:center;" hidden>Month</td>
                            <td colspan="3" bgcolor="#f3fafe" style="text-align:center;" hidden>Month</td>
                         
                           </c:otherwise>
                           </c:choose>
                          
                         </tr>
						  <tr>
							<th>Sr.No</th>
							<th>Activity_Done_In</th>
							<th>Item(What)</th>
							<th>Checkpoints</th>
							<th>Method(How)</th>
							<th hidden>Required Value</th>
					 <c:choose>
                           <c:when test="${status==1}">
							<th>Date</th>
							<th>Observation/Action</th> 
							<th>Image1</th> 
							<th>Date</th>
							<th>Observation/Action</th> 
							<th>Image2</th> 
							<th>Date</th>
							<th>Observation/Action</th>
							<th>Image3</th> 
							</c:when>
						 <c:when test="${status==2}">
						    <th >Date</th>
							<th >Observation/Action</th> 
							<th >Image1</th> 
							<th>Date</th>
							<th>Observation/Action</th> 
							<th>Image2</th> 
							<th hidden>Date</th>
							<th hidden>Observation/Action</th>
							<th hidden>Image3</th> 
						 </c:when>
						 <c:when test="${status==3}">
						    <th >Date</th>
							<th >Observation/Action</th> 
							<th >Image1</th> 
							<th hidden>Date</th>
							<th hidden>Observation/Action</th> 
							<th hidden>Image2</th> 
							<th hidden>Date</th>
							<th hidden>Observation/Action</th>
							<th hidden>Image3</th> 
						 </c:when>
						 <c:otherwise>
						 <th hidden>Date</th>
							<th hidden>Observation/Action</th> 
							<th hidden>Image1</th> 
							<th hidden>Date</th>
							<th hidden>Observation/Action</th> 
							<th hidden>Image2</th> 
							<th hidden>Date</th>
							<th hidden>Observation/Action</th>
							<th hidden>Image3</th> 
						 </c:otherwise>
						 </c:choose>
							<th>Remark</th>
							<th>Action</th>
						  </tr>
						</thead>
						<tbody>
										
						<c:set var="cnt1" value="0"/>
                        <c:forEach var="entry" items="${actTypes}">
						 <tr >
							<td colspan="16" style="text-align:center;"><c:out value="${entry.value}"/></td>
						  </tr>
					<c:forEach items="${paMaintainenceList}" var="paMaintainence" varStatus="count">
			<form action="${pageContext.request.contextPath}/insertPMRecord"  class="form-horizontal" name="pm_form" enctype="multipart/form-data" method="post">	
				<input type="hidden" name="machine_id" id="machine_id" value="${machineId}"/>
                <input type="hidden" name="machine_type" id="machine_type" value="${machineType}"/>
						<c:choose>
						<c:when test="${entry.key==paMaintainence.int2}">
						<c:set var="cnt1" value="${cnt1+1}"/>
					 <%-- 	<input type="hidden" id="key" name="key"value="${count.index}"/>  --%>
						    <input type="hidden" name="check_point_id" id="check_point_id"  value="${paMaintainence.checkPointId}"/>
						    <input type="hidden" name="pa_maint_id" id="pa_maint_id" value="${paMaintainence.paMaintId}"/>
						    <input type="hidden" name="activity_id" id="activity_id" value="${paMaintainence.activityId}"/>
						    <input type="hidden" name="item_id" id="item_id" value="${paMaintainence.itemId}"/>
						 <input type="hidden" name="ph1" id="ph1" value="${paMaintainence.date1Photo}"/>
						 <input type="hidden" name="ph2" id="ph2" value="${paMaintainence.date2Photo}"/>
						 <input type="hidden" name="ph3" id="ph3" value="${paMaintainence.date3Photo}"/>
							 <input type="hidden" name="int1" id="int1" value="${paMaintainence.int1}"/>
						   	 <input type="hidden" name="int3" id="int3" value="${paMaintainence.int3}"/>
						   	 	 <input type="hidden" name="string1" id="string1" value="${paMaintainence.string1}"/>
						   	 <input type="hidden" name="string2" id="string2" value="${paMaintainence.string2}"/>						   					    
						  <tr>
							<td><c:out value="${cnt1}" /> </td>
							<td width="300" > <c:out value="${paMaintainence.activityName}" /></td>
						    <td ><c:out value="${paMaintainence.itemName}" /></td>
							 <td ><c:out value="${paMaintainence.checkPointName}" /></td>
							 <td><select name="method_id" id="method_id${cnt1}"  class="chosen-select"  required>
							   <option value="">Select Method</option>
							    <c:choose>
							    <c:when test="${paMaintainence.method==1}">
							     <option value="1" selected>Visually</option>
                               <option value="2">Physically</option>
							    </c:when>
							    <c:when test="${paMaintainence.method==2}">
							     <option value="1" >Visually</option>
                               <option value="2"selected>Physically</option>
							    </c:when>
							    <c:otherwise>
							     <option value="1" >Visually</option>
                               <option value="2">Physically</option>
							    </c:otherwise>
							    </c:choose>
                             </select></td>
						
							  <td hidden><select name="req_value" id="req_value"  class="chosen-select" >						
                        <option value="">Select Required Value</option>
						<c:forEach items="${requiredValueList}" var="requiredValue" varStatus="cnt">
					    <c:choose>
						    <c:when test="${paMaintainence.rquiredValure==requiredValue.requiredValueId}">
						      <option value="${requiredValue.requiredValueId}" selected>${requiredValue.requiredValue}</option>
						    </c:when>
						    <c:otherwise>
						   	 <option value="${requiredValue.requiredValueId}">${requiredValue.requiredValue}</option>
						    </c:otherwise>
						</c:choose>
                            
                       </c:forEach>
                             </select></td>
                             	 <c:choose>
                           <c:when test="${status==1}">
                        <td ><input type="date" name="date1" id="date1${cnt1}" class="form-control"  placeholder="dd-mm-yyyy"  style="width:200px;" value="${paMaintainence.date1}"/></td>
							
							<td ><textarea rows="1" cols="20" name="date1ob" id="date1ob${cnt1}" class="form-control">${paMaintainence.date1Obervation}
</textarea></td>
							<td ><input type="file" id="myFile1${cnt1}" name="myFile1" value="${paMaintainence.date1Photo}" >
							<c:choose><c:when test="${!empty paMaintainence.date1Photo}">
							<a href="#"data-lightbox="image-1"tabindex="-1" onclick="openImage('${url}${paMaintainence.date1Photo}')" ><c:out value='Image1' /></a>
							</c:when>
							
							</c:choose>
</td>
                             <td><input type="date" name="date2" id="date2${cnt1}" placeholder="dd-mm-yyyy" class="form-control" style="width:200px;" value="${paMaintainence.date2}"/></td>

							<td><textarea rows="1" cols="20" name="date2ob" id="date2ob${cnt1}" class="form-control">${paMaintainence.date2Obervation}
</textarea></td>
							<td><input type="file" id="myFile2${cnt1}" name="myFile2" value="${paMaintainence.date2Photo}" >
								<c:choose><c:when test="${!empty paMaintainence.date2Photo}">
							<a href="#"data-lightbox="image-1"tabindex="-1"  onclick="openImage('${url}${paMaintainence.date2Photo}')"><c:out value='Image2' /></a>
							</c:when>
							</c:choose>
							</td>
						
                             <td><input type="date" name="date3" id="date3${cnt1}" class="form-control" placeholder="dd-mm-yyyy"  style="width:200px;" value="${paMaintainence.date3}"/></td>
	<td><textarea rows="1" cols="20" name="date3ob" id="date3ob${cnt1}"class="form-control">${paMaintainence.date3Obervation}
</textarea></td>
							<td><input type="file" id="myFile3${cnt1}" name="myFile3" value="${paMaintainence.date3Photo}">
							<c:choose><c:when test="${!empty paMaintainence.date3Photo}"><a href="#"data-lightbox="image-1"tabindex="-1"  onclick="openImage('${url}${paMaintainence.date3Photo}')"><c:out value='Image3' /></a>
				 			</c:when></c:choose>
							</td>
							</c:when>
							<c:when test="${status==2}">
							  <td><input type="date" name="date1" id="date1${cnt1}" class="form-control"  placeholder="dd-mm-yyyy"  style="width:200px;" value="${paMaintainence.date1}"/></td>
							
							<td><textarea rows="1" cols="20" name="date1ob" id="date1ob${cnt1}" class="form-control">${paMaintainence.date1Obervation}
</textarea></td>
							<td><input type="file" id="myFile1${cnt1}" name="myFile1" value="${paMaintainence.date1Photo}" >
							<c:choose><c:when test="${!empty paMaintainence.date1Photo}">
							<a href="#" data-lightbox="image-1"tabindex="-1" onclick="openImage('${url}${paMaintainence.date1Photo}')"><c:out value='Image1' /></a>
							</c:when>
							
							</c:choose>
</td>
                             <td> <input type="date" name="date2" id="date2${cnt1}" placeholder="dd-mm-yyyy" class="form-control" style="width:200px;" value="${paMaintainence.date2}"/></td>

							<td><textarea rows="1" cols="20" name="date2ob" id="date2ob${cnt1}" class="form-control">${paMaintainence.date2Obervation}
</textarea></td>
							<td><input type="file" id="myFile2${cnt1}" name="myFile2" value="${paMaintainence.date2Photo}" >
								<c:choose><c:when test="${!empty paMaintainence.date2Photo}">
							<a href="#" data-lightbox="image-1"tabindex="-1" onclick="openImage('${url}${paMaintainence.date2Photo}')"><c:out value='Image2' /></a>
							</c:when>
							</c:choose>
							</td>
						
                             <td hidden><input type="date" name="date3" id="date3" class="form-control" placeholder="dd-mm-yyyy"  style="width:200px;" value="${paMaintainence.date3}"/></td>
	<td hidden><textarea rows="1" cols="20" name="date3ob" id="date3ob"class="form-control">${paMaintainence.date3Obervation}
</textarea></td>
							<td hidden><input type="file" id="myFile3" name="myFile3" value="${paMaintainence.date3Photo}">
							<c:choose><c:when test="${!empty paMaintainence.date3Photo}"><a href="#" data-lightbox="image-1"tabindex="-1"  onclick="openImage('${url}${paMaintainence.date3Photo}')"><c:out value='Image3' /></a>
							</c:when></c:choose>
							</td>
							</c:when>
							
							<c:when test="${status==3}">
							 <td ><input type="date" name="date1" id="date1${cnt1}" class="form-control"  placeholder="dd-mm-yyyy"  style="width:200px;" value="${paMaintainence.date1}"/></td>
							
							<td ><textarea rows="1" cols="20" name="date1ob" id="date1ob${cnt1}" class="form-control">${paMaintainence.date1Obervation}
</textarea></td>
							<td ><input type="file" id="myFile1${cnt1}" name="myFile1" value="${paMaintainence.date1Photo}" >
							<c:choose><c:when test="${!empty paMaintainence.date1Photo}">
							<a href="#" data-lightbox="image-1"tabindex="-1" onclick="openImage('${url}${paMaintainence.date1Photo}')">Image1</a>
							</c:when>
							
							</c:choose>
</td>
                             <td hidden><input type="date" name="date2" id="date2" placeholder="dd-mm-yyyy" class="form-control" style="width:200px;" value="${paMaintainence.date2}"/></td>

							<td hidden><textarea rows="1" cols="20" name="date2ob" id="date2ob" class="form-control">${paMaintainence.date2Obervation}
</textarea></td>
							<td hidden><input type="file" id="myFile2" name="myFile2" value="${paMaintainence.date2Photo}" >
								<c:choose><c:when test="${!empty paMaintainence.date2Photo}">
							<a href="#" data-lightbox="image-1"tabindex="-1"onclick="openImage('${url}${paMaintainence.date2Photo}')" ><c:out value='Image2' /></a>
							</c:when>
							</c:choose>
							</td>
						
                             <td hidden><input type="date" name="date3" id="date3" class="form-control" placeholder="dd-mm-yyyy"  style="width:200px;" value="${paMaintainence.date3}"/></td>
	<td hidden><textarea rows="1" cols="20" name="date3ob" id="date3ob"class="form-control">${paMaintainence.date3Obervation}
</textarea></td>
							<td hidden><input type="file" id="myFile3" name="myFile3" value="${paMaintainence.date3Photo}">
							<c:choose><c:when test="${!empty paMaintainence.date3Photo}"><a href="#" data-lightbox="image-1"tabindex="-1" onclick="openImage('${url}${paMaintainence.date3Photo}')"><c:out value='Image3' /></a>
							</c:when></c:choose>
							</td>
							</c:when>
							<c:otherwise>
							 <td hidden><input type="date" name="date1" id="date1" class="form-control"  placeholder="dd-mm-yyyy"  style="width:200px;" value="${paMaintainence.date1}"/></td>
							
							<td hidden><textarea rows="1" cols="20" name="date1ob" id="date1ob" class="form-control">${paMaintainence.date1Obervation}
</textarea></td>
							<td hidden><input type="file" id="myFile1" name="myFile1" value="${paMaintainence.date1Photo}" >
							<c:choose><c:when test="${!empty paMaintainence.date1Photo}">
							<a href="#"data-lightbox="image-1"tabindex="-1" onclick="openImage(${url}${paMaintainence.date1Photo})"><c:out value='Image8' /></a>
							</c:when>
							
							</c:choose>
</td>
                             <td hidden><input type="date" name="date2" id="date2" placeholder="dd-mm-yyyy" class="form-control" style="width:200px;" value="${paMaintainence.date2}"/></td>

							<td hidden><textarea rows="1" cols="20" name="date2ob" id="date2ob" class="form-control">${paMaintainence.date2Obervation}
</textarea></td>
							<td hidden><input type="file" id="myFile2" name="myFile2" value="${paMaintainence.date2Photo}" >
								<c:choose><c:when test="${!empty paMaintainence.date2Photo}">
							<a href="#" data-lightbox="image-1"tabindex="-1" onclick="openImage('${url}${paMaintainence.date2Photo}')"><c:out value='Image2' /></a>
							</c:when>
							</c:choose>
							</td>
						
                             <td hidden><input type="date" name="date3" id="date3" class="form-control" placeholder="dd-mm-yyyy"  style="width:200px;" value="${paMaintainence.date3}"/></td>
	<td hidden><textarea rows="1" cols="20" name="date3ob" id="date3ob"class="form-control">${paMaintainence.date3Obervation}
</textarea></td>
							<td hidden><input type="file" id="myFile3" name="myFile3" value="${paMaintainence.date3Photo}">
							<c:choose><c:when test="${!empty paMaintainence.date3Photo}"><a href="#" data-lightbox="image-1"tabindex="-1" onclick="openImage('${url}${paMaintainence.date3Photo}')"><c:out value='Image3' /></a>
							</c:when></c:choose>
							</td>
							
							</c:otherwise>
							</c:choose>
							
							
							<td>
						<textarea rows="1" cols="18" name="remark" id="remark${cnt1}" >${paMaintainence.remark}
</textarea></td>  	<td> <c:choose>
							<c:when test="${status==1 or status==2 or status==3}"><input type="submit" value="Submit" name="submit" class="btn btn-info"/>
</c:when><c:otherwise><input type="submit" value="Submit" name="submit" class="btn btn-info" disabled/>
</c:otherwise></c:choose></td> 
						</c:when>
						</c:choose></form>
						 </c:forEach>
						 </c:forEach><input type="hidden" id="totalRows" value="${cnt1}"/>
							</tbody>
					  </table><br><br><br>
					</div>
					
					<div class="col-sm-9 col-sm-offset-3 col-lg-6 col-lg-offset-10">
					<c:choose>
						<c:when test="${sessionScope.userDetail.type==1}">
							<c:choose>
								<c:when test="${approveStatus==0}">
									<c:choose>
										<c:when test="${pmStatus==1}">
											<a href="${pageContext.request.contextPath}/approveList/1"><input type="submit" value="Approve" name="Approve" class="btn btn-info"  /></a>1
										</c:when>
										<c:otherwise>
									<div title="Approved By ${paMaintainenceList.get(0).string2}">
											<input type="submit" value="Approve" name="Approve" class="btn btn-info"  disabled/></div>
										</c:otherwise>
									
									</c:choose> 
								</c:when>
								
								<c:when test="${approveStatus==1}">
								<div title="Approved By ${paMaintainenceList.get(0).string2}">
									 <input type="submit" value="Approved" name="Approve" class="btn btn-info"  disabled/>
								</div></c:when>
								
								<c:when test="${approveStatus==2}">
									<c:choose>
										<c:when test="${pmStatus==2}">
										<div title="Approved By ${paMaintainenceList.get(0).string2}">	<a href="${pageContext.request.contextPath}/approveList/3"><input type="submit" value="Approve" name="Approve" class="btn btn-info"  /></a>3
										</div></c:when>
										<c:otherwise>
									<div title="Approved By ${paMaintainenceList.get(0).string2}">
											<input type="submit" value="Approved" name="Approve" class="btn btn-info"  disabled/>
									</div>	</c:otherwise>
									
									</c:choose> 
								</c:when>
								
								<c:when test="${approveStatus==3}">
								<div title="Approved By ${paMaintainenceList.get(0).string2}">
									 <input type="submit" value="Approved" name="Approve" class="btn btn-info"  disabled/>
							</div></c:when>
								
								<c:when test="${approveStatus==4}">
									<c:choose>
										<c:when test="${pmStatus==3}">
										<div title="Approved By ${paMaintainenceList.get(0).string2}">	<a href="${pageContext.request.contextPath}/approveList/5"><input type="submit" value="Approve" name="Approve" class="btn btn-info"  /></a>5
									</div></c:when>
										<c:otherwise>
										<div title="Approved By ${paMaintainenceList.get(0).string2}">
											<input type="submit" value="Approved" name="Approve" class="btn btn-info"  disabled/>
										</div></c:otherwise>
									
									</c:choose> 
								</c:when>
								
								<c:when test="${approveStatus==5}">
							<div title="Approved By ${paMaintainenceList.get(0).string2}">
									 <input type="submit" value="Approved" name="Approve" class="btn btn-info"  disabled/>
							</div>	</c:when>
								
								<c:when test="${approveStatus==6}">
								<div title="Approved By ${paMaintainenceList.get(0).string2}">
									 <input type="submit" value="Approved" name="Approve" class="btn btn-info"  disabled/>
								</div></c:when>
							
							</c:choose>
						
						</c:when>
						
						
						<c:when test="${sessionScope.userDetail.type==2}">
							<c:choose>
								<c:when test="${approveStatus==0}"> 
								<div title="Approved By ${paMaintainenceList.get(0).string2}">
											<input type="submit" value="Approved" name="Approve" class="btn btn-info"  disabled/> 
							</div>	</c:when>
								
								<c:when test="${approveStatus==1}"> 
								<div title="Approved By ${paMaintainenceList.get(0).string2}">
											<a href="${pageContext.request.contextPath}/approveList/2"><input type="submit" value="Approve" name="Approve" class="btn btn-info"  /></a>2 
								</div></c:when>
								
								<c:when test="${approveStatus==2}"> 
								<div title="Approved By ${paMaintainenceList.get(0).string2}">
											<input type="submit" value="Approved" name="Approve" class="btn btn-info"  disabled/> 
								</div></c:when>
								
								<c:when test="${approveStatus==3}">
								<div title="Approved By ${paMaintainenceList.get(0).string2}">
									 <a href="${pageContext.request.contextPath}/approveList/4"><input type="submit" value="Approve" name="Approve" class="btn btn-info"  /></a>4
							</div>	</c:when>
								
								<c:when test="${approveStatus==4}"> 
								<div title="Approved By ${paMaintainenceList.get(0).string2}">
											<input type="submit" value="Approved" name="Approve" class="btn btn-info"  disabled/> 
							</div>	</c:when>
								
								<c:when test="${approveStatus==5}">
								<div title="Approved By ${paMaintainenceList.get(0).string2}">
									 <a href="${pageContext.request.contextPath}/approveList/6"><input type="submit" value="Approve" name="Approve" class="btn btn-info"  /></a>6
								</div></c:when>
								
								<c:when test="${approveStatus==6}">
								<div title="Approved By ${paMaintainenceList.get(0).string2}">
									 <input type="submit" value="Approved" name="Approve" class="btn btn-info"  disabled/>
								</div></c:when>
							
							</c:choose>
						
						</c:when>
						
					</c:choose>
					 </div>
				</div>
			</div>			     
				</div>

			</div>

		</div>
	</div>
	<!-- END Main Content -->
<div id="myModal" class="modal">
 <div class="modal-content">
    <span class="close">&times;</span>
   
  <!-- Modal content -->
  <!-- <div class="modal-content">
    <span class="close">&times;</span>
    <p>Some text in the Modal..</p>
  </div> -->
<img  alt="Image Not Available" id="objMachineImage" style="height: 500px; width: 500px;">
 </div>
</div>
	</div>
 
	  <!--//w3-agileits-pane-->	
<!-- script-for sticky-nav -->
	<!-- 	<script>
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
		 <p>© 2017-18 . All Rights Reserved |  <a href="www.mahindra.com/" target="_blank">Mahindra rise</a> </p></div>	 -->
</div>	
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
<!-- <script type="text/javascript">
function addNewPM(key)
{
	 if (confirm("Do you want to Save this record?")) {
	var isValid=validation(key);
	document.getElementById('key').value=key;
	
	if(isValid==true)
		{
		document.forms["pm_form"].submit();
		}
	 }
}
</script> -->
<script type="text/javascript">
/* function validation(key) {
	
	var methodId = $("#method_id"+key).val();
	var reqValue = $("#req_value"+key).val();
	
	var isValid = true;
	if (methodId==0) { 
		isValid = false;
		alert("Please Select Method");
	} else if (reqValue ==0) {
		isValid = false;
		alert("Please Select Required Value");
	}
	return isValid;
} */
/* var tx = document.getElementsByTagName('textarea');
for (var i = 0; i < tx.length; i++) {
  tx[i].setAttribute('style', 'height:' + (tx[i].scrollHeight) + 'px;overflow-y:hidden;');
  tx[i].addEventListener("input", OnInput, false);
}

function OnInput() {
  this.style.height = 'auto';
  this.style.height = (this.scrollHeight) + 'px';
} */
</script>

<script type="text/javascript">
	
		function getData() {
			var file = $("#file").val();
			
			$.getJSON('${importExcel2}',

							{
								 
								file : file, 
								ajax : 'true'

							},
							function(data) {
								alert("ala");
								$('#table_grid td').remove();
								 

								if (data == "") {
									alert("No records found !!");

								}
							 

							  $.each( data,
											function(key, itemList) {
												
												var bgcolor; 
											var tr = $('<tr></tr>');
										  	tr.append($('<td style="color:red"></td>').html(key+1));

										  	tr.append($('<td style="color:red"></td>').html(itemList.fromDeptName));
										  	

										  	tr.append($('<td style="color:red"></td>').html(itemList.reqDate));
										  
										  	tr.append($('<td style="color:red"></td>').html(stats));
										  	tr.append($('<td ></td>').html("<a href='${pageContext.request.contextPath}/viewDetailBOMRequest?reqId="+itemList.reqId+"' class='action_btn'> <abbr title='detailed'> <i class='fa fa-list' ></i></abbr> "));
											
											$('#table_grid tbody').append(tr);
											 
												 
											 
											

											})  
							});

		 
	}
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
		$(document).ready(function() { 

			$('#machineId').change(

					function() {

						//alert("hh");

						 

						$.getJSON('${getActivityByMachin}', {

							machinId : $(this).val(),

							 

							ajax : 'true'

						}, function(data) {

							var html = '<option value=""selected disabled="disabled">Choose Machine Activity</option>';

						

							var len = data.length;

							$('#machinActivity')

						    .find('option')

						    .remove()

						    .end()

						    $("#machinActivity").append(

			                           $("<option ></option>").attr(

			                               "value", "").text("Select Machine Activity ")

			                       );

							for ( var i = 0; i < len; i++) {

								

								 $("#machinActivity").append(

				                           $("<option ></option>").attr(

				                               "value", data[i].activityId).text(data[i].activityName)

				                       );

							} 
							$("#machinActivity").trigger("chosen:updated");
		 
						});

					});

		});

		
		$(document).ready(function() { 

			$('#machinActivity').change(

					function() {

						$.getJSON('${getItemByActivity}', {

							activityId : $(this).val(),
							ajax : 'true'

						}, function(data) {

							var html = '<option value=""selected disabled="disabled">Choose Machine Item</option>';

						

							var len = data.length;

							$('#machinItem')

						    .find('option')

						    .remove()

						    .end()

						    $("#machinItem").append(

			                           $("<option ></option>").attr(

			                               "value", "").text("Select Item ")

			                       );

							for ( var i = 0; i < len; i++) {

								

								 $("#machinItem").append(

				                           $("<option ></option>").attr(

				                               "value", data[i].itemId).text(data[i].itemName)

				                       );

							} 
							$("#machinItem").trigger("chosen:updated");
		 
						});

					});

		});
		
		
		$(document).ready(function() { 

			$('#machinItem').change(

					function() {

						$.getJSON('${getCheckPointsByItem}', {

							itemId : $(this).val(),

							 

							ajax : 'true'

						}, function(data) {

							var html = '<option value=""selected disabled="disabled">Choose Machine Check Ponts</option>';

						

							var len = data.length;

							$('#machinCheckPoint')

						    .find('option')

						    .remove()

						    .end()

								

						    	//alert(len);
						    $("#machinCheckPoint").append(

			                           $("<option ></option>").attr(

			                               "value", "").text("Select CheckPoint ")

			                       );

							for ( var i = 0; i < len; i++) {

								

								 $("#machinCheckPoint").append(

				                           $("<option ></option>").attr(

				                               "value", data[i].checkPointId).text(data[i].checkPointName)

				                       );

							} 
							$("#machinCheckPoint").trigger("chosen:updated");
		 
						});

					});

		});
		
		$(document).ready(function() { 

			$('#machinCheckPoint').change(
					 
					function() { 
						
						var machineId = $("#machineId").val();
						
						$.getJSON('${getCheckRecordAgistMachine}', {

							checkPointId : $(this).val(),
							machineId : machineId,
							 

							ajax : 'true'

						}, function(data) {

							 if(data.paMaintId==0)
								 {
								 document.getElementById("date1").value ="";
								 document.getElementById("observation1").value ="";
								 document.getElementById("date2").value ="";
								 document.getElementById("observation2").value ="";
								 document.getElementById("date3").value ="";
								 document.getElementById("observation3").value ="";
								 document.getElementById("date2div").style.display="none";
								 document.getElementById("date3div").style.display="none";
								 document.getElementById('addMaintenance2').style.visibility = 'visible';
								 document.getElementById("requiredValueId").value ="";
								 $("#requiredValueId").trigger("chosen:updated");
								 document.getElementById("methodId").value ="";
								 $("#methodId").trigger("chosen:updated");
								 }
							 else
								 {
								 alert(data.status);
								 if(data.status==2)
									 {
									 document.getElementById("date2div").style.display="block";
									 document.getElementById("date3div").style.display="none";
									 document.getElementById('addMaintenance2').style.visibility = 'visible';
									 }
								 else if(data.status==3)
									 {
									 document.getElementById("date2div").style.display="block";
									 document.getElementById("date3div").style.display="block";
									 document.getElementById('addMaintenance2').style.visibility = 'hidden';
									 }
								 else
									 {
									 document.getElementById("date2div").style.display="none";
									 document.getElementById("date3div").style.display="none";
									 document.getElementById('addMaintenance2').style.visibility = 'visible';
									 }
								 
								 document.getElementById("date1").value =data.date1;
								 document.getElementById("observation1").value =data.date1Obervation;
								 document.getElementById("date2").value =data.date2;
								 document.getElementById("observation2").value =data.date2Obervation;
								 document.getElementById("date3").value =data.date3;
								 document.getElementById("observation3").value =data.date3Obervation;
								 document.getElementById("requiredValueId").value =data.rquiredValure;
								 $("#requiredValueId").trigger("chosen:updated");
								 document.getElementById("methodId").value =data.method;
								 $("#methodId").trigger("chosen:updated");
								 }
		 
						});

					});

		});
		
		function unlockDate2Dive()
		{
			 if(document.getElementById("date2div").style.display=="block")
				 {
				 document.getElementById("date3div").style.display="block";
				 document.getElementById('addMaintenance2').style.visibility = 'hidden'; 
				 }
			document.getElementById("date2div").style.display="block"; 
		}
		 
	</script>
	<script type="text/javascript">
	function setMachineSelected(machineType,machineId,rows,apstatus,type)
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
	
	/* 	var rows = document.getElementById("totalRows").value;
		var apstatus = document.getElementById("apstatus").value;
		var type = document.getElementById("usertype").value; */
        if((apstatus==1 && type==1) ||  apstatus==2)
        	{
         for(var i=1;i<=rows;i++)
        	 {
        	 document.getElementById("date1"+i).readOnly = true;
        	 document.getElementById("date1ob"+i).readOnly = true;
        	 document.getElementById("myFile1"+i).readOnly = true;
        	 }
        	}
       else if((apstatus==3 && type==1) || apstatus==4 || (apstatus==5 && type==2)){
        	  for(var i=1;i<=rows;i++)
         	 {
         	 document.getElementById("date1"+i).readOnly = true;
         	 document.getElementById("date1ob"+i).readOnly = true;
         	 document.getElementById("myFile1"+i).readOnly = true;
         	 document.getElementById("date2"+i).readOnly = true;
         	 document.getElementById("date2ob"+i).readOnly = true;
         	 document.getElementById("myFile2"+i).readOnly = true;
         	 }
        	  }else if(apstatus==3 && type==2){
        		  for(var i=1;i<=rows;i++)
              	 {
         		 document.getElementById("date1"+i).readOnly = true;
             	 document.getElementById("date1ob"+i).readOnly = true;
             	 document.getElementById("myFile1"+i).readOnly = true;
              	 }
         	 } else if(apstatus==5 && type==1)
         		 {
         		 for(var i=1;i<=rows;i++)
             	 {
         		 document.getElementById("date1"+i).readOnly = true;
             	 document.getElementById("date1ob"+i).readOnly = true;
             	 document.getElementById("myFile1"+i).readOnly = true;
             	 document.getElementById("date2"+i).readOnly = true;
             	 document.getElementById("date2ob"+i).readOnly = true;
             	 document.getElementById("myFile2"+i).readOnly = true;
             	 document.getElementById("date3"+i).readOnly = true;
             	 document.getElementById("date3ob"+i).readOnly = true;
             	 document.getElementById("myFile3"+i).readOnly = true;
             	 }
         		 } 
        	
     
        
	}
	</script>
<%-- <script src="http://code.jquery.com/jquery-1.12.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/home/js/jquery.rowspanizer.min.js"></script>
<script>
$('#action').on('click', function() {
  $("#table").rowspanizer({vertical_align: 'middle'});
});
</script>
<script type="text/javascript">
$("#table").rowspanizer({vertical_align: 'middle'});
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script> --%>

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
		
		<script type="text/javascript">
		
		function openImage(img)
		{
			$("#myModal").show();
			 
			document.getElementById("objMachineImage").src=img;
		}
		var span = document.getElementsByClassName("close")[0]; 
		span.onclick = function() {
			$("#myModal").hide();
		    
		}
		</script>
		
</body>

</html>