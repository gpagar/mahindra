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
<body>
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
								<i class="fa fa-bars"></i> BREAKDOWN/WHY WHY ANALYSIS HISTORY
							</h3>
							<div class="box-tool">
							
						</div>

						<div class="box-content">
				<form action="${pageContext.request.contextPath}/searchBreakdownsHistory"  class="form-horizontal"
							 id="validation-form"
										enctype="multipart/form-data" method="post">
										<input type="hidden" name="yearselected" id="yearselected" value="${year}"/>
							<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Select Year</label>
									 
									<div class="col-sm-6 col-lg-4 controls">
										<select name="yearpicker" id="yearpicker"	class="form-control"></select>
										
						</div>
									
						</div>	
								
								
						<div class="row" align="center">
						<div class="col-sm-9 col-sm-offset-3 col-lg-8 col-lg-offset-2">
							<button type="submit" class="btn btn-info" id="submitbtn">Search</button>  

						</div>
					</div>
				</form>
	
				        
			<div class="agile-grids" >	
				<!-- tables -->
				<div class="agile-tables">
					<div class="w3l-table-info" style="overflow-x:auto;height:400px">
					
					    <table id="table"  style="border: 1px;" >
						<thead>
						  <tr>
							<th>Sr.No</th>
							<th>Month</th>
							<th>Date</th>
							<th>Dept.</th>
							<th>cell/circle</th>
							<th>M/c No.</th>
							<th>Problem_Reported</th>
							<th>BD time Loss (Min)</th> 
							<th>Engine_Loss</th> 
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
						  </tr>
						</thead>
						<tbody>
						
						<c:forEach items="${whyWhyF18List}"  var="whyWhyF18" varStatus="count" >
						
						<tr>
						
						<td>${count.index+1}</td>
						<td><input id="month${count.index}" type="month" name="month${count.index}" value="${whyWhyF18.month}" disabled/></td>
						<td><input id="date${count.index}" type="date" name="date${count.index}" value="${whyWhyF18.date}"disabled/>
						</td>
						<td>${whyWhyF18.dept}
						</td>
						<td>${whyWhyF18.cellCircle}
						</td>
						<td>${whyWhyF18.machineNo}
						</td>
						<td>${whyWhyF18.problemReported}
						</td>
						<td>${whyWhyF18.bdTimeLoss}
						</td>
						<td>${whyWhyF18.engineLoss}
						</td>
						<td>
						   ${whyWhyF18.partStatus}
   
						</td>
						<td>${whyWhyF18.partDesc}
						</td>
						<td>
						       ${whyWhyF18.bdMsPt}
                              
						</td>
						<td>${whyWhyF18.action}
						</td>
						<td>${whyWhyF18.why1}
						</td>
						<td>${whyWhyF18.why2}
						</td>
						<td>${whyWhyF18.why3}
						</td>
						<td>${whyWhyF18.why4}
						</td>
						<td>${whyWhyF18.why5}
						</td>
						<td>${whyWhyF18.rootCause}
						</td>
						<td> ${whyWhyF18.clarificationOfCause}
						</td>
						<td>${whyWhyF18.failureCode}
						</td>
							<td>${whyWhyF18.counterMeasure}
						</td>
						<td>${whyWhyF18.category}
						</td>
						<td>${whyWhyF18.recurNonRecurr}
						</td>
							<td>${whyWhyF18.linkageWith}
						</td>
						<td> <c:choose>
						         <c:when test="${whyWhyF18.status eq '0'}"><c:out value="Closed"></c:out>
						         </c:when>
						           <c:when test="${whyWhyF18.status eq '1'}"><c:out value="Open"></c:out>
						         </c:when>
						      </c:choose>
						</td>
						<td>${whyWhyF18.refNo}
						</td>
						<td>${whyWhyF18.sapNotifNo}
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
	 
	</div>
 <!-- /script-for sticky-nav -->
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

</div>


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
	
for (i = (year); i > 1900; i--)
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
</body>

</html>