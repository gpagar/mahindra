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
#overlay {
    position: fixed;
    display: none;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(101, 113, 119, 0.5);
    z-index: 2;
    cursor: pointer;
}
#text {
   position: absolute;
    top: 50%;
    left: 50%;
    font-size: 25px;
    color: white;
    transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
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
 <div id="overlay" >  <div id="text"> Saving TBM,Please Wait...
 <img id="loading-image1" src="${pageContext.request.contextPath}/resources/images/loader1.gif" alt="Loading..." />
</div></div>  
 <div class="page-container">
<div class="left-content">
	   <div class="mother-grid-inner"> 
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <c:url var="insertTbm" value="/insertTbmData"></c:url>

              <div id="main-content">
			<!-- BEGIN Page Title -->
			
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>Earthing Resistance History
							</h3>
							<div class="box-tool">
						
						</div><br>

						<div class="box-content">
			 				<form action="${pageContext.request.contextPath}/showCbmMagazineChainHistory"  class="form-horizontal"
							 id="validation-form" 	 method="GET">
                   
				
					<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Select Year</label>
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine"
								class="form-control chosen"   id="yearId"
								name="yearId" required>

								<option value=""selected disabled="disabled">Select Year</option>

								<c:forEach items="${yearEndList}" var="yearEndList" >
								<c:choose>
									<c:when test="${yearId==yearEndList.yearEndId}">
									<option value="${yearEndList.yearEndId}" selected><c:out value="${yearEndList.year}"/></option>
									</c:when>
									<c:otherwise>
									<option value="${yearEndList.yearEndId}"><c:out value="${yearEndList.year}"/></option>
									</c:otherwise>
								</c:choose>
									
								</c:forEach>


							</select>
						</div>
									 
									
						</div>
					
					<div class="row" align="center">
						<div class="col-sm-9 col-sm-offset-3 col-lg-1 col-lg-offset-4">
							<button type="submit" class="btn btn-info" id="submitbtn">Search</button>  
							
						</div><br>
						<%-- <div class="col-sm-9 col-sm-offset-3 col-lg-1 col-lg-offset-5">
								<a href="${pageContext.request.contextPath}/showTbmHistory">	<button type="button" class="btn btn-success" >TBM History</button> </a> 
						
						</div> --%>
					</div>
		</form>  
					<div class="agile-grids" >	
				
				<div class="agile-tables">
					<div class="w3l-table-info" style="overflow-x:auto; height:400px">
					
					    <table id="table"  style="border: 1px;"><!-- class="table table-inverse table-bordered" -->
						<thead>
						   
						  <tr>
							 
							<th style="text-align: center;"  >SR.NO</th>
							<th style="text-align: center;"  >MACHINE NO.</th>  
							<th style="text-align: center;"  >REQUIRED VALUE</th>
							<th style="text-align: center;"  >ACTUAL VALUE</th>
							<th style="text-align: center;" >STATUS/REMARK</th>
							<th style="text-align: center;" >Date</th> 
							<th style="text-align: center;" >ACTUAL VALUE</th>
							<th style="text-align: center;" >STATUS/REMARK</th> 
							<th style="text-align: center;" >Date</th> 
						  </tr>
						  
						    
						</thead>
						<tbody>
				              <c:forEach items="${list}" var="list" varStatus="count">
				              
				              <tr>
				              <td>${count.index+1}</td>
				              <td>${list.machineNo}</td> 
				              <td>${list.requiredValue}</td>
				              <td>${list.actualValue1}</td>
				              <td>${list.remark1}</td>
				              <td  >${list.date1}</td>
				              <td  >${list.actualValue2}</td>
				              <td >${list.remark2}</td>
				              <td  >${list.date2} </td>  
				               
				                
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
	</div>
	<!-- END Main Content -->

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
<%-- <script src="${pageContext.request.contextPath}/resources/home/js/jquery.rowspanizer.min.js"></script>
<script>
$('#action').on('click', function() {
  $("#table").rowspanizer({vertical_align: 'middle'});
});
</script> --%>
<script type="text/javascript">
$("#table").rowspanizer({vertical_align: 'middle'});
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script> 
<script type="text/javascript">
function saveTbm(key)
{ on();
	var  tTbmId=$("#tTbmId"+key).val();
	var  machineId = $("#machineId"+key).val();
	var  locationId = $("#locationId"+key).val();
	var  itemId = $("#itemId"+key).val();
	var  frequency = $("#frequency"+key).val();
	var  lastDoneDate = $("#lastDoneDate"+key).val();
	var  lastObservation = $("#lastObservation"+key).val();
	var  lastObDate = $("#lastObDate"+key).val();

	var  nextDoneDate = $("#nextDoneDate"+key).val();
	var  nextObservation = $("#nextObservation"+key).val();
	var  nextObDate = $("#nextObDate"+key).val();


	$.getJSON('${insertTbm}', {
		tTbmId : tTbmId,
		machineId:machineId,
		locationId:locationId,
		itemId:itemId,
		frequency:frequency,
		lastDoneDate:lastDoneDate,
		lastObservation:lastObservation,
		lastObDate:lastObDate,
		nextDoneDate:nextDoneDate,
		nextObservation:nextObservation,
		nextObDate:nextObDate,
		
		ajax : 'true'

	}, function(data) {
		if(data!=null){
		alert("TBM SAVED SUCCESSFULLY")
		off();
		}
		else{
			
		}
	});
	
	
}
</script>
<script>
function on() {
    document.getElementById("overlay").style.display = "block";
}

function off() {
    document.getElementById("overlay").style.display = "none";
}

function relocate_home()
{
     location.href = 'http://file:///E:/EMaintainence/pdf/qrCodes.pdf';
}
</script>
</body>

</html>