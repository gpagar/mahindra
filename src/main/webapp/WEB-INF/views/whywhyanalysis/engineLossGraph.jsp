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
}

</style> 
   <script>
   $("#datepicker").datepicker( {
	    format: "mm-yyyy",
	    startView: "months", 
	    minViewMode: "months"
	});
  
  </script>
  
<style>
.buttonload {
    background-color:white; /* Green background */
    border: none; /* Remove borders */
    color:  #f44280; /* White text */
    padding: 12px 24px; /* Some padding */
    font-size: 16px; /* Set a font-size */
    display:none;
}

/* Add a right margin to each icon */
.fa {
    margin-left: -12px;
    margin-right: 8px;
}
</style> 
</head>
<body onload="searchGraph()">
     <div class="page-container">
   <!--/content-inner-->
<div class="left-content">
	   <div class="mother-grid-inner"> 
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<c:url var="searchBrekELossGraphData" value="/searchBrekELossGraphData" />
<c:url var="updateGraphOwner" value="/updateGraphOwner" />

 <c:url var="importExcel2" value="/importExcel2"></c:url>
    <c:url var="getMachinByType" value="/getMachinByType"></c:url>
    <c:url var="getActivityByMachin" value="/getActivityByMachin"></c:url>
    <c:url var="getItemByActivity" value="/getItemByActivity"></c:url>
    <c:url var="getCheckPointsByItem" value="/getCheckPointsByItem"></c:url>
    <c:url var="getCheckRecordAgistMachine" value="/getCheckRecordAgistMachine"></c:url>
    <c:url var="insertPMRecord" value="/insertPMRecord"></c:url> 
   <c:url var="searchBrekDailyELossGraph" value="/searchBrekDailyELossGraph"></c:url> 
              <div id="main-content" style="background-color: white;">
		
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
                      <div class="row">
							<h3>
								<i class="fa fa-bars"></i> Engine loss due to machine break down&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span style="text-align:right;">
							<a href="${pageContext.request.contextPath}/showTargetG7" >	<i class="glyphicon glyphicon-plus"></i>Target</a></span>
							</h3>
						</div>
			
				     <div>
				     <table>
				     <tr>
				     <td width="15%" style="background:#f9eb3f; "><b>${sessionScope.deptName}</b></td>
				      <td width="55%"style="text-align: center;background:#f9eb3f;"><b>Engine loss due to machine break down</b></td>
				       <td width="30%" style="background:#f9eb3f;"><select name="userId" id="userId"  class="form-control" style="font-size:12px; max-width:250px !important;" onchange="ownerChange(this.value)">						
                        <option value="">Select Owner</option>	<c:forEach items="${userRes}" var="userRes" varStatus="cnt">
					    <c:choose>
						    <c:when test="${userRes.userId==graphType.userId}">
						      <option value="${userRes.userId}" selected>Owner: ${userRes.name}</option>
						    </c:when>
						    <c:otherwise>
						   	 <option value="${userRes.userId}">Owner: ${userRes.name}</option>
						    </c:otherwise>
						</c:choose>
                            
                       </c:forEach>
                       </select></td>
				     </tr>
				     </table>
				     </div>
				<div class="box-content">
				<div id="chart" >
				    <div id="chart_div" style="width:48%; height:360px; float:left;" >
				   <center>  <div id="loading1"><br><br><br><br><br><br><br>
  <img id="loading-image1" src="${pageContext.request.contextPath}/resources/home/images/loader1.gif" alt="Loading..." />
<br><br><br><br><br><br><br></div> </center>
				    </div>
				    				      <img src="${pageContext.request.contextPath}/resources/home/images/up.png" width="35" height="42">
				    
					<div id="chart_div1" style="width:48%; height:360px; float:right;" >
					<center> <div id="loading2"><br><br><br><br><br><br><br>
  <img id="loading-image1" src="${pageContext.request.contextPath}/resources/home/images/loader1.gif" alt="Loading..." />
<br><br><br><br><br><br><br></div> </center>
					</div><br><br><br><br><br><br><br><br><br><br><br>
			<br><br><br><br><br><br><br>
									<label class="col-sm-3 col-lg-2 control-label">Month:</label>
									<div class="col-sm-6 col-lg-2 controls">
							     <input type="month" id="month" name="month" class="form-control" value="${currentMonth}"/>
						</div> <button type="button" class="btn btn-info" id="graph" onclick="showDailyGraph()" name="graph" >Search</button> 
						 <button class="buttonload" id="button1">
  <i class="fa fa-spinner fa-spin"></i>Loading
</button> 
						  	<div id="chart_div2" style="width:90%; height:300px; float:left;" >
						
						<center> <div id="loading3"><br><br><br><br><br><br><br>
  <img id="loading-image1" src="${pageContext.request.contextPath}/resources/home/images/loader1.gif" alt="Loading..." />
<br><br><br><br><br><br><br></div> </center>
						</div>
				
	       		  <img src="${pageContext.request.contextPath}/resources/home/images/down.jpg" width="35" height="42" style="float:right;">
	           
	             
	             
	             </div>
			</div>

		</div>
	</div>
	<!-- END Main Content -->
<img src="${pageContext.request.contextPath}/resources/home/images/drawing.png" alt=""><br>
MQS/DM/F/03 Rev: 0.0
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
<!-- <div class="copyrights">
		 <p>© 2017-18 . All Rights Reserved |  <a href="www.mahindra.com/" target="_blank">Mahindra rise</a> </p></div>	 -->
</div>	
<!--COPY rights end here-->
</div>
<!-- </div> -->
  <!--//content-inner-->
			<!--/sidebar-menu-->
				
 <jsp:include page="/WEB-INF/views/include/left.jsp"></jsp:include>

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
<script src="${pageContext.request.contextPath}/resources/home/js/jquery.nicescroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/home/js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
   <script src="${pageContext.request.contextPath}/resources/home/js/bootstrap.min.js"></script>
   <!-- /Bootstrap Core JavaScript -->	   
<!-- morris JavaScript -->	
<script src="${pageContext.request.contextPath}/resources/home/js/raphael-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/home/js/morris.js"></script>
<!-- <script type="text/javascript">
function addNewPM(key)
{
	 if (confirm("Do you want to Save this record?")) {
	var isValid=validation(key);
	document.getElementById('key').value=key;
	
	if(isValid==true)
		{
		document.forms["pm_form"].submit();
		}
	 }
}
</script> -->
<script type="text/javascript">
/* function validation(key) {
	
	var methodId = $("#method_id"+key).val();
	var reqValue = $("#req_value"+key).val();
	
	var isValid = true;
	if (methodId==0) { 
		isValid = false;
		alert("Please Select Method");
	} else if (reqValue ==0) {
		isValid = false;
		alert("Please Select Required Value");
	}
	return isValid;
} */
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

<script type="text/javascript">
	
		
		function onMacTypeChange(machineType) {


						$.getJSON('${getMachinByType}', {

							machineType : machineType,

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

					}
		$(document).ready(function() { 

			$('#machineId').change(

					function() {

						//alert("hh");

						 

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

		
	
		 
	</script>
	<script type="text/javascript">
	function setMachineSelected(machineType,machineId)
	{
		
		$.getJSON('${getMachinByType}', {
			machineType : machineType,
			ajax : 'true'

		}, function(data) {
			var html = '<option value="" selected >Choose Machine</option>';

			var len = data.length;

			$('#machineId')

		    .find('option')

		    .remove()

		    .end()

		    $("#machineId").append(

                       $("<option ></option>").attr(

                           "value", "").text("Select Machine Name Or Number")

                   );

			for ( var i = 0; i < len; i++) {

				if(data[i].machinId==machineId)
					{
				 $("#machineId").append(

                           $("<option selected></option>").attr(

                               "value", data[i].machinId).text(data[i].machinNo+" "+data[i].machinName)

                       );
					}else{
					 $("#machineId").append(

	                           $("<option ></option>").attr(

	                               "value", data[i].machinId).text(data[i].machinNo+" "+data[i].machinName)

	                       );
					
					}
			} 
			
			$("#machineId").trigger("chosen:updated");

		});
		
		
	}
	</script>
			 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
	<script type="text/javascript">
	
	function searchGraph()
	{
		 //  var machineType = document.getElementById("machineType").value;
		 //  var machineId = document.getElementById("machineId").value;
	    var d = new Date();
        var n = d.getMonth()+1;
        if(n==1){
       	 n=10;
        }else if(n==2)
       	 {
       	  n=11;
       	 }else if(n==3)
       		 {
       		 n=12;
       		 }
       	 else
       		 {
       		 n=n-3;
       		 }
		$.getJSON('${searchBrekELossGraphData}',{
			
			//machineType : machineType,
			//machineId : machineId,
			ajax : 'true',

		},
		function(data) {
	
		 if (data == "") {
				alert("No records found !!");

			}
	    var year=parseInt(data.year);
		var firstYear=parseFloat(data.yearlyMachineBdTimeList.breakdownYearly.firstYearTime);  firstYear=parseFloat((firstYear/n).toFixed(1));
	    var secondYear=parseFloat(data.yearlyMachineBdTimeList.breakdownYearly.secondYearTime);secondYear=parseFloat((secondYear/n).toFixed(1));
	    var thirdYear=parseFloat(data.yearlyMachineBdTimeList.breakdownYearly.thirdYearTime);thirdYear=parseFloat((thirdYear/n).toFixed(1));
	    var fourthYear=parseFloat(data.yearlyMachineBdTimeList.breakdownYearly.fourthYearTime);fourthYear=parseFloat((fourthYear/n).toFixed(1));
        var year1L3Target=parseFloat(data.yearlyMachineBdTimeList.machineL3Target.year1lTtarget);
        var year2L3Target=parseFloat(data.yearlyMachineBdTimeList.machineL3Target.year2lTtarget);
        var year3L3Target=parseFloat(data.yearlyMachineBdTimeList.machineL3Target.year3lTtarget);
        var year4L3Target=parseFloat(data.yearlyMachineBdTimeList.machineL3Target.year4lTtarget);
        var year1L5Target=parseFloat(data.yearlyMachineBdTimeList.machineL5Target.year1lTarget);
        var year2L5Target=parseFloat(data.yearlyMachineBdTimeList.machineL5Target.year2lTarget);
        var year3L5Target=parseFloat(data.yearlyMachineBdTimeList.machineL5Target.year3lTarget);
        var year4L5Target=parseFloat(data.yearlyMachineBdTimeList.machineL5Target.year4lTarget);
 
        var avgYear1L3Targetpm=parseFloat(year1L3Target/12);avgYear1L3Targetpm=parseFloat(avgYear1L3Targetpm.toFixed(1));
        var avgYear1L5Targetpm=parseFloat(year1L5Target/12);avgYear1L5Targetpm=parseFloat(avgYear1L5Targetpm.toFixed(1));
        var avgYear2L3Targetpm=parseFloat(year2L3Target/12);avgYear2L3Targetpm=parseFloat(avgYear2L3Targetpm.toFixed(1));
        var avgYear2L5Targetpm=parseFloat(year2L5Target/12);avgYear2L5Targetpm=parseFloat(avgYear2L5Targetpm.toFixed(1));
        var avgYear3L3Targetpm=parseFloat(year3L3Target/12);avgYear3L3Targetpm=parseFloat(avgYear3L3Targetpm.toFixed(1));
        var avgYear3L5Targetpm=parseFloat(year3L5Target/12);avgYear3L5Targetpm=parseFloat(avgYear3L5Targetpm.toFixed(1));
        
        var avgL3Targetpm=parseFloat(year4L3Target/12);avgL3Targetpm=parseFloat(avgL3Targetpm.toFixed(1));
        var avgL5Targetpm=parseFloat(year4L5Target/12);avgL5Targetpm=parseFloat(avgL5Targetpm.toFixed(1));
        
        var avgL3Targetpd=parseFloat(year4L3Target/30);avgL3Targetpd=parseFloat(avgL3Targetpd.toFixed(1));
        var avgL5Targetpd=parseFloat(year4L3Target/30);avgL5Targetpd=parseFloat(avgL5Targetpd.toFixed(1));
        
    	var day1=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day1);day1=parseFloat(day1.toFixed(1));
    	var day2=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day2);day2=parseFloat(day2.toFixed(1));
    	var day3=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day3);day3=parseFloat(day3.toFixed(1));
    	var day4=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day4);day4=parseFloat(day4.toFixed(1));
    	var day5=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day5);day5=parseFloat(day5.toFixed(1));
    	var day6=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day6);day6=parseFloat(day6.toFixed(1));
    	var day7=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day7);day7=parseFloat(day7.toFixed(1));
    	var day8=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day8);day8=parseFloat(day8.toFixed(1));
    	var day9=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day9);day9=parseFloat(day9.toFixed(1));
    	var day10=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day10);day10=parseFloat(day10.toFixed(1));
    	var day11=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day11);day11=parseFloat(day11.toFixed(1));
    	var day12=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day12);day12=parseFloat(day12.toFixed(1));
    	var day13=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day13);day13=parseFloat(day13.toFixed(1));
    	var day14=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day14);day14=parseFloat(day14.toFixed(1));
    	var day15=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day15);day15=parseFloat(day15.toFixed(1));
    	var day16=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day16);day16=parseFloat(day16.toFixed(1));
    	var day17=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day17);day17=parseFloat(day17.toFixed(1));
    	var day18=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day18);day18=parseFloat(day18.toFixed(1));
    	var day19=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day19);day19=parseFloat(day19.toFixed(1));
    	var day20=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day20);day20=parseFloat(day20.toFixed(1));
    	var day21=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day21);day21=parseFloat(day21.toFixed(1));
    	var day22=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day22);day22=parseFloat(day22.toFixed(1));
    	var day23=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day23);day23=parseFloat(day23.toFixed(1));
    	var day24=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day24);day24=parseFloat(day24.toFixed(1));
    	var day25=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day25);day25=parseFloat(day25.toFixed(1));
    	var day26=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day26);day26=parseFloat(day26.toFixed(1));
    	var day27=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day27);day27=parseFloat(day27.toFixed(1));
    	var day28=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day28);day28=parseFloat(day28.toFixed(1));
    	var day29=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day29);day29=parseFloat(day29.toFixed(1));
    	var day30=parseFloat(data.yearlyMachineBdTimeList.dailyBreakdowns.day30);day30=parseFloat(day30.toFixed(1));

    	var day1bd="1 \n Actual: "+day1;var day2bd="2 \n Actual: "+day2;var day3bd="3 \n Actual: "+day3;var day4bd="4 \n Actual: "+day4;var day5bd="5 \n Actual: "+day5;
    	var day6bd="6 \n Actual: "+day6;var day7bd="7 \n Actual: "+day7;var day8bd="8 \n Actual: "+day8;var day9bd="9 \n Actual: "+day9;var day10bd="10 \n Actual: "+day10;
    	var day11bd="11 \n Actual: "+day11;var day12bd="12 \n Actual: "+day12;var day13bd="13 \n Actual: "+day13;var day14bd="14 \n Actual: "+day14;var day15bd="15 \n Actual: "+day15;
    	var day16bd="16 \n Actual: "+day16;var day17bd="17 \n Actual: "+day17;var day18bd="18 \n Actual: "+day18;var day19bd="19 \n Actual: "+day19;var day20bd="20 \n Actual: "+day20;
    	var day21bd="21 \n Actual: "+day21;var day22bd="22 \n Actual: "+day22;var day23bd="23 \n Actual: "+day23;var day24bd="24 \n Actual: "+day24;var day25bd="25 \n Actual: "+day25;
    	var day26bd="26 \n Actual: "+day26;var day27bd="27 \n Actual: "+day27;var day28bd="28 \n Actual: "+day28;var day29bd="29 \n Actual: "+day29;var day30bd="30 \n Actual: "+day30;
    	
    	 for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list1.length;i++)
		  {
		  day1bd=day1bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list1[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list1[i].problemReported;
		  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list2.length;i++)
	  {
	  day2bd=day2bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list2[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list2[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list3.length;i++)
	  {
	  day3bd=day3bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list3[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list3[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list4.length;i++)
	  {
	  day4bd=day4bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list4[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list4[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list5.length;i++)
	  {
	  day5bd=day5bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list5[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list5[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list6.length;i++)
	  {
	  day6bd=day6bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list6[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list6[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list7.length;i++)
	  {
	  day7bd=day7bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list7[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list7[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list8.length;i++)
	  {
	  day8bd=day8bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list8[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list8[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list9.length;i++)
	  {
	  day9bd=day9bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list9[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list9[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list10.length;i++)
	  {
	  day10bd=day10bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list10[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list10[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list11.length;i++)
	  {
	  day11bd=day11bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list11[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list11[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list12.length;i++)
	  {
	  day12bd=day12bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list12[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list12[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list13.length;i++)
	  {
	  day13bd=day13bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list13[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list13[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list14.length;i++)
	  {
	  day14bd=day14bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list14[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list14[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list15.length;i++)
	  {
	  day15bd=day15bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list15[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list15[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list16.length;i++)
	  {
	  day16bd=day16bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list16[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list16[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list17.length;i++)
	  {
	  day17bd=day17bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list17[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list17[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list18.length;i++)
	  {
	  day18bd=day18bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list18[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list18[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list19.length;i++)
	  {
	  day19bd=day19bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list19[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list19[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list20.length;i++)
	  {
	  day20bd=day20bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list20[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list20[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list21.length;i++)
	  {
	  day21bd=day21bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list21[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list21[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list22.length;i++)
	  {
	  day22bd=day22bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list22[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list22[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list23.length;i++)
	  {
	  day23bd=day23bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list23[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list23[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list24.length;i++)
	  {
	  day24bd=day24bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list24[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list24[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list25.length;i++)
	  {
	  day25bd=day25bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list25[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list25[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list26.length;i++)
	  {
	  day26bd=day26bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list26[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list26[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list27.length;i++)
	  {
	  day27bd=day27bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list27[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list27[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list28.length;i++)
	  {
	  day28bd=day28bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list28[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list28[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list29.length;i++)
	  {
	  day29bd=day29bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list29[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list29[i].problemReported;
	  }
	  for(var i=0;i<data.yearlyMachineBdTimeList.bProblemsList.list30.length;i++)
	  {
	  day30bd=day30bd+"\n M/c No: "+data.yearlyMachineBdTimeList.bProblemsList.list30[i].machineNo+"\n Problem Reported: "+data.yearlyMachineBdTimeList.bProblemsList.list30[i].problemReported;
	  }
			  
        
		      google.charts.load('current', {'packages':['corechart']});
		      google.charts.setOnLoadCallback(drawVisualization);
		      google.charts.setOnLoadCallback(drawVisualization1);
		      google.charts.setOnLoadCallback(drawVisualization2);


		      function drawVisualization() {
		        // Some raw data (not necessarily accurate)
		        var data = google.visualization.arrayToDataTable([
		         ['F YEAR', 'Actual',{ role: 'annotation' } , 'Target L3',{type:'boolean',role:'certainty'},'Target L5'],
		         ['F-'+(year-3)+'',firstYear,firstYear+'',avgYear1L3Targetpm,false,avgYear1L5Targetpm],
		         ['F-'+(year-2)+'', secondYear,secondYear+'',avgYear2L3Targetpm,false,avgYear2L5Targetpm],
		         ['F-'+(year-1)+'',  thirdYear,thirdYear+'',avgYear3L3Targetpm,false,avgYear3L5Targetpm],
		         ['F-'+year+'', fourthYear,fourthYear+'',avgL3Targetpm,false,avgL5Targetpm],
		     
		      ]);

		    var options = {
		      title : 'Yearly Trends (Avg.Yearly)',
		      vAxis: {title: 'No. of engine'},
		      hAxis: {title: 'YEAR  -->'},
		      seriesType: 'bars',
		      series: {
		          1: { type: 'line' },
		          2: { type: 'line' }
		        },  colors: ['#1156d6','#1156d6', '#cc0000'], 
		    };

		    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
			 document.getElementById("chart_div").style.border = "thin dotted red";
		    chart.draw(data, options);
		     $('#loading1').hide();

		   
		  }
		      var breakdownTime1=parseFloat(data.breakdownTimeMonthwise.breakdownTime1);breakdownTime1=parseFloat(breakdownTime1.toFixed(1));
		      var breakdownTime2=parseFloat(data.breakdownTimeMonthwise.breakdownTime2);breakdownTime2=parseFloat(breakdownTime2.toFixed(1));
		      var breakdownTime3=parseFloat(data.breakdownTimeMonthwise.breakdownTime3);breakdownTime3=parseFloat(breakdownTime3.toFixed(1));
		      var breakdownTime4=parseFloat(data.breakdownTimeMonthwise.breakdownTime4);breakdownTime4=parseFloat(breakdownTime4.toFixed(1));
		      var breakdownTime5=parseFloat(data.breakdownTimeMonthwise.breakdownTime5);breakdownTime5=parseFloat(breakdownTime5.toFixed(1));
		      var breakdownTime6=parseFloat(data.breakdownTimeMonthwise.breakdownTime6);breakdownTime6=parseFloat(breakdownTime6.toFixed(1));
		      var breakdownTime7=parseFloat(data.breakdownTimeMonthwise.breakdownTime7);breakdownTime7=parseFloat(breakdownTime7.toFixed(1));
		      var breakdownTime8=parseFloat(data.breakdownTimeMonthwise.breakdownTime8);breakdownTime8=parseFloat(breakdownTime8.toFixed(1));
		      var breakdownTime9=parseFloat(data.breakdownTimeMonthwise.breakdownTime9);breakdownTime9=parseFloat(breakdownTime9.toFixed(1));
		      var breakdownTime10=parseFloat(data.breakdownTimeMonthwise.breakdownTime10);breakdownTime10=parseFloat(breakdownTime10.toFixed(1));
		      var breakdownTime11=parseFloat(data.breakdownTimeMonthwise.breakdownTime11);breakdownTime11=parseFloat(breakdownTime11.toFixed(1));
		      var breakdownTime12=parseFloat(data.breakdownTimeMonthwise.breakdownTime12);breakdownTime12=parseFloat(breakdownTime12.toFixed(1));
		      
		  /*     var breakdownL5Target1=parseInt(data.breakdownMothwiseL5Target.breakdownCnt1);
		      var breakdownL5Target2=parseInt(data.breakdownMothwiseL5Target.breakdownCnt2);
		      var breakdownL5Target3=parseInt(data.breakdownMothwiseL5Target.breakdownCnt3);
		      var breakdownL5Target4=parseInt(data.breakdownMothwiseL5Target.breakdownCnt4);
		      var breakdownL5Target5=parseInt(data.breakdownMothwiseL5Target.breakdownCnt5);
		      var breakdownL5Target6=parseInt(data.breakdownMothwiseL5Target.breakdownCnt6);
		      var breakdownL5Target7=parseInt(data.breakdownMothwiseL5Target.breakdownCnt7);
		      var breakdownL5Target8=parseInt(data.breakdownMothwiseL5Target.breakdownCnt8);
		      var breakdownL5Target9=parseInt(data.breakdownMothwiseL5Target.breakdownCnt9);
		      var breakdownL5Target10=parseInt(data.breakdownMothwiseL5Target.breakdownCnt10);
		      var breakdownL5Target11=parseInt(data.breakdownMothwiseL5Target.breakdownCnt11);
		      var breakdownL5Target12=parseInt(data.breakdownMothwiseL5Target.breakdownCnt12); */
		      function drawVisualization1() {
			        // Some raw data (not necessarily accurate)
			        var data = google.visualization.arrayToDataTable([
			         ['Month', 'Actual',{ role: 'annotation' }, 'Target L3',{type:'boolean',role:'certainty'},'Target L5'],
			         ['Apr',breakdownTime1,breakdownTime1+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['May', breakdownTime2,breakdownTime2+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['June',breakdownTime3,breakdownTime3+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['July', breakdownTime4,breakdownTime4+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Aug',breakdownTime5,breakdownTime5+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Sep',breakdownTime6,breakdownTime6+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Oct',breakdownTime7,breakdownTime7+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Nov',breakdownTime8,breakdownTime8+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Dec',breakdownTime9,breakdownTime9+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Jan',breakdownTime10,breakdownTime10+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Feb',breakdownTime11,breakdownTime11+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Mar',breakdownTime12,breakdownTime12+'',avgL3Targetpm,false,avgL5Targetpm],
			     
			      ]);

			    var options = {
			      title : 'Monthly Trends (Engine Loss/Month)',
			      vAxis: {title: 'No. Of Engine'},
			      hAxis: {title: 'Month  -->'},
			      seriesType: 'bars',
			      series: {
			          1: { type: 'line' },
			          2: { type: 'line' },
			        },  colors: ['#1156d6','#1156d6', '#cc0000'], 
			    };

			    var chart = new google.visualization.ComboChart(document.getElementById('chart_div1'));
				 document.getElementById("chart_div1").style.border = "thin dotted red";

			    chart.draw(data, options);
			     $('#loading2').hide();

			  }
		      function drawVisualization2() {

		    	    var data = new google.visualization.DataTable();
		    	data.addColumn('number', 'days'); 
		    	data.addColumn('number', 'Actual'); 
		        data.addColumn({type: 'string', role: 'tooltip'});

		    	data.addColumn('number', 'Target L3'); 
		    	data.addColumn({type:'boolean',role:'certainty'}); // certainty col.

		    	data.addColumn('number', 'Target L5'); 
		    	
		    	data.addRows([
		    		 [{v: 1, f:'1'},day1,day1bd ,avgL3Targetpm,false,avgL5Targetpm],
			    	  [{v: 2, f:'2'},day2,day2bd,avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 3, f:'3'},day3,day3bd,avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 4, f:'4'},day4,day4bd,avgL3Targetpm, false, avgL5Targetpm],
			    	   [{v: 5, f:'5'},day5,day5bd,avgL3Targetpm  ,false,avgL5Targetpm],
			    	  [{v: 6, f:'6'},day6,day6bd,avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v:7, f:'7'},day7,day7bd, avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 8, f:'8'},day8,day8bd, avgL3Targetpm, false, avgL5Targetpm],
			    	   [{v: 9, f:'9'},day9,day9bd,avgL3Targetpm  ,false,avgL5Targetpm],
			    	  [{v: 10, f:'10'},day10,day10bd, avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 11, f:'11'},day11,day11bd, avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 12, f:'12'},day12,day12bd, avgL3Targetpm, false,avgL5Targetpm],
			    	   [{v: 13, f:'13'},day13,day13bd,avgL3Targetpm  ,false,avgL5Targetpm],
			    	  [{v: 14, f:'14'},day14,day14bd, avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 15, f:'15'},day15,day15bd,avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 16, f:'16'},day16,day16bd,avgL3Targetpm, false, avgL5Targetpm], 
			    	  [{v: 17, f:'17'},day17,day17bd, avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 18, f:'18'},day18,day18bd, avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 19, f:'19'},day19,day19bd,avgL3Targetpm, false,avgL5Targetpm], 
			    	  [{v: 20, f:'20'},day20,day20bd, avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 21, f:'21'},day21,day21bd,avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 22, f:'22'},day22,day22bd,avgL3Targetpm, false, avgL5Targetpm],
			    	  [{v: 23, f:'23'},day23,day23bd, avgL3Targetpm, false,avgL5Targetpm],
			    	  [{v: 24, f:'24'},day24,day24bd, avgL3Targetpm, false, avgL5Targetpm],
			    	  [{v: 25, f:'25'},day25,day25bd,avgL3Targetpm, false, avgL5Targetpm],
			    	  [{v: 26, f:'26'},day26,day26bd, avgL3Targetpm, false, avgL5Targetpm],
			    	  [{v: 27, f:'27'},day27,day27bd, avgL3Targetpm, false,avgL5Targetpm],
			    	  [{v: 28, f:'28'},day28,day28bd, avgL3Targetpm, false,avgL5Targetpm],
			    	  [{v: 29, f:'29'},day29,day29bd, avgL3Targetpm, false,avgL5Targetpm],
			    	  [{v: 30, f:'30'},day30,day30bd, avgL3Targetpm, false,avgL5Targetpm]
		    	]);
		    	var options = {
		    			
		    	    		curveType: 'function',
		    	        title: 'Daily trends Engine Loss/day(cum)',
		    	        hAxis: {
		    	            title: 'days',
		    	            titleTextStyle: {
		    	                color: '#333'
		    	            }, tooltip: {isHtml: true},
		    	            baseline: 0,
		    	            gridlines: {
		    	            	color: '#f3f3f3',
		    	              count: 4
		    	            },
		    	           ticks: [{v: 1, f:'1'},{v: 2, f:'2'},{v:3, f:'3'},{v: 4, f:'4'},{v:5, f:'5'},{v:6, f:'6'},{v: 7, f:'7'},{v:8, f:'8'}
		    	           ,{v: 9, f:'9'},{v:10, f:'10'},{v: 11, f:'11'},{v: 12, f:'12'},{v: 13, f:'13'},{v: 14, f:'14'},{v: 15, f:'15'},{v: 16, f:'16'}
		    	           ,{v: 17, f:'17'},{v: 18, f:'18'},{v: 19, f:'19'},{v: 20, f:'20'},{v: 21, f:'21'},{v:22, f:'22'},{v: 23, f:'23'},{v: 24, f:'24'}
		    	          ,{v: 25, f:'25'},{v: 26, f:'26'},{v: 27, f:'27'},{v: 28, f:'28'},{v:29, f:'29'},{v: 30, f:'30'}
		    	           ]
		    	        },
		    	        vAxis: { 
		    	        	title: 'No. Of Engines(Cum)',
		    	            viewWindow: {
		    	            	
		    	                min:0
		    	            }
		    	        },  seriesType: 'line',
					      series: {
					          1: { type: 'line' },
					          2: { type: 'line' },
					        },  colors: ['#1156d6','#1156d6', '#cc0000'], 
		    	       
		    	       
			    };

			    var chart = new google.visualization.ComboChart(document.getElementById('chart_div2'));
				 document.getElementById("chart_div2").style.border = "thin dotted red";

			    chart.draw(data, options);
			     $('#loading3').hide();

			  }
		
		});
		
		

	}
	
	function showDailyGraph()
	{
		  $('#button1').show();

		var month = document.getElementById("month").value;
		$.getJSON('${searchBrekDailyELossGraph}',{
			month : month,
			ajax : 'true',
		},
		function(data) {
			var avgL3Targetpm=parseFloat(data.dSearchedTarget.yearL3target/12);avgL3Targetpm=parseFloat(avgL3Targetpm.toFixed(1));
			
		       var avgL5Targetpm=parseFloat(data.dSearchedTarget.yearL5target/12);avgL5Targetpm=parseFloat(avgL5Targetpm.toFixed(1))
			 google.charts.load('current', {'packages':['corechart']});
		  
		      google.charts.setOnLoadCallback(drawVisualization2);
		      var day1=parseFloat(data.dailyBreakdowns.day1);day1=parseFloat(day1.toFixed(1));
		    	var day2=parseFloat(data.dailyBreakdowns.day2);day2=parseFloat(day2.toFixed(1));
		    	var day3=parseFloat(data.dailyBreakdowns.day3);day3=parseFloat(day3.toFixed(1));
		    	var day4=parseFloat(data.dailyBreakdowns.day4);day4=parseFloat(day4.toFixed(1));
		    	var day5=parseFloat(data.dailyBreakdowns.day5);day5=parseFloat(day5.toFixed(1));
		    	var day6=parseFloat(data.dailyBreakdowns.day6);day6=parseFloat(day6.toFixed(1));
		    	var day7=parseFloat(data.dailyBreakdowns.day7);day7=parseFloat(day7.toFixed(1));
		    	var day8=parseFloat(data.dailyBreakdowns.day8);day8=parseFloat(day8.toFixed(1));
		    	var day9=parseFloat(data.dailyBreakdowns.day9);day9=parseFloat(day9.toFixed(1));
		    	var day10=parseFloat(data.dailyBreakdowns.day10);day10=parseFloat(day10.toFixed(1));
		    	var day11=parseFloat(data.dailyBreakdowns.day11);day11=parseFloat(day11.toFixed(1));
		    	var day12=parseFloat(data.dailyBreakdowns.day12);day12=parseFloat(day12.toFixed(1));
		    	var day13=parseFloat(data.dailyBreakdowns.day13);day13=parseFloat(day13.toFixed(1));
		    	var day14=parseFloat(data.dailyBreakdowns.day14);day14=parseFloat(day14.toFixed(1));
		    	var day15=parseFloat(data.dailyBreakdowns.day15);day15=parseFloat(day15.toFixed(1));
		    	var day16=parseFloat(data.dailyBreakdowns.day16);day16=parseFloat(day16.toFixed(1));
		    	var day17=parseFloat(data.dailyBreakdowns.day17);day17=parseFloat(day17.toFixed(1));
		    	var day18=parseFloat(data.dailyBreakdowns.day18);day18=parseFloat(day18.toFixed(1));
		    	var day19=parseFloat(data.dailyBreakdowns.day19);day19=parseFloat(day19.toFixed(1));
		    	var day20=parseFloat(data.dailyBreakdowns.day20);day20=parseFloat(day20.toFixed(1));
		    	var day21=parseFloat(data.dailyBreakdowns.day21);day21=parseFloat(day21.toFixed(1));
		    	var day22=parseFloat(data.dailyBreakdowns.day22);day22=parseFloat(day22.toFixed(1));
		    	var day23=parseFloat(data.dailyBreakdowns.day23);day23=parseFloat(day23.toFixed(1));
		    	var day24=parseFloat(data.dailyBreakdowns.day24);day24=parseFloat(day24.toFixed(1));
		    	var day25=parseFloat(data.dailyBreakdowns.day25);day25=parseFloat(day25.toFixed(1));
		    	var day26=parseFloat(data.dailyBreakdowns.day26);day26=parseFloat(day26.toFixed(1));
		    	var day27=parseFloat(data.dailyBreakdowns.day27);day27=parseFloat(day27.toFixed(1));
		    	var day28=parseFloat(data.dailyBreakdowns.day28);day28=parseFloat(day28.toFixed(1));
		    	var day29=parseFloat(data.dailyBreakdowns.day29);day29=parseFloat(day29.toFixed(1));
		    	var day30=parseFloat(data.dailyBreakdowns.day30);day30=parseFloat(day30.toFixed(1));
		   
		    	var day1bd="1 \n Actual: "+day1;var day2bd="2 \n Actual: "+day2;var day3bd="3 \n Actual: "+day3;var day4bd="4 \n Actual: "+day4;var day5bd="5 \n Actual: "+day5;
		    	var day6bd="6 \n Actual: "+day6;var day7bd="7 \n Actual: "+day7;var day8bd="8 \n Actual: "+day8;var day9bd="9 \n Actual: "+day9;var day10bd="10 \n Actual: "+day10;
		    	var day11bd="11 \n Actual: "+day11;var day12bd="12 \n Actual: "+day12;var day13bd="13 \n Actual: "+day13;var day14bd="14 \n Actual: "+day14;var day15bd="15 \n Actual: "+day15;
		    	var day16bd="16 \n Actual: "+day16;var day17bd="17 \n Actual: "+day17;var day18bd="18 \n Actual: "+day18;var day19bd="19 \n Actual: "+day19;var day20bd="20 \n Actual: "+day20;
		    	var day21bd="21 \n Actual: "+day21;var day22bd="22 \n Actual: "+day22;var day23bd="23 \n Actual: "+day23;var day24bd="24 \n Actual: "+day24;var day25bd="25 \n Actual: "+day25;
		    	var day26bd="26 \n Actual: "+day26;var day27bd="27 \n Actual: "+day27;var day28bd="28 \n Actual: "+day28;var day29bd="29 \n Actual: "+day29;var day30bd="30 \n Actual: "+day30;
		    	
		    		  for(var i=0;i<data.bProblemsList.list1.length;i++)
		    			  {
		    			  day1bd=day1bd+"\n M/c No: "+data.bProblemsList.list1[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list1[i].problemReported;
		    			  }
		    		  for(var i=0;i<data.bProblemsList.list2.length;i++)
					  {
					  day2bd=day2bd+"\n M/c No: "+data.bProblemsList.list2[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list2[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list3.length;i++)
					  {
					  day3bd=day3bd+"\n M/c No: "+data.bProblemsList.list3[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list3[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list4.length;i++)
					  {
					  day4bd=day4bd+"\n M/c No: "+data.bProblemsList.list4[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list4[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list5.length;i++)
					  {
					  day5bd=day5bd+"\n M/c No: "+data.bProblemsList.list5[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list5[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list6.length;i++)
					  {
					  day6bd=day6bd+"\n M/c No: "+data.bProblemsList.list6[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list6[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list7.length;i++)
					  {
					  day7bd=day7bd+"\n M/c No: "+data.bProblemsList.list7[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list7[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list8.length;i++)
					  {
					  day8bd=day8bd+"\n M/c No: "+data.bProblemsList.list8[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list8[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list9.length;i++)
					  {
					  day9bd=day9bd+"\n M/c No: "+data.bProblemsList.list9[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list9[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list10.length;i++)
					  {
					  day10bd=day10bd+"\n M/c No: "+data.bProblemsList.list10[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list10[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list11.length;i++)
					  {
					  day11bd=day11bd+"\n M/c No: "+data.bProblemsList.list11[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list11[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list12.length;i++)
					  {
					  day12bd=day12bd+"\n M/c No: "+data.bProblemsList.list12[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list12[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list13.length;i++)
					  {
					  day13bd=day13bd+"\n M/c No: "+data.bProblemsList.list13[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list13[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list14.length;i++)
					  {
					  day14bd=day14bd+"\n M/c No: "+data.bProblemsList.list14[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list14[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list15.length;i++)
					  {
					  day15bd=day15bd+"\n M/c No: "+data.bProblemsList.list15[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list15[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list16.length;i++)
					  {
					  day16bd=day16bd+"\n M/c No: "+data.bProblemsList.list16[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list16[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list17.length;i++)
					  {
					  day17bd=day17bd+"\n M/c No: "+data.bProblemsList.list17[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list17[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list18.length;i++)
					  {
					  day18bd=day18bd+"\n M/c No: "+data.bProblemsList.list18[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list18[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list19.length;i++)
					  {
					  day19bd=day19bd+"\n M/c No: "+data.bProblemsList.list19[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list19[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list20.length;i++)
					  {
					  day20bd=day20bd+"\n M/c No: "+data.bProblemsList.list20[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list20[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list21.length;i++)
					  {
					  day21bd=day21bd+"\n M/c No: "+data.bProblemsList.list21[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list21[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list22.length;i++)
					  {
					  day22bd=day22bd+"\n M/c No: "+data.bProblemsList.list22[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list22[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list23.length;i++)
					  {
					  day23bd=day23bd+"\n M/c No: "+data.bProblemsList.list23[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list23[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list24.length;i++)
					  {
					  day24bd=day24bd+"\n M/c No: "+data.bProblemsList.list24[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list24[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list25.length;i++)
					  {
					  day25bd=day25bd+"\n M/c No: "+data.bProblemsList.list25[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list25[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list26.length;i++)
					  {
					  day26bd=day26bd+"\n M/c No: "+data.bProblemsList.list26[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list26[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list27.length;i++)
					  {
					  day27bd=day27bd+"\n M/c No: "+data.bProblemsList.list27[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list27[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list28.length;i++)
					  {
					  day28bd=day28bd+"\n M/c No: "+data.bProblemsList.list28[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list28[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list29.length;i++)
					  {
					  day29bd=day29bd+"\n M/c No: "+data.bProblemsList.list29[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list29[i].problemReported;
					  }
		    		  for(var i=0;i<data.bProblemsList.list30.length;i++)
					  {
					  day30bd=day30bd+"\n M/c No: "+data.bProblemsList.list30[i].machineNo+"\n Problem Reported: "+data.bProblemsList.list30[i].problemReported;
					  }
			  function drawVisualization2() {

		    	    var data = new google.visualization.DataTable();
		    	data.addColumn('number', 'day'); 
		    	data.addColumn('number', 'Actual'); 
		        data.addColumn({type: 'string', role: 'tooltip'});

		    	data.addColumn('number', 'Target L3'); 
		    	data.addColumn({type:'boolean',role:'certainty'}); // certainty col.

		    	data.addColumn('number', 'Target L5'); 
		    	data.addRows([
		    		[{v: 1, f:'1'},day1,day1bd ,avgL3Targetpm,false,avgL5Targetpm],
			    	  [{v: 2, f:'2'},day2,day2bd,avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 3, f:'3'},day3,day3bd,avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 4, f:'4'},day4,day4bd,avgL3Targetpm, false, avgL5Targetpm],
			    	   [{v: 5, f:'5'},day5,day5bd,avgL3Targetpm  ,false,avgL5Targetpm],
			    	  [{v: 6, f:'6'},day6,day6bd,avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v:7, f:'7'},day7,day7bd, avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 8, f:'8'},day8,day8bd, avgL3Targetpm, false, avgL5Targetpm],
			    	   [{v: 9, f:'9'},day9,day9bd,avgL3Targetpm  ,false,avgL5Targetpm],
			    	  [{v: 10, f:'10'},day10,day10bd, avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 11, f:'11'},day11,day11bd, avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 12, f:'12'},day12,day12bd, avgL3Targetpm, false,avgL5Targetpm],
			    	   [{v: 13, f:'13'},day13,day13bd,avgL3Targetpm  ,false,avgL5Targetpm],
			    	  [{v: 14, f:'14'},day14,day14bd, avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 15, f:'15'},day15,day15bd,avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 16, f:'16'},day16,day16bd,avgL3Targetpm, false, avgL5Targetpm], 
			    	  [{v: 17, f:'17'},day17,day17bd, avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 18, f:'18'},day18,day18bd, avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 19, f:'19'},day19,day19bd,avgL3Targetpm, false,avgL5Targetpm], 
			    	  [{v: 20, f:'20'},day20,day20bd, avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 21, f:'21'},day21,day21bd,avgL3Targetpm,  false,avgL5Targetpm],
			    	  [{v: 22, f:'22'},day22,day22bd,avgL3Targetpm, false, avgL5Targetpm],
			    	  [{v: 23, f:'23'},day23,day23bd, avgL3Targetpm, false,avgL5Targetpm],
			    	  [{v: 24, f:'24'},day24,day24bd, avgL3Targetpm, false, avgL5Targetpm],
			    	  [{v: 25, f:'25'},day25,day25bd,avgL3Targetpm, false, avgL5Targetpm],
			    	  [{v: 26, f:'26'},day26,day26bd, avgL3Targetpm, false, avgL5Targetpm],
			    	  [{v: 27, f:'27'},day27,day27bd, avgL3Targetpm, false,avgL5Targetpm],
			    	  [{v: 28, f:'28'},day28,day28bd, avgL3Targetpm, false,avgL5Targetpm],
			    	  [{v: 29, f:'29'},day29,day29bd, avgL3Targetpm, false,avgL5Targetpm],
			    	  [{v: 30, f:'30'},day30,day30bd, avgL3Targetpm, false,avgL5Targetpm]
		    	]);
		    	var options = {
		    			
		    	    		curveType: 'function',
		    	        title: 'Daily trends of Engine Loss/day(cum)',
		    	        hAxis: {
		    	            title: 'day',
		    	            titleTextStyle: {
		    	                color: '#333'
		    	            }, tooltip: {isHtml: true},
		    	            baseline: 0,
		    	            gridlines: {
		    	            	color: '#f3f3f3',
		    	              count: 4
		    	            },
		    	           ticks: [{v: 1, f:'1'},{v: 2, f:'2'},{v:3, f:'3'},{v: 4, f:'4'},{v:5, f:'5'},{v:6, f:'6'},{v: 7, f:'7'},{v:8, f:'8'}
		    	           ,{v: 9, f:'9'},{v:10, f:'10'},{v: 11, f:'11'},{v: 12, f:'12'},{v: 13, f:'13'},{v: 14, f:'14'},{v: 15, f:'15'},{v: 16, f:'16'}
		    	           ,{v: 17, f:'17'},{v: 18, f:'18'},{v: 19, f:'19'},{v: 20, f:'20'},{v: 21, f:'21'},{v:22, f:'22'},{v: 23, f:'23'},{v: 24, f:'24'}
		    	          ,{v: 25, f:'25'},{v: 26, f:'26'},{v: 27, f:'27'},{v: 28, f:'28'},{v:29, f:'29'},{v: 30, f:'30'}
		    	           ]
		    	        },
		    	        vAxis: { title: 'Hours(Cum)',
		    	            viewWindow: {
		    	                min:0
		    	            }
		    	        },  seriesType: 'line',
					      series: {
					          1: { type: 'line' },
					          2: { type: 'line' },
					        },  colors: ['#1156d6','#1156d6', '#cc0000'], 
		    	       
		    	       
			    };

			    var chart = new google.visualization.ComboChart(document.getElementById('chart_div2'));
				 document.getElementById("chart_div2").style.border = "thin dotted red";

			    chart.draw(data, options);
			     $('#loading3').hide();
				  $('#button1').hide();

			  }
			
		});
		
	}
	</script>
	<script language="javascript" type="text/javascript">
     $(window).load(function() {
     $('#loading').hide();
  });
</script>
<script type="text/javascript">
function ownerChange(userId)
{
	
	$.getJSON('${updateGraphOwner}',{
		userId : userId,
		graphType:7,
		ajax : 'true',
	},
	function(data) {
		
		if(data.error==false)
			{
			alert("Owner Updated Successfully");
			}
		else
			{
			alert("Owner Updation Failed");
			}
	})
}
</script>
</body>

</html>