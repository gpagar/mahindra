<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
  
</head>
<body>
   <div class="page-container">
   
  
         
   
   
   <!--/content-inner-->
<div class="left-content">
	   <div class="mother-grid-inner"> 
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
             <jsp:include page="/WEB-INF/views/include/left.jsp"></jsp:include>
            
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
								<i class="fa fa-bars"></i>MIS
							</h3>
							<div class="box-tool">
							
						</div>
	
						<div class="box-content" >
						
				
					<div class="agile-grids" >	
				
				<div class="agile-tables">
					<div class="w3l-table-info"style="overflow-x:auto; height:450px; font-size: 13px; ">		
<table >
<thead >
  <tr>
    <th>Activities</th>
    <th>Units.</th>
    <th>F-${YEAR} Target L5</th>
    <th>F-${YEAR} Target L3</th>
     <th>Apr-${YEAR-1}</th> 
     <th>May-${YEAR-1}</th>    
     <th>June-${YEAR-1}</th>  
     <th>July-${YEAR-1}</th>  
     <th>Aug-${YEAR-1}</th>  
     <th>Sept-${YEAR-1}</th>  
     <th>Oct-${YEAR-1}</th>  
     <th>Nov-${YEAR-1}</th>  
     <th>Dec-${YEAR-1}</th>  
      <th>Jan-${YEAR}</th>  
     <th>Feb-${YEAR}</th>  
     <th>March-${YEAR}</th>  
       <th>Avg-F-${YEAR}</th>  
  </tr>
  </thead>
  <tbody>
  <tr>
    <td style="background-color:#bcbcbc; color:black; font-weight: bold;">Engine Loss due to Breakdown</td>
    <td style="background-color:#bcbcbc;color:black; font-weight: bold; ">Nos./Month</td><td style="background-color:#b6d4ea;font-size: 14px;font-weight: bold;"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${elTarget.targetL5}"/></td> <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${elTarget.targetL3}"/></td> 
      <td >${engineLoss.breakdownTime1}</td> 
     <td>${engineLoss.breakdownTime2}</td>    
     <td>${engineLoss.breakdownTime3}</td>  
     <td>${engineLoss.breakdownTime4}</td>  
     <td>${engineLoss.breakdownTime5}</td>  
     <td>${engineLoss.breakdownTime6}</td>  
     <td>${engineLoss.breakdownTime7}</td>  
     <td>${engineLoss.breakdownTime8}</td>  
      <td>${engineLoss.breakdownTime9}</td>  
     <td>${engineLoss.breakdownTime10}</td>  
     <td>${engineLoss.breakdownTime11}</td>
       <td>${engineLoss.breakdownTime12}</td> 
       <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(engineLoss.breakdownTime1+engineLoss.breakdownTime2+engineLoss.breakdownTime3+engineLoss.breakdownTime4+engineLoss.breakdownTime5+engineLoss.breakdownTime6+engineLoss.breakdownTime7+engineLoss.breakdownTime8+engineLoss.breakdownTime9+engineLoss.breakdownTime10+engineLoss.breakdownTime11+engineLoss.breakdownTime12)/monthNo}" var="eLossAvg"/>
    <c:choose><c:when test="${(elTarget.targetL3)>eLossAvg}"> <td style="font-weight: bold; color:white; background-color:#6bbf2d; font-size:14px;">${eLossAvg}</td> </c:when><c:otherwise> <td style="font-weight: bold; color:white;background-color:#f92018; font-size:14px;">${eLossAvg}</td> </c:otherwise>  </c:choose> 
  </tr>
  <tr>
   <td style="background-color:#bcbcbc;color:black; font-weight: bold;">Breakdown incidences - Total</td>
    <td style="background-color:#bcbcbc;color:black; font-weight: bold;">Nos./Month</td>
   <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${allTarget.targetL5}"/></td>
    <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${allTarget.targetL3}"/></td>
      <td>${allBreak.breakdownCnt1}</td> 
     <td>${allBreak.breakdownCnt2}</td>    
     <td>${allBreak.breakdownCnt3}</td>  
     <td>${allBreak.breakdownCnt4}</td>  
     <td>${allBreak.breakdownCnt5}</td>  
     <td>${allBreak.breakdownCnt6}</td>  
     <td>${allBreak.breakdownCnt7}</td>  
     <td>${allBreak.breakdownCnt8}</td>  
      <td>${allBreak.breakdownCnt9}</td>  
     <td>${allBreak.breakdownCnt10}</td>  
     <td>${allBreak.breakdownCnt11}</td>
       <td>${allBreak.breakdownCnt12}</td>
       <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(allBreak.breakdownCnt1+allBreak.breakdownCnt2+allBreak.breakdownCnt3+allBreak.breakdownCnt4+allBreak.breakdownCnt5+allBreak.breakdownCnt6+allBreak.breakdownCnt7+allBreak.breakdownCnt8+allBreak.breakdownCnt9+allBreak.breakdownCnt10+allBreak.breakdownCnt11+allBreak.breakdownCnt12)/monthNo}" var="allBreakTotal"/>
      <c:choose><c:when test="${(allTarget.targetL3)>allBreakTotal}"> <td style="font-weight: bold; color:white; background-color:#6bbf2d; font-size:14px;">${allBreakTotal}</td> </c:when><c:otherwise> <td style="font-weight: bold; color:white;background-color:#f92018; font-size:14px;">${allBreakTotal}</td> </c:otherwise>  </c:choose> 
  </tr>
  <tr>
   <td style="background-color:#bcbcbc;color:black; font-weight: bold;">Breakdown time - Total</td>
    <td style="background-color:#bcbcbc;color:black; font-weight: bold;">Hrs./ Month</td>
  <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${timeTarget.targetL5}"/></td>
    <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${timeTarget.targetL3}"/></td>
     <td><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${mtbf.breakdownTime1/60}"  var="tm1" /> ${tm1}</td> 
     <td><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${mtbf.breakdownTime2/60}"  var="tm2"/> ${tm2}</td>    
     <td><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${mtbf.breakdownTime3/60}"  var="tm3"/> ${tm3}</td>  
     <td><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${mtbf.breakdownTime4/60}"  var="tm4"/> ${tm4}</td>  
     <td><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${mtbf.breakdownTime5/60}"  var="tm5"/> ${tm5}</td>  
     <td><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${mtbf.breakdownTime6/60}"  var="tm6"/> ${tm6}</td>  
     <td><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${mtbf.breakdownTime7/60}"  var="tm7"/> ${tm7}</td>  
     <td><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${mtbf.breakdownTime8/60}"  var="tm8"/> ${tm8}</td>  
      <td><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${mtbf.breakdownTime9/60}"  var="tm9"/> ${tm9}</td>  
     <td><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${mtbf.breakdownTime10/60}"  var="tm10"/> ${tm10}</td>  
     <td><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${mtbf.breakdownTime11/60}"  var="tm11"/> ${tm11}</td>
       <td><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${mtbf.breakdownTime12/60}"  var="tm12"/>${tm12}</td>
       <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(tm1+tm2+tm3+tm4+tm5+tm6+tm7+tm8+tm9+tm10+tm11+tm12)/monthNo}" var="timeAvg"/>   
      <c:choose><c:when test="${(timeTarget.targetL3)>timeAvg}"> <td style="font-weight: bold; color:white; background-color:#6bbf2d; font-size:14px;">${timeAvg}</td> </c:when><c:otherwise> <td style="font-weight: bold; color:white;background-color:#f92018; font-size:14px;">${timeAvg}</td> </c:otherwise>  </c:choose> 
   
  </tr>
  <tr>
     <td style="background-color:#bcbcbc;color:black; font-weight: bold;">Open Breakdowns</td>
    <td style="background-color:#bcbcbc;color:black; font-weight: bold;">Nos./Month</td>
   <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;">0</td>
    <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;">0</td>
     <td>0</td> 
     <td>0</td>    
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
      <td>0</td>  
     <td>0</td>  
     <td>0</td> <td style="font-weight: bold; color:white; background-color:#6bbf2d; font-size:14px;">0</td> 
  </tr>
  <tr>
     <td style="background-color:#bcbcbc;color:black; font-weight: bold;">Minor Stoppage Incidences</td>
    <td style="background-color:#bcbcbc;color:black; font-weight: bold;">Nos./Month</td>
    <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${minorTarget.targetL5}"/></td>
    <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${minorTarget.targetL3}"/></td>
     <td>${minorStoppages.breakdownCnt1}</td> 
     <td>${minorStoppages.breakdownCnt2}</td>    
     <td>${minorStoppages.breakdownCnt3}</td>  
     <td>${minorStoppages.breakdownCnt4}</td>  
     <td>${minorStoppages.breakdownCnt5}</td>  
     <td>${minorStoppages.breakdownCnt6}</td>  
     <td>${minorStoppages.breakdownCnt7}</td>  
     <td>${minorStoppages.breakdownCnt8}</td>  
      <td>${minorStoppages.breakdownCnt9}</td>  
     <td>${minorStoppages.breakdownCnt10}</td>  
     <td>${minorStoppages.breakdownCnt11}</td>
       <td>${minorStoppages.breakdownCnt12}</td>
       <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(minorStoppages.breakdownCnt1+minorStoppages.breakdownCnt2+minorStoppages.breakdownCnt3+minorStoppages.breakdownCnt4+minorStoppages.breakdownCnt5+minorStoppages.breakdownCnt6+minorStoppages.breakdownCnt7+minorStoppages.breakdownCnt8+minorStoppages.breakdownCnt9+minorStoppages.breakdownCnt10+minorStoppages.breakdownCnt11+minorStoppages.breakdownCnt12)/monthNo}" var="minorAvg"/>
      <c:choose><c:when test="${(minorTarget.targetL3)>minorAvg}"> <td style="font-weight: bold; color:white; background-color:#6bbf2d; font-size:14px;">${minorAvg}</td> </c:when><c:otherwise> <td style="font-weight: bold; color:white;background-color:#f92018; font-size:14px;">${minorAvg}</td> </c:otherwise>  </c:choose> 
</tr>
<tr>
     <td style="background-color:#bcbcbc;color:black; font-weight: bold;">MTBF</td>
    <td style="background-color:#bcbcbc;color:black; font-weight: bold;">Total Time/ Incidences 
(Hrs)</td>
  <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${mtbfTarget.targetL5}" /></td>
    <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${mtbfTarget.targetL3}"  /></td>
    <td><c:choose><c:when test="${mtbf.breakdownCnt1>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${720/mtbf.breakdownCnt1}"   var="bf1"/> ${bf1} </c:when><c:otherwise>0</c:otherwise> </c:choose></td> 
     <td><c:choose><c:when test="${mtbf.breakdownCnt2>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${744/mtbf.breakdownCnt2}"   var="bf2"/>${bf2}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>    
     <td><c:choose><c:when test="${mtbf.breakdownCnt3>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${720/mtbf.breakdownCnt3}"   var="bf3"/>${bf3}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>  
     <td><c:choose><c:when test="${mtbf.breakdownCnt4>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${744/mtbf.breakdownCnt4}"   var="bf4"/>${bf4}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>  
     <td><c:choose><c:when test="${mtbf.breakdownCnt5>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${744/mtbf.breakdownCnt5}"   var="bf5"/>${bf5}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>  
     <td><c:choose><c:when test="${mtbf.breakdownCnt6>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${720/mtbf.breakdownCnt6}"   var="bf6"/>${bf6}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>  
     <td><c:choose><c:when test="${mtbf.breakdownCnt7>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${744/mtbf.breakdownCnt7}"   var="bf7"/>${bf7}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>  
     <td><c:choose><c:when test="${mtbf.breakdownCnt8>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${720/mtbf.breakdownCnt8}"   var="bf8"/>${bf8}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>  
      <td><c:choose><c:when test="${mtbf.breakdownCnt9>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${744/mtbf.breakdownCnt9}"   var="bf9"/>${bf9}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>  
     <td><c:choose><c:when test="${mtbf.breakdownCnt10>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${744/mtbf.breakdownCnt10}"   var="bf10"/>${bf10}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>  
     <td><c:choose><c:when test="${mtbf.breakdownCnt11>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${720/mtbf.breakdownCnt11}" var="bf11"/>${bf11}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>
       <td><c:choose><c:when test="${mtbf.breakdownCnt12>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${744/mtbf.breakdownCnt12}" var="bf12"/>${bf12}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>
         <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(bf1+bf2+bf3+bf4+bf5+bf6+bf7+bf8+bf9+bf10+bf11+bf12)/monthNo}" var="mtbfAvg"/>
      <c:choose><c:when test="${mtbfAvg>(mtbfTarget.targetL3)}"> <td style="font-weight: bold; color:white; background-color:#6bbf2d; font-size:14px;">${mtbfAvg}</td> </c:when><c:otherwise> <td style="font-weight: bold; color:white;background-color:#f92018; font-size:14px;">${mtbfAvg}</td> </c:otherwise>  </c:choose> 
</tr>
<tr>
     <td style="background-color:#bcbcbc;color:black; font-weight: bold;">MTTR</td>
    <td style="background-color:#bcbcbc;color:black; font-weight: bold;"> Total BD time/incidences 
(Hrs)</td>
       <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${mttrTarget.targetL5}"/></td>
    <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${mttrTarget.targetL3}"/></td>
    <td><c:choose><c:when test="${mtbf.breakdownCnt1>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(mtbf.breakdownTime1/60)/mtbf.breakdownCnt1}"  var="tr1" />${tr1}</c:when><c:otherwise>0</c:otherwise> </c:choose></td> 
     <td><c:choose><c:when test="${mtbf.breakdownCnt2>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(mtbf.breakdownTime2/60)/mtbf.breakdownCnt2}" var="tr2"/>${tr2}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>    
     <td><c:choose><c:when test="${mtbf.breakdownCnt3>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(mtbf.breakdownTime3/60)/mtbf.breakdownCnt3}" var="tr3"/>${tr3}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>  
     <td><c:choose><c:when test="${mtbf.breakdownCnt4>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(mtbf.breakdownTime4/60)/mtbf.breakdownCnt4}" var="tr4"/>${tr4}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>  
     <td><c:choose><c:when test="${mtbf.breakdownCnt5>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(mtbf.breakdownTime5/60)/mtbf.breakdownCnt5}" var="tr5"/>${tr5}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>  
     <td><c:choose><c:when test="${mtbf.breakdownCnt6>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(mtbf.breakdownTime6/60)/mtbf.breakdownCnt6}" var="tr6"/>${tr6}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>  
     <td><c:choose><c:when test="${mtbf.breakdownCnt7>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(mtbf.breakdownTime7/60)/mtbf.breakdownCnt7}" var="tr7"/>${tr7}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>  
     <td><c:choose><c:when test="${mtbf.breakdownCnt8>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(mtbf.breakdownTime8/60)/mtbf.breakdownCnt8}" var="tr8"/>${tr8}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>  
      <td><c:choose><c:when test="${mtbf.breakdownCnt9>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(mtbf.breakdownTime9/60)/mtbf.breakdownCnt9}" var="tr9"/>${tr9}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>  
     <td><c:choose><c:when test="${mtbf.breakdownCnt10>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(mtbf.breakdownTime10/60)/mtbf.breakdownCnt10}" var="tr10"/>${tr10}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>  
     <td><c:choose><c:when test="${mtbf.breakdownCnt11>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(mtbf.breakdownTime11/60)/mtbf.breakdownCnt11}" var="tr11"/>${tr11}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>
       <td><c:choose><c:when test="${mtbf.breakdownCnt12>0}"><fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(mtbf.breakdownTime12/60)/mtbf.breakdownCnt12}" var="tr12"/>${tr12}</c:when><c:otherwise>0</c:otherwise> </c:choose></td>
         <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(tr1+tr2+tr3+tr4+tr5+tr6+tr7+tr8+tr9+tr10+tr11+tr12)/monthNo}" var="mttrAvg"/>
      <c:choose><c:when test="${(mttrTarget.targetL3)>mttrAvg}"> <td style="font-weight: bold; color:white; background-color:#6bbf2d; font-size:14px;">${mttrAvg}</td> </c:when><c:otherwise> <td style="font-weight: bold; color:white;background-color:#f92018; font-size:14px;">${mttrAvg}</td> </c:otherwise>  </c:choose> 
</tr>

<tr>
     <td style="background-color:#bcbcbc;color:black; font-weight: bold;">Fixed cost</td>
    <td style="background-color:#bcbcbc;color:black; font-weight: bold;">Rs.Lacs</td>
    <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;">0</td>
    <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;">0</td>
     <td>0</td> 
     <td>0</td>    
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
      <td>0</td>  
     <td>0</td>  
     <td>0</td>
      <td style="font-weight: bold;  background-color:#6bbf2d;font-size:14px;">0</td> 
</tr><%-- 
<tr>
     <td style="background-color:#bcbcbc;color:black; font-weight: bold;">PM compliance</td>
    <td style="background-color:#bcbcbc;color:black; font-weight: bold;">%</td>
 <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;">100</td>
    <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;"> <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${machineL3TargetRes.year4lTtarget/(machineL5TargetRes.year4lTarget/100)}" var="pmL3Target"/> ${pmL3Target}</td>
     <td> <c:set var = "total"  value ="0"/>
     <c:choose><c:when test="${pmActualGDataRes.apr>1}">
     <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(pmActualGDataRes.apr/pmTargetGDataRes.aprTarget)*100}"/>
           <c:set var = "total"  value = "${total+(pmTargetGDataRes.aprTarget/pmActualGDataRes.apr)}"/>
     
     </c:when>
     <c:otherwise>0</c:otherwise></c:choose>
     </td> 
     <td> <c:choose><c:when test="${pmActualGDataRes.may>1}">
    <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = " ${(pmActualGDataRes.may/pmTargetGDataRes.mayTarget)*100}"/>
      <c:set var = "total"  value = "${total+(pmTargetGDataRes.mayTarget/pmActualGDataRes.may)}"/>
         </c:when>
     <c:otherwise>0</c:otherwise></c:choose>
     </td>    
     <td><c:choose><c:when test="${pmActualGDataRes.june>1}">
      <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(pmActualGDataRes.june/pmTargetGDataRes.juneTarget)*100}"/>
      <c:set var = "total"  value = "${total+(pmTargetGDataRes.juneTarget/pmActualGDataRes.june)}"/>
     </c:when>
     <c:otherwise>0</c:otherwise></c:choose>
     </td>  
     <td> <c:choose><c:when test="${pmActualGDataRes.july>1}">
     <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = " ${(pmActualGDataRes.july/pmTargetGDataRes.julyTarget)*100}"/>
      <c:set var = "total"  value = "${total+(pmTargetGDataRes.julyTarget/pmActualGDataRes.july)}"/>
      </c:when>
     <c:otherwise>0</c:otherwise></c:choose>
     </td>  
     <td> <c:choose><c:when test="${pmActualGDataRes.aug>1}">
     <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = " ${(pmActualGDataRes.aug/pmTargetGDataRes.augTarget)*100}"/>
      <c:set var = "total"  value = "${total+(pmTargetGDataRes.augTarget/pmActualGDataRes.aug)}"/>
      </c:when>
     <c:otherwise>0</c:otherwise></c:choose></td>  
     <td>
      <c:choose><c:when test="${pmActualGDataRes.sept>0}">
      <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(pmActualGDataRes.sept/pmTargetGDataRes.septTarget)*100}"/>
      <c:set var = "total"  value = "${total+(pmTargetGDataRes.septTarget/pmActualGDataRes.sept)}"/>
      </c:when>
     <c:otherwise>0</c:otherwise></c:choose></td>  
     <td> <c:choose><c:when test="${pmActualGDataRes.oct>0}">
     <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = " ${(pmActualGDataRes.oct/pmTargetGDataRes.octTarget)*100}"/>
      <c:set var = "total"  value = "${total+(pmTargetGDataRes.octTarget/pmActualGDataRes.oct)}"/>
      </c:when>
     <c:otherwise>0</c:otherwise></c:choose></td>  
     <td> <c:choose><c:when test="${pmActualGDataRes.nov>0}">
     <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = " ${(pmActualGDataRes.nov/pmTargetGDataRes.novTarget)*100}"/>
      <c:set var = "total"  value = "${total+(pmTargetGDataRes.novTarget/pmActualGDataRes.nov)}"/>
      </c:when>
     <c:otherwise>0</c:otherwise></c:choose></td>  
     <td>
      <c:choose><c:when test="${pmActualGDataRes.dec>0}">
     <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = " ${(pmActualGDataRes.dec/pmTargetGDataRes.decTarget)*100}"/>
      <c:set var = "total"  value = "${total+(pmTargetGDataRes.decTarget/pmActualGDataRes.dec)}"/>
      </c:when>
     <c:otherwise>0</c:otherwise></c:choose></td>  
      <td> <c:choose><c:when test="${pmActualGDataRes.jan>0}">
       <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(pmActualGDataRes.jan/pmTargetGDataRes.janTarget)*100}"/>
       <c:set var = "total"  value = "${total+(pmTargetGDataRes.janTarget/pmActualGDataRes.jan)}"/>
       </c:when>
     <c:otherwise>0</c:otherwise></c:choose></td>  
     <td> <c:choose><c:when test="${pmActualGDataRes.feb>0}">
      <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(pmActualGDataRes.feb/pmTargetGDataRes.febTarget)*100}"/>
    <c:set var = "total"  value = "${total+(pmTargetGDataRes.febTarget/pmActualGDataRes.feb)}"/>
      </c:when>
     <c:otherwise>0</c:otherwise></c:choose>
     </td>  
     <td>
      <c:choose><c:when test="${pmActualGDataRes.march>0}">
    <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${(pmActualGDataRes.march/pmTargetGDataRes.marchTarget)*100}"/>
      <c:set var = "total"  value = "${total+(pmTargetGDataRes.marchTarget/pmActualGDataRes.march)}"/>
      </c:when>
     <c:otherwise>0</c:otherwise></c:choose>
     </td>
       <c:choose><c:when test="${(pmL3Target)>(total/monthNo)}"> <td style="font-weight: bold; color:white; background-color:#f92018; font-size:14px;"> <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${total/monthNo}" /></td> </c:when><c:otherwise> <td style="font-weight: bold; color:white;background-color:#6bbf2d; font-size:14px;"> <fmt:formatNumber type = "number" 
         minFractionDigits = "2"   maxFractionDigits = "2" value = "${total/monthNo}" /></td> </c:otherwise>  </c:choose>        
         
         
</tr> --%>
<tr>
     <td style="background-color:#bcbcbc;color:black; font-weight: bold;">PM compliance</td>
    <td style="background-color:#bcbcbc;color:black; font-weight: bold;">%</td>
   <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;">0</td>
    <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;">0</td>
     <td>0</td> 
     <td>0</td>    
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
      <td>0</td>  
     <td>0</td>  
     <td>0</td> <td style="font-weight: bold; background-color:#6bbf2d; font-size:14px;">0</td> 
</tr>
<tr>
     <td style="background-color:#bcbcbc;color:black; font-weight: bold;">TBM compliance</td>
    <td style="background-color:#bcbcbc;color:black; font-weight: bold;">%</td>
   <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;">0</td>
    <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;">0</td>
     <td>0</td> 
     <td>0</td>    
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
      <td>0</td>  
     <td>0</td>  
     <td>0</td> <td style="font-weight: bold; background-color:#6bbf2d; font-size:14px;">0</td> 
</tr>
<tr>
     <td style="background-color:#bcbcbc;color:black; font-weight: bold;">No. of MTBF / MTTR kaizens</td>
    <td style="background-color:#bcbcbc;color:black; font-weight: bold;">No./Month</td>
    <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;">0</td>
    <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;">0</td>
     <td>0</td> 
     <td>0</td>    
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
      <td>0</td>  
     <td>0</td>  
     <td>0</td> <td style="font-weight: bold; background-color:#6bbf2d; font-size:14px;">0</td> 
</tr>

<tr>
     <td style="background-color:#bcbcbc;color:black; font-weight: bold;">B rank Zero breakdown machine</td>
    <td style="background-color:#bcbcbc;color:black; font-weight: bold;">%</td>
   <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;">0</td>
    <td style="background-color:#b6d4ea;font-weight: bold;font-size: 14px;">0</td>
     <td>0</td> 
     <td>0</td>    
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
     <td>0</td>  
      <td>0</td>  
     <td>0</td>  
     <td>0</td> <td style="font-weight: bold; background-color:#6bbf2d; font-size:14px;" >0</td> 
</tr>
</tbody>
</table>
		</div></div></div>				

      </div>
      
						
      </div></div></div></div>
    
	 
		 
		   
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
		 <p>� 2017-18 . All Rights Reserved |  <a href="www.mahindra.com/" target="_blank">Mahindra rise</a> </p></div>	
</div>	
<!--COPY rights end here-->
</div>
</div>
  <!--//content-inner-->
			<!--/sidebar-menu-->
				





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