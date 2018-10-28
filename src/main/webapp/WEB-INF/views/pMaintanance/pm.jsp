<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dash board</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Pooled Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="resources/home/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="resources/home/css/style.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="resources/home/css/morris.css" type="text/css"/>
<!-- Graph CSS -->
<link href="resources/home/css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="resources/home/js/jquery-2.1.4.min.js"></script>
<!-- //jQuery -->
<link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<!-- lined-icons -->
<link rel="stylesheet" href="resources/home/css/icon-font.min.css" type='text/css' />
<!-- //lined-icons -->
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Roboto');

body{
  font-family: 'Roboto', sans-serif;
}

h2{
  margin:0px;
  text-transform: uppercase;
}

h6{
  margin:0px;
  color:#777;
}

.wrapper{
  text-align:center;
  margin:20px auto;
}

.tabs{
  /* margin-top:50px; */
  font-size:15px;
  padding:0px;
  list-style:none;
  background:#fff;
  box-shadow:0px 5px 20px rgba(0,0,0,0.1);
  display:inline-block;
  border-radius:50px;
  position:relative;
}

.tabs a{
  text-decoration:none;
  color: #777;
  text-transform:uppercase;
  padding:10px 20px;
  display:inline-block;
  position:relative;
  z-index:1;
  transition-duration:0.6s;
}

.tabs a.active{
  color:#fff;
}

.tabs a i{
  margin-right:5px;
}

.tabs .selector{
  height:100%;
  display:inline-block;
  position:absolute;
  left:0px;
  top:0px;
  z-index:1;
  border-radius:50px;
  transition-duration:0.6s;
  transition-timing-function: cubic-bezier(0.68, -0.55, 0.265, 1.55);
  
  background: #05abe0;
  background: -moz-linear-gradient(45deg, #05abe0 0%, #8200f4 100%);
  background: -webkit-linear-gradient(45deg, #05abe0 0%,#8200f4 100%);
  background: linear-gradient(45deg, #05abe0 0%,#8200f4 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#05abe0', endColorstr='#8200f4',GradientType=1 );
}
</style>
<style>

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
    transition: 0.3s;
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
<%-- <div id="myNav" class="overlay">
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
</div> --%>
   <div class="page-container sidebar-collapsed">
   <!--/content-inner-->
<div class="left-content">
	   <div class="mother-grid-inner">
             

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<!-- 
		<ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a> <i class="fa fa-angle-right"></i></li>
            </ol> -->
<!--four-grids here-->
	<!-- 	<div class="four-grids">
					<div class="col-md-3 four-grid">
						<div class="four-agileits">
							<div class="icon">
								<i class="glyphicon glyphicon-user" aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>User</h3>
								<h4> 24,420  </h4>
								
							</div>
							
						</div>
					</div>
					<div class="col-md-3 four-grid">
						<div class="four-agileinfo">
							<div class="icon">
								<i class="glyphicon glyphicon-list-alt" aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>Clients</h3>
								<h4>15,520</h4>

							</div>
							
						</div>
					</div>
					<div class="col-md-3 four-grid">
						<div class="four-w3ls">
							<div class="icon">
								<i class="glyphicon glyphicon-folder-open" aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>Projects</h3>
								<h4>12,430</h4>
								
							</div>
							
						</div>
					</div>
					<div class="col-md-3 four-grid">
						<div class="four-wthree">
							<div class="icon">
								<i class="glyphicon glyphicon-briefcase" aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>Old Projects</h3>
								<h4>14,430</h4>
								
							</div>
							
						</div>
					</div>
					<div class="clearfix"></div>
				</div> -->
				<div class="wrapper">
  <h2><img src="${pageContext.request.contextPath}/resources/home/images/mahlogo.png" alt="" height="42" width="200"></h2>
  <h6 style="color: blue;">E-Maintainence</h6>
  <nav class="tabs">
    <div class="selector"></div>
   <!--  <a href="#" class="active" onclick="enableDiv(1)"><i class="fas fa-"></i>Machine Shop</a>
    <a href="#"onclick="enableDiv(2)"><i class="fas fa-"  ></i> &nbsp;m-Hawk &nbsp;</a>
    <a href="#"  onclick="enableDiv(3)"><i class="fas fa-" ></i>  &nbsp; &nbsp; NEF-mDI  &nbsp; &nbsp; &nbsp;</a>
    -->
</div> 
  </nav>
  <div class="four-grids"id="dept1">
   <div class="row" >
  <div class="col-md-1"></div>  <div class="col-md-1"></div>  <div class="col-md-1"></div> 
  <div class="col-md-2 four-grid">
					<a href="${pageContext.request.contextPath}/showPmSchedule">	<div class="four-w3ls">
							<div class="icon">
								<i class="glyphicon glyphicon-folder-open" aria-hidden="true"></i>
							</div>
							<div class="four-text" style="color:white;">
							<h5><b>PM Schedule</b></h5>
						
							</div>
							
						</div></a>
					</div>
					<div class="col-md-2 four-grid">
					<a href="${pageContext.request.contextPath}/showPmPlanList">	<div class="four-agileits">
							<div class="icon">
								<i class="glyphicon glyphicon-folder-open" aria-hidden="true"></i>
							</div>
							<div class="four-text" style="color:white;">
							<h5><b>PM</b></h5>
							</div>
							
						</div></a>
					</div>
					<div class="col-md-2 four-grid">
						<a href="${pageContext.request.contextPath}/showAddMachine"><div class="four-agileinfo">
							<div class="icon">
								<i class="glyphicon glyphicon-folder-open" aria-hidden="true"></i>
							</div>
							<div class="four-text" style="color:white;">
							<h5><b>Add Machine</b></h5>
						</div>
							
						</div></a>
					</div>
					
					
					<div class="clearfix"></div>
				</div> 
				<br>
	
					
					<div class="clearfix"></div>
				</div>
				</div>
				
		
<!--//four-grids here-->
<!--agileinfo-grap-->
 
	<!--//agileinfo-grap-->
<!--photoday-section-->	
			
                        
                    	 
                        
                        
                    	 
						 
                   
	<!--//photoday-section-->	
	<!--w3-agileits-pane-->	
	 
	  <!--//w3-agileits-pane-->	
<!-- script-for sticky-nav -->
		 
		<!-- /script-for sticky-nav -->
<!--inner block start here-->
<div class="inner-block">

</div>
<!--inner block end here-->
<!--copy rights start here-->
<!-- <div class="copyrights">
		 <p>© 2017-18 . All Rights Reserved |  <a href="http://m&m.com/" target="_blank">M&M</a> </p></div>	
COPY rights end here
</div> -->
</div>
  <!--//content-inner-->
			<!--/sidebar-menu-->
				
 <jsp:include page="/WEB-INF/views/include/left.jsp"></jsp:include>





							  <div class="clearfix"></div>		
							</div>
							 
<!--js -->
<script src="resources/home/js/jquery.nicescroll.js"></script>
<script src="resources/home/js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
   <script src="resources/home/js/bootstrap.min.js"></script>
   <!-- /Bootstrap Core JavaScript -->	   
<!-- morris JavaScript -->	
<script src="resources/home/js/raphael-min.js"></script>
 
</body>
<script type="text/javascript">
var tabs = $('.tabs');
var items = $('.tabs').find('a').length;
var selector = $(".tabs").find(".selector");
var activeItem = tabs.find('.active');
var activeWidth = activeItem.innerWidth();
$(".selector").css({
  "left": activeItem.position.left + "px", 
  "width": activeWidth + "px"
});

$(".tabs").on("click","a",function(){
  $('.tabs a').removeClass("active");
  $(this).addClass('active');
  var activeWidth = $(this).innerWidth();
  var itemPos = $(this).position();
  $(".selector").css({
    "left":itemPos.left + "px", 
    "width": activeWidth + "px"
  });
});
</script>

<script type="text/javascript">
function enableDiv(status) {

	if(status==1){
    var x = document.getElementById("dept1");
    x.style.display = "block";
    var y = document.getElementById("dept2");
    y.style.display = "none";
    var z = document.getElementById("dept3");
    z.style.display = "none";
	}
	else if(status==2)
		{
		 var x = document.getElementById("dept1");
		    x.style.display = "none";
		    var y = document.getElementById("dept2");
		    y.style.display = "block";
		    var z = document.getElementById("dept3");
		    z.style.display = "none";
		}
	else if(status==3)
	{
		 var x = document.getElementById("dept1");
		    x.style.display = "none";
		    var y = document.getElementById("dept2");
		    y.style.display = "none";
		    var z = document.getElementById("dept3");
		    z.style.display = "block";
	}
}
</script>
<script>
function openNav() {
    document.getElementById("myNav").style.width = "100%";
}

function closeNav() {
    document.getElementById("myNav").style.width = "0%";
}

</script>
</html>