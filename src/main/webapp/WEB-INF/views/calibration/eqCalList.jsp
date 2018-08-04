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

</style> 
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
 
<div class="left-content">
	   <div class="mother-grid-inner"> 
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

              <div id="main-content">
			<!-- BEGIN Page Title -->
			
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>  EQUIPMENT / INSTRUMENT CALIBRATION List
							</h3>
							<div class="box-tool">
						
						</div>

					<div class="agile-grids" >	
				
				<div class="agile-tables">
					<div class="w3l-table-info">
					
					    <table id="table"  style="border: 1px;"><!-- class="table table-inverse table-bordered" -->
						<thead>
						
						  <tr>
							<th>Sr.No</th>
							<th>Instrument Name</th>
							<th>Serial No.</th>
							<th>M&M Card No.</th>
						 	<th>M/c No.</th>
						    <th>Line</th>
							<th>Freq.(Year)</th>
							<th>Last Calibration Date</th>
							<th>Action</th>
						 </tr>
						</thead>
						<tbody>
				            <%--   <c:forEach items="${tbmDataList}" var="tbmDataList" varStatus="count">
				               <tr>
				              
                              <td>${count.index+1}</td>
                              <td>${tbmDataList.machineName}</td>
                              <td>${tbmDataList.locationName}</td>
                              <td>${tbmDataList.itemName}</td>
                               <td><p id="freq${count.index}">${tbmDataList.frequency}</p></td>
                              <td><p id="last${count.index}">${tbmDataList.lastDoneMonth}</p></td>
                              <td><p id="next${count.index}">${tbmDataList.nextDoneMonth}</p></td>
                                <td><p id="date1${count.index}"><input type="date" name="lastObDate${count.index}" id="lastObDate${count.index}" value="${tbmDataList.lastDate}"/></p></td>
                                <td><p id="ob1${count.index}"><textarea name="lastObservation${count.index}" id="lastObservation${count.index}">${tbmDataList.lastObservation}</textarea></p></td>
                                <td><p id="date2${count.index}"><input type="date" name="nextObDate${count.index}" id="nextObDate${count.index}" value="${tbmDataList.nextDoneDate}"/></p></td>
                                <td><p id="ob2${count.index}"><textarea name="nextObservation${count.index}" id="nextObservation${count.index}">${tbmDataList.nextObservation}</textarea></p></td>
                            
                              </tr>
                              </c:forEach> --%>
							</tbody>
					  </table>
					</div>
				

				</div>
			</div>			     
				</div>

			</div>

		</div>
	</div>
	<!-- END Main Content -->

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

</div></div>	
<!--COPY rights end here-->
</div>
</div>
  <!--//content-inner-->
			<!--/sidebar-menu-->
				
 <jsp:include page="/WEB-INF/views/include/left.jsp"></jsp:include>

							  <div class="clearfix"></div>		
							</div>
							
<script src="${pageContext.request.contextPath}/resources/home/js/jquery.nicescroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/home/js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
   <script src="${pageContext.request.contextPath}/resources/home/js/bootstrap.min.js"></script>
   <!-- /Bootstrap Core JavaScript -->	   
<!-- morris JavaScript -->	
<script src="${pageContext.request.contextPath}/resources/home/js/raphael-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/home/js/morris.js"></script>

<script type="text/javascript">

var tx = document.getElementsByTagName('textarea');
for (var i = 0; i < tx.length; i++) {
  tx[i].setAttribute('style', 'height:' + (tx[i].scrollHeight) + 'px;overflow-y:hidden;');
  tx[i].addEventListener("input", OnInput, false);
}

function OnInput() {
  this.style.height = 'auto';
  this.style.height = (this.scrollHeight) + 'px';
}
</script>

	
<script src="http://code.jquery.com/jquery-1.12.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/home/js/jquery.rowspanizer.min.js"></script>
<script>
$('#action').on('click', function() {
  $("#table").rowspanizer({vertical_align: 'middle'});
});
</script>

</body>

</html>