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
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/resources/home/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/resources/home/css/style.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/morris.css" type="text/css"/>
<!-- Graph CSS -->
<link href="${pageContext.request.contextPath}/resources/home/css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/home/js/jquery-2.1.4.min.js"></script>
<!-- //jQuery -->
<link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<!-- lined-icons -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/icon-font.min.css" type='text/css' />
<!-- //lined-icons -->

<link rel='stylesheet' type='text/css' href='stylesheet.css'/>
        <link rel='stylesheet' type='text/css' href='http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css'/>
        <script type='text/javascript' src='script.js'></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
        

<script>
  $( function() {
    $( "#datepicker" ).datepicker();
 
  } );
  </script>
  
</head>
<body>
   <div class="page-container">
   
   <c:url var="importExcel2" value="/importExcel2"></c:url>
   <!--/content-inner-->
<div class="left-content">
	   <div class="mother-grid-inner"> 
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

		<ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a> <i class="fa fa-angle-right"></i></li>
            </ol>
 
              <div id="main-content">
			<!-- BEGIN Page Title -->
			 
			<!-- END Page Title -->

			<!-- BEGIN Main Content -->
			<div class="row">
					<!-- END Main Content -->
	





<SCRIPT LANGUAGE="JavaScript">

/*
3-month calendar script- Ada Shimar (adashimar@chalktv.com)
Script featured on and available at:
http://www.javascriptkit.com/
*/

//Specify bgcolor of calendar
var bg="#FFFFE1"

//Specify font size
var fs=2

var flg = 0;
//var fs = 1;
M = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
D = new Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat");
function getBgn() {
pdy = new Date();        // today
pmo = 5;    // present month
pyr = pdy.getYear();     // present year
if (pyr < 2000)    // Y2K Fix, Isaac Powell
pyr = pyr + 1900; // http://onyx.idbsu.edu/~ipowell
yr = yr1 = (pmo==0?pyr-1:pyr); // last month's year
mo = (pmo==0?11:pmo-1);  // last month
bgn = new Date(M[mo]+" 1,"+yr1); // assign to date
document.write('<TABLE BORDER=0><TR><TD VALIGN=TOP>');
Calendar();       // Send last month to screen
document.write('</TD><TD VALIGN=TOP> &nbsp; &nbsp;</TD><TD VALIGN=TOP>');
yr = pyr;                // present year
mo = pmo;                // present month
bgn = new Date(M[mo]+" 1,"+yr); // assign to date
Calendar();           // Send this month to screen
 
document.write('</TD><TD VALIGN=TOP> &nbsp; &nbsp;</TD><TD VALIGN=TOP>');
yr = (pmo==11?pyr+1:pyr); // next month's year
mo = (pmo==11?0:pmo+1);   // next month
bgn = new Date(M[mo]+" 1,"+yr); // assign to date
Calendar();           // Send next month to screen
document.write('</TD></TR></TABLE>'); // Finish up
}
function Calendar(){
dy = bgn.getDay();
yr = eval(yr);
d = "312831303130313130313031";
if (yr / 4 == Math.floor(yr / 4)) {
d = d.substring(0, 2) + "29" + d.substring(4, d.length);
}
pos = (mo * 2);
ld = eval(d.substring(pos, pos + 2));
document.write("<TABLE BORDER=1"
+ " BGCOLOR='" + bg
+ "'><TR><TD ALIGN=CENTER COLSPAN=7>"
+ "<FONT SIZE=" + fs + ">" + M[mo] + " " + yr
+ "</FONT></TD></TR><TR><TR>");
for (var i = 0;i < 7;i ++) {
document.write("<TD ALIGN=CENTER>"
+"<FONT SIZE="+fs+">" + D[i] + "</FONT></TD>");
}   
document.write("</TR><TR>");
ctr = 0;
for (var i = 0;i < 7; i++){
if (i < dy) {
document.write("<TD ALIGN=CENTER width='30px'>"
+"<FONT SIZE=" + fs + "> </FONT>"
+"</TD>");
}  
else {
ctr++;
document.write("<TD ALIGN=CENTER>"
+ "<FONT SIZE=" + fs + ">" + ctr + "</FONT>"
+ "</TD>");
   }
}
document.write("</TR><TR>");
while (ctr < ld) {
for (var i = 0;i < 7; i++){
ctr++;
if (ctr > ld){
document.write("<TD ALIGN=CENTER>"
+ " </TD>");
}
else {
document.write("<TD ALIGN=CENTER>"
+ "<FONT SIZE=" + fs + ">" + ctr + "</FONT>"
+ "</TD>");
   }
}

document.write("</TR><TR>");
}
document.write("</TR></TABLE>");

}

</SCRIPT>

<CENTER>
<P><B> Maintanance</B>
<SCRIPT LANGUAGE="JavaScript">

getBgn();

</SCRIPT>
</CENTER>

<p align="center"><br />
 </p>










	<!-- <a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a> -->
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
<div class="copyrights">
		 <p>© 2017-18 . All Rights Reserved |  <a href="http://m&m.com/" target="_blank">M&M</a> </p></div>	
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
 
</body>

</html>