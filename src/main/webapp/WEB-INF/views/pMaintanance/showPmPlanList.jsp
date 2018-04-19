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

table {
    height: 200px;       /* Just for the demo          */
    overflow-y: auto;    /* Trigger vertical scroll    */
    overflow-x: auto;  /* Hide the horizontal scroll */
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
</head>
<body onload="setMachineSelected(${machineType},${machineId})">
   
   <!--/content-inner-->
<div class="left-content">
	   <div class="mother-grid-inner"> 
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

 <c:url var="importExcel2" value="/importExcel2"></c:url>
      <c:url var="getMachinByType" value="/getMachinByType"></c:url>
         <c:url var="getActivityByMachin" value="/getActivityByMachin"></c:url>
              <c:url var="getItemByActivity" value="/getItemByActivity"></c:url>
                 <c:url var="getCheckPointsByItem" value="/getCheckPointsByItem"></c:url>
                 <c:url var="getCheckRecordAgistMachine" value="/getCheckRecordAgistMachine"></c:url>
                  <c:url var="insertPMRecord" value="/insertPMRecord"></c:url> 
  

		<!-- <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a> <i class="fa fa-angle-right"></i></li>
            </ol> -->
 
              <div id="main-content">
			<!-- BEGIN Page Title -->
			 
			<!-- END Page Title -->

			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>  Preventive Maintenance List
							</h3>
							<div class="box-tool">
							
						</div>

						<div class="box-content">
							<form action="${pageContext.request.contextPath}/searchPaMaintainenceList"  class="form-horizontal"
							 id="validation-form"
										enctype="multipart/form-data" method="post">
							
                  
                   
					<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Machine Type.</label>
									 
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine Type"
								class="form-control chosen" tabindex="6" id="machineType"
								name="machineType" required onchange="onMacTypeChange(this.value)">

								<option value="" >Choose Machine Type</option>
                                   <c:choose>
                                   
                                   <c:when test="${machineType==1}">
                                   <option value="1" selected>Electrical</option>
								   <option value="2">Mechanical</option>
                                   </c:when>
                                     <c:when test="${machineType==2}">
                                   <option value="1" >Electrical</option>
								   <option value="2" selected>Mechanical</option>
                                   </c:when>
                                   <c:otherwise>
                                    <option value="1">Electrical</option>
								   <option value="2">Mechanical</option>
                                   </c:otherwise>
                                   
                                   </c:choose>
								
							</select>
						</div>
									<input type="hidden" name="umo_id" id="umo_id" />
									
						</div>
						
								<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Machine name & No.</label>
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine"
								class="form-control chosen" tabindex="6" id="machineId"
								name="machineId" required>

								<option value=""selected disabled="disabled">Choose Machine</option>

							</select>
						</div>
									
						</div>
					
					<div class="row" align="center">
						<div class="col-sm-9 col-sm-offset-3 col-lg-8 col-lg-offset-2">
							<button type="submit" class="btn btn-info" id="submitbtn">Search</button>  
			<!-- 	<button type="button" class="btn btn-info" id="addMaintenance2" onclick="unlockDate2Dive()">Search</button>   -->
		

						</div>
					</div>
					</form>
		<form action="${pageContext.request.contextPath}/insertPMRecord"  class="form-horizontal" name="pm_form"
							 id="validation-form"
										enctype="multipart/form-data" method="post">	
										 <input type="hidden" name="machine_id" id="machine_id" value="${machineId}"/>
                   <input type="hidden" name="machine_type" id="machine_type" value="${machineType}"/>			
					<div class="agile-grids" >	
				<!-- tables -->
				
				<div class="agile-tables">
					<div class="w3l-table-info" style="overflow-x:auto; ">
					<!-- <button class="btn btn-primary" id="action">Auto Rowspan</button> -->
					
					    <table id="table"  style="border: 1px;"><!-- class="table table-inverse table-bordered" -->
						<thead>
						  <tr>
							<th>Sr.No</th>
							<th>Activity_Done_In</th>
							<th>Item(What)</th>
							<th>Checkpoints</th>
							<th>Method(How)</th>
							<th>Required Value</th>
							<th>Date</th>
							<th>Observation/Action</th> 
							<th>Image1</th> 
							<th>Date</th>
							<th>Observation/Action</th> 
							<th>Image2</th> 
							<th>Date</th>
							<th>Observation/Action</th>
							<th>Image3</th> 
							<th>Remark</th>
							<th>Action</th>
						  </tr>
						</thead>
						<tbody>
						<c:set var="cnt1" value="0"/>
                        <c:forEach var="entry" items="${actTypes}">
						 <tr >
						     <td></td>
							<td colspan="16"><c:out value="${entry.value}"/></td>
						  </tr>
						<c:forEach items="${paMaintainenceList}" var="paMaintainence" varStatus="count">
						<c:choose>
						<c:when test="${entry.key==paMaintainence.int2}">
						<c:set var="cnt1" value="${cnt1+1}"/>
						<input type="hidden" id="key" name="key"/>
						    <input type="hidden" name="check_point_id${count.index}" id="check_point_id${count.index}"  value="${paMaintainence.checkPointId}"/>
						    <input type="hidden" name="pa_maint_id${count.index}" id="pa_maint_id${count.index}" value="${paMaintainence.paMaintId}"/>
						    <input type="hidden" name="activity_id${count.index}" id="activity_id${count.index}" value="${paMaintainence.activityId}"/>
						    <input type="hidden" name="item_id${count.index}" id="item_id${count.index}" value="${paMaintainence.itemId}"/>
						    
						  <tr>
						    
							<td><c:out value="${cnt1}" /></td>
							<td width="300" > <c:out value="${paMaintainence.activityName}" /></td>
							
						    <td ><c:out value="${paMaintainence.itemName}" /></td>
							 <td ><c:out value="${paMaintainence.checkPointName}" /></td>
						
							 <td><select name="method_id${count.index}" id="method_id${count.index}">
							   <option value="">Select Method</option>
							    <c:choose>
							    <c:when test="${paMaintainence.method==1}">
							     <option value="1" selected>Visually</option>
                               <option value="2">Physically</option>
							    </c:when>
							    <c:when test="${paMaintainence.method==2}">
							     <option value="1" >Visually</option>
                               <option value="2"selected>Physically</option>
							    </c:when>
							    <c:otherwise>
							     <option value="1" >Visually</option>
                               <option value="2">Physically</option>
							    </c:otherwise>
							    </c:choose>
                              
 
                             </select></td>
						
							  <td><select name="req_value${count.index}" id="req_value${count.index}"	>						
                      <option value="">Select Required Value</option>
						<c:forEach items="${requiredValueList}" var="requiredValue" varStatus="cnt">
					 <c:choose>
						    <c:when test="${paMaintainence.rquiredValure==requiredValue.requiredValueId}">
						      <option value="${requiredValue.requiredValueId}" selected>${requiredValue.requiredValue}</option>
						    </c:when>
						    <c:otherwise>
						   	 <option value="${requiredValue.requiredValueId}">${requiredValue.requiredValue}</option>
						   </c:otherwise>
						    </c:choose>
                            
                       </c:forEach>
                             </select></td>
                        <td><input type="date" name="date1${count.index}" id="date1${count.index}"   placeholder="dd-mm-yyyy"  style="width:200px;" value="${paMaintainence.date1}"/></td>
							
							<td><textarea rows="1" cols="20" name="date1ob${count.index}" id="date1ob${count.index}">${paMaintainence.date1Obervation}
</textarea></td>
							<td><input type="file" id="myFile1${count.index}" value="${paMaintainence.date1Photo}">
</td>
                             <td><input type="date" name="date2${count.index}" id="date2${count.index}" placeholder="dd-mm-yyyy"  style="width:200px;" value="${paMaintainence.date2}"/></td>

							<td><textarea rows="1" cols="20" name="date2ob${count.index}" id="date2ob${count.index}">${paMaintainence.date2Obervation}
</textarea></td>
							<td><input type="file" id="myFile2${count.index}"value="${paMaintainence.date2Photo}"></td>
							<td><textarea rows="1" cols="20" name="date3ob${count.index}" id="date3ob${count.index}">${paMaintainence.date3Obervation}
</textarea></td>
                             <td><input type="date" name="date3${count.index}" id="date3${count.index}" placeholder="dd-mm-yyyy"  style="width:200px;" value="${paMaintainence.date3}"/></td>

							<td><input type="file" id="myFile3${count.index}" value="${paMaintainence.date3Photo}"></td>
							<td><textarea rows="1" cols="18" name="remark${count.index}" id="remark${count.index}">${paMaintainence.remark}
</textarea></td>  <td>   <a href="#" onclick="addNewPM(${count.index})"><i class="fa fa-save" style="font-size:24px"></i></a>
</td> 
						
						</c:when>
						</c:choose> </c:forEach></c:forEach>
						</tbody>
			
					  </table>
					</div>
				

				</div>
				<!-- //tables -->
			</div>			</form>	     
				</div>

			</div>

		</div>
	</div>
	<!-- END Main Content -->
	 


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
		 <p>© 2017-18 . All Rights Reserved |  <a href="www.mahindra.com/" target="_blank">Mahindra rise</a> </p></div>	
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
<script type="text/javascript">
function addNewPM(key)
{
	 if (confirm("Do you want to Save this record?")) {
	var isValid=validation(key);
	document.getElementById('key').value=key;
	/* var activityId = $("#activity_id"+key).val();alert("activityId"+activityId)
	var itemId = $("#item_id"+key).val();alert("itemId"+activityId)
	var paMaintId = $("#pa_maint_id"+key).val();alert("paMaintId"+paMaintId)
	var machineId = $("#machine_id").val();alert("machineId"+machineId)
	var machineType = $("#machine_type").val();alert("machineType"+machineType)
	var methodId = $("#method_id"+key).val();alert("methodId"+methodId)
	var checkPointId=$("#check_point_id"+key).val();alert("checkPointId"+checkPointId)
	var requiredVal=$("#req_value"+key).val();alert("requiredVal"+requiredVal)
	var date1=$("#date1"+key).val();alert("date1"+date1)
	var date1Ob=$("#date1ob"+key).val();alert("date1Ob"+date1Ob)
	var date2=$("#date2"+key).val();alert("date2"+date2)
	var date2Ob=$("#date2ob"+key).val();alert("date2Ob"+date2Ob)
	var date3=$("#date3"+key).val();alert("date3"+date3)
	var date3Ob=$("#date3ob"+key).val();alert("date3Ob"+date3Ob)
	var remark=$("#remark"+key).val();alert("remark"+remark)
	var file1 = $("#myFile1"+key).val();alert("file1"+file1)
	var file2 = $("#myFile2"+key).val();alert("file2"+file2)
	var file3 = $("#myFile3"+key).val();alert("file3"+file3)
 */
 
	if(isValid==true)
		{
		document.forms["pm_form"].submit();
		/* alert("data")
		$.getJSON('${insertPMRecord}',
				{
			        activityId:activityId,
			        itemId:itemId,
			        paMaintId:paMaintId,
			        machineId:machineId,
			        machineType:machineType,
        	        checkPointId:checkPointId,
		        	methodId:methodId,
		        	requiredValId:requiredVal,
		        	date1:date1,
		        	date2:date2,
		        	date3:date3,
		        	date1Ob:date1Ob,
		        	date2Ob:date2Ob,
		        	date3Ob:date3Ob,
		        	remark:remark,
					file1 : file1, 
					file2 : file2, 
					file3 : file3, 
					ajax : 'true'

				},
				function(data) {
		
		alert("data")
		}); */
		
		
		
		}
	 }
}
</script>
<script type="text/javascript">
function validation(key) {
	
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
}
</script>

<script type="text/javascript">
	
		function getData() {
			var file = $("#file").val();
			
			//alert("ala"+file);
			 
			$
					.getJSON(
							'${importExcel2}',

							{
								 
								file : file, 
								ajax : 'true'

							},
							function(data) {
								alert("ala");
								$('#table_grid td').remove();
								 

								if (data == "") {
									alert("No records found !!");

								}
							 

							  $.each( data,
											function(key, itemList) {
												
												var bgcolor; 
											var tr = $('<tr></tr>');
										  	tr.append($('<td style="color:red"></td>').html(key+1));

										  	tr.append($('<td style="color:red"></td>').html(itemList.fromDeptName));
										  	

										  	tr.append($('<td style="color:red"></td>').html(itemList.reqDate));
										  
										  	tr.append($('<td style="color:red"></td>').html(stats));
										  	tr.append($('<td ></td>').html("<a href='${pageContext.request.contextPath}/viewDetailBOMRequest?reqId="+itemList.reqId+"' class='action_btn'> <abbr title='detailed'> <i class='fa fa-list' ></i></abbr> "));
											
											$('#table_grid tbody').append(tr);
											 
												 
											 
											

											})  
							});

		 
	}
		
		
		
		/* $(document).ready(function() { 

			$('#machineType').change(
 */
					function onMacTypeChange(machineType) {

						//alert("hh"+machineType);

						 

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

					}/* );

		}); */

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

								

						    	//alert(len);
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

		
		$(document).ready(function() { 

			$('#machinActivity').change(

					function() {

						//alert("hh");

						 

						$.getJSON('${getItemByActivity}', {

							activityId : $(this).val(),

							 

							ajax : 'true'

						}, function(data) {

							var html = '<option value=""selected disabled="disabled">Choose Machine Item</option>';

						

							var len = data.length;

							$('#machinItem')

						    .find('option')

						    .remove()

						    .end()

								

						    	//alert(len);
						    $("#machinItem").append(

			                           $("<option ></option>").attr(

			                               "value", "").text("Select Item ")

			                       );

							for ( var i = 0; i < len; i++) {

								

								 $("#machinItem").append(

				                           $("<option ></option>").attr(

				                               "value", data[i].itemId).text(data[i].itemName)

				                       );

							} 
							$("#machinItem").trigger("chosen:updated");
		 
						});

					});

		});
		
		
		$(document).ready(function() { 

			$('#machinItem').change(

					function() {

						//alert("hh");

						 

						$.getJSON('${getCheckPointsByItem}', {

							itemId : $(this).val(),

							 

							ajax : 'true'

						}, function(data) {

							var html = '<option value=""selected disabled="disabled">Choose Machine Check Ponts</option>';

						

							var len = data.length;

							$('#machinCheckPoint')

						    .find('option')

						    .remove()

						    .end()

								

						    	//alert(len);
						    $("#machinCheckPoint").append(

			                           $("<option ></option>").attr(

			                               "value", "").text("Select CheckPoint ")

			                       );

							for ( var i = 0; i < len; i++) {

								

								 $("#machinCheckPoint").append(

				                           $("<option ></option>").attr(

				                               "value", data[i].checkPointId).text(data[i].checkPointName)

				                       );

							} 
							$("#machinCheckPoint").trigger("chosen:updated");
		 
						});

					});

		});
		
		$(document).ready(function() { 

			$('#machinCheckPoint').change(
					 
					function() { 
						
						var machineId = $("#machineId").val();
						
						$.getJSON('${getCheckRecordAgistMachine}', {

							checkPointId : $(this).val(),
							machineId : machineId,
							 

							ajax : 'true'

						}, function(data) {

							 if(data.paMaintId==0)
								 {
								 document.getElementById("date1").value ="";
								 document.getElementById("observation1").value ="";
								 document.getElementById("date2").value ="";
								 document.getElementById("observation2").value ="";
								 document.getElementById("date3").value ="";
								 document.getElementById("observation3").value ="";
								 document.getElementById("date2div").style.display="none";
								 document.getElementById("date3div").style.display="none";
								 document.getElementById('addMaintenance2').style.visibility = 'visible';
								 document.getElementById("requiredValueId").value ="";
								 $("#requiredValueId").trigger("chosen:updated");
								 document.getElementById("methodId").value ="";
								 $("#methodId").trigger("chosen:updated");
								 }
							 else
								 {
								 alert(data.status);
								 if(data.status==2)
									 {
									 document.getElementById("date2div").style.display="block";
									 document.getElementById("date3div").style.display="none";
									 document.getElementById('addMaintenance2').style.visibility = 'visible';
									 }
								 else if(data.status==3)
									 {
									 document.getElementById("date2div").style.display="block";
									 document.getElementById("date3div").style.display="block";
									 document.getElementById('addMaintenance2').style.visibility = 'hidden';
									 }
								 else
									 {
									 document.getElementById("date2div").style.display="none";
									 document.getElementById("date3div").style.display="none";
									 document.getElementById('addMaintenance2').style.visibility = 'visible';
									 }
								 
								 document.getElementById("date1").value =data.date1;
								 document.getElementById("observation1").value =data.date1Obervation;
								 document.getElementById("date2").value =data.date2;
								 document.getElementById("observation2").value =data.date2Obervation;
								 document.getElementById("date3").value =data.date3;
								 document.getElementById("observation3").value =data.date3Obervation;
								 document.getElementById("requiredValueId").value =data.rquiredValure;
								 $("#requiredValueId").trigger("chosen:updated");
								 document.getElementById("methodId").value =data.method;
								 $("#methodId").trigger("chosen:updated");
								 }
		 
						});

					});

		});
		
		function unlockDate2Dive()
		{
			 if(document.getElementById("date2div").style.display=="block")
				 {
				 document.getElementById("date3div").style.display="block";
				 document.getElementById('addMaintenance2').style.visibility = 'hidden'; 
				 }
			document.getElementById("date2div").style.display="block"; 
		}
		 
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

				

		    	//alert(len);
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
</body>

</html>