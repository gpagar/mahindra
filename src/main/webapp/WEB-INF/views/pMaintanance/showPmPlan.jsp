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
<meta name="keywords"
	content="Pooled Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />



</head>
<body>

   <c:url var="getMachinByType" value="/getMachinByType"></c:url>
	<div class="page-container">





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
										<i class="fa fa-bars"></i> Preventive Maintenance Plan
									</h3>
									<div class="box-tool"></div>

								</div><br>
									<div class="box-content">

							<form action="${pageContext.request.contextPath}/generateCalender" class="form-horizontal"
								method="post" id="validation-form">

										<div class="box-content">
										<label class="col-md-1"></label>
											<div class="col-md-1">
												 
											</div>
											<label class="col-md-2">Machine
												Type.</label>

											<div class="col-md-4">
												<select data-placeholder="Choose Machine Type"
													class="form-control chosen" tabindex="6" id="machineType"
													name="machineType" required>

													<option value="" selected disabled="disabled">Choose Machine Type</option>


													<option value="1">Electrical</option>
													<option value="2">Mechanical</option>


												</select>
											</div>
											
											
											 
										</div><br><br>
													
												<div class="box-content">
											<label class="col-md-1"></label>

											<div class="col-md-1">
												 
											</div>
											
											<label class="col-md-2">Machine
												name & No.</label>
											<div class="col-md-4">
												<select data-placeholder="Choose Machine"
													class="form-control chosen" tabindex="6" id="machineId"  onchange="getMonthCal(this.form)"
													name="machineId" required>

													<option value="" selected disabled="disabled">Choose Machine</option>




												</select>
											</div>
											 
										</div><br><br>
										
										<div class="box-content">
											<div class="form-group">
									<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-5">
										<input type="submit" class="btn btn-primary" value="Submit"> 
										</div>
								</div>
											 
										</div><br><br>


										 

										<br />
										 
										<br> <br>
										</form>
									</div>
									

								</div>
								
							</div>





						</div>





						<!--//w3-agileits-pane-->
						<!-- script-for sticky-nav -->
						 
						<!-- /script-for sticky-nav -->
						<!--inner block start here-->
						<div class="inner-block"></div>
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

			$(".sidebar-icon").click(
					function() {
						if (toggle) {
							$(".page-container").addClass("sidebar-collapsed")
									.removeClass("sidebar-collapsed-back");
							$("#menu span").css({
								"position" : "absolute"
							});
						} else {
							$(".page-container").removeClass(
									"sidebar-collapsed").addClass(
									"sidebar-collapsed-back");
							setTimeout(function() {
								$("#menu span").css({
									"position" : "relative"
								});
							}, 400);
						}

						toggle = !toggle;
					});
		</script>
		<!--js -->
		<script
			src="${pageContext.request.contextPath}/resources/home/js/jquery.nicescroll.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/home/js/scripts.js"></script>
		<!-- Bootstrap Core JavaScript -->
		<script
			src="${pageContext.request.contextPath}/resources/home/js/bootstrap.min.js"></script>
		<!-- /Bootstrap Core JavaScript -->
		<!-- morris JavaScript -->
		<script
			src="${pageContext.request.contextPath}/resources/home/js/raphael-min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/home/js/morris.js"></script>
</body>



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

</script>

</html>