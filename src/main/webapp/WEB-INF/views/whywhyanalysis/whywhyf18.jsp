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
								<i class="fa fa-bars"></i>  WHY WHY ANALYSIS F18
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
		<form action="${pageContext.request.contextPath}/saveWhyWhy"  class="form-horizontal" name="pm_form"
							 id="validation-form" enctype="multipart/form-data" method="post">	
					<input type="hidden" name="machine_id" id="machine_id" value="${machineId}"/>
                   <input type="hidden" name="machine_type" id="machine_type" value="${machineType}"/>			
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
						  <input type="hidden" name="id" id="id" value="0"/>			
						
						<td>1</td>
						<td><input id="month" type="month" name="month"/>
						</td>
						<td><input id="date" type="date" name="date"/>
						</td>
						<td><textarea id="dept"   name="dept"></textarea>
						</td>
						<td><textarea id="cellcircle"   name="cellcircle"></textarea>
						</td>
						<td><textarea id="machine_no"   name="machine_no"></textarea>
						</td>
						<td><textarea id="problem_reported"   name="problem_reported"></textarea>
						</td>
						<td><textarea id="bd_time_loss" name="bd_time_loss"></textarea>
						</td>
						<td><textarea id="engine_loss"   name="engine_loss"></textarea>
						</td>
						<td><textarea id="part"   name="part"></textarea>
						</td>
						<td><textarea id="part_desc"   name="part_desc"></textarea>
						</td>
						<td><select id="bd_ms_pt" name="bd_ms_pt">
                                 <option value="BD">BD</option>
                                 <option value="MS">MS</option>
                                <option value="PT">PT</option>
                        </select>
						</td>
						<td><textarea id="action"   name="action"></textarea>
						</td>
						<td><textarea id="why1"   name="why1"></textarea>
						</td>
						<td><textarea id="why2"   name="why2"></textarea>
						</td>
						<td><textarea id="why3"   name="why3"></textarea>
						</td>
						<td><textarea id="why4"   name="why4"></textarea>
						</td>
						<td><textarea id="why5"   name="why5"></textarea>
						</td>
						<td><textarea id="root_cause"   name="root_cause"></textarea>
						</td>
						<td><select id="clarification_cause" name="clarification_cause">
                             <option value="Inadequate Operating condition">Inadequate Operating condition</option>
                             <option value="Neglect of completion of life">Neglect of completion of life</option>
                             <option value="Design Flaws">Design Flaws</option>
                             <option value="Skill up">Skill up</option>
                             <option value="Inadequate basic condition">Inadequate basic condition</option>
                             <option value="Open">Open</option>
                             
                             </select>
						</td>
						<td><select id="failure_code" name="failure_code">
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
							<td><textarea id="counter_measure"   name="counter_measure"></textarea>
						</td>
						<td><select id="category" name="category">
                                 <option value="E">E</option>
                                 <option value="M">M</option>
                             
                         </select>
						</td>
						<td><select id="recurnonrecurr" name="recurnonrecurr">
                                 <option value="R">R</option>
                                 <option value="NR">NR</option>
                        </select>
						</td>
							<td><textarea id="linkage_with"   name="linkage_with"></textarea>
						</td>
						<td><select id="status" name="status">
                                 <option value="Closed">Closed</option>
                                 <option value="Open">Open</option>
                        </select>
						</td>
						<td><textarea id="ref_no"   name="ref_no"></textarea>
						</td>
						<td><textarea id="sap_notif_no"   name="sap_notif_no"></textarea>
						</td>
						<td>  <input type="submit" name="Save" id="Save"/>
                          </td> 
						</tr>
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