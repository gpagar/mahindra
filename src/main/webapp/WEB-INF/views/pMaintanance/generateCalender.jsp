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
<meta name="keywords"
	content="Pooled Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />



</head>
<body onLoad="fillYears(${planList.fMonth-1}); populateTable(document.dateChooser,${planList.fWeek},${planList.fStatus}); fillYears1(${planList.sMonth-1}); populateTable1(document.dateChooser,${planList.sWeek},${planList.sStatus}); fillYears2(${planList.tMonth-1}); populateTable2(document.dateChooser,${planList.tweek},${planList.tStatus}) ">

    
	<div class="page-container">





		<!--/content-inner-->
		<div class="left-content">
			<div class="mother-grid-inner">
				<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>



				<script>
					$(function() {
						$(".dp2").datepicker({
							autoclose : true,
							format : "dd-mm-yyyy"

						});

					});
				</script>


				<STYLE TYPE="text/css">
TD, TH {
	text-align: center
}
</STYLE>
				<SCRIPT LANGUAGE="JavaScript">
					 
					// day of week of month's first day
			function getFirstDay(theYear, theMonth) {
						
						var firstDate = new Date(theYear, theMonth, 1)
						
						return firstDate.getDay()
			}
					
					
					
					// number of days in the month
			function getMonthLen(theYear, theMonth) {
						
						var oneDay = 1000 * 60 * 60 * 24
						var thisMonth = new Date(theYear, theMonth, 1)
						var nextMonth = new Date(theYear, theMonth + 1, 1)
						var len = Math.ceil((nextMonth.getTime() - thisMonth.getTime())/ oneDay)
						
						return len
			}
					
					
					// create array of English month names
		var theMonths = [ "January", "February", "March", "April","May", "June", "July", "August", "September","October", "November", "December" ]
					
					
					// return IE4+ or W3C DOM reference for an ID
			function getObject(obj) {
						
						var theObj
						
						if (document.all) 
						{
							if (typeof obj == "string") {
								return document.all(obj)
							} 
							else {
								return obj.style
							}
						}
						
						if (document.getElementById) 
						{
							if (typeof obj == "string") {
								return document.getElementById(obj)
							} 
							else {
								return obj.style
							}
						}
						
						
						return null
			}

					
					
					/************************
					 DRAW CALENDAR CONTENTS
					 *************************/
					// clear and re-populate table based on form's selections
				function populateTable(form, ii,fStatus) {
						//alert(ii +""+ fStatus);
						var theMonth = form.chooseMonth.selectedIndex
						var theYear = parseInt(form.chooseYear.options[form.chooseYear.selectedIndex].text)
						// initialize date-dependent variables
						var firstDay = getFirstDay(theYear, theMonth)
						var howMany = getMonthLen(theYear, theMonth)

						// fill in month/year in table header
						getObject("tableHeader").innerHTML = theMonths[theMonth]
								+ " " + theYear

						// initialize vars for table creation
						var dayCounter = 1
						var TBody = getObject("tableBody")
						// clear any existing rows
						while (TBody.rows.length > 0) {
							TBody.deleteRow(0)
						}
						var newR, newC
						var done = false
						while (!done) {
							// create new row at end
							newR = TBody.insertRow(TBody.rows.length)
							for (var i = 0; i < 7; i++) {

								// create new cell at end of row
								newC = newR.insertCell(newR.cells.length)
								if (TBody.rows.length == 1 && i < firstDay) {
									// no content for boxes before first day
									newC.innerHTML = ""
									continue
								}
								if (dayCounter == howMany) {
									// no more rows after this one
									done = true
								}
								// plug in date (or empty for boxes after last day)
								for (var k = 1; k <=TBody.rows.length; k++) {
									if (k == ii)
										{
										//alert(fStatus);
										if(fStatus==0)
											newR.style.backgroundColor = "#228B22";
										else
											newR.style.backgroundColor = "#FFFF00"; 
										} 
									else
										{
										newR.style.backgroundColor = "#ffffff";
										}
										
								}
								/* if(newR==2)
									{
									//newC.innerHTML = (dayCounter <= howMany) ? dayCounter++ : ""
									newR.style.color = "#00AA00";
									} */

								newC.innerHTML = (dayCounter <= howMany) ? dayCounter++
										: ""

							}

						}
						/* fillYears1(8); 
						populateTable1(document.dateChooser,8); */
					}

					
					
					
					
				function populateTable1(form, ii, sStatus) {
					//alert(sStatus);
					var theMonth = form.chooseMonth.selectedIndex
					var theYear = parseInt(form.chooseYear.options[form.chooseYear.selectedIndex].text)
					// initialize date-dependent variables
					var firstDay = getFirstDay(theYear, theMonth)
					var howMany = getMonthLen(theYear, theMonth)

					// fill in month/year in table header
					getObject("tableHeader1").innerHTML = theMonths[theMonth]
							+ " " + theYear

					// initialize vars for table creation
					var dayCounter = 1
					var TBody = getObject("tableBody1")
					// clear any existing rows
					while (TBody.rows.length > 0) {
						TBody.deleteRow(0)
					}
					var newR, newC
					var done = false
					while (!done) {
						// create new row at end
						newR = TBody.insertRow(TBody.rows.length)
						for (var i = 0; i < 7; i++) {

							// create new cell at end of row
							newC = newR.insertCell(newR.cells.length)
							if (TBody.rows.length == 1 && i < firstDay) {
								// no content for boxes before first day
								newC.innerHTML = ""
								continue
							}
							if (dayCounter == howMany) {
								// no more rows after this one
								done = true
							}
							// plug in date (or empty for boxes after last day)
							for (var k = 0; k < TBody.rows.length; k++) { 
								if (k == ii)
								{
								//alert(sStatus);
									if(sStatus==0)
										newR.style.backgroundColor = "#228B22";
									else
										newR.style.backgroundColor = "#FFFF00"; 
									
								} 
							else
								{
								newR.style.backgroundColor = "#ffffff";
								}
							}
							/* if(newR==2)
								{
								//newC.innerHTML = (dayCounter <= howMany) ? dayCounter++ : ""
								newR.style.color = "#00AA00";
								} */

							newC.innerHTML = (dayCounter <= howMany) ? dayCounter++
									: ""

						}

					}
					/* fillYears2(10); 
					populateTable2(document.dateChooser,10); */
				}
				
function populateTable2(form, ii, tStatus) {
					//alert(tStatus);
					var theMonth = form.chooseMonth.selectedIndex
					var theYear = parseInt(form.chooseYear.options[form.chooseYear.selectedIndex].text)
					// initialize date-dependent variables
					var firstDay = getFirstDay(theYear, theMonth)
					var howMany = getMonthLen(theYear, theMonth)

					// fill in month/year in table header
					getObject("tableHeader2").innerHTML = theMonths[theMonth]
							+ " " + theYear

					// initialize vars for table creation
					var dayCounter = 1
					var TBody = getObject("tableBody2")
					// clear any existing rows
					while (TBody.rows.length > 0) {
						TBody.deleteRow(0)
					}
					var newR, newC
					var done = false
					while (!done) {
						// create new row at end
						newR = TBody.insertRow(TBody.rows.length)
						for (var i = 0; i < 7; i++) {

							// create new cell at end of row
							newC = newR.insertCell(newR.cells.length)
							if (TBody.rows.length == 1 && i < firstDay) {
								// no content for boxes before first day
								newC.innerHTML = ""
								continue
							}
							if (dayCounter == howMany) {
								// no more rows after this one
								done = true
							}
							// plug in date (or empty for boxes after last day)
							for (var k = 0; k < TBody.rows.length; k++) {
								if (k == ii)
								{
								//alert(tStatus);
									if(tStatus==0)
										newR.style.backgroundColor = "#228B22";
									else
										newR.style.backgroundColor = "#FFFF00"; 
									
								} 
							else
								{
								newR.style.backgroundColor = "#ffffff";
								}
							}
							/* if(newR==2)
								{
								//newC.innerHTML = (dayCounter <= howMany) ? dayCounter++ : ""
								newR.style.color = "#00AA00";
								} */

							newC.innerHTML = (dayCounter <= howMany) ? dayCounter++
									: ""

						}

					}
				}
				
				
				
					/*******************
					 INITIALIZATIONS
					 ********************/
					// create dynamic list of year choices
					function fillYears(calMonthValue) {
						var today = new Date()
						var thisYear = today.getFullYear()
						var yearChooser = document.dateChooser.chooseYear
						for (i = thisYear; i < thisYear + 8; i++) {
							yearChooser.options[yearChooser.options.length] = new Option(
									i, i)
						}
						setCurrMonth(calMonthValue)
					}
					// set month choice to current month
					function setCurrMonth(calMonthValue) {
						document.dateChooser.chooseMonth.selectedIndex = calMonthValue
					}
					
					
					
					function fillYears1(calMonthValue) {
						var today = new Date()
						var thisYear = today.getFullYear()
						var yearChooser = document.dateChooser.chooseYear
						for (i = thisYear; i < thisYear + 8; i++) {
							yearChooser.options[yearChooser.options.length] = new Option(
									i, i)
						}
						setCurrMonth1(calMonthValue)
					}
					// set month choice to current month
					function setCurrMonth1(calMonthValue) {
						document.dateChooser.chooseMonth.selectedIndex = calMonthValue
					}
					function fillYears2(calMonthValue) {
						var today = new Date()
						var thisYear = today.getFullYear()
						var yearChooser = document.dateChooser.chooseYear
						for (i = thisYear; i < thisYear + 8; i++) {
							yearChooser.options[yearChooser.options.length] = new Option(
									i, i)
						}
						setCurrMonth1(calMonthValue)
					}
					// set month choice to current month
					function setCurrMonth2(calMonthValue) {
						document.dateChooser.chooseMonth.selectedIndex = calMonthValue
					}
				</SCRIPT>

				 

				<div id="main-content">
					<!-- BEGIN Page Title -->

					<!-- END Page Title -->

					<!-- BEGIN Main Content -->
					<div class="row">
						<div class="col-md-12">
							<div class="box">
								<div class="box-title">
									<h3>
										<i class="fa fa-bars"></i> Preventive Maintenance Plan Schedule
									</h3>
									<div class="box-tool"></div>

</div>
									<div class="box-content">



										 


										 

										<br />
										<div class="form-group">
											<div class="col-sm-6 col-lg-4 controls">

												<!-- <BODY
													onLoad="fillYears(5); populateTable(document.dateChooser,5)">
 -->

													<TABLE ID="calendarTable" BORDER=1 ALIGN="center">
														<TR>
															<TH ID="tableHeader" COLSPAN=7></TH>
														</TR>
														<TR bgcolor="NavieBlue">
															<TH width="35px">Sun</TH>
															<TH width="35px">Mon</TH>
															<TH width="35px">Tue</TH>
															<TH width="35px">Wed</TH>
															<TH width="35px">Thu</TH>
															<TH width="35px">Fri</TH>
															<TH width="35px">Sat</TH>
														</TR>
														<TBODY ID="tableBody"></TBODY>
														 
														 </TABLE>
														 
														
														 
														 
																<FORM NAME="dateChooser">
																	<SELECT NAME="chooseMonth"
																		onChange="populateTable(this.form,5)"
																		style="display: none;">
																		<OPTION SELECTED>January</OPTION>
																		<OPTION>February</OPTION>
																		<OPTION>March</OPTION>
																		<OPTION>April</OPTION>
																		<OPTION>May</OPTION>
																		<OPTION>June</OPTION>
																		<OPTION>July</OPTION>
																		<OPTION>August</OPTION>
																		<OPTION>September</OPTION>
																		<OPTION>October</OPTION>
																		<OPTION>November</OPTION>
																		<OPTION>December</OPTION>
																	</SELECT> <SELECT NAME="chooseYear"
																		onChange="populateTable(this.form)"
																		style="display: none;">

																	</SELECT>

																</FORM>

																 
													
											<!-- 	</BODY> -->

											</div>
											<div class="col-sm-6 col-lg-4 controls">
											 <TABLE ID="calendarTable1" BORDER=1 ALIGN="center">
														<TR>
															<TH ID="tableHeader1" COLSPAN=7></TH>
														</TR>
														<TR bgcolor="NavieBlue">
															<TH width="35px">Sun</TH>
															<TH width="35px">Mon</TH>
															<TH width="35px">Tue</TH>
															<TH width="35px">Wed</TH>
															<TH width="35px">Thu</TH>
															<TH width="35px">Fri</TH>
															<TH width="35px">Sat</TH>
														</TR>
														<TBODY ID="tableBody1"></TBODY>
														 
														 </TABLE>
														 </div>
									 	<div class="col-sm-6 col-lg-4 controls">

												 
								<TABLE ID="calendarTable2" BORDER=1 ALIGN="center">
														<TR>
															<TH ID="tableHeader2" COLSPAN=7></TH>
														</TR>
														<TR bgcolor="NavieBlue">
															<TH width="35px">Sun</TH>
															<TH width="35px">Mon</TH>
															<TH width="35px">Tue</TH>
															<TH width="35px">Wed</TH>
															<TH width="35px">Thu</TH>
															<TH width="35px">Fri</TH>
															<TH width="35px">Sat</TH>
														</TR>
														<TBODY ID="tableBody2"></TBODY>
														 
														 </TABLE>

													 

											</div> 
										</div></br>
										<br> <br>
									</div>

								</div>
							</div>





						</div><br>





						<!--//w3-agileits-pane-->
						<!-- script-for sticky-nav -->
						<script>
							$(document)
									.ready(
											function() {
												var navoffeset = $(
														".header-main")
														.offset().top;
												$(window)
														.scroll(
																function() {
																	var scrollpos = $(
																			window)
																			.scrollTop();
																	if (scrollpos >= navoffeset) {
																		$(
																				".header-main")
																				.addClass(
																						"fixed");
																	} else {
																		$(
																				".header-main")
																				.removeClass(
																						"fixed");
																	}
																});

											});
						</script>
						<!-- /script-for sticky-nav -->
						<!--inner block start here-->
						<div class="inner-block"></div>
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

			$(".sidebar-icon").click(
					function() {
						if (toggle) {
							$(".page-container").addClass("sidebar-collapsed")
									.removeClass("sidebar-collapsed-back");
							$("#menu span").css({
								"position" : "absolute"
							});
						} else {
							$(".page-container").removeClass(
									"sidebar-collapsed").addClass(
									"sidebar-collapsed-back");
							setTimeout(function() {
								$("#menu span").css({
									"position" : "relative"
								});
							}, 400);
						}

						toggle = !toggle;
					});
		</script>
		<!--js -->
		<script
			src="${pageContext.request.contextPath}/resources/home/js/jquery.nicescroll.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/home/js/scripts.js"></script>
		<!-- Bootstrap Core JavaScript -->
		<script
			src="${pageContext.request.contextPath}/resources/home/js/bootstrap.min.js"></script>
		<!-- /Bootstrap Core JavaScript -->
		<!-- morris JavaScript -->
		<script
			src="${pageContext.request.contextPath}/resources/home/js/raphael-min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/home/js/morris.js"></script>
</body>



<script type="text/javascript">
function getMonthCal(calMonth)
{
	alert("jj");
	fillYears(9);
	
	populateTable(calMonth,5);
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

</script>

</html>