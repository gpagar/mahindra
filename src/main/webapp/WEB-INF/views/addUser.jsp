<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-Maintainence</title>

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

<!----------------------------------------Dropdown With Search----------------------------------------------- -->

<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/customerBill/chosen.css">
<!--------------------------------------------------------------------------------------- -->

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
<c:url var="checkUser" value="/checkUser"></c:url>
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
   <div class="page-container sidebar-collapsed">
   <!--/content-inner-->
<div class="left-content">
	   <div class="mother-grid-inner">
             

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
 
 
				<div class="wrapper">
  <h2><img src="${pageContext.request.contextPath}/resources/home/images/mahlogo.png" alt="" height="42" width="200"></h2>
   
  <nav class="tabs">
    
  </nav>
  <div class="four-grids"id="dept1">
   <div class="row" >
  
  <form action="${pageContext.request.contextPath}/insertUser"  class="form-horizontal"
							 id="validation-form" 	 method="POST">
   					<div class="form-group">
							<div class="col-md-2" align="right">Name : </div>
							<div class="col-md-3">
								<input type="text" name="name" id="name" value="${userDetails.name}" class="form-control"   required />
								<input type="hidden" name="userId" id="userId" value="${userDetails.userId}" />
								<input type="hidden" name="oldPass" id="oldPass" value="${userDetails.password}" />
						</div>
						 
							  
				</div> 
				<br>
				
				<div class="form-group">
							<div class="col-md-2" align="right">User Name : </div>
							<div class="col-md-3">
							<c:choose>
								<c:when test=" ${isEdit==1} ">
								<input type="text" name="userName" id="userName" value="${userDetails.email}" onchange="checkUser();"  class="form-control"   required />
								</c:when>
								<c:otherwise>
								<input type="text" name="userName" id="userName" value="${userDetails.email}" onchange="checkUser();"  class="form-control"    />
								</c:otherwise>
							</c:choose>
								
						</div>
						 
				</div> 
				<br>
				
							<%-- <c:choose>
								<c:when test=" ${isEdit==1} ">
								 
								 <div class="form-group">
									<div class="col-md-2" align="left">Enter Old Password : </div>
									<div class="col-md-3">
										<input type="password" name="pass" id="pass" onchange="matchPassword();" class="form-control"   required />
									</div>
						 
								</div> 
									<br>
								</c:when>
								 
							</c:choose> --%>
				
				<div class="form-group">
							<div class="col-md-2" align="right">Password : </div>
							<div class="col-md-3">
								<input type="password" name="pass" id="pass" onchange="matchPassword();" class="form-control"   required />
						</div>
						 
				</div> 
				<br>
				
				<div class="form-group">
							<div class="col-md-2" align="right">Re-Password : </div>
							<div class="col-md-3">
								<input type="password" name="rePass" id="rePass" onchange="matchPassword();" class="form-control"   required />
						</div>
						 
				</div> 
				<br>
				
				<div class="form-group">
							<div class="col-md-2" align="right">Select Type : </div>
							<div class="col-md-3">
								 
								 <select  class="chosen-select"   style="width:90% !important;" id="type"
								name="type" required>
								
								<c:choose> 
				               <c:when test="${userDetails.type==0}"> 
								<option value="0"   selected>Associate</option>
								<option value="1"   >Officer</option>
								<option value="2"   >Manager</option>
				              </c:when>
				              <c:when test="${userDetails.type==1}"> 
								<option value="0"   >Associate</option>
								<option value="1"   selected>Officer</option>
								<option value="2"   >Manager</option>
				              </c:when>
				              <c:when test="${userDetails.type==2}"> 
								<option value="0"   >Associate</option>
								<option value="1"   >Officer</option>
								<option value="2"   selected>Manager</option>
				              </c:when>
				              <c:otherwise>
				              <option value=""  >Select Type</option>
								<option value="0"   >Associate</option>
								<option value="1"   >Officer</option>
								<option value="2"   >Manager</option>
				              </c:otherwise>
				              </c:choose>
 
							</select>
							
						</div>
						 
				</div> 
				<br>
				
				<div class="row" align="center">
						<div class="col-sm-9 col-sm-offset-3 col-lg-1 col-lg-offset-3">
							<button type="submit" class="btn btn-info" id="submitbtn" disabled>Submit</button>  
						</div><br>
						 
					</div>
	</form>
					
					<div class="clearfix"></div>
				</div>
				</div>
	  
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
 <!----------------------------------------Dropdown With Search----------------------------------------------- -->
	 <script
		src="${pageContext.request.contextPath}/resources/customerBill/jquery-2.1.4.min.js"
		type="text/javascript"></script>  
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/chosen.jquery.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/init.js"
		type="text/javascript" charset="utf-8"></script>
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
function checkUser()
{  
	var  name=$("#userName").val(); 

 
	$.getJSON('${checkUser}', {
		name : name, 
		ajax : 'true'

	}, function(data) {
		 
		if(data.userId==0){
			
			alert("User Name Available");
			document.getElementById("submitbtn").disabled = false;
		}
		else{
			alert("User Name Not Available");
			document.getElementById("submitbtn").disabled = true;
		}
		 
	});
	
	
}
</script>
<script>
function matchPassword() {
	var  pass=$("#pass").val(); 
	var  rePass=$("#rePass").val(); 
	
	if(pass!="" && rePass!=""){
	if(pass==rePass){
		document.getElementById("submitbtn").disabled = false;
	}
	else{
		document.getElementById("submitbtn").disabled = true;
		alert("Password Not Matched");
	}
	}
	else{
		document.getElementById("submitbtn").disabled = true;
	}
}
 

</script>
</html>