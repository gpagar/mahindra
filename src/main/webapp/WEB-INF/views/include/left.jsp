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
    background-color:rgba(206, 201, 77, 0.9);
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
    transition: 0.3s;justify-content:left;    border: 1px solid blue;     background-color: #f9ae5e;
    
    
    
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
										<li><a href="home"><i class="fa fa-tachometer"></i> <span>dashboard</span><div class="clearfix"></div></a></li>
										
										
										 <li id="menu-academico" ><a href="${pageContext.request.contextPath}/showPmPlanList"><i class="fa fa-cogs"></i><span>Preventive Maintenance</span><div class="clearfix"></div></a></li>
										 <li id="menu-academico" ><a href="${pageContext.request.contextPath}/addPredictiveMaintenance"><i class="fa fa-gear"></i><span>Predictive Maintenance </span><div class="clearfix"></div></a></li>
									  <li id="menu-academico" ><a href="${pageContext.request.contextPath}/showWhyWhyf18"><i class="fa fa-exclamation-triangle"></i><span>BreakDown</span> <br/><span>(WHY WHY Analysis) </span><div class="clearfix"></div></a></li>
							
							
								
									<li><a href="showPmPlan"><i class="fa fa-wrench" aria-hidden="true"></i><span>Repair & Maintenance</span><div class="clearfix"></div></a></li>
								
								
								
								<li><a href="${pageContext.request.contextPath}/showBreakdownHistory"><i class="fa fa-history" aria-hidden="true"></i><span>Machine History </span><div class="clearfix"></div></a></li>
									 
									
									<li><a href="${pageContext.request.contextPath}/showBreakdownHistory"><i class="fa fa-h-square" aria-hidden="true"></i><span>History Card</span><div class="clearfix"></div></a></li>
									 
										<li><a href="showPmPlan"><i class="fa fa-ellipsis-h" aria-hidden="true"></i><span>QCRT</span><div class="clearfix"></div></a></li>
										
										
										<li><a href="showPmPlan"><i class="fa fa-calculator" aria-hidden="true"></i><span>Calibration </span><div class="clearfix"></div></a></li>
								 
									<li><a href="showPmPlan"><i class="	fa fa-columns" aria-hidden="true"></i><span>DWM </span><div class="clearfix"></div></a></li>
								
								 	
								<li><a href="showPmPlan"><i class="	fa fa-internet-explorer" aria-hidden="true"></i><span>Mail Alerts</span><div class="clearfix"></div></a></li>
								
								
									<li><a href="showPmPlan"><i class="fa fa-calendar" aria-hidden="true"></i><span>Schedulers</span><div class="clearfix"></div></a></li>
									
									<li><a href="#" onclick="openNav()"><i class="fa fa-bar-chart" style="font-size:14px" aria-hidden="true"></i><span >Auto Graph Plot</span><div class="clearfix"></div></a></li>

									<li id="menu-academico" ><a href="mail"><i class="fa fa-users"></i><span>User Roles Management </span><div class="clearfix"></div></a></li>
									 
									 <li><a href="graph"><i class="fa fa-align-justify"></i>  <span>Inventory & spares</span><br/><span> management</span><div class="clearfix"></div></a></li>
								
								
								 <li><a href="graph"><i class="fa fa-book"></i>  <span>Learning librabry</span><div class="clearfix"></div></a></li>
									 <li><a href="logout"><i class="fa fa-sign-out"></i>  <span>Log out</span><div class="clearfix"></div></a></li>
									 
									
									
								  </ul>
								</div>
							  </div>
							  
							  
<script>
function openNav() {
    document.getElementById("myNav").style.width = "100%";
}

function closeNav() {
    document.getElementById("myNav").style.width = "0%";
}
</script>
     
							 </body>
</html>