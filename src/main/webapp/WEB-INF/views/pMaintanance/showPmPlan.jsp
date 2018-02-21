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
<body>
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
					/*******************
					 UTILITY FUNCTIONS
					 ********************/
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
						var len = Math.ceil((nextMonth.getTime() - thisMonth
								.getTime())
								/ oneDay)
						return len
					}
					// create array of English month names
					var theMonths = [ "January", "February", "March", "April",
							"May", "June", "July", "August", "September",
							"October", "November", "December" ]
					// return IE4+ or W3C DOM reference for an ID
					function getObject(obj) {
						var theObj
						if (document.all) {
							if (typeof obj == "string") {
								return document.all(obj)
							} else {
								return obj.style
							}
						}
						if (document.getElementById) {
							if (typeof obj == "string") {
								return document.getElementById(obj)
							} else {
								return obj.style
							}
						}
						return null
					}

					/************************
					 DRAW CALENDAR CONTENTS
					 *************************/
					// clear and re-populate table based on form's selections
					function populateTable(form, ii) {
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
								for (var k = 0; k < TBody.rows.length; k++) {
									if (k == ii)
										newR.style.color = "#FF0000";
									else
										newR.style.color = "#000";
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
					function fillYears() {
						var today = new Date()
						var thisYear = today.getFullYear()
						var yearChooser = document.dateChooser.chooseYear
						for (i = thisYear; i < thisYear + 8; i++) {
							yearChooser.options[yearChooser.options.length] = new Option(
									i, i)
						}
						setCurrMonth(today)
					}
					// set month choice to current month
					function setCurrMonth(today) {
						document.dateChooser.chooseMonth.selectedIndex = 2
					}
				</SCRIPT>

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
										<i class="fa fa-bars"></i> Preventive Maintenance Plan
									</h3>
									<div class="box-tool"></div>

									<div class="box-content">







										<BODY
											onLoad="fillYears(); populateTable(document.dateChooser,3)">












											<HR>
											<TABLE ID="calendarTable" BORDER=1 ALIGN="center">
												<TR>
													<TH ID="tableHeader" COLSPAN=7></TH>
												</TR>
												<TR>
													<TH>Sun</TH>
													<TH>Mon</TH>
													<TH>Tue</TH>
													<TH>Wed</TH>
													<TH>Thu</TH>
													<TH>Fri</TH>
													<TH>Sat</TH>
												</TR>
												<TBODY ID="tableBody"></TBODY>
												<TR>
													<TD COLSPAN=7>
														<P>
														<FORM NAME="dateChooser">
															<SELECT NAME="chooseMonth"
																onChange="populateTable(this.form,3)"
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

														</P>
													</TD>
												</TR>
											</TABLE>





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
					<script>
						$(document).ready(function() {
							var navoffeset = $(".header-main").offset().top;
							$(window).scroll(function() {
								var scrollpos = $(window).scrollTop();
								if (scrollpos >= navoffeset) {
									$(".header-main").addClass("fixed");
								} else {
									$(".header-main").removeClass("fixed");
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
						<p>
							© 2017-18 . All Rights Reserved | <a href="http://m&m.com/"
								target="_blank">M&M</a>
						</p>
					</div>
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
						$(".page-container").removeClass("sidebar-collapsed")
								.addClass("sidebar-collapsed-back");
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

</html>