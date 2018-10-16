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
</head>
<body onload="searchGraph()">
     <div class="page-container">
   <!--/content-inner-->
<div class="left-content">
	   <div class="mother-grid-inner"> 
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<c:url var="searchGraphData" value="/searchGraphData" />
<c:url var="updateGraphOwner" value="/updateGraphOwner" />

 <c:url var="importExcel2" value="/importExcel2"></c:url>
    <c:url var="getMachinByType" value="/getMachinByType"></c:url>
    <c:url var="getActivityByMachin" value="/getActivityByMachin"></c:url>
    <c:url var="getItemByActivity" value="/getItemByActivity"></c:url>
    <c:url var="getCheckPointsByItem" value="/getCheckPointsByItem"></c:url>
    <c:url var="getCheckRecordAgistMachine" value="/getCheckRecordAgistMachine"></c:url>
    <c:url var="insertPMRecord" value="/insertPMRecord"></c:url> 
   <c:url var="searchBrekMtbfGraphData" value="/searchBrekMtbfGraphData"></c:url> 
              <div id="main-content" style="background-color: white;">
		
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="row">
							<h3>
							&nbsp;&nbsp;	<i class="fa fa-bars"></i> MTBF &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span style="text-align:right;">
							<a href="${pageContext.request.contextPath}/showTargetG5" >	<i class="glyphicon glyphicon-plus"></i>Target</a></span>
							</h3>
						</div>

			
				     <div>
				     <table>
				     <tr>
				     <td width="15%" style="background:#f9eb3f; "><b>${sessionScope.deptName}</b></td>
				      <td width="55%"style="text-align: center;background:#f9eb3f;"><b>MTBF</b></td>
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

					</div>
						</div>
				
	           
	             
	             
	             </div>
			</div>

		</div>
	</div>
	<!-- END Main Content -->
<img src="${pageContext.request.contextPath}/resources/home/images/drawing.png" alt=""><br>
MQS/DM/F/04 Rev: 0.0
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
<!-- </div>	
COPY rights end here
</div> -->
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
		
		$.getJSON('${searchBrekMtbfGraphData}',{
			
		ajax : 'true',

		},
		function(data) {
	
		 if (data == "") {
				alert("No records found !!");

			}

	    var year=parseInt(data.year);
		var firstYear=parseFloat(data.yearlyMachineBdTimeList.breakdownYearly.firstYearTime); 
	    var secondYear=parseFloat(data.yearlyMachineBdTimeList.breakdownYearly.secondYearTime);
	    var thirdYear=parseFloat(data.yearlyMachineBdTimeList.breakdownYearly.thirdYearTime);
	    var fourthYear=parseFloat(data.yearlyMachineBdTimeList.breakdownYearly.fourthYearTime);
        var year1L3Target=parseInt(data.yearlyMachineBdTimeList.machineL3Target.year1lTtarget);
        var year2L3Target=parseInt(data.yearlyMachineBdTimeList.machineL3Target.year2lTtarget);
        var year3L3Target=parseInt(data.yearlyMachineBdTimeList.machineL3Target.year3lTtarget);
        var year4L3Target=parseInt(data.yearlyMachineBdTimeList.machineL3Target.year4lTtarget);
        var year1L5Target=parseInt(data.yearlyMachineBdTimeList.machineL5Target.year1lTarget);
        var year2L5Target=parseInt(data.yearlyMachineBdTimeList.machineL5Target.year2lTarget);
        var year3L5Target=parseInt(data.yearlyMachineBdTimeList.machineL5Target.year3lTarget);
        var year4L5Target=parseInt(data.yearlyMachineBdTimeList.machineL5Target.year4lTarget);
 
        var  avgYear1L3Targetpm=parseInt(year1L3Target/12);
        var  avgYear1L5Targetpm=parseInt(year1L5Target/12);
        var  avgYear2L3Targetpm=parseInt(year2L3Target/12);
        var  avgYear2L5Targetpm=parseInt(year2L5Target/12);
        var  avgYear3L3Targetpm=parseInt(year3L3Target/12);
        var  avgYear3L5Targetpm=parseInt(year3L5Target/12);
        
       var  avgL3Targetpm=parseInt(year4L3Target/12);
       var  avgL5Targetpm=parseInt(year4L5Target/12);
        var avgL3Targetpd=parseInt(year4L3Target/30);
        var avgL5Targetpd=parseInt(year4L3Target/30);
    


        
		      google.charts.load('current', {'packages':['corechart']});
		      google.charts.setOnLoadCallback(drawVisualization);
		      google.charts.setOnLoadCallback(drawVisualization1);


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
		      title : 'Yearly Trends of MTBF in Hrs (Avg)',
		      vAxis: {title: 'Hrs.'},
		      hAxis: {title: 'YEAR  -->'},
		      seriesType: 'bars',
		      series: {
		          1: { type: 'line' },
		          2: { type: 'line' }
		        } , colors: ['#1156d6','#1156d6', '#cc0000'], 
		    };

		    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
			 document.getElementById("chart_div").style.border = "thin dotted red";
		    chart.draw(data, options);
		     $('#loading1').hide();

		     
		  }
		      var breakdownCnt1=parseInt(720/data.breakdownTimeMonthwise.breakdownCnt1);
		      var breakdownCnt2=parseInt(744/data.breakdownTimeMonthwise.breakdownCnt2);
		      var breakdownCnt3=parseInt(720/data.breakdownTimeMonthwise.breakdownCnt3);
		      var breakdownCnt4=parseInt(744/data.breakdownTimeMonthwise.breakdownCnt4);
		      var breakdownCnt5=parseInt(744/data.breakdownTimeMonthwise.breakdownCnt5);
		      var breakdownCnt6=parseInt(720/data.breakdownTimeMonthwise.breakdownCnt6);
		      var breakdownCnt7=parseInt(744/data.breakdownTimeMonthwise.breakdownCnt7);
		      var breakdownCnt8=parseInt(720/data.breakdownTimeMonthwise.breakdownCnt8);
		      var breakdownCnt9=parseInt(744/data.breakdownTimeMonthwise.breakdownCnt9);
		      var breakdownCnt10=parseInt(744/data.breakdownTimeMonthwise.breakdownCnt10);
		      var breakdownCnt11=parseInt(720/data.breakdownTimeMonthwise.breakdownCnt11);
		      var breakdownCnt12=parseInt(744/data.breakdownTimeMonthwise.breakdownCnt12);
		      
	
		      function drawVisualization1() {
			        // Some raw data (not necessarily accurate)
			        var data = google.visualization.arrayToDataTable([
			         ['Month', 'Actual',{ role: 'annotation' }, 'Target L3',{type:'boolean',role:'certainty'},'Target L5'],
			         ['Apr',breakdownCnt1,breakdownCnt1+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['May', breakdownCnt2,breakdownCnt2+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['June',breakdownCnt3,breakdownCnt3+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['July', breakdownCnt4,breakdownCnt4+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Aug',breakdownCnt5,breakdownCnt5+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Sep',breakdownCnt6,breakdownCnt6+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Oct',breakdownCnt7,breakdownCnt7+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Nov',breakdownCnt8,breakdownCnt8+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Dec',breakdownCnt9,breakdownCnt9+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Jan',breakdownCnt10,breakdownCnt10+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Feb',breakdownCnt11,breakdownCnt11+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Mar',breakdownCnt12,breakdownCnt12+'',avgL3Targetpm,false,avgL5Targetpm],
			     
			      ]);

			    var options = {
			      title : 'Monthly Trends  of MTBF in Hrs',
			      vAxis: {title: 'Hrs.'},
			      hAxis: {title: 'Month  -->'},
			      seriesType: 'bars',
			      series: {
			          1: { type: 'line' },
			          2: { type: 'line' },
			        } ,
			          colors: ['#1156d6','#1156d6', '#cc0000'], 
			    };

			    var chart = new google.visualization.ComboChart(document.getElementById('chart_div1'));
				 document.getElementById("chart_div1").style.border = "thin dotted red";

			    chart.draw(data, options);
			     $('#loading2').hide();

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
		graphType:5,
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