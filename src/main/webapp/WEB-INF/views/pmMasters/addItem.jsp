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

<!----------------------------------------Dropdown With Search----------------------------------------------- -->

<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/customerBill/chosen.css">
<!--------------------------------------------------------------------------------------- -->


  
</head>
<body onload="selectData(${machineType},${machineId},${activityId})">
   <div class="page-container">
   
  
         
   
   
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
                 
                 <script>
  $( function() {
    $( ".dp2" ).datepicker({
    	 autoclose: true, 
    	format: "dd-mm-yyyy"
    		
    });
 
  } );
  </script>

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
								<i class="fa fa-bars"></i>  Preventive Maintenance
							</h3>
							<div class="box-tool">
							
							   
								 
							 
						
						</div>


<div class="form-group">
						<div class="col-sm-3 col-lg-2 controls">
						<a href="${pageContext.request.contextPath}/showAddMachine">Add Machine
						
						</a>
						</div>
						<div class="col-sm-3 col-lg-2 controls">
						<a href="${pageContext.request.contextPath}/showUpdateMachine">Edit Machine
						
						</a>
						</div>
						<div class="col-sm-3 col-lg-2 controls">
						<a href="${pageContext.request.contextPath}/showAddActivity">Add Activity
						
						</a>
						</div>
						<div class="col-sm-3 col-lg-2 controls" style="text-decoration: underline; font-size: 20px;">
						<a href="${pageContext.request.contextPath}/showAddItem">Add Item
						
						</a>
						</div>
						<div class="col-sm-3 col-lg-2 controls">
						<a href="${pageContext.request.contextPath}/showAddCheckpoint">Add Checkpoints
						
						</a>
						</div>
						<div class="col-sm-3 col-lg-2 controls">
												<a href="${pageContext.request.contextPath}/showAllMachines">All PM Machines

						
						</a>
						</div>
						</div>
						<br/>	<br/>	<br/>
						
						<div class="box-content">
							<form action="${pageContext.request.contextPath}/insertPmItem"  class="form-horizontal"
							 id="validation-form"
										enctype="multipart/form-data" method="post">
							<input type="hidden" name="itemId" id="itemId" value="${item.itemId}"/>

					<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Machine Type.</label>
									 
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine Type"
								class="chosen-select" style="width:99% !important;" tabindex="6" id="machineType"
								name="machineType" required>

								<option value=""selected disabled="disabled">Choose Machine Type</option>

								 	 <c:choose>
								 <c:when test="${machineType==1}">
								 	<option value="1" selected>Electrical</option>
								 <option value="2">Mechanical</option>
								 </c:when>
								 <c:when test="${machineType==2}">
								 	<option value="1">Electrical</option>
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
										<select data-placeholder="Choose Machine" style="width:99% !important;"
								class="chosen-select" tabindex="6" id="machineId"
								name="machineId" required>

								<option value=""selected disabled="disabled">Choose Machine</option>

								 


							</select>
						</div>
									 
									
						</div>
							<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label">Machine Activity</label>
									<div class="col-sm-6 col-lg-4 controls">
										<select data-placeholder="Choose Machine Activity"  style="width:99% !important;"
								class="chosen-select" tabindex="6" id="machinActivity"
								name="machinActivity" required>

								<option value=""selected disabled="disabled">Choose Machine Activity</option>
 
							</select></div>
									 
								 
									
						</div>
						 
						<div class="form-group">
									<label class="col-sm-3 col-lg-4 control-label"> Item Name</label>
									<div class="col-sm-6 col-lg-4 controls" >
						<input type="text" name="itemName" id="itemName"  class="form-control " value="${item.itemName}" placeholder="itemName"   data-rule-required="true" required />
								
							</div>
							</div>
							
													 <input type="hidden" name="saveType" id="saveType"/>
							 

					<div class="row" align="center">
						<div class="col-sm-9 col-sm-offset-3 col-lg-8 col-lg-offset-2">
								<button type="button" class="btn btn-info" id="submitbtn" onclick="submitForm()">Save</button>  
				   	<button type="button" class="btn btn-info" id="submitbtn1" onclick="submitForm1()">Save & Next</button>  
		
						</div>
					</div>
					</form>
							<br>
								 
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
<script type="text/javascript">
	
		function getData() {
			var file = $("#file").val();
			
			alert("ala"+file);
			 
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
		
		
		
		$(document).ready(function() { 

			$('#machineType').change(

					function() {

						//alert("hh");

						 

						$.getJSON('${getMachinByType}', {

							machineType : $(this).val(),

							 

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

					});

		});

		$(document).ready(function() { 

			$('#machineId').change(

					function() {

						alert("hh");

						 

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

	 function selectData(machineType,machineId,activityId)
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

					
                      if(machineId==data[i].machinId){
					 $("#machineId").append(

	                           $("<option selected></option>").attr(

	                               "value", data[i].machinId).text(data[i].machinNo+" "+data[i].machinName)

	                       );
                      }else
                    	  {
                    	  $("#machineId").append(

   	                           $("<option></option>").attr(

   	                               "value", data[i].machinId).text(data[i].machinNo+" "+data[i].machinName)

   	                       );
                    	  }

				} 
				
				$("#machineId").trigger("chosen:updated");

			});


			$.getJSON('${getActivityByMachin}', {

				machinId : machineId,

				 

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

					
                     if(activityId==data[i].activityId){
					 $("#machinActivity").append(

	                           $("<option selected></option>").attr(

	                               "value", data[i].activityId).text(data[i].activityName)

	                       );
                     }
                     else
                    	 {
                    	 $("#machinActivity").append(

  	                           $("<option ></option>").attr(

  	                               "value", data[i].activityId).text(data[i].activityName)

  	                       );
                    	 }

				} 
				$("#machinActivity").trigger("chosen:updated");

			});

			
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
		<script type="text/javascript">
function submitForm()
{
	 document.getElementById("saveType").value=0;
  document.getElementById("validation-form").submit();
}
function submitForm1()
{
	 document.getElementById("saveType").value=1;
  document.getElementById("validation-form").submit();
}
</script>
</body>

</html>