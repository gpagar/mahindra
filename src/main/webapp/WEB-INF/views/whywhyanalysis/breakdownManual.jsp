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


<!----------------------------------------Dropdown With Search----------------------------------------------- -->

<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/customerBill/chosen.css">
<!--------------------------------------------------------------------------------------- -->
   <script>
  $( function() {
    $( ".dp2" ).datepicker({
    	 autoclose: true, 
    	format: "dd-mm-yyyy"
    		
    });
 
  } );
  
  </script>
</head>
<body>
   <div class="page-container">

         <c:url var="getMachinByType" value="/getMachinByType"></c:url>
         <c:url var="getMachineById" value="/getMachineById"></c:url>
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
								<i class="fa fa-bars"></i> BREAKDOWN MANUAL
							</h3>
							<div class="box-tool">
							
						</div>

						<div class="box-content">
				<form action="${pageContext.request.contextPath}/searchBreakdownManual"  class="form-horizontal"
							 id="validation-form"
										enctype="multipart/form-data" method="get">
						<%-- 	<div class="form-group">
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
									
						</div>	 --%>
								
								<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Machine name & No.</label>
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine"
								 class="chosen-select" style="width:99% !important;"  tabindex="6" id="machineId" onchange="onMachineChange(this.value)"
								name="machineId" required>

								<option value=""selected disabled="disabled">Choose Machine</option>
                                 <c:forEach items="${machineList}" var="machineList">
                                  <c:choose>
                                  <c:when test="${machineList.machinId==machineId}">
                                  <option value="${machineList.machinId}" selected>${machineList.machinNo}-${machineList.machinName}</option>
                                  
                                  </c:when>
                                  <c:otherwise>
                                  <option value="${machineList.machinId}">${machineList.machinNo}-${machineList.machinName}</option>
                                  
                                  </c:otherwise>
                                  </c:choose>
                                  
                                  </c:forEach>   
							</select>
						</div>
									
						<!-- </div> -->
					<!-- 	<div class="row" align="center">
						<div class="col-sm-9 col-sm-offset-3 col-lg-8 col-lg-offset-2"> -->
							<button type="submit" class="btn btn-info" id="submitbtn">Search</button>  
			<!-- 	<button type="button" class="btn btn-info" id="addMaintenance2" onclick="unlockDate2Dive()">Search</button>   -->
		

<!-- 						</div> -->
					</div>
				</form>
		<form action="${pageContext.request.contextPath}/saveWhyWhy"  class="form-horizontal" name="breakdown_form"
							 id="validation-form" enctype="multipart/form-data" method="post">	
				        	<input type="hidden" name="machine_id-1" id="machine_id-1" value="${machineId}"/>
                           <input type="hidden" name="machine_type-1" id="machine_type-1" value="${machineType}"/>			
                           <input type="hidden" name="key" id="key"/>
			<div class="agile-grids" >	
				<!-- tables -->
				<div class="agile-tables">
					<div class="w3l-table-info" style="overflow-x:auto;height:400px;  ">
					
					    <table id="table"  style="border: 1px;" >
						<thead>
						  <tr>
							<th>Sr.No</th>
							<th>Breakdown Incidence</th>
							<th>Date of Occurrence</th>
							<th>Root Cause.</th>
							<th>Action Taken</th>
							<th>Type of BreakDown</th>
							<th>Spare Details.</th>
							<th>Doc reference no.</th>
							<th>SAP Notification Number</th>
							<th>Action</th>
						  </tr>
						</thead>
						<tbody>
					<c:forEach items="${whyWhyF18List}"  var="whyWhyF18" varStatus="count" >
						
						<tr>
						
						<td>${count.index+1}</td>
				
						<td>${whyWhyF18.failureCode}
						</td>
						<td><input id="date${count.index}" type="date" name="date${count.index}" value="${whyWhyF18.date}"disabled/>

						<td>${whyWhyF18.rootCause}
						</td>
						<td>${whyWhyF18.action}
						</td>
					
						<td> <c:choose>
						         <c:when test="${whyWhyF18.status eq '0'}"><c:out value="Closed"></c:out>
						         </c:when>
						           <c:when test="${whyWhyF18.status eq '1'}"><c:out value="Open"></c:out>
						         </c:when>
						      </c:choose>
						</td>
							<td>${whyWhyF18.partDesc}
						</td>
						<td>${whyWhyF18.refNo}
						</td>
						<td>${whyWhyF18.sapNotifNo}
						</td>
						 <td>   
                               
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
<!-- </div> -->
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
</body>

</html>