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
}</style> 
   <script>
  $( function() {
    $( ".dp2" ).datepicker({
    	 autoclose: true, 
    	format: "dd-mm-yyyy"
    		
    });
 
  } );
  
  </script>
</head>
<body onload="setMachineSelected(${machineType},${machineId})">
         <c:url var="getMachinByType" value="/getMachinByType"></c:url>
   
   <!--/content-inner-->
<div class="left-content">
	   <div class="mother-grid-inner"> 
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

              <div id="main-content">
			<!-- BEGIN Page Title -->
			 
			<!-- END Page Title -->

			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i> BREAKDOWN/WHY WHY ANALYSIS
							</h3>
							<div class="box-tool">
							
						</div>

						<div class="box-content">
				<form action="${pageContext.request.contextPath}/searchWhyWhyList"  class="form-horizontal"
							 id="validation-form"
										enctype="multipart/form-data" method="post">
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
								class="form-control chosen" tabindex="6" id="machineId"
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
				</form>
		<form action="${pageContext.request.contextPath}/saveWhyWhy"  class="form-horizontal" name="breakdown_form"
							 id="validation-form" enctype="multipart/form-data" method="post">	
				        	<input type="hidden" name="machine_id" id="machine_id" value="1"/>
                           <input type="hidden" name="machine_type" id="machine_type" value="1"/>			
                           <input type="hidden" name="key" id="key"/>
			<div class="agile-grids" >	
				<!-- tables -->
				<div class="agile-tables">
					<div class="w3l-table-info" style="overflow-x:auto;">
					
					    <table id="table"  style="border: 1px;"class="table table-inverse table-bordered">
						<thead>
						  <tr>
							<th>Sr.No</th>
							<th>Month</th>
							<th>Date</th>
							<th>Dept.</th>
							<th>cell/circle</th>
							<th>M/c No.</th>
							<th>Problem Reported</th>
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
							<th>Status</th>
							<th>Ref NO.</th>
							<th>SAP Notification Number</th>
							<th>Action</th>
						  </tr>
						</thead>
						<tbody>
						<tr>
						  <input type="hidden" name="id1" id="id1" value=""/>			
						
						<td>1</td>
						<td><input id="month-1" type="month" name="month-1"/>
						</td>
						<td><input id="date-1" type="date" name="date-1"/>
						</td>
						<td><textarea id="dept-1"   name="dept-1"></textarea>
						</td>
						<td><textarea id="cellcircle-1"   name="cellcircle-1"></textarea>
						</td>
						<td><textarea id="machine_no-1"   name="machine_no-1"></textarea>
						</td>
						<td><textarea id="problem_reported-1"   name="problem_reported-1"></textarea>
						</td>
						<td><textarea id="bd_time_loss-1" name="bd_time_loss-1"></textarea>
						</td>
						<td><textarea id="engine_loss-1"   name="engine_loss-1"></textarea>
						</td>
						<td><textarea id="part-1"   name="part-1"></textarea>
						</td>
						<td><textarea id="part_desc-1"   name="part_desc-1"></textarea>
						</td>
						<td><select id="bd_ms_pt-1" name="bd_ms_pt-1">
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
						<td><select id="clarification_cause-1" name="clarification_cause-1">
                             <option value="Inadequate Operating condition">Inadequate Operating condition</option>
                             <option value="Neglect of completion of life">Neglect of completion of life</option>
                             <option value="Design Flaws">Design Flaws</option>
                             <option value="Skill up">Skill up</option>
                             <option value="Inadequate basic condition">Inadequate basic condition</option>
                             <option value="Open">Open</option>
                             
                             </select>
						</td>
						<td><select id="failure_code-1" name="failure_code-1">
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
						<td><select id="category-1" name="category-1">
                                 <option value="E">E</option>
                                 <option value="M">M</option>
                             
                         </select>
						</td>
						<td><select id="recurnonrecurr-1" name="recurnonrecurr-1">
                                 <option value="R">R</option>
                                 <option value="NR">NR</option>
                        </select>
						</td>
							<td><textarea id="linkage_with-1"   name="linkage_with-1"></textarea>
						</td>
						<td><select id="status-1" name="status-1">
                                 <option value="0">Closed</option>
                                 <option value="1">Open</option>
                        </select>
						</td>
						<td><textarea id="ref_no-1"   name="ref_no-1"></textarea>
						</td>
						<td><textarea id="sap_notif_no-1"   name="sap_notif_no-1"></textarea>
						</td>
						 <td>   <a href="#" onclick="addBreakdown(-1)"><i class="fa fa-save" style="font-size:24px"></i></a>

                          </td> 
						</tr>
						<c:forEach items="${whyWhyF18List}"  var="whyWhyF18" varStatus="count" >
						
						<tr>
						  <input type="hidden" name="id1" id="id1" value="${whyWhyF18.id}"/>			
						
						<td>${count.index+1}</td>
						<td><input id="month${count.index}" type="month" name="month${count.index}" value="${whyWhyF18.id}"/>
						</td>
						<td><input id="date${count.index}" type="date" name="date${count.index}"/>
						</td>
						<td><textarea id="dept${count.index}"   name="dept${count.index}"></textarea>
						</td>
						<td><textarea id="cellcircle${count.index}"   name="cellcircle${count.index}"></textarea>
						</td>
						<td><textarea id="machine_no${count.index}"   name="machine_no${count.index}"></textarea>
						</td>
						<td><textarea id="problem_reported${count.index}"   name="problem_reported${count.index}"></textarea>
						</td>
						<td><textarea id="bd_time_loss${count.index}" name="bd_time_loss${count.index}"></textarea>
						</td>
						<td><textarea id="engine_loss${count.index}"   name="engine_loss${count.index}"></textarea>
						</td>
						<td><textarea id="part${count.index}"   name="part${count.index}"></textarea>
						</td>
						<td><textarea id="part_desc${count.index}"   name="part_desc${count.index}"></textarea>
						</td>
						<td><select id="bd_ms_pt${count.index}" name="bd_ms_pt${count.index}">
                                 <option value="BD">BD</option>
                                 <option value="MS">MS</option>
                                <option value="PT">PT</option>
                        </select>
						</td>
						<td><textarea id="action${count.index}"   name="action${count.index}"></textarea>
						</td>
						<td><textarea id="why1${count.index}"   name="why1${count.index}"></textarea>
						</td>
						<td><textarea id="why2${count.index}"   name="why2${count.index}"></textarea>
						</td>
						<td><textarea id="why3${count.index}"   name="why3${count.index}"></textarea>
						</td>
						<td><textarea id="why4${count.index}"   name="why4${count.index}"></textarea>
						</td>
						<td><textarea id="why5${count.index}"   name="why5${count.index}"></textarea>
						</td>
						<td><textarea id="root_cause${count.index}"   name="root_cause${count.index}"></textarea>
						</td>
						<td><select id="clarification_cause${count.index}" name="clarification_cause${count.index}">
                             <option value="Inadequate Operating condition">Inadequate Operating condition</option>
                             <option value="Neglect of completion of life">Neglect of completion of life</option>
                             <option value="Design Flaws">Design Flaws</option>
                             <option value="Skill up">Skill up</option>
                             <option value="Inadequate basic condition">Inadequate basic condition</option>
                             <option value="Open">Open</option>
                             
                             </select>
						</td>
						<td><select id="failure_code${count.index}" name="failure_code${count.index}">
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
							<td><textarea id="counter_measure${count.index}"   name="counter_measure${count.index}"></textarea>
						</td>
						<td><select id="category${count.index}" name="category${count.index}">
                                 <option value="E">E</option>
                                 <option value="M">M</option>
                             
                         </select>
						</td>
						<td><select id="recurnonrecurr${count.index}" name="recurnonrecurr${count.index}">
                                 <option value="R">R</option>
                                 <option value="NR">NR</option>
                        </select>
						</td>
							<td><textarea id="linkage_with${count.index}"   name="linkage_with${count.index}"></textarea>
						</td>
						<td><select id="status${count.index}" name="status${count.index}">
                                 <option value="0">Closed</option>
                                 <option value="1">Open</option>
                        </select>
						</td>
						<td><textarea id="ref_no${count.index}"   name="ref_no${count.index}"></textarea>
						</td>
						<td><textarea id="sap_notif_no${count.index}"   name="sap_notif_no${count.index}"></textarea>
						</td>
						 <td>   <a href="#" onclick="addBreakdown(${count.index})"><i class="fa fa-save" style="font-size:24px"></i></a>

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
		<script>
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
		</script>
		<!-- /script-for sticky-nav -->
<!--inner block start here-->
<div class="inner-block">

</div>
<!--inner block end here-->
<!--copy rights start here-->
<div class="copyrights">
		 <p>© 2017-18 . All Rights Reserved |  <a href="www.mahindra.com/" target="_blank">Mahindra rise</a> </p></div>	
</div>	
<!--COPY rights end here-->
</div>
</div>
  <!--//content-inner-->
			<!--/sidebar-menu-->
				
 <jsp:include page="/WEB-INF/views/include/left.jsp"></jsp:include>





							  <div class="clearfix"></div>		
							</div>
							<script>
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
							</script>
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
	 if (confirm("Do you want to Save this record?")) {
	var isValid=validation(key);
	document.getElementById('key').value=key;
	
	if(isValid==true)
		{
		document.forms["breakdown_form"].submit();
		}
	 }
}
</script>
<script type="text/javascript">
function validation(key) {
	var isValid = true;
	/* var date = $("#date"+key).val();
	var month = $("#month"+key).val();
	var dept = $("#dept"+key).val();
	var cellCircle=$("#cellcircle"+key).val();
	var machineNo=$("#machine_no"+key).val();
	var problemReported=$("#problem_reported"+key).val();
	var bdTimeLoss=$("#bd_time_loss"+key).val();
	var engineLoss=$("#engine_loss"+key).val();
	var part=$("#part"+key).val();
	var partDesc=$("#part_desc"+key).val();
	var bdMsPt=$("#bd_ms_pt"+key).val();
	var action=$("#action"+key).val();
	var why1=$("#why1"+key).val();
	var why2=$("#why2"+key).val();
	var why3=$("#why3"+key).val();
	var why4=$("#why4"+key).val();
	var why5=$("#why5"+key).val();
	root_cause */
/* 	
	var isValid = true;
	if (methodId==0) { 
		isValid = false;
		alert("Please Select Method");
	} else if (reqValue ==0) {
		isValid = false;
		alert("Please Select Required Value");
	} */
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
</body>

</html>