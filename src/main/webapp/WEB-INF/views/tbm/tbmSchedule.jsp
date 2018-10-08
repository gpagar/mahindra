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
 <div class="page-container">
 <div id="overlay" >  <div id="text"> Saving TBM,Please Wait...
 <%-- <img id="loading-image1" src="${pageContext.request.contextPath}/resources/images/loader1.gif" alt="Loading..." /> --%>
</div></div>  
<div class="left-content">
	   <div class="mother-grid-inner"> 
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <c:url var="insertTbm" value="/insertTbmData"></c:url>
  <c:url var="updateLastOb" value="/updateTbmData"></c:url>
              <div id="main-content">
			<!-- BEGIN Page Title -->
			
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i> TBM Schedule
							</h3>
							<div class="box-tool">
						
						</div>

						<div class="box-content">
							<form action="${pageContext.request.contextPath}/searchTbmSchedule"  class="form-horizontal"
							 id="validation-form" 	 method="GET">
                   
				
					<div class="form-group">
							<label class="col-sm-3 col-lg-4 control-label">Machine name & No.</label>
							<div class="col-sm-6 col-lg-4 controls">
								<select data-placeholder="Choose Machine"
								class="form-control chosen" tabindex="6" id="machineId"
								name="machineId" required>
								<option value=""selected disabled="disabled">Choose Machine</option>
                                <c:forEach items="${tbmMachineList}" var="tbmMachineList" varStatus="count">
                                <c:choose>
                                <c:when test="${tbmMachineList.machineId==machineId}">
                                    <option value="${tbmMachineList.machineId}" selected>${tbmMachineList.machineNo}--${tbmMachineList.machineName}</option>
                                
                                </c:when>
                               <c:otherwise>
                                       <option value="${tbmMachineList.machineId}">${tbmMachineList.machineNo}--${tbmMachineList.machineName}</option>
                               
                               </c:otherwise>
                              </c:choose>
                                </c:forEach>
							</select>
						</div>
									
						</div>
					
					<div class="row" align="center">
						<div class="col-sm-9 col-sm-offset-3 col-lg-1 col-lg-offset-4">
							<button type="submit" class="btn btn-info" id="submitbtn">Search</button>  
							
						</div>
						<div class="col-sm-9 col-sm-offset-3 col-lg-1 col-lg-offset-5">
								<c:if test="${machineId ne null}">  <a href="${pageContext.request.contextPath}/searchTbmData?machineId=${machineId}">	<button type="button" class="btn btn-success" >TBM</button> </a></c:if> 
						
						</div>
					</div>
		</form>
					<div class="agile-grids" >	
				
				<div class="agile-tables">
					<div class="w3l-table-info" style="overflow-x:auto; height:400px">
					
					    <table id="table"  style="border: 1px;"><!-- class="table table-inverse table-bordered" -->
						<thead>
						
						  <tr>
							<th>Sr.No</th>
							<th>Machine</th>
							<th>Location</th>
							<th>Item</th>
						 	<th>Frequency</th>
						    <th>Last done</th>
							<th>Next due</th>
							
						  </tr>
						</thead>
						<tbody>
				              <c:forEach items="${tbmDataList}" var="tbmDataList" varStatus="count">
				               <tr>
				               
				                <input type="hidden" name="tTbmId" id="tTbmId${count.index}" value="${tbmDataList.tTbmId}"/>
				               <input type="hidden" name="machineId" id="machineId${count.index}" value="${tbmDataList.machineId}"/>
				               <input type="hidden" name="itemId" id="itemId${count.index}" value="${tbmDataList.itemId}"/>
				               <input type="hidden" name="locationId" id="locationId${count.index}" value="${tbmDataList.locationId}"/>
				               <input type="hidden" name="frequency" id="frequency${count.index}" value="${tbmDataList.frequency}"/>
				               <input type="hidden" name="lastDoneDate" id="lastDoneDate${count.index}" value="${tbmDataList.lastDate}"/>
<%-- 				               <input type="hidden" name="nextDoneDate" id="nextDoneDate" value="${tbmDataList.nextDate}"/>
 --%>				              
				              <fmt:parseDate value="${tbmDataList.nextDate}" pattern="yyyy-MM-dd" var="myDate"/>
                              <fmt:formatDate value="${myDate}" var="nextD" pattern="yyyy-MM"/>
                                  <c:set var = "now" value = "<%= new java.util.Date()%>"/>
                                  <fmt:formatDate pattern = "yyyy-MM" var="currD" value = "${now}"/>
                                  
                              <td>${count.index+1}</td>
                              <td>${tbmDataList.machineName}</td>
                              <td>${tbmDataList.locationName}</td>
                              <td>${tbmDataList.itemName}</td>
                               <td><p id="freq${count.index}">${tbmDataList.frequency}</p></td>
                              <td><p id="last${count.index}">${tbmDataList.lastDoneMonth}</p></td>
                              <td><p id="next${count.index}">${tbmDataList.nextDoneMonth}</p></td>
                           
                          
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
</script>
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

</script>  --%>
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

/* 	var  nextDoneDate = $("#nextDoneDate"+key).val();
 */	var  nextObservation = $("#nextObservation"+key).val();
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
		/* nextDoneDate:nextDoneDate, */
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
<script type="text/javascript">
		function saveQty(key)
		{
			var  lastObservation = $("#lastObservation"+key).val();
			var  lastObDate = $("#lastObDate"+key).val();
			var  tTbmId=$("#tTbmId"+key).val();
			 document.getElementById("lastObservation"+key).style.backgroundColor = "lightgrey";
			    document.getElementById("lastObDate"+key).style.backgroundColor = "lightgrey";
			document.getElementById('lastObservation'+key).readOnly = true;
			document.getElementById('lastObDate'+key).readOnly = true;
		    document.getElementById('edit'+key).style.display = "block";
			document.getElementById('save'+key).style.display = "none";
				$.getJSON('${updateLastOb}',
						{
					
				            	tTbmIdLast : tTbmId,
					            nextObservation : lastObservation,
					            nextObDate:lastObDate,
					            nextDoneDate:lastObDate,
							    ajax : 'true'
							
						});
			
		}
		</script>
<script type="text/javascript">
		function editQty(key)
		{
			   document.getElementById('save'+key).style.display = "block";
			    document.getElementById('edit'+key).style.display = "none";
				    document.getElementById('lastObservation'+key).removeAttribute('readonly');
				    document.getElementById('lastObDate'+key).removeAttribute('readonly');
				    document.getElementById("lastObservation"+key).style.backgroundColor = "white";
				    document.getElementById("lastObDate"+key).style.backgroundColor = "white";

		}
		</script>
<script>
function on() {
    document.getElementById("overlay").style.display = "block";
}

function off() {
    document.getElementById("overlay").style.display = "none";
}
</script>
</body>

</html>