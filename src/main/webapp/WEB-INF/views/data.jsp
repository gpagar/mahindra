<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Maintenance</title>

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

</head>
<body>
   <div class="page-container">
   <!--/content-inner-->
<div class="left-content">
	   <div class="mother-grid-inner">
             

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

		<ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a> <i class="fa fa-angle-right"></i></li>
            </ol>
 
              <div class="row">         
               <div class="box-content">
               	<form action="importExcel2" method="get" enctype="multipart/form-data">
               	
               		 
               		
               		<div class=" box-content">
									<div class="row">
										<div style="overflow:scroll;height:500px;width:100%;overflow:auto">
									<table width="100%" border="0"class="table table-bordered table-striped fill-head "
										style="width: 100%" id="table_grid">
												<thead>
													<tr>
														<th>Sr.No.</th> 
														<th>Activity</th>
														<th>Machine Name</th> 
														<th>Check Point</th>
														<th>Method</th>
														<th>Required Value</th>
														<th>Month1</th>
														<th>Month2</th>
														<th>Month3</th>
														<th>Status</th>
														 

													</tr>
												</thead>
												<tbody>
												
												<c:set var="srNo" value="0" />
													<c:forEach items="${dataList}" var="dataList"
														varStatus="count">

														<tr>
															<td><c:out value="${count.index+1}" /></td>
															<c:set var="srNo" value="${srNo+1}" /> 
															<td><c:out value="${dataList.activity}" /></td>
															<td><c:out value="${dataList.item}" /></td>
															<td><c:out value="${dataList.checkpoint}" /></td>
															<td><c:out value="${dataList.method}" /></td>
															<td><c:out value="${dataList.requiredValue}" /></td>
															<td><input style="width:100px" type="text" name='month1<c:out
																value="${srNo}" />' class="form-control" value=
																<c:out value="${dataList.month1}" />  ></td>
															<td><input style="width:100px" type="text" name='month1<c:out
																value="${srNo}" />' class="form-control" value=
																<c:out value="${dataList.month1}" />  ></td>
															<td><input style="width:100px" type="text" name='month1<c:out
																value="${srNo}" />' class="form-control" value=
																<c:out value="${dataList.month1}" />  ></td>
															<%-- <td><c:out value="${dataList.month1}" /></td>
															<td><c:out value="${dataList.month2}" /></td>
															<td><c:out value="${dataList.month3}" /></td> --%>
															<td><c:out value="${dataList.remark}" /></td>
															 </tr>
													</c:forEach>
												
													 
												</tbody>
											</table>
										</div>
									</div>
								</div>
               	
               	</form>
               </div> 
               </div>     	 
                        
                    	 
						 
	 
		 
		   
	  <!--//w3-agileits-pane-->	
<!-- script-for sticky-nav -->
		<!-- <script>
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
		</script> -->
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
				 
<!--js -->
<script src="resources/home/js/jquery.nicescroll.js"></script>
<script src="resources/home/js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
   <script src="resources/home/js/bootstrap.min.js"></script>
   <!-- /Bootstrap Core JavaScript -->	   
<!-- morris JavaScript -->	
<script src="resources/home/js/raphael-min.js"></script>
<script src="resources/home/js/morris.js"></script>
 
</body>

</html>