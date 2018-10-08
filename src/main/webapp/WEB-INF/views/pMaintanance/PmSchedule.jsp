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
<!----------------------------------------Dropdown With Search----------------------------------------------- -->

<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/customerBill/chosen.css">
<!--------------------------------------------------------------------------------------- -->

</head>
<body>
<jsp:useBean id="monthNames" class="java.text.DateFormatSymbols" />
<c:set value="${monthNames.months}" var="months" />
 <div class="page-container">
<div class="left-content">
	   <div class="mother-grid-inner"> 
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <c:url var="insertTbm" value="/insertTbmData"></c:url>

              <div id="main-content">
			<!-- BEGIN Page Title -->
			
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i> PM Schedule
							</h3>
							<div class="box-tool">
						
						</div>
									            	<form action="${pageContext.request.contextPath}/showPmSchedule"  class="form-horizontal">

						<div class="box-content">
					
					<div class="form-group">
							<label class="col-sm-3 col-lg-1 control-label">Month</label>
							<div class="col-sm-6 col-lg-3 controls">
								<select data-placeholder="Choose Month"
								 class="chosen-select" style="width:99% !important;" tabindex="6" id="month"
								name="month" required>
								<option value=""selected disabled="disabled">Choose Month</option>
                                <c:choose>
                                <c:when test="${month==1}">
                                <option value="1" selected >Jan</option>
                                <option value="2" >Feb</option>
                                <option value="3" >March</option>
                                <option value="4" >April</option>
                                <option value="5" >May</option>
                                <option value="6" >June</option>
                                <option value="7" >July</option>
                                <option value="8" >Aug</option>
                                <option value="9" >Sept</option>
                                <option value="10" >Oct</option>
                                 <option value="11" >Nov</option>
                                  <option value="12" >Dec</option>
                                </c:when>
                                 <c:when test="${month==2}">
                                <option value="1"  >Jan</option>
                                <option value="2" selected>Feb</option>
                                <option value="3" >March</option>
                                <option value="4" >April</option>
                                <option value="5" >May</option>
                                <option value="6" >June</option>
                                <option value="7" >July</option>
                                <option value="8" >Aug</option>
                                <option value="9" >Sept</option>
                                <option value="10" >Oct</option>
                                 <option value="11" >Nov</option>
                                  <option value="12" >Dec</option>
                                </c:when>
                                 <c:when test="${month==3}">
                                <option value="1"  >Jan</option>
                                <option value="2" >Feb</option>
                                <option value="3" selected>March</option>
                                <option value="4" >April</option>
                                <option value="5" >May</option>
                                <option value="6" >June</option>
                                <option value="7" >July</option>
                                <option value="8" >Aug</option>
                                <option value="9" >Sept</option>
                                <option value="10" >Oct</option>
                                 <option value="11" >Nov</option>
                                  <option value="12" >Dec</option>
                                </c:when>
                                 <c:when test="${month==4}">
                                <option value="1"  >Jan</option>
                                <option value="2" >Feb</option>
                                <option value="3" >March</option>
                                <option value="4" selected>April</option>
                                <option value="5" >May</option>
                                <option value="6" >June</option>
                                <option value="7" >July</option>
                                <option value="8" >Aug</option>
                                <option value="9" >Sept</option>
                                <option value="10" >Oct</option>
                                 <option value="11" >Nov</option>
                                  <option value="12" >Dec</option>
                                </c:when>
                                 <c:when test="${month==5}">
                                <option value="1"  >Jan</option>
                                <option value="2" >Feb</option>
                                <option value="3" >March</option>
                                <option value="4" >April</option>
                                <option value="5" selected>May</option>
                                <option value="6" >June</option>
                                <option value="7" >July</option>
                                <option value="8" >Aug</option>
                                <option value="9" >Sept</option>
                                <option value="10" >Oct</option>
                                 <option value="11" >Nov</option>
                                  <option value="12" >Dec</option>
                                </c:when>
                                 <c:when test="${month==6}">
                                <option value="1"  >Jan</option>
                                <option value="2" >Feb</option>
                                <option value="3" >March</option>
                                <option value="4" >April</option>
                                <option value="5" >May</option>
                                <option value="6" selected>June</option>
                                <option value="7" >July</option>
                                <option value="8" >Aug</option>
                                <option value="9" >Sept</option>
                                <option value="10" >Oct</option>
                                 <option value="11" >Nov</option>
                                  <option value="12" >Dec</option>
                                </c:when>
                                 <c:when test="${month==7}">
                                <option value="1"  >Jan</option>
                                <option value="2" >Feb</option>
                                <option value="3" >March</option>
                                <option value="4" >April</option>
                                <option value="5" >May</option>
                                <option value="6" >June</option>
                                <option value="7" selected>July</option>
                                <option value="8" >Aug</option>
                                <option value="9" >Sept</option>
                                <option value="10" >Oct</option>
                                 <option value="11" >Nov</option>
                                  <option value="12" >Dec</option>
                                </c:when>
                                 <c:when test="${month==8}">
                                <option value="1"  >Jan</option>
                                <option value="2" >Feb</option>
                                <option value="3" >March</option>
                                <option value="4" >April</option>
                                <option value="5" >May</option>
                                <option value="6" >June</option>
                                <option value="7" >July</option>
                                <option value="8"selected>Aug</option>
                                <option value="9" >Sept</option>
                                <option value="10" >Oct</option>
                                 <option value="11" >Nov</option>
                                  <option value="12" >Dec</option>
                                </c:when>
                                 <c:when test="${month==9}">
                                <option value="1"  >Jan</option>
                                <option value="2" >Feb</option>
                                <option value="3" >March</option>
                                <option value="4" >April</option>
                                <option value="5" >May</option>
                                <option value="6" >June</option>
                                <option value="7" >July</option>
                                <option value="8" >Aug</option>
                                <option value="9" selected>Sept</option>
                                <option value="10" >Oct</option>
                                 <option value="11" >Nov</option>
                                  <option value="12" >Dec</option>
                                </c:when>
                                 <c:when test="${month==10}">
                                <option value="1"  >Jan</option>
                                <option value="2" >Feb</option>
                                <option value="3" >March</option>
                                <option value="4" >April</option>
                                <option value="5" >May</option>
                                <option value="6" >June</option>
                                <option value="7" >July</option>
                                <option value="8" >Aug</option>
                                <option value="9" >Sept</option>
                                <option value="10" selected>Oct</option>
                                 <option value="11" >Nov</option>
                                  <option value="12" >Dec</option>
                                </c:when>
                                    <c:when test="${month==11}">
                                <option value="1"  >Jan</option>
                                <option value="2" >Feb</option>
                                <option value="3" >March</option>
                                <option value="4" >April</option>
                                <option value="5" >May</option>
                                <option value="6" >June</option>
                                <option value="7" >July</option>
                                <option value="8" >Aug</option>
                                <option value="9" >Sept</option>
                                <option value="10" >Oct</option>
                                 <option value="11" selected >Nov</option>
                                  <option value="12" >Dec</option>
                                </c:when>
                                    <c:when test="${month==12}">
                                <option value="1"  >Jan</option>
                                <option value="2" >Feb</option>
                                <option value="3" >March</option>
                                <option value="4" >April</option>
                                <option value="5" >May</option>
                                <option value="6" >June</option>
                                <option value="7" >July</option>
                                <option value="8" >Aug</option>
                                <option value="9" >Sept</option>
                                <option value="10" >Oct</option>
                                 <option value="11" >Nov</option>
                                  <option value="12" selected>Dec</option>
                                </c:when>
                                
                                </c:choose>
							</select>
						</div>
							<label class="col-sm-3 col-lg-1 control-label">OR M/C</label>
							<div class="col-sm-6 col-lg-4 controls">
								<select data-placeholder="Choose M/C"
								 class="chosen-select" style="width:99% !important;" tabindex="6" id="mach"
								name="mach" >
								<option value="" selected>Choose M/c</option>	
								 <c:forEach items="${machineList}" var="machineList">
                                  <c:choose>
                                  <c:when test="${machineList.machinId==machineId}">
                                  <option value="${machineList.machinId}" selected>${machineList.machinNo}-${machineList.machinName}</option>
                                  
                                  </c:when>
                                  <c:otherwise>
                                  <option value="${machineList.machinId}">${machineList.machinNo}-${machineList.machinName}</option>
                                  
                                  </c:otherwise>
                                  </c:choose>
                                  
                                  </c:forEach>   
								</select>
								</div>	
						
					<!-- 
					<div class="row" align="center">
						<div class="col-sm-9 col-sm-offset-3 col-lg-1 col-lg-offset-4"> -->
							<button type="submit" class="btn btn-info" id="submitbtn" >Search</button>  
							</div>
						</div>
					</form> 	
					</div>
		
					<div class="agile-grids" >	
				
				<div class="agile-tables">
					<div class="w3l-table-info" style="overflow-x:auto; height:450px">
					
					    <table id="table"  style="border: 1px;"><!-- class="table table-inverse table-bordered" -->
						<thead>
						  <c:set value="${planListRes[0].fMonth}" var="f" />
				            <c:set value="${planListRes[0].sMonth}" var="s" />
				            <c:set value="${planListRes[0].tMonth}" var="t" />
						  <tr>
							<th>Sr</th>
							<th>Machine</th>
							<th>M/C No</th>
							<th>Line</th>
						 	<th>Type</th>
						    <th>Freq in Month</th>
						    <th colspan="4">${months[(f-1)]}</th>
						    <th colspan="4">${months[(s-1)]}</th>
						    <th colspan="4">${months[(t-1)]}</th>
						     <th>Status</th>
						    <th>Action</th>
						  </tr>
						    <tr>
							<th> </th>
							<th> </th>
							<th> </th>
							<th> </th>
						 	<th> </th>
						    <th> </th>
						   <th>W1</th>
							<th>W2</th>
						 	<th>W3</th>
						    <th>W4</th>
						     <th>W1</th>
							<th>W2</th>
						 	<th>W3</th>
						    <th>W4</th>
						     <th>W1</th>
							<th>W2</th>
						 	<th>W3</th>
						    <th>W4</th>
						     <th> </th>
						    <th> </th>
						  </tr>
						</thead>
						<tbody>
				     <c:forEach items="${planListRes}" var="planList" varStatus="count">
				            	<form action="${pageContext.request.contextPath}/searchPaMaintainenceList"  class="form-horizontal"
							 id="validation-form" 	 method="GET">
				            <input type="hidden" name="machineType" id="machineType" value="${planList.type}"/>
				               <input type="hidden" name="machineId" id="machineId" value="${planList.machinId}"/>
				           <c:set value="${planList.fMonth}" var="f" />
				            <c:set value="${planList.sMonth}" var="s" />
				            <c:set value="${planList.tMonth}" var="t" />
				              <tr>
				             
				              <td>${count.index+1}</td>
				              <td>${planList.machinName}</td>
				              <td>${planList.machineNo}</td>
				              <td>${planList.line}</td>
				              <td><c:choose>
				              <c:when test="${planList.type==1}">
				              Electrical
				              </c:when>
				              <c:when test="${planList.type==2}">
				              Mechanical
				              </c:when>
				              </c:choose></td>
				              <td>4</td>
				              <c:set var="month1color" value="orange"></c:set>
				              				              <c:set var="month2color" value="orange"></c:set>
				              
				              				              <c:set var="month3color" value="orange"></c:set>
				              
				              <c:choose>
						<c:when test="${sessionScope.userDetail.type==1  && planList.status>0}">
						  <c:set var="month1color" value="green"></c:set>
						</c:when>
						</c:choose> 
						<c:choose>
							<c:when test="${sessionScope.userDetail.type==1  && planList.status>2}">
							  <c:set var="month2color" value="green"></c:set>
						</c:when>
							</c:choose>
							<c:choose>
							<c:when test="${sessionScope.userDetail.type==1  && planList.status>4}">
							  <c:set var="month3color" value="green"></c:set>
						</c:when> </c:choose>
						<c:choose>
						<c:when test="${sessionScope.userDetail.type==2  && planList.status>1}">
						  <c:set var="month1color" value="green"></c:set>
						</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${sessionScope.userDetail.type==2  && planList.status>3}">
							  <c:set var="month2color" value="green"></c:set>
						</c:when>
							</c:choose>
							<c:choose>
							<c:when test="${sessionScope.userDetail.type==2  && planList.status>5}">
							  <c:set var="month3color" value="green"></c:set>
						</c:when>
						</c:choose>
				               <c:choose>
				               <c:when test="${planList.fWeek==1}">
				                <td style="background-color: ${month1color} ;"></td>
				              <td></td>
				              <td></td>
				              <td></td>
				               </c:when>
				                <c:when test="${planList.fWeek==2}">
				                <td></td>
				              <td style="background-color:${month1color}"></td>
				              <td></td>
				              <td></td>
				               </c:when>
				                <c:when test="${planList.fWeek==3}">
				                <td></td>
				              <td></td>
				              <td style="background-color:${month1color}"></td>
				              <td></td>
				               </c:when>
				                <c:when test="${planList.fWeek==4}">
				                <td></td>
				              <td></td>
				              <td></td>
				              <td style="background-color: ${month1color}"></td>
				               </c:when>
				               <c:otherwise>
				                <td></td>
				              <td></td>
				              <td></td>
				              <td></td>
				               </c:otherwise>
				               </c:choose>
				                        <c:choose>
				               <c:when test="${planList.sWeek==1}">
				                <td style="background-color: ${month2color}"></td>
				              <td></td>
				              <td></td>
				              <td></td>
				               </c:when>
				                <c:when test="${planList.sWeek==2}">
				                <td></td>
				              <td style="background-color: ${month2color}"></td>
				              <td></td>
				              <td></td>
				               </c:when>
				                <c:when test="${planList.sWeek==3}">
				                <td></td>
				              <td></td>
				              <td style="background-color: ${month2color}"></td>
				              <td></td>
				               </c:when>
				                <c:when test="${planList.sWeek==4}">
				                <td></td>
				              <td></td>
				              <td></td>
				              <td style="background-color: ${month2color}"></td>
				               </c:when>
				               <c:otherwise>
				                <td></td>
				              <td></td>
				              <td></td>
				              <td></td>
				               </c:otherwise>
				               </c:choose>
				                        <c:choose>
				               <c:when test="${planList.tweek==1}">
				                <td style="background-color: ${month3color}"></td>
				              <td></td>
				              <td></td>
				              <td></td>
				               </c:when>
				                <c:when test="${planList.tweek==2}">
				                <td></td>
				              <td style="background-color: ${month3color}"></td>
				              <td></td>
				              <td></td>
				               </c:when>
				                <c:when test="${planList.tweek==3}">
				                <td></td>
				              <td></td>
				              <td style="background-color: ${month3color}"></td>
				              <td></td>
				               </c:when>
				                <c:when test="${planList.tweek==4}">
				                <td></td>
				              <td></td>
				              <td></td>
				              <td style="background-color: ${month3color}"></td>
				               </c:when>
				               <c:otherwise>
				                <td></td>
				              <td></td>
				              <td></td>
				              <td></td>
				               </c:otherwise>
				               </c:choose>
				             
				              
				               <td>
				               <c:choose>
				               <c:when test="${planList.status=='-1'}">
				            Open
				               </c:when>
				               <c:when test="${planList.status==0}">
				            1st Month InProcess
				               </c:when>
				               <c:when test="${planList.status==1}">
				            1st Month Approved By Officer & Pending for Manager
				               </c:when>
				                <c:when test="${planList.status==2}">
				            1st Month  Approved By Manager &  2nd Month Open
				               </c:when>
				                <c:when test="${planList.status==3}">
				            2nd Month Approved By Officer & Pending for Manager
				               </c:when>
				                <c:when test="${planList.status==4}">
				           2nd Month Approved By Manager &  3rd Month Open
				               </c:when>
				                <c:when test="${planList.status==5}">
				           3rd Month Approved By Officer & Pending for Manager
				               </c:when>
				                <c:when test="${planList.status==6}">
				            3rd Month  Approved By Manager
				               </c:when>
				               
				           
				                  </c:choose>
				               </td>
				             
				              <td><input type="Submit"  value="PM" class="btn btn-info"  />
				              </td>
				            <%--   <td>${eqCalDetailList.frequency}</td>
				              <td>${eqCalDetailList.lastCalDate}</td>
				              <td>${eqCalDetailList.nextCalDate}</td>
				              <td><input type="date" name="calibrationDoneDate" id="calibrationDoneDate"/></td>
				              <td> <input type="button" name="submit${count.index}" id="submit${count.index}" class="btn btn-primary" value="Submit" onclick="saveCal(${count.index})"/>
				              </td> --%>
				              </tr></form>	
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
<!-- </div>
</div> -->
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
<%-- <script src="${pageContext.request.contextPath}/resources/home/js/jquery.rowspanizer.min.js"></script>
<script>
$('#action').on('click', function() {
  $("#table").rowspanizer({vertical_align: 'middle'});
});
</script> --%>
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
<script type="text/javascript">
function saveTbm(key)
{ on();
	var  tTbmId=$("#tTbmId"+key).val();
	var  machineId = $("#machineId"+key).val();
	var  locationId = $("#locationId"+key).val();
	var  itemId = $("#itemId"+key).val();
	var  frequency = $("#frequency"+key).val();
	var  lastDoneDate = $("#lastDoneDate"+key).val();
	var  lastObservation = $("#lastObservation"+key).val();
	var  lastObDate = $("#lastObDate"+key).val();

	var  nextDoneDate = $("#nextDoneDate"+key).val();
	var  nextObservation = $("#nextObservation"+key).val();
	var  nextObDate = $("#nextObDate"+key).val();


	$.getJSON('${insertTbm}', {
		tTbmId : tTbmId,
		machineId:machineId,
		locationId:locationId,
		itemId:itemId,
		frequency:frequency,
		lastDoneDate:lastDoneDate,
		lastObservation:lastObservation,
		lastObDate:lastObDate,
		nextDoneDate:nextDoneDate,
		nextObservation:nextObservation,
		nextObDate:nextObDate,
		
		ajax : 'true'

	}, function(data) {
		if(data!=null){
		alert("TBM SAVED SUCCESSFULLY")
		off();
		}
		else{
			
		}
	});
	
	
}
</script>
<script>
function on() {
    document.getElementById("overlay").style.display = "block";
}

function off() {
    document.getElementById("overlay").style.display = "none";
}
</script>

<!----------------------------------------Dropdown With Search----------------------------------------------- -->
	<%-- <script
		src="${pageContext.request.contextPath}/resources/customerBill/jquery-3.2.1.min.js"
		type="text/javascript"></script> --%>
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/chosen.jquery.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/init.js"
		type="text/javascript" charset="utf-8"></script>
</body>

</html>