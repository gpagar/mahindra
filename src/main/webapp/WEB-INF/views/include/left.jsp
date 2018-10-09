 <!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
    font-family: 'Lato', sans-serif;
}

.overlay {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: rgb(0,0,0);
    background-color:rgba(177, 197, 138, 0.9);
    overflow-x: hidden;
    transition: 0.5s;
}
.h1{

}
.overlay-content {
    position: relative;
    top: 15%;
    width: 100%;
    text-align: center;
    margin-top: 30px;
}

.overlay a {
    padding: 8px;
    text-decoration: none;
    font-size: 20px;
    color: #150909;
    display: flex;
    transition: 0.3s;justify-content:left;    border: 1px solid #162f18;     background-color: #e6b975;
    
    
    
}

.overlay a:hover, .overlay a:focus {
    color: #f1f1f1;
}

.overlay .closebtn {
    position: absolute;
    top: 20px;
    right: 45px;
    font-size:40px;
}

@media screen and (max-height: 450px) {
  .overlay a {font-size: 20px}
  .overlay .closebtn {
    font-size: 40px;
    top: 15px;
    right: 35px;
  }
}

</style>
</head>
<body>

<div id="myNav" class="overlay">
   <!--/content-inner-->
<div class="left-content"> <div id="main-content"><br></br><br></br><br></br>
	   <div class="mother-grid-inner"> 
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div class="overlay-content">
   <h1><a href="${pageContext.request.contextPath}/showWhyWhyGraph"><i class="fa fa-bar-chart"style="font-size:16px; color:  white;" ></i> &nbsp; &nbsp;MINOR STOPPAGE INCIDENCES</a> </h1> 
    <h1><a href="${pageContext.request.contextPath}/showArankBreakdownGraph"><i class="fa fa-bar-chart"style="font-size:16px; color:  white;" ></i> &nbsp; &nbsp; A-RANK MACHINES BREAKDOWN INCIDENCES</a> </h1> 
   <h1><a href="${pageContext.request.contextPath}/showAllBreakdownGraph"> <i class="fa fa-bar-chart"style="font-size:16px; color:  white;" ></i> &nbsp; &nbsp;ALL  MACHINES BREAKDOWN INCIDENCES</a> </h1> 
   <h1> <a href="${pageContext.request.contextPath}/showBreakdownTimeGraph"><i class="fa fa-bar-chart"style="font-size:16px; color:  white;" ></i> &nbsp; &nbsp;BREAKDOWN MONITORING TREND(Time Graph)</a> </h1> 
   <h1><a href="${pageContext.request.contextPath}/showMtbfGraph"> <i class="fa fa-bar-chart"style="font-size:16px; color:  white;" ></i> &nbsp; &nbsp;MTBF GRAPH</a> </h1> 
    <h1><a href="${pageContext.request.contextPath}/showMttrGraph"><i class="fa fa-bar-chart"style="font-size:16px; color:  white;" ></i> &nbsp; &nbsp; MTTR GRAPH</a> </h1> 
  <h1>  <a href="${pageContext.request.contextPath}/showEngineLossGraph"><i class="fa fa-bar-chart"style="font-size:16px; color:  white;" ></i> &nbsp; &nbsp; ENGINE LOSS DUE TO MACHINE BREKDOWN</a> </h1> 
  </div></div></div></div>
</div>
<div class="sidebar-menu" style="overflow: scroll;" >
					<header class="logo1">
						<a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> 
					</header>
						<div style="border-top:1px ridge rgba(255, 255, 255, 0.15)"></div>
                           <div class="menu">
									<ul id="menu" >
										<li><a href="home"><i class="fa fa-tachometer"></i> <span>Dashboard</span><div class="clearfix"></div></a></li>
										
<%-- 										<li id="menu-academico" ><a href="${pageContext.request.contextPath}/showAddMachine"><i class="fa fa-cogs"></i><span>PM Masters</span><div class="clearfix"></div></a></li>
 --%>										
										 <li id="menu-academico" ><a href="${pageContext.request.contextPath}/showPm"><i class="fa fa-cogs"></i><span>Preventive Maintenance</span><div class="clearfix"></div></a></li>
<%-- 										 <li id="menu-academico" ><a href="${pageContext.request.contextPath}/showPmSchedule"><i class="fa fa-cogs"></i><span>PM Schedule</span><div class="clearfix"></div></a></li>
 --%>										 
<%-- 										 <li id="menu-academico" ><a href="${pageContext.request.contextPath}/addPredictiveMaintenance"><i class="fa fa-gear"></i><span>Predictive Maintenance </span><div class="clearfix"></div></a></li>
 --%>									  <li id="menu-academico" ><a href="${pageContext.request.contextPath}/showWhyWhyf18"><i class="fa fa-exclamation-triangle"></i><span>BreakDown</span> <br/><span>(WHY WHY Analysis) </span><div class="clearfix"></div></a></li>
							
							
								
<!-- 									<li><a href="showPmPlan"><i class="fa fa-wrench" aria-hidden="true"></i><span>Repair & Maintenance</span><div class="clearfix"></div></a></li>
 -->								
								
								
								<li><a href="${pageContext.request.contextPath}/showBreakdownManual"><i class="fa fa-history" aria-hidden="true"></i><span>Machine History </span><div class="clearfix"></div></a></li>
									 
									
<%-- 									<li><a href="${pageContext.request.contextPath}/showBreakdownHistory"><i class="fa fa-h-square" aria-hidden="true"></i><span>History Card</span><div class="clearfix"></div></a></li>
 --%>									 
<!-- 										<li><a href="showPmPlan"><i class="fa fa-ellipsis-h" aria-hidden="true"></i><span>QCRT</span><div class="clearfix"></div></a></li>
 -->									
									<li><a href="#" onclick="openNav()"><i class="	fa fa-columns" aria-hidden="true"></i><span>DWM </span><div class="clearfix"></div></a></li>
								
<%-- 								 		<li><a href="${pageContext.request.contextPath}/showAddTbmMachine"><i class="fa fa-ellipsis-h" aria-hidden="true"></i><span>TBM Master</span><div class="clearfix"></div></a></li>
 --%>											<li><a href="${pageContext.request.contextPath}/showTbmMenu"><i class="fa fa-ellipsis-h" aria-hidden="true"></i><span>Periodic Maintainence</span><div class="clearfix"></div></a></li>
 		<li><a href="${pageContext.request.contextPath}/showCbmSchedule"><i class="fa fa-ellipsis-h" aria-hidden="true"></i><span>Predictive Maintainence</span><div class="clearfix"></div></a></li>
<%-- 										<li><a href="${pageContext.request.contextPath}/showEqCal"><i class="fa fa-calculator" aria-hidden="true"></i><span>Add Equipment(Cal)</span><div class="clearfix"></div></a></li>
 --%>										<li><a href="${pageContext.request.contextPath}/showCalMenu"><i class="fa fa-calculator" aria-hidden="true"></i><span>Calibration </span><div class="clearfix"></div></a></li>
								 
								<li><a href="showPmPlan"><i class="	fa fa-internet-explorer" aria-hidden="true"></i><span>Mail Alerts</span><div class="clearfix"></div></a></li>
								
								
<!-- 									<li><a href="showPmPlan"><i class="fa fa-calendar" aria-hidden="true"></i><span>Schedulers</span><div class="clearfix"></div></a></li>
 -->									
<!-- 									<li><a href="#" onclick="openNav()"><i class="fa fa-bar-chart" style="font-size:14px" aria-hidden="true"></i><span >Auto Graph Plot</span><div class="clearfix"></div></a></li>
 -->
									 
									 <li><a href="graph"><i class="fa fa-align-justify"></i>  <span>Inventory & spares</span><br/><span> management</span><div class="clearfix"></div></a></li>
								
								
								 <li><a href="${pageContext.request.contextPath}/graph"><i class="fa fa-book"></i>  <span>Learning librabry</span><div class="clearfix"></div></a></li>
									<li id="menu-academico" ><a href="mail"><i class="fa fa-users"></i><span>User Roles Management </span><div class="clearfix"></div></a></li>
									
									 <li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out"></i>  <span>Log out</span><div class="clearfix"></div></a></li>
									 
									
									
								  </ul>
								</div>
							  </div>
							  
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
<script>
function openNav() {
    document.getElementById("myNav").style.width = "100%";
}

function closeNav() {
    document.getElementById("myNav").style.width = "0%";
}

</script>
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
							  
							<!-- 
<script src="resources/home/js/jquery.nicescroll.js"></script>
<script src="resources/home/js/scripts.js"></script>
Bootstrap Core JavaScript
   <script src="resources/home/js/bootstrap.min.js"></script>
   /Bootstrap Core JavaScript	   
morris JavaScript	
<script src="resources/home/js/raphael-min.js"></script>
<script src="resources/home/js/morris.js"></script> -->
<!-- <script>
	$(document).ready(function() {
		//BOX BUTTON SHOW AND CLOSE
	   jQuery('.small-graph-box').hover(function() {
		  jQuery(this).find('.box-button').fadeIn('fast');
	   }, function() {
		  jQuery(this).find('.box-button').fadeOut('fast');
	   });
	   jQuery('.small-graph-box .box-close').click(function() {
		  jQuery(this).closest('.small-graph-box').fadeOut(200);
		  return false;
	   });
	   
	    //CHARTS
	    function gd(year, day, month) {
			return new Date(year, month - 1, day).getTime();
		}
		
		graphArea2 = Morris.Area({
			element: 'hero-area',
			padding: 10,
        behaveLikeLine: true,
        gridEnabled: false,
        gridLineColor: '#dddddd',
        axes: true,
        resize: true,
        smooth:true,
        pointSize: 0,
        lineWidth: 0,
        fillOpacity:0.85,
			data: [
				{period: '2014 Q1', iphone: 2668, ipad: null, itouch: 2649},
				{period: '2014 Q2', iphone: 15780, ipad: 13799, itouch: 12051},
				{period: '2014 Q3', iphone: 12920, ipad: 10975, itouch: 9910},
				{period: '2014 Q4', iphone: 8770, ipad: 6600, itouch: 6695},
				{period: '2015 Q1', iphone: 10820, ipad: 10924, itouch: 12300},
				{period: '2015 Q2', iphone: 9680, ipad: 9010, itouch: 7891},
				{period: '2015 Q3', iphone: 4830, ipad: 3805, itouch: 1598},
				{period: '2015 Q4', iphone: 15083, ipad: 8977, itouch: 5185},
				{period: '2016 Q1', iphone: 10697, ipad: 4470, itouch: 2038},
				{period: '2016 Q2', iphone: 8442, ipad: 5723, itouch: 1801}
			],
			lineColors:['#ff4a43','#a2d200','#22beef'],
			xkey: 'period',
            redraw: true,
            ykeys: ['iphone', 'ipad', 'itouch'],
            labels: ['All Visitors', 'Returning Visitors', 'Unique Visitors'],
			pointSize: 2,
			hideHover: 'auto',
			resize: true
		});
		
	   
	});
	</script> -->
							 </body>
</html>