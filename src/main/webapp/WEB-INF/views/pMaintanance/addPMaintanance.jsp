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
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/resources/home/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/resources/home/css/style.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/morris.css" type="text/css"/>
<!-- Graph CSS -->
<link href="${pageContext.request.contextPath}/resources/home/css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/home/js/jquery-2.1.4.min.js"></script>
<!-- //jQuery -->
<link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<!-- lined-icons -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/icon-font.min.css" type='text/css' />
<!-- //lined-icons -->

<link rel='stylesheet' type='text/css' href='stylesheet.css'/>
        <link rel='stylesheet' type='text/css' href='http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css'/>
        <script type='text/javascript' src='script.js'></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
        

<script>
  $( function() {
    $( "#datepicker" ).datepicker();
 
  } );
  </script>
  
</head>
<body>
   <div class="page-container">
   
   <c:url var="importExcel2" value="/importExcel2"></c:url>
   <!--/content-inner-->
<div class="left-content">
	   <div class="mother-grid-inner"> 
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

		<ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a> <i class="fa fa-angle-right"></i></li>
            </ol>
 
              <div id="main-content">
			<!-- BEGIN Page Title -->
			 
			<!-- END Page Title -->

			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>Preventive Maintenance
							</h3>
							<div class="box-tool">
							
							   
								 
							 
						
						</div>

						<div class="box-content">
							<form action="${pageContext.request.contextPath}/addNewUser"  class="form-horizontal"
							 id="validation-form"
										enctype="multipart/form-data" method="post">
							

								<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Machine name & No.</label>
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine"
								class="form-control chosen" tabindex="6" id="dept_id"
								name="dept_id" >

								<option value=""selected disabled="disabled">Choose Machine</option>

								<c:forEach items="${departmentList}" var="departmentList"
									varStatus="count">
									<option value="${departmentList.deptId}"><c:out value="${departmentList.deptName}"/></option>
								</c:forEach>


							</select>
						</div>
									<input type="hidden" name="umo_id" id="umo_id" />
									
						</div>
							<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Machine Activity</label>
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine Activity"
								class="form-control chosen" tabindex="6" id="dept_id"
								name="dept_id" >

								<option value=""selected disabled="disabled">Choose Machine Activity</option>

								 


							</select></div>
									 
								 
									
						</div>
						<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Items</label>
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine Activity"
								class="form-control chosen" tabindex="6" id="dept_id"
								name="dept_id" >

								<option value=""selected disabled="disabled">Choose Items</option>

								  
							</select>
							</div>
									
								 
									
						</div>
						<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label"> Checkpoints</label>
									<div class="col-sm-6 col-lg-4 controls">
						<select data-placeholder="Choose Department"
								class="form-control chosen" tabindex="6" id="dept_id"
								name="dept_id" >

									<option value=""selected disabled="disabled">Choose Checkpoint</option>


								 


							</select>
							</div>
							</div>
							
								<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label"> Method</label>
									<div class="col-sm-6 col-lg-4 controls">
						<select data-placeholder="Choose Department"
								class="form-control chosen" tabindex="6" id="dept_id"
								name="dept_id" >

									<option value=""selected disabled="disabled">Choose Method</option>
										<option value="1">Physically</option>
										<option value="2">Visually</option>

								 


							</select>
							</div>
							</div>
							
							
								<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Required Value</label>
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine"
								class="form-control chosen" tabindex="6" id="dept_id"
								name="dept_id" >

								<option value=""selected disabled="disabled">Choose Required Value</option>

								<c:forEach items="${departmentList}" var="departmentList"
									varStatus="count">
									<option value="${departmentList.deptId}"><c:out value="${departmentList.deptName}"/></option>
								</c:forEach>


							</select>
						</div>
									 
									
						</div>
						
						<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Date 1</label>
									<div class="col-sm-6 col-lg-4 controls">
										<input type="text" name="uname" id="datepicker"  class="form-control"placeholder="dd-mm-yyy"data-rule-required="true" />
									</div>
								 
									
						</div>
						
						

					<div class="row" align="center">
						<div class="col-sm-9 col-sm-offset-3 col-lg-8 col-lg-offset-2">
							<button type="button" class="btn btn-info" id="submitbtn" onclick="submitUser()" disabled>Submit</button>  


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
		 <p>© 2017-18 . All Rights Reserved |  <a href="http://m&m.com/" target="_blank">M&M</a> </p></div>	
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
	
		function getData() {
			var file = $("#file").val();
			
			alert("ala"+file);
			 
			$
					.getJSON(
							'${importExcel2}',

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
	</script>
</body>

</html>