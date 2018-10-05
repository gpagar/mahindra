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
								<i class="fa fa-bars"></i> TBM History
							</h3>
							<div class="box-tool">
						
						</div>

						<div class="box-content">
							<form action="${pageContext.request.contextPath}/searchTbmHistory"  class="form-horizontal"
							 id="validation-form" 	 method="POST">
           	<input type="hidden" name="yearselected" id="yearselected" value="${fromYear}"/>
          <input type="hidden" name="yearselected1" id="yearselected1" value="${toYear}"/>
                   
				
					    <div class="form-group">
								<label class="col-sm-3 col-lg-2 control-label">From Year</label>
									 
							<div class="col-sm-6 col-lg-2 controls">
							<select name="yearpicker" id="yearpicker" 	class="form-control"></select>
										
						</div>
					
								<label class="col-sm-3 col-lg-2 control-label">To Year</label>
									 
							<div class="col-sm-6 col-lg-2 controls">
							<select name="yearpicker1" id="yearpicker1"	 class="form-control"></select>
										
						</div>
						</div>
					
					<div class="row" align="center">
						<div class="col-sm-9 col-sm-offset-3 col-lg-1 col-lg-offset-4">
							<button type="submit" class="btn btn-info" id="submitbtn">Search</button>  
							
						</div>
						<div class="col-sm-9 col-sm-offset-3 col-lg-1 col-lg-offset-5">
								<a href="${pageContext.request.contextPath}/showTbm">	<button type="button" class="btn btn-success" >BACK</button> </a> 
						
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
							<th>Prev Ob Date</th>
							<th>Prev Observation</th>
							<th>Last Ob Date</th>
							<th>Last Observation</th>
<!-- 							<th>Add Tbm</th>
 -->						  </tr>
						</thead>
						<tbody>
				              <c:forEach items="${tbmDataList}" var="tbmDataList" varStatus="count">
				               <tr>
				                <input type="hidden" name="tTbmId${count.index}" id="tTbmId${count.index}" value="${tbmDataList.tTbmId}"/>
				               <input type="hidden" name="machineId${count.index}" id="machineId${count.index}" value="${tbmDataList.machineId}"/>
				               <input type="hidden" name="itemId${count.index}" id="itemId${count.index}" value="${tbmDataList.itemId}"/>
				               <input type="hidden" name="locationId${count.index}" id="locationId${count.index}" value="${tbmDataList.locationId}"/>
				               <input type="hidden" name="frequency${count.index}" id="frequency${count.index}" value="${tbmDataList.frequency}"/>
				               <input type="hidden" name="lastDoneDate${count.index}" id="lastDoneDate${count.index}" value="${tbmDataList.lastDate}"/>
				               <input type="hidden" name="nextDoneDate${count.index}" id="nextDoneDate${count.index}" value="${tbmDataList.nextDate}"/>
				              
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
                                
<%--                                 <td><input type="button" name="submit${count.index}" id="submit${count.index}" class="btn btn-primary" value="Submit" onclick="saveTbm(${count.index})"/></td>
 --%>                              
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
<!-- <script type="text/javascript">
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

</script>  -->
<script type="text/javascript">
function saveTbm(key)
{
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
		
		}
		else{
			
		}
	});
	
	
}
</script>
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
$(document).ready(function() {
	var yearsel=parseInt($("#yearselected1").val());
	var year=new Date().getFullYear();
	if((new Date().getMonth()+1)>3)
	{
		year=(new Date().getFullYear())+1;
	}
	
for (i = (year); i > 2010; i--)
{ 
	if(i==yearsel)
		{
	
    $('#yearpicker1').append($('<option selected></option>').val(i).html('F-'+i));
		}
	else
		{
		 $('#yearpicker1').append($('<option ></option> ').val(i).html('F-'+i));	
		}
}
});
</script>
</body>

</html>