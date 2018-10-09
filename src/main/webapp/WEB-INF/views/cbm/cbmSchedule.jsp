<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
	
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
  $( function() {
    $( ".dp2" ).datepicker({
    	 autoclose: true, 
    	format: "dd-mm-yyyy"
    		
    });
 
  } );
  
  </script>
<style>
* {
  box-sizing: border-box;
}

#myInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 40%;
  font-size: 16px;
  padding: 12px 16px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#myTable {
  border-collapse: collapse;
  width: 50%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}
</style>
</head>
<body>
   <div class="page-container">
<div class="left-content">
	   <div class="mother-grid-inner"> 
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

              <div id="main-content">
			<!-- BEGIN Page Title -->
			
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title"><br>
							<div class="col-md-7" style="font-size: 23px">
								<i class="fa fa-bars"></i>  CBM Schedule 
								
							</div>
									<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search By Machine No." title="Type in a name" style="border-radius: 23px;">
											
							<div class="box-tool">
						
						</div>
					<div class="box-content">
					
					<div class="agile-grids" >	
				
				<div class="agile-tables">
					<div class="w3l-table-info" style="overflow-x:auto; height:450px">
					
					    <table id="table1"  style="border: 1px;"><!-- class="table table-inverse table-bordered" -->
						<thead>
						
						  <tr>
							<!-- <th rowspan="2">Sr.No</th>
							<th rowspan="2">M/c No.</th>
							<th rowspan="2">Machine No.</th>
							<th rowspan="2">Line</th>
							<th rowspan="2">M/c Name</th>
							<th >Spindle Clamping Force</th>
							<th rowspan="2">Ball Bar Test</th>
							<th rowspan="2">Spindle Vibration</th>
							<th rowspan="2">Spindle Taper check</th>
							<th >Thermo Graphy</th>
							<th >Earthing Resistance</th>
							<th >ASRS Humidity Monitoring</th>
							<th >Voltage Monitoring</th>
							<th >Makino Magazine chain</th>
							<th rowspan="2">Heller Pallet Pin</th>
							<th rowspan="2">Oil debris anyalisis</th>
							<th rowspan="2">Profibus Analyser</th> -->
							<th rowspan="2">Sr.No</th>
							<th rowspan="2">Machine No.</th>
							<th rowspan="2">Line</th>
							<th rowspan="2">M/c Name</th>
							<th colspan="4">Spindle Clamping Force</th>
							<th >Ball Bar Test</th>
							<th colspan="2">Spindle Vibration</th>
							<th colspan="2">Spindle Taper check</th>
							<th >Thermo Graphy</th>
							<th colspan="2">Earthing Resistance</th>
							<th colspan="2">ASRS Humidity Monitoring</th>
							<th colspan="2">Voltage Monitoring</th>
							<th colspan="2">Makino Magazine chain</th>
							<th >Heller Pallet Pin</th>
							<th >Oil debris anyalisis</th>
							<th >Profibus Analyser</th>
						  </tr>
						    <tr>
            <th>Q1</th>
            <th>Q2</th>
            <th>Q3</th>
            <th>Q4</th>
            <th>H2</th>
            <th>Q1</th>
            <th>Q3</th>
            <th>Q1</th>
            <th>Q3</th>
            <th></th>
             <th>H1</th>
            <th>H2</th>
            <th>H1</th>
            <th>H2</th>
            <th>H1</th>
            <th>H2</th>
            <th>H1</th>
            <th>H2</th>
            <th></th>
            <th></th>
             <th></th>
         </tr>  
						</thead>
						<tbody>
				              <c:forEach items="${scheduleList}" var="scheduleList" varStatus="count">
				               <tr>
				                 <td>${scheduleList.id}</td>
				                  <td>${scheduleList.machineNo}</td>
				                   <td>${scheduleList.line}</td>
				                    <td>${scheduleList.machineName}</td>
				                     <td>${scheduleList.scfQ1}</td>
				                      <td>${scheduleList.scfQ2}</td>
				                       <td>${scheduleList.scfQ3}</td>
				                        <td>${scheduleList.scfQ4}</td>
				                         <td>${scheduleList.bbtH2}</td>
				                          <td>${scheduleList.svQ1}</td>
				                           <td>${scheduleList.svQ3}</td>
				                            <td>${scheduleList.stcQ1}</td>
				                             <td>${scheduleList.stcQ3}</td>
				                              <td>${scheduleList.tg}</td>
				                               <td>${scheduleList.erH1}</td>
				                                <td>${scheduleList.erH2}</td>
				                                 <td>${scheduleList.ahmH1}</td>
				                                  <td>${scheduleList.ahmH2}</td>
				                                   <td>${scheduleList.vmH1}</td>
				                                    <td>${scheduleList.vmH2}</td>
				                                    <td>${scheduleList.mmcH1}</td>
				                                    <td>${scheduleList.mmcH2}</td>
				                                    <td>${scheduleList.hpp}</td>
				                                    <td>${scheduleList.oda}</td>
				                                       <td>${scheduleList.pa}</td>
                              </tr>
                              </c:forEach>
							</tbody>
					  </table>
					</div>
				

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
	<!-- 	<script>
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

</div></div>	
<!--COPY rights end here-->
</div>
</div>
  <!--//content-inner-->
			<!--/sidebar-menu-->
				
 <jsp:include page="/WEB-INF/views/include/left.jsp"></jsp:include>

							  <div class="clearfix"></div>		
							</div>
							
<script src="${pageContext.request.contextPath}/resources/home/js/jquery.nicescroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/home/js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
   <script src="${pageContext.request.contextPath}/resources/home/js/bootstrap.min.js"></script>
   <!-- /Bootstrap Core JavaScript -->	   
<!-- morris JavaScript -->	
<script src="${pageContext.request.contextPath}/resources/home/js/raphael-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/home/js/morris.js"></script>

<script type="text/javascript">

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

	
<script src="http://code.jquery.com/jquery-1.12.1.min.js"></script>
 <script src="${pageContext.request.contextPath}/resources/home/js/jquery.rowspanizer.min.js"></script>
<script>
$('#action').on('click', function() {
  $("#table").rowspanizer({vertical_align: 'middle'});
});
</script>
<script type="text/javascript">
$("#table").rowspanizer({vertical_align: 'middle'});
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>  

<script>
function myFunction() {
  var input, filter, table, tr, td, i,td1,td2;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("table1");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    td1 = tr[i].getElementsByTagName("td")[2];
    td2 = tr[i].getElementsByTagName("td")[3];
    if (td||td1||td2) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else  if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      }else   if (td2.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      }else {
        tr[i].style.display = "none";
      }
    }    
   
    
  }
}
</script>
</body>

</html>