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
  
   <!--/content-inner-->
<div class="left-content">
	   <div class="mother-grid-inner"> 
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<c:url var="searchGraphData" value="/searchGraphData" />

 <c:url var="importExcel2" value="/importExcel2"></c:url>
    <c:url var="getMachinByType" value="/getMachinByType"></c:url>
    <c:url var="getActivityByMachin" value="/getActivityByMachin"></c:url>
    <c:url var="getItemByActivity" value="/getItemByActivity"></c:url>
    <c:url var="getCheckPointsByItem" value="/getCheckPointsByItem"></c:url>
    <c:url var="getCheckRecordAgistMachine" value="/getCheckRecordAgistMachine"></c:url>
    <c:url var="insertPMRecord" value="/insertPMRecord"></c:url> 
   <c:url var="searchBrekTimeGraphData" value="/searchBrekTimeGraphData"></c:url> 
              <div id="main-content">
		
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="row">
							<h3>
							&nbsp;&nbsp;	<i class="fa fa-bars"></i> MTTR &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span style="text-align:right;">
							<a href="${pageContext.request.contextPath}/showTargetG6" >	<i class="glyphicon glyphicon-plus"></i>Target</a></span>
							</h3>
						</div>
                <input type="hidden" id="graphType" name="graphType" value="6"/>
			
				     <div>
				     <table>
				     <tr>
				     <td width="15%" style="background:#f9eb3f; "><b>MACHINE SHOP</b></td>
				      <td width="65%"style="text-align: center;background:#f9eb3f;"><b>MTTR</b></td>
				       <td width="20%" style="background:#f9eb3f;">Owner:<b>Pankaj Badgujar</b></td>
				     </tr>
				     </table>
				     </div>
				<div class="box-content">
				<div id="chart" >
				    <div id="chart_div" style="width:50%; height:360px; float:left;" >
				   <center>  <div id="loading1"><br><br><br><br><br><br><br>
  <img id="loading-image1" src="${pageContext.request.contextPath}/resources/home/images/loader1.gif" alt="Loading..." />
<br><br><br><br><br><br><br></div> </center>
				    </div>
					<div id="chart_div1" style="width:50%; height:360px; float:right;" >
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
		var graphType = parseInt($("#graphType").val());

		$.getJSON('${searchBrekTimeGraphData}',{
			
			graphType:graphType,
		ajax : 'true',

		},
		function(data) {
	
		 if (data == "") {
				alert("No records found !!");

			}
	    var year=parseInt(data.year);
		var firstYear=parseInt(data.yearlyMachineBdTimeList.breakdownYearly.firstYear); 
	    var secondYear=parseInt(data.yearlyMachineBdTimeList.breakdownYearly.secondYear);
	    var thirdYear=parseInt(data.yearlyMachineBdTimeList.breakdownYearly.thirdYear);
	    var fourthYear=parseInt(data.yearlyMachineBdTimeList.breakdownYearly.fourthYear);
		var firstYearTime=parseFloat(data.yearlyMachineBdTimeList.breakdownYearly.firstYearTime/60);  firstYear=parseFloat(firstYear.toFixed(1));
	    var secondYearTime=parseFloat(data.yearlyMachineBdTimeList.breakdownYearly.secondYearTime/60);secondYear=parseFloat(secondYear.toFixed(1));
	    var thirdYearTime=parseFloat(data.yearlyMachineBdTimeList.breakdownYearly.thirdYearTime/60);thirdYear=parseFloat(thirdYear.toFixed(1));
	    var fourthYearTime=parseFloat(data.yearlyMachineBdTimeList.breakdownYearly.fourthYearTime/60);fourthYear=parseFloat(fourthYear.toFixed(1));
        var year1=parseFloat((firstYearTime/firstYear).toFixed(1));
        var year2=parseFloat((secondYearTime/secondYear).toFixed(1));
        var year3=parseFloat((thirdYearTime/thirdYear).toFixed(1));
        var year4=parseFloat((fourthYearTime/fourthYear).toFixed(1));

        
        var year1L3Target=parseInt(data.yearlyMachineBdTimeList.machineL3Target.year1lTtarget);
        var year2L3Target=parseInt(data.yearlyMachineBdTimeList.machineL3Target.year2lTtarget);
        var year3L3Target=parseInt(data.yearlyMachineBdTimeList.machineL3Target.year3lTtarget);
        var year4L3Target=parseInt(data.yearlyMachineBdTimeList.machineL3Target.year4lTtarget);
        var year1L5Target=parseInt(data.yearlyMachineBdTimeList.machineL5Target.year1lTarget);
        var year2L5Target=parseInt(data.yearlyMachineBdTimeList.machineL5Target.year2lTarget);
        var year3L5Target=parseInt(data.yearlyMachineBdTimeList.machineL5Target.year3lTarget);
        var year4L5Target=parseInt(data.yearlyMachineBdTimeList.machineL5Target.year4lTarget);
 
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
		         [year-3+'',year1,year1+'',year1L3Target,false,year1L5Target],
		         [year-2+'', year2,year2+'',year2L3Target,false,year2L5Target],
		         [year-1+'',  year3,year3+'',year3L3Target,false,year3L5Target],
		         [year+'', year4,year4+'',year4L3Target,false,year4L5Target],
		     
		      ]);

		    var options = {
		      title : 'Yearly Trends (MTTR in Hrs)',
		      vAxis: {title: 'Hours.'},
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
		      var breakdownCnt1=parseInt(data.breakdownTimeMonthwise.breakdownCnt1);
		      var breakdownCnt2=parseInt(data.breakdownTimeMonthwise.breakdownCnt2);
		      var breakdownCnt3=parseInt(data.breakdownTimeMonthwise.breakdownCnt3);
		      var breakdownCnt4=parseInt(data.breakdownTimeMonthwise.breakdownCnt4);
		      var breakdownCnt5=parseInt(data.breakdownTimeMonthwise.breakdownCnt5);
		      var breakdownCnt6=parseInt(data.breakdownTimeMonthwise.breakdownCnt6);
		      var breakdownCnt7=parseInt(data.breakdownTimeMonthwise.breakdownCnt7);
		      var breakdownCnt8=parseInt(data.breakdownTimeMonthwise.breakdownCnt8);
		      var breakdownCnt9=parseInt(data.breakdownTimeMonthwise.breakdownCnt9);
		      var breakdownCnt10=parseInt(data.breakdownTimeMonthwise.breakdownCnt10);
		      var breakdownCnt11=parseInt(data.breakdownTimeMonthwise.breakdownCnt11);
		      var breakdownCnt12=parseInt(data.breakdownTimeMonthwise.breakdownCnt12);
		      var breakdownTime1=parseFloat(data.breakdownTimeMonthwise.breakdownTime1/60);breakdownTime1=parseFloat(breakdownTime1.toFixed(1));
		      var breakdownTime2=parseFloat(data.breakdownTimeMonthwise.breakdownTime2/60);breakdownTime2=parseFloat(breakdownTime2.toFixed(1));
		      var breakdownTime3=parseFloat(data.breakdownTimeMonthwise.breakdownTime3/60);breakdownTime3=parseFloat(breakdownTime3.toFixed(1));
		      var breakdownTime4=parseFloat(data.breakdownTimeMonthwise.breakdownTime4/60);breakdownTime4=parseFloat(breakdownTime4.toFixed(1));
		      var breakdownTime5=parseFloat(data.breakdownTimeMonthwise.breakdownTime5/60);breakdownTime5=parseFloat(breakdownTime5.toFixed(1));
		      var breakdownTime6=parseFloat(data.breakdownTimeMonthwise.breakdownTime6/60);breakdownTime6=parseFloat(breakdownTime6.toFixed(1));
		      var breakdownTime7=parseFloat(data.breakdownTimeMonthwise.breakdownTime7/60);breakdownTime7=parseFloat(breakdownTime7.toFixed(1));
		      var breakdownTime8=parseFloat(data.breakdownTimeMonthwise.breakdownTime8/60);breakdownTime8=parseFloat(breakdownTime8.toFixed(1));
		      var breakdownTime9=parseFloat(data.breakdownTimeMonthwise.breakdownTime9/60);breakdownTime9=parseFloat(breakdownTime9.toFixed(1));
		      var breakdownTime10=parseFloat(data.breakdownTimeMonthwise.breakdownTime10/60);breakdownTime10=parseFloat(breakdownTime10.toFixed(1));
		      var breakdownTime11=parseFloat(data.breakdownTimeMonthwise.breakdownTime11/60);breakdownTime11=parseFloat(breakdownTime11.toFixed(1));
		      var breakdownTime12=parseFloat(data.breakdownTimeMonthwise.breakdownTime12/60);breakdownTime12=parseFloat(breakdownTime12.toFixed(1));
		      var breakdown1=parseFloat((parseFloat(breakdownTime1/breakdownCnt1)).toFixed(1));
		      var breakdown2=parseFloat((parseFloat(breakdownTime2/breakdownCnt2)).toFixed(1));
		      var breakdown3=parseFloat((parseFloat(breakdownTime3/breakdownCnt3)).toFixed(1));
		      var breakdown4=parseFloat((parseFloat(breakdownTime4/breakdownCnt4)).toFixed(1));
		      var breakdown5=parseFloat((parseFloat(breakdownTime5/breakdownCnt5)).toFixed(1));
		      var breakdown6=parseFloat((parseFloat(breakdownTime6/breakdownCnt6)).toFixed(1));
		      var breakdown7=parseFloat((parseFloat(breakdownTime7/breakdownCnt7)).toFixed(1));
		      var breakdown8=parseFloat((parseFloat(breakdownTime8/breakdownCnt8)).toFixed(1));
		      var breakdown9=parseFloat((parseFloat(breakdownTime9/breakdownCnt9)).toFixed(1));
		      var breakdown10=parseFloat((parseFloat(breakdownTime10/breakdownCnt10)).toFixed(1));
		      var breakdown11=parseFloat((parseFloat(breakdownTime11/breakdownCnt11)).toFixed(1));
		      var breakdown12=parseFloat((parseFloat(breakdownTime12/breakdownCnt12)).toFixed(1));
		     
		      
	
		      function drawVisualization1() {
			        // Some raw data (not necessarily accurate)
			        var data = google.visualization.arrayToDataTable([
			         ['Month', 'Actual',{ role: 'annotation' }, 'Target L3',{type:'boolean',role:'certainty'},'Target L5'],
			         ['Apr',breakdown1,breakdown1+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['May', breakdown2,breakdown2+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['June',breakdown3,breakdown3+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['July', breakdown4,breakdown4+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Aug',breakdown5,breakdown5+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Sep',breakdown6,breakdown6+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Oct',breakdown7,breakdown7+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Nov',breakdown8,breakdown8+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Dec',breakdown9,breakdown9+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Jan',breakdown10,breakdown10+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Feb',breakdown11,breakdown11+'',avgL3Targetpm,false,avgL5Targetpm],
			         ['Mar',breakdown12,breakdown12+'',avgL3Targetpm,false,avgL5Targetpm],
			     
			      ]);

			    var options = {
			      title : 'Monthly Trends  (MTBF in Hrs)',
			      vAxis: {title: 'Hours.'},
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
		});
	}
	</script>
	<script language="javascript" type="text/javascript">
     $(window).load(function() {
     $('#loading').hide();
  });
</script>
</body>

</html>