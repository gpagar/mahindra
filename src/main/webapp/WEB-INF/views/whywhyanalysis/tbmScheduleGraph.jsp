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
<c:url var="searchTbmScheduleGraphData" value="/searchTbmScheduleGraphData" />
<c:url var="updateGraphOwner" value="/updateGraphOwner" />
              <div id="main-content" style="background-color: white;">
		
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="row">
							<h3>
							&nbsp;&nbsp;	<i class="fa fa-bars"></i> TBM Schedule Adherance&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span style="text-align:right;">
							<a href="${pageContext.request.contextPath}/showTargetG9" >	<i class="glyphicon glyphicon-plus"></i>Target</a></span>
							</h3>
						</div>

			
				     <div>
				     <table>
				     <tr>
				     <td width="15%" style="background:#f9eb3f; "><b>${sessionScope.deptName}</b></td>
				      <td width="55%"style="text-align: center;background:#f9eb3f;"><b>TBM Schedule Adherance</b></td>
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
		
		$.getJSON('${searchTbmScheduleGraphData}',{
			
		ajax : 'true',

		},
		function(data) {
	
		 if (data == "") {
				alert("No records found !!");

			}

	    var year=parseInt(data.year);
	    
	    var firstYear=parseInt(data.breakdownYearly.firstYear); 
	    var secondYear=parseInt(data.breakdownYearly.secondYear);
	    var thirdYear=parseInt(data.breakdownYearly.thirdYear);
		 var year1L3Target=parseInt(data.machineL3Target.year1lTtarget);
        var year2L3Target=parseInt(data.machineL3Target.year2lTtarget);
        var year3L3Target=parseInt(data.machineL3Target.year3lTtarget);
        var year4L3Target=parseInt(data.machineL3Target.year4lTtarget);
        var year1L5Target=parseInt(data.machineL5Target.year1lTarget);
        var year2L5Target=parseInt(data.machineL5Target.year2lTarget);
        var year3L5Target=parseInt(data.machineL5Target.year3lTarget);
        var year4L5Target=parseInt(data.machineL5Target.year4lTarget);
 
        var  avgYear1L3Targetpm=parseInt(year1L3Target);
        var  avgYear1L5Targetpm=parseInt(year1L5Target);
        var  avgYear2L3Targetpm=parseInt(year2L3Target);
        var  avgYear2L5Targetpm=parseInt(year2L5Target);
        var  avgYear3L3Targetpm=parseInt(year3L3Target);
        var  avgYear3L5Targetpm=parseInt(year3L5Target);
        
       var  avgL3Targetpm=parseInt(year4L3Target);
       var  avgL5Targetpm=parseInt(year4L5Target);
      
       var aprTarget=parseInt(data.pmTargetGData.aprTarget);
	      var mayTarget=parseInt(data.pmTargetGData.mayTarget);
	      var juneTarget=parseInt(data.pmTargetGData.juneTarget);
	      var julyTarget=parseInt(data.pmTargetGData.julyTarget);
	      var augTarget=parseInt(data.pmTargetGData.augTarget);
	      var septTarget=parseInt(data.pmTargetGData.septTarget);
	      var octTarget=parseInt(data.pmTargetGData.octTarget);
	      var novTarget=parseInt(data.pmTargetGData.novTarget);
	      var decTarget=parseInt(data.pmTargetGData.decTarget);
	      var janTarget=parseInt(data.pmTargetGData.janTarget);
	      var febTarget=parseInt(data.pmTargetGData.febTarget);
	      var marchTarget=parseInt(data.pmTargetGData.marchTarget);
	      var totalYearTarget=aprTarget+mayTarget+juneTarget+julyTarget+augTarget+septTarget+octTarget+novTarget+decTarget+janTarget+febTarget+marchTarget;
	   


        
		      google.charts.load('current', {'packages':['corechart']});
		      google.charts.setOnLoadCallback(drawVisualization);
		      google.charts.setOnLoadCallback(drawVisualization1);


		      function drawVisualization() {
		        // Some raw data (not necessarily accurate)
		        var data = google.visualization.arrayToDataTable([
		         ['F YEAR', 'Actual',{ role: 'annotation' } , 'Target L3',{type:'boolean',role:'certainty'},{type: 'number', role: 'annotation'},'Target L5',{type: 'number', role: 'annotation'}],
		         ['F-'+(year-3)+'',firstYear,firstYear+'',avgYear1L3Targetpm,false,avgYear1L3Targetpm,avgYear1L5Targetpm,avgYear1L5Targetpm],
		         ['F-'+(year-2)+'',secondYear,secondYear+'',avgYear2L3Targetpm,false,avgYear2L3Targetpm,avgYear2L5Targetpm,avgYear2L5Targetpm],
		         ['F-'+(year-1)+'',thirdYear,thirdYear+'',avgYear3L3Targetpm,false,avgYear3L3Targetpm,avgYear3L5Targetpm,avgYear3L5Targetpm],
		         ['F-'+year+'', totalYearTarget,totalYearTarget+'',avgL3Targetpm,false,avgL3Targetpm,avgL5Targetpm,avgL5Targetpm],
		     
		      ]);

		    var options = {
		      title : 'Yearly Trends (TBM -Schedule Adherance)',
		      vAxis: {title: 'No of TBM  points'},
		      hAxis: {title: 'YEAR  -->'},
		      seriesType: 'bars',
		      series: {
		          1: { type: 'line' },
		          2: { type: 'line' }
		        } , colors: ['#1156d6','#009fff', '#cc0000'], 
		    };

		    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
			 document.getElementById("chart_div").style.border = "thin dotted red";
		    chart.draw(data, options);
		     $('#loading1').hide();

		     
		  }
		        var apr=parseInt(data.pmActualGData.apr);
		      var may=parseInt(data.pmActualGData.may);
		      var june=parseInt(data.pmActualGData.june);
		      var july=parseInt(data.pmActualGData.july);
		      var aug=parseInt(data.pmActualGData.aug);
		      var sept=parseInt(data.pmActualGData.sept);
		      var oct=parseInt(data.pmActualGData.oct);
		      var nov=parseInt(data.pmActualGData.nov);
		      var dec=parseInt(data.pmActualGData.dec);
		      var jan=parseInt(data.pmActualGData.jan);
		      var feb=parseInt(data.pmActualGData.feb);
		      var march=parseInt(data.pmActualGData.march);
		      function drawVisualization1() {
			        // Some raw data (not necessarily accurate)
			        var data = google.visualization.arrayToDataTable([
			         ['Month', 'Actual',{ role: 'annotation' },'Plan',{ role: 'annotation' }],
			         ['Apr',apr,apr+'',aprTarget,aprTarget+''],
			         ['May', may,may+'',mayTarget,mayTarget+''],
			         ['June',june,june+'',juneTarget,juneTarget+''],
			         ['July',july,july+'',julyTarget,julyTarget+''],
			         ['Aug',aug,aug+'',augTarget,augTarget+''],
			         ['Sep',sept,sept+'',septTarget,septTarget+''],
			         ['Oct',oct,oct+'',octTarget,octTarget+''],
			         ['Nov',nov,nov+'',novTarget,novTarget+''],
			         ['Dec',dec,dec+'',decTarget,decTarget+''],
			         ['Jan',jan,jan+'',janTarget,janTarget+''],
			         ['Feb',feb,feb+'',febTarget,febTarget+''],
			         ['Mar',march,march+'',marchTarget,marchTarget+''],
			     
			      ]);

			    var options = {
			      title : 'Monthly Trends (TBM Schedule Adherance) ',
			      
			      vAxis: {title: 'No of TBM  points'},
			      hAxis: {title: 'Month  -->'},
			      seriesType: 'bars',
			    
			          colors: ['#6d4b4b','#1156d6'], 
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
		graphType:9,
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