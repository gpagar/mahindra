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


<!----------------------------------------Dropdown With Search----------------------------------------------- -->

<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/customerBill/chosen.css">
<!--------------------------------------------------------------------------------------- -->

  
</head>
<body>
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
            <c:url var="getScheduleById" value="/getScheduleById"></c:url>
                 <script>
  $( function() {
    $( ".dp2" ).datepicker({
    	 autoclose: true, 
    	format: "dd-mm-yyyy"
    		
    });
 
  } );
  </script>

		<!-- <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a> <i class="fa fa-angle-right"></i></li>
            </ol> -->
 
              <div id="main-content">
			<!-- BEGIN Page Title -->
			 
			<!-- END Page Title -->

			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>  Preventive Maintenance Plan
							</h3>
							<div class="box-tool">
							
							   
								 
							 
						
						</div>
						
						<div class="form-group">
						<%-- <div class="col-sm-3 col-lg-3 controls">
						<a href="${pageContext.request.contextPath}/showAddMachine">Add Machine
						
						</a>
						</div>
						<div class="col-sm-3 col-lg-3 controls">
						<a href="${pageContext.request.contextPath}/showAddActivity">Add Activity
						
						</a>
						</div>
						<div class="col-sm-3 col-lg-3 controls">
						<a href="${pageContext.request.contextPath}/showAddItem">Add Item
						
						</a>
						</div>
						<div class="col-sm-3 col-lg-3 controls">
						<a href="${pageContext.request.contextPath}/showAddCheckpoint">Add Checkpoints
						
						</a>
						</div>
						</div> --%>
						<br/>	<br/>	<br/>

						<div class="box-content">
							<form action="${pageContext.request.contextPath}/submitInsertPmPlan"  class="form-horizontal"
							 id="validation-form"
										enctype="multipart/form-data" method="post">
							
                    <input type="hidden" name="maintId" id="maintId" value="0"/>
					<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Machine Type.</label>
									 
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine Type"
									class="chosen-select" tabindex="6" id="machineType" style="width:99% !important;"
								name="machineType" required>

								<option value=""selected disabled="disabled">Choose Machine Type</option>

								 
									<option value="1">Electrical</option>
								 <option value="2">Mechanical</option>


							</select>
						</div>
									 
									
						</div>
						
								<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Machine name</label>
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine"
								class="chosen-select" tabindex="6" id="machineId" style="width:99% !important;"
								name="machineId" onchange="onMachineChange(this.value)" required>

								<option value=""selected disabled="disabled">Choose Machine</option>

								 


							</select>
						</div>
									 
									
						</div>
							<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Select Rank</label>
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine Rank"
									class="chosen-select" tabindex="6" id="rank" style="width:99% !important;"
								name="rank" required>

									<option value="0" selected  >Rank A</option>
								<option value="1"   >Rank B</option>
								<option value="1"   >Rank C</option>
 
							</select></div>
									 
								 
									
						</div>
						<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Select first Month</label>
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine Month"
									class="chosen-select" tabindex="6" id="fmonth" style="width:99% !important;"
								name="fmonth" required>
								<option value=""selected  >Select first Month</option>
 						
								  <option value="1"   >Jan</option>
								  <option value="2"   >Feb</option>
                                  <option value="3"   >March</option>
                                  <option value="4"   >April</option>
                                  <option value="5"   >May</option>
                                  <option value="6"   >June</option>
                                  <option value="7"   >July</option>
                                  <option value="8"   >Aug</option>
                                  <option value="9"   >Sept</option>
                                  <option value="10"   >Oct</option>
                                  <option value="11"   >Nov</option>
                                  <option value="12"   >Dec</option>
								
							</select>
							</div>
									
								 
									
						</div>
						<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Select first Week</label>
									<div class="col-sm-6 col-lg-4 controls" >
						<select data-placeholder="Choose Machine Week" style="width:99% !important;"
									class="chosen-select" tabindex="6" id="fweek"
								name="fweek" required>

								<option value=""selected  >Select first Week</option>
 							<c:forEach var = "i" begin = "1" end = "4">
       
      
								<option value="${i}"   >${i}</option>
								 

								  </c:forEach>

								  
							</select>
								
							</div>
							</div>
							
							 <div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Select Second Month</label>
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine Month"
									class="chosen-select" tabindex="6" id="smonth" style="width:99% !important;"
								name="smonth" required>
								<option value=""selected  >Select Second Month</option>
 							 <option value="1"   >Jan</option>
								  <option value="2"   >Feb</option>
                                  <option value="3"   >March</option>
                                  <option value="4"   >April</option>
                                  <option value="5"   >May</option>
                                  <option value="6"   >June</option>
                                  <option value="7"   >July</option>
                                  <option value="8"   >Aug</option>
                                  <option value="9"   >Sept</option>
                                  <option value="10"   >Oct</option>
                                  <option value="11"   >Nov</option>
                                  <option value="12"   >Dec</option>
							</select>
							</div>
									
								 
									
						</div>
						<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Select Second Week</label>
									<div class="col-sm-6 col-lg-4 controls" >
						<select data-placeholder="Choose Machine Week"
									class="chosen-select" tabindex="6" id="sweek" style="width:99% !important;"
								name="sweek" required>

								<option value=""selected  >Select Second Week</option>
 							<c:forEach var = "i" begin = "1" end = "4">
       
      
								<option value="${i}"   >${i}</option>
								 

								  </c:forEach>

								  
							</select>
								
							</div>
							</div>
							
							
								 <div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Select third Month</label>
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine Month"
									class="chosen-select" tabindex="6" id="tmonth" style="width:99% !important;"
								name="tmonth" required>
								<option value=""selected  >Select Third Month</option>
 							 <option value="1"   >Jan</option>
								  <option value="2"   >Feb</option>
                                  <option value="3"   >March</option>
                                  <option value="4"   >April</option>
                                  <option value="5"   >May</option>
                                  <option value="6"   >June</option>
                                  <option value="7"   >July</option>
                                  <option value="8"   >Aug</option>
                                  <option value="9"   >Sept</option>
                                  <option value="10"   >Oct</option>
                                  <option value="11"   >Nov</option>
                                  <option value="12"   >Dec</option>
							</select>
							</div>
									
								 
									
						</div>
						<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Select third Week</label>
									<div class="col-sm-6 col-lg-4 controls" >
						<select data-placeholder="Choose Machine Week" style="width:99% !important;"
									class="chosen-select" tabindex="6" id="tweek"
								name="tweek" required>

								<option value="" selected  >Select third Week</option>
 							<c:forEach var = "i" begin = "1" end = "4">
       
      
								<option value="${i}"   >${i}</option>
								 

								  </c:forEach>

								  
							</select>
								
							</div>
							</div>
						
					 
						
					 
								  
									 
				 
						 

					<div class="row" align="center">
						<div class="col-sm-9 col-sm-offset-3 col-lg-8 col-lg-offset-2">
							<button type="submit" class="btn btn-info" id="submitbtn">Submit</button>  
				   
		

						</div>
					</div>
					</form>
							<br>
								 
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
					<!-- 		<script>
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
	
	 
		
		
		$(document).ready(function() { 

			$('#machineType').change(

					function() {

						//alert("hh");

						 

						$.getJSON('${getMachinByType}', {

							machineType : $(this).val(),

							 

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

					});

		});

		$(document).ready(function() { 

			$('#machineId').change(

					function() {
						 

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

								

						    	//alert(len);
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

						//alert("hh");

						 

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

								

						    	//alert(len);
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

						//alert("hh");

						 

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
		 
		
	 
		 
	</script>
	
	<script type="text/javascript">
	function onMachineChange(machineId)
	{
		
		document.getElementById("rank").value="0";$("#rank").trigger("chosen:updated");
		document.getElementById("fmonth").value="";$("#fmonth").trigger("chosen:updated");
		document.getElementById("fweek").value="";$("#fweek").trigger("chosen:updated");
		document.getElementById("smonth").value="";$("#smonth").trigger("chosen:updated");
		document.getElementById("sweek").value="";	$("#sweek").trigger("chosen:updated");
		document.getElementById("tmonth").value="";$("#tmonth").trigger("chosen:updated");
		document.getElementById("tweek").value="";$("#tweek").trigger("chosen:updated");
		document.getElementById("maintId").value=0;	$("#maintId").trigger("chosen:updated");
		$.getJSON('${getScheduleById}', {
			machineId : machineId,
			ajax : 'true'

		}, function(data) {
			document.getElementById("rank").value=data.int1;
			$("#rank").trigger("chosen:updated");
			document.getElementById("fmonth").value=data.fMonth;
			$("#fmonth").trigger("chosen:updated");
			document.getElementById("fweek").value=data.fWeek;
			$("#fweek").trigger("chosen:updated");
			document.getElementById("smonth").value=data.sMonth;
			$("#smonth").trigger("chosen:updated");
			document.getElementById("sweek").value=data.sWeek;
			$("#sweek").trigger("chosen:updated");
			document.getElementById("tmonth").value=data.tMonth;
			$("#tmonth").trigger("chosen:updated");
			document.getElementById("tweek").value=data.tweek;
			$("#tweek").trigger("chosen:updated");
			document.getElementById("maintId").value=data.maintId;
			$("#maintId").trigger("chosen:updated");
		});
		
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