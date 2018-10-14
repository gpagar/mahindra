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
                     <c:url var="getTarget" value="/getTarget"></c:url>
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
								<i class="fa fa-bars"></i>  Add Target For ${graph}
							</h3>
							<div class="box-tool">
							
							   
								 
							 
						
						</div>

						<div class="box-content">
					<form action="${pageContext.request.contextPath}/insertTarget"  class="form-horizontal"
							 id="validation-form" enctype="multipart/form-data" method="post">
								<input type="hidden" name="graphType" id="graphType" value="${graphType}"/>
									<input type="hidden" name="targetId" id="targetId" value="0"/>
                    	<div class="row">
									<label class="col-sm-2 col-lg-1 control-label">Year</label>
									 
									<div class="col-sm-6 col-lg-2 controls">
										<select name="yearpicker" id="yearpicker"	class="form-control" ></select>
										
						</div>
						<label class="col-sm-2 col-lg-1 control-label">Target(L3)</label>
									<div class="col-sm-6 col-lg-1 controls">
										<input type="text" name="l3Target" id="l3Target" style="width:90px" min="0" required/>
									</div>
					
									<label class="col-sm-2 col-lg-2 control-label">Target(L5)</label>
									<div class="col-sm-6 col-lg-1 controls">
										<input type="text" name="l5Target" id="l5Target"  style="width:90px" min="0" required  />
									</div>
									<label class="col-sm-2 col-lg-2 control-label">Actual</label>
									<div class="col-sm-6 col-lg-1 controls">
										<input type="text" name="actual" id="actual" style="width:90px"  min="0" required  />
									</div>
						</div>	
						<div class="row">
						
						</div>
						
				
					<div class="row" align="center">
						<div class="col-sm-9 col-sm-offset-3 col-lg-8 col-lg-offset-2">
							<button type="submit" class="btn btn-info" id="submitbtn">Submit</button>  

						</div>
					</div>
					</form>
							
				</div>
					<div class="agile-grids" >	
				<!-- tables -->
				<div class="agile-tables">
					<div class="w3l-table-info" style="overflow-x:auto;height:400px">
					
					    <table id="table"  style="border: 1px;" >
						<thead>
						  <tr>
						  <th>Year</th>
						  <th>Target L3</th>
						  <th>Target L5</th>
						  <th>Action</th>
						  </tr>
						</thead>
						<tbody>
			<c:forEach items="${brTargetList}"  var="breakdownTarget" varStatus="count" >
                         <tr>
						  <td>${breakdownTarget.year}</td>
						  <td>${breakdownTarget.targetL3}</td>
						  <td>${breakdownTarget.targetL5}</td>
						  <td>
						  <span class="glyphicon glyphicon-edit" onclick="updateTarget(${breakdownTarget.targetId})"></span>&nbsp;&nbsp;
                                            
						  <a href="${pageContext.request.contextPath}/deleteTarget/${breakdownTarget.targetId}/${graphType}"
													    onClick="return confirm('Are you sure want to delete this record');"><span
														class="glyphicon glyphicon-remove"></span></a></td>
						  </tr>
						
						
						</c:forEach>
						</tbody>
						</table>
						</div>
		</div>
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
</div> -->	
<!--COPY rights end here-->
</div>
</div>
  <!--//content-inner-->
			<!--/sidebar-menu-->
				
 <jsp:include page="/WEB-INF/views/include/left.jsp"></jsp:include>
			  <div class="clearfix"></div>		
							</div>
						<!-- 	<script>
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
	var yearsel=parseInt($("#yearselected").val());
	var year=new Date().getFullYear();
	if((new Date().getMonth()+1)>3)
	{
		year=(new Date().getFullYear())+1;
	}
	
for (i = (year); i > 2010; i--)
{ 
	if(i==yearsel)
		{
	
    $('#yearpicker').append($('<option selected></option>').val(i).html('F-'+i));
		}
	else
		{
		 $('#yearpicker').append($('<option ></option> ').val(i).html('F-'+i));	
		}
}
});

</script>
<script type="text/javascript">
function updateTarget(targetId){
	
	$.getJSON('${getTarget}', {
		targetId : targetId,
	
		ajax : 'true'

	}, function(data) {
	document.getElementById("targetId").value=data.targetId;
	document.getElementById("yearpicker").value=data.year;
	document.getElementById("l3Target").value=data.targetL3;
	document.getElementById("l5Target").value=data.targetL5;
	document.getElementById("actual").value=data.exString;
	});
}
</script>
</body>
</html>