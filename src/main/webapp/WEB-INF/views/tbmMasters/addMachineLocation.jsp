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
								<i class="fa fa-bars"></i>  Time Base Maintenance
							</h3>
							<div class="box-tool">
							
							   
								 
							 
						
						</div>
						<div class="form-group">
						<div class="col-sm-3 col-lg-3 controls">
						<a href="${pageContext.request.contextPath}/showAddTbmMachine">Add Machine
						
						</a>
						</div>
						<div class="col-sm-3 col-lg-3 controls">
						<a href="${pageContext.request.contextPath}/showAddTbmLocation">Add Location
						
						</a>
						</div>
						<div class="col-sm-3 col-lg-3 controls">
						<a href="${pageContext.request.contextPath}/showAddTbmItem">Add Item
						
						</a>
						</div>
						<%-- <div class="col-sm-3 col-lg-3 controls">
						<a href="${pageContext.request.contextPath}/showAddCheckpoint">Add Frequency
						
						</a>
						</div> --%>
						</div>
						<br/>	<br/>	<br/>

						<div class="box-content">
							<form action="${pageContext.request.contextPath}/submitAddTbmMachineLocation"  class="form-horizontal"
							 id="validation-form"
										enctype="multipart/form-data" method="post">
							

					<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Select Machine</label>
									 
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine Type"
								class="form-control chosen" tabindex="6" id="machine"
								name="machine" required>

								<option value=""selected disabled="disabled">Choose Machine </option>
								<c:set var="${select}" value=""/>
								 <c:forEach items="${tbmMachineDetailsList}" var="tbmMachineDetailsList"
									varStatus="count">
									<c:set var="${select}" value=""/>
									<c:choose>
									<c:when test="${tbmMachineDetailsList.machineId==tbmMachineLocation.machineId}">
									<c:set var="${select}" value="selected"/>
									</c:when>
									</c:choose>
									<option <c:out value="${select}"/> value="${tbmMachineDetailsList.machineId}"><c:out value="${tbmMachineDetailsList.machineName}"/></option>
								</c:forEach>
									 


							</select>
						</div>
								 
									
						</div>
						
								 
						<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Enter Location  </label>
									<div class="col-sm-6 col-lg-4 controls">
										<input type="text" name=location id="location" value="${tbmMachineLocation.location}" class="form-control "placeholder=location   data-rule-required="true" required />

						</div>
						</div>
						
						 	 
								 
									
						 
					 
							 
							
							
								 <input type="hidden" name="locationId" value="${tbmMachineLocation.locationId}">
						
					 
						
					 
								  
									 
				 
						 

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
 
</body>

</html>