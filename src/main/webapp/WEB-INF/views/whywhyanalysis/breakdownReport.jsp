<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Breakdown Report</title>
<style type="text/css">
#ex1 {
    border: 2px solid red;
    border-radius: 10px;
}
input[type="radio"]:checked:before {
    content: "";
    display: block;
    position: relative;
    top: 3px;
    left: 3px;
    width: 7px;
    height: 7px;
    border-radius: 50%;
    background: red;
}
</style>
</head>
<body>   <div class="page-container">

<div class="left-content">
	   <div class="mother-grid-inner"> 
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

              <div id="main-content">
			<!-- BEGIN Page Title -->
			 
			<!-- END Page Title -->

			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>BreakDown Report 
							</h3>
							<div class="box-tool">
							
						</div>
	<form action="${pageContext.request.contextPath}/saveBreakdown"  class="form-horizontal" name="breakdown_form"
							 id="validation-form" enctype="multipart/form-data" method="post">	
	<input type="hidden" value="${whyWhyF18.id}" name="id" id="id"/>	<input type="hidden" value="${machineType}" name="mcType" id="mcType"/>						 
						<div class="box-content" style="overflow-x: scroll;height:auto">
<table width="95%" border="0"  cellpadding="0" cellspacing="0" style="border-left:1px solid #313131;border-right:1px solid #313131;border-top:1px solid #313131;overflow-x:scroll;overflow-y:hidden;">
  <tr bgcolor="pink"> <td width="100%" colspan="11" style=" padding:1px;color:#000; font-size:15px; text-align:center">
    <h3 style="color:black; font-size:18px; text-align:center; margin:7px;">Breakdown Report & Why Why Analysis Sheet</h3>
 </td>
  </tr>
 <tr  bgcolor="pink">
    <td width="33%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">Plant:Igatpuri  </p> 
    </td>
    <td width="33%" colspan="4" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">PU / Shop / Dept. : Machine Shop</p> 
    </td>
    <td width="33%" colspan="4" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">Cell / Circle : ${whyWhyF18.cellCircle}</p> 
    </td>
    </tr>
 
   <tr  bgcolor="pink">
    <td width="33%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">Machine / Equipment :
Workstation No. :${whyWhyF18.machineNo}</p> 
    </td>
    <td width="33%" colspan="4" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">Machine / Equipment / 
Workstation Name : ${whyWhyF18.machineName}</p> 
    </td>
    <td width="33%" colspan="4" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">Breakdown Date :${whyWhyF18.date}</p> 
    </td>
    </tr>
    <tr>
 <td width="20%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">Repaired by : ${whyWhyF18.repairedBy}</p> 
    </td>
    <td width="20%" colspan="3" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">Repair Start Time : ${whyWhyF18.repairStartTime}</p> 
    </td>
    <td width="20%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">Repair Finish Time :${whyWhyF18.repairFinishTime}</p> 
    </td>
     <td width="20%" colspan="3" style="border-top:1px solid #313131;border-right:1px solid #313131; padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">Down Time (Mins) : ${whyWhyF18.bdTimeLoss}</p> 
    </td>
    </tr>
  <tr>
 <td width="50%" colspan="5" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">Failure Classification (Random / Recurrence) : ${whyWhyF18.recurNonRecurr}</p> 
    </td>
    <td width="50%" colspan="5" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">Previous Occurrence Date : <input type="date" name="prevOccDate" id="prevOccDate" value="${whyWhyF18.prevOccDate}" disabled/></p> 
    </td>
   
    </tr>
   <tr>
 <td width="20%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">System Classification :</p> 
    </td>
    <td width="21%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">Spare Parts Replaced: <c:choose>
     <c:when test="${whyWhyF18.partStatus eq 'Replaced'}">
      Yes
     </c:when>
     <c:otherwise> No</c:otherwise>
     </c:choose> </p> 
    </td>
    <td width="49%" colspan="5" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">If YES details: <c:choose>
     <c:when test="${whyWhyF18.partStatus eq 'Replaced'}">
     ${whyWhyF18.partDesc}
     </c:when>
     </c:choose>           </p> 
    </td>
   
    </tr>
  <tr>
 <td width="20%" colspan="2" style="text-align:right;   border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>Breakdown Physical Phenomenon</b></p> 
    </td>
  
    <td width="70%" colspan="7" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>${whyWhyF18.problemReported}</b></p> 
    </td>
   
    </tr>
     <tr>
 <td width="20%" colspan="2" style="text-align:right;   border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>Action for Restoring 
(Action for restaring MC)</b></p> 
    </td>
  
    <td width="70%" colspan="7" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>${whyWhyF18.action}</b></p> 
    </td>
   
    </tr>
     <tr>
 <td width="20%" colspan="2" style="text-align:right;   border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>WHY 1</b></p> 
    </td>
  
    <td width="70%" colspan="7" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>${whyWhyF18.why1}</b></p> 
    </td>
   
    </tr>
     <tr>
 <td width="20%" colspan="2" style="text-align:right;   border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>WHY 2</b></p> 
    </td>
  
    <td width="70%" colspan="7" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>${whyWhyF18.why2}</b></p> 
    </td>
   
    </tr>
     <tr>
 <td width="20%" colspan="2" style="text-align:right;   border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>WHY 3</b></p> 
    </td>
  
    <td width="70%" colspan="7" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>${whyWhyF18.why3}</b></p> 
    </td>
   
    </tr>
     <tr>
 <td width="20%" colspan="2" style="text-align:right;   border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>WHY 4</b></p> 
    </td>
  
    <td width="70%" colspan="7" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>${whyWhyF18.why4}</b></p> 
    </td>
   
    </tr>
     <tr>
 <td width="20%" colspan="2" style="text-align:right;   border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>WHY 5</b></p> 
    </td>
  
    <td width="70%" colspan="7" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>${whyWhyF18.why5}</b></p> 
    </td>
   
    </tr>
     <tr >
 <td width="20%" colspan="2" style="text-align:right;   border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>Root Cause</b></p> 
    </td>
  
    <td width="70%" colspan="7" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>${whyWhyF18.rootCause}</b></p> 
    </td>
   
    </tr>
     <tr>
 <td width="20%" colspan="2" style="text-align:right;   border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>Idea</b></p> 
    </td>
  
    <td width="70%" colspan="7" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>${whyWhyF18.idea}</b></p> 
    </td>
   
    </tr>
      <tr>
 <td width="20%" colspan="2" style="text-align:right;   border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>Counter measures</b></p> 
    </td>
  
    <td width="70%" colspan="7" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>${whyWhyF18.counterMeasure}</b></p> 
    </td>
   
    </tr>
     <tr>
 <td width="20%" colspan="2" style="text-align:right;   border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>Root Cause due to</b></p> 
    </td>
  
    <td width="20%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>Tick</b></p> 
    </td>
     <td width="60%" colspan="6" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;"><b>Prevention of Recurrence </b></p> 
    </td>
    </tr>
     <tr>
 <td width="30%" colspan="2" style="text-align:right;   border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">1. Inadequate Basic Conditions</p> 
    </td>
  
    <td width="20%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:20px; text-align:center;margin:5px;"><b>
     <c:if test="${whyWhyF18.clarificationOfCause eq 'Inadequate Basic Condition'}">
     &#x2714;</c:if></b></p> 
    </td>
     <td width="30%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">KAIZEN IDEA NO.:</p> 
    </td>
      <td width="20%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">
     <c:choose>
     <c:when test="${whyWhyF18.linkageWith.equalsIgnoreCase('kaizen')}">
     &#x2714; <input type="text" style="width: 120px;" name="prevenReccur" id="prevenReccur" value="${breakdownDetail.prevenReccur}"/>
     </c:when>
     </c:choose>
     </p> 
    </td>
    </tr>
     <tr>
 <td width="30%" colspan="2" style="text-align:right;   border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">2. Inadequate Operating Condition</p> 
    </td>
  
    <td width="20%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:20px; text-align:center;margin:5px;"><b>  <c:if test="${whyWhyF18.clarificationOfCause eq 'Inadequate Operating condition'}">
     &#x2714;</c:if></b></p> 
    </td>
     <td width="30%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">OPL NO.:</p> 
    </td>
      <td width="20%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">
      <c:choose>
     <c:when test="${whyWhyF18.linkageWith.equalsIgnoreCase('opl')}">
    &#x2714;  <input type="text" style="width: 120px;" name="prevenReccur" id="prevenReccur" value="${breakdownDetail.prevenReccur}"/>
     </c:when>
     </c:choose>
     </p> 
    </td>
    </tr>
     <tr>
 <td width="30%" colspan="2" style="text-align:right;   border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">3. Deterioration</p> 
    </td>
  
    <td width="20%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:20px; text-align:center;margin:5px;">  <b><c:if test="${whyWhyF18.clarificationOfCause eq 'Deterioration'}">
     &#x2714;</c:if></b></p> 
    </td>
     <td width="30%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">PM Calendar (Update/New entry)  :</p> 
    </td>
      <td width="20%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">
         <c:choose>
     <c:when test="${whyWhyF18.linkageWith.equalsIgnoreCase('pm') || whyWhyF18.linkageWith.equalsIgnoreCase('tbm') || whyWhyF18.linkageWith.equalsIgnoreCase('cbm') || fn:contains(whyWhyF18.linkageWith, 'pm') || fn:contains(whyWhyF18.linkageWith, 'PM')}">
     &#x2714; <input type="text" style="width: 120px;" name="prevenReccur" id="prevenReccur" value="${breakdownDetail.prevenReccur}"/>
     </c:when>
     </c:choose>
     </p> 
    </td>
    </tr>
     <tr>
 <td width="30%" colspan="2" style="text-align:right;   border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">4. Inadequate Design</p> 
    </td>
  
    <td width="20%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:20px; text-align:center;margin:5px;"><b><c:if test="${whyWhyF18.clarificationOfCause eq 'Inadequate Design'}">
     &#x2714;</c:if></b></p> 
    </td>
     <td width="30%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">Jishu Hozen :</p> 
    </td>
      <td width="20%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">
       <c:choose>
     <c:when test="${whyWhyF18.linkageWith.equalsIgnoreCase('jh')}">
    &#x2714;  <input type="text" style="width: 120px;" name="prevenReccur" id="prevenReccur" value="${breakdownDetail.prevenReccur}"/>
     </c:when>
     </c:choose>
     </p> 
    </td>
    </tr>
     <tr>
 <td width="30%" colspan="2" style="text-align:right;   border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">5. Inadequate Skill</p> 
    </td>
  
    <td width="20%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:20px; text-align:center;margin:5px;"><b><c:if test="${whyWhyF18.clarificationOfCause eq 'Inadequate Skill'}">
     &#x2714;</c:if></b></p> 
    </td>
     <td width="30%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">Horizontal Deployment Possible (Yes/No) :
     <c:choose>
     <c:when test="${breakdownDetail.isHdp==1}">
      <input type="checkbox"  value="1" name="ishdp"  checked="checked"  onclick="enableDisable(this.checked, 'hdp')"/>
      Yes &nbsp;
      <input type="checkbox"   value="2" name="ishdp"   onclick="disableDisable(this.checked, 'hdp')"/>No &nbsp;
   </c:when>  
    <c:when test="${breakdownDetail.isHdp==2}">
      <input type="checkbox"  value="1" name="ishdp"  onclick="enableDisable(this.checked, 'hdp')"/>
      Yes &nbsp;
      <input type="checkbox"   value="2" name="ishdp"  checked="checked"   onclick="disableDisable(this.checked, 'hdp')"  />No &nbsp;
   </c:when>  
   <c:otherwise>
      <input type="checkbox"  value="1" name="ishdp"  onclick="enableDisable(this.checked, 'hdp')"/>
      Yes &nbsp;
      <input type="checkbox"   value="2" name="ishdp" onclick="disableDisable(this.checked, 'hdp')"/>No &nbsp;
  
   </c:otherwise>
   </c:choose>
      </p> 
    </td>
      <td width="20%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:center;margin:5px;">
     <c:choose>
      <c:when test="${breakdownDetail.isHdp==2}">
        <input type="text" style="width: 120px;" name="hdp" id="hdp" value="${breakdownDetail.hdp}" disabled="disabled"/>
      </c:when>
      <c:otherwise>
      <input type="text" style="width: 120px;" name="hdp" id="hdp" value="${breakdownDetail.hdp}" />
      </c:otherwise>
     </c:choose>
   </p> 
    </td>
    </tr>
        <tr>
 <td width="20%" colspan="2" style="text-align:right;   border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">Prepared by : ${whyWhyF18.preparedBy}</p> 
    </td>
  
    <td width="30%" colspan="3" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">PU Manager / Department Head :  ${whyWhyF18.mgrorhead}</p> 
    </td>
     <td width="30%" colspan="3" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">Pillar Subcommittee Members : ${whyWhyF18.subcommMember}</p> 
    </td>
    </tr>
      </table>
      <table width="95%" border="0"  cellpadding="0" cellspacing="0" style="border-left:1px solid #313131;border-right:1px solid #313131;">
       <tr>
 <td width="20%" colspan="2" style="text-align:right;   border-top:1px solid #313131;border-bottom:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">System Classification</p> 
    </td>
  
    <td width="20%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;border-bottom:1px solid #313131;padding:2px;">
     <p style="font-size:12px; text-align:left;margin:5px;">
     <c:choose>
     <c:when test="${whyWhyF18.category=='M'||breakdownDetail.systemclassif==1}">
    <input type="checkbox" name="systemclassif" value="1" checked="checked"/> 1.Mechanical<br></br>
    <input type="checkbox" name="systemclassif" value="2" /> 2.Electrical<br></br>
    <input type="checkbox" name="systemclassif" value="3" />3.Electronics<br></br>
     <input type="checkbox" name="systemclassif" value="4" />4.Hydraulics<br></br>
    <input type="checkbox" name="systemclassif" value="5" />5.Pneumatics<br></br>
     <input type="checkbox" name="systemclassif" value="6" />6.Lubrication<br></br>
     <input type="checkbox" name="systemclassif" value="7" />7.Refrigeration<br></br>
    <input type="checkbox" name="systemclassif" value="8"/>8.Heating
   </c:when>
    <c:when test="${whyWhyF18.category=='E'||breakdownDetail.systemclassif==2}">
    <input type="checkbox" name="systemclassif" value="1"/> 1.Mechanical<br></br>
    <input type="checkbox" name="systemclassif" value="2"  checked="checked"/> 2.Electrical<br></br>
    <input type="checkbox" name="systemclassif" value="3" />3.Electronics<br></br>
     <input type="checkbox" name="systemclassif" value="4" />4.Hydraulics<br></br>
    <input type="checkbox" name="systemclassif" value="5" />5.Pneumatics<br></br>
     <input type="checkbox" name="systemclassif" value="6" />6.Lubrication<br></br>
     <input type="checkbox" name="systemclassif" value="7" />7.Refrigeration<br></br>
    <input type="checkbox" name="systemclassif" value="8"/>8.Heating
   </c:when>
   <c:when test="${breakdownDetail.systemclassif==3}">
    <input type="checkbox" name="systemclassif" value="1"/> 1.Mechanical<br></br>
    <input type="checkbox" name="systemclassif" value="2"  /> 2.Electrical<br></br>
    <input type="checkbox" name="systemclassif" value="3" checked="checked"/>3.Electronics<br></br>
     <input type="checkbox" name="systemclassif" value="4" />4.Hydraulics<br></br>
    <input type="checkbox" name="systemclassif" value="5" />5.Pneumatics<br></br>
     <input type="checkbox" name="systemclassif" value="6" />6.Lubrication<br></br>
     <input type="checkbox" name="systemclassif" value="7" />7.Refrigeration<br></br>
    <input type="checkbox" name="systemclassif" value="8"/>8.Heating
   </c:when>
   <c:when test="${breakdownDetail.systemclassif==4}">
    <input type="checkbox" name="systemclassif" value="1"/> 1.Mechanical<br></br>
    <input type="checkbox" name="systemclassif" value="2" /> 2.Electrical<br></br>
    <input type="checkbox" name="systemclassif" value="3" />3.Electronics<br></br>
     <input type="checkbox" name="systemclassif" value="4"  checked="checked"/>4.Hydraulics<br></br>
    <input type="checkbox" name="systemclassif" value="5" />5.Pneumatics<br></br>
     <input type="checkbox" name="systemclassif" value="6" />6.Lubrication<br></br>
     <input type="checkbox" name="systemclassif" value="7" />7.Refrigeration<br></br>
    <input type="checkbox" name="systemclassif" value="8"/>8.Heating
   </c:when>
   <c:when test="${breakdownDetail.systemclassif==5}">
    <input type="checkbox" name="systemclassif" value="1"/> 1.Mechanical<br></br>
    <input type="checkbox" name="systemclassif" value="2"/> 2.Electrical<br></br>
    <input type="checkbox" name="systemclassif" value="3" />3.Electronics<br></br>
     <input type="checkbox" name="systemclassif" value="4" />4.Hydraulics<br></br>
    <input type="checkbox" name="systemclassif" value="5"   checked="checked"/>5.Pneumatics<br></br>
     <input type="checkbox" name="systemclassif" value="6" />6.Lubrication<br></br>
     <input type="checkbox" name="systemclassif" value="7" />7.Refrigeration<br></br>
    <input type="checkbox" name="systemclassif" value="8"/>8.Heating
   </c:when>
   <c:when test="${breakdownDetail.systemclassif==6}">
    <input type="checkbox" name="systemclassif" value="1"/> 1.Mechanical<br></br>
    <input type="checkbox" name="systemclassif" value="2"  /> 2.Electrical<br></br>
    <input type="checkbox" name="systemclassif" value="3" />3.Electronics<br></br>
     <input type="checkbox" name="systemclassif" value="4" />4.Hydraulics<br></br>
    <input type="checkbox" name="systemclassif" value="5" />5.Pneumatics<br></br>
     <input type="checkbox" name="systemclassif" value="6" checked="checked"/>6.Lubrication<br></br>
     <input type="checkbox" name="systemclassif" value="7" />7.Refrigeration<br></br>
    <input type="checkbox" name="systemclassif" value="8"/>8.Heating
   </c:when>
   <c:when test="${breakdownDetail.systemclassif==7}">
    <input type="checkbox" name="systemclassif" value="1"/> 1.Mechanical<br></br>
    <input type="checkbox" name="systemclassif" value="2"  /> 2.Electrical<br></br>
    <input type="checkbox" name="systemclassif" value="3" />3.Electronics<br></br>
     <input type="checkbox" name="systemclassif" value="4" />4.Hydraulics<br></br>
    <input type="checkbox" name="systemclassif" value="5" />5.Pneumatics<br></br>
     <input type="checkbox" name="systemclassif" value="6" />6.Lubrication<br></br>
     <input type="checkbox" name="systemclassif" value="7"checked="checked" />7.Refrigeration<br></br>
    <input type="checkbox" name="systemclassif" value="8"/>8.Heating
   </c:when>
   <c:when test="${breakdownDetail.systemclassif==8}">
    <input type="checkbox" name="systemclassif" value="1"/> 1.Mechanical<br></br>
    <input type="checkbox" name="systemclassif" value="2" /> 2.Electrical<br></br>
    <input type="checkbox" name="systemclassif" value="3" />3.Electronics<br></br>
     <input type="checkbox" name="systemclassif" value="4" />4.Hydraulics<br></br>
    <input type="checkbox" name="systemclassif" value="5" />5.Pneumatics<br></br>
     <input type="checkbox" name="systemclassif" value="6" />6.Lubrication<br></br>
     <input type="checkbox" name="systemclassif" value="7" />7.Refrigeration<br></br>
    <input type="checkbox" name="systemclassif" value="8" checked="checked"/>8.Heating
   </c:when>
  <c:otherwise>
   <input type="checkbox" name="systemclassif" value="1"/> 1.Mechanical<br></br>
    <input type="checkbox" name="systemclassif" value="2"  /> 2.Electrical<br></br>
    <input type="checkbox" name="systemclassif" value="3" />3.Electronics<br></br>
     <input type="checkbox" name="systemclassif" value="4" />4.Hydraulics<br></br>
    <input type="checkbox" name="systemclassif" value="5" />5.Pneumatics<br></br>
     <input type="checkbox" name="systemclassif" value="6" />6.Lubrication<br></br>
     <input type="checkbox" name="systemclassif" value="7" />7.Refrigeration<br></br>
    <input type="checkbox" name="systemclassif" value="8"/>8.Heating
  
  </c:otherwise>
   

</c:choose>
</p> 

    </td>
     <td width="20%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;border-bottom:1px solid #313131;padding:2px;color:#FFF; ">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">Breakdown Phenomenon</p> 
    </td>
      <td width="20%" colspan="2" style="border-top:1px solid #313131;border-right:1px solid #313131;padding:2px;color:#FFF; border-bottom:1px solid #313131;">
     <p style="color:#000; font-size:12px; text-align:left;margin:5px;">
     <c:choose>
     <c:when test="${breakdownDetail.breakdownPhenomenon==1}">
        <input type="checkbox" name="breakdownPhenomenon" value="1" checked="checked"/>1.Not working<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="2"/>2.Machine stopped<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="3"/>3.Jammed<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="4"/>4.Broken<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="5"/>5.Damaged<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="6"/>6.Short Circuit<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="7"/>7.Tripped<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="8"/>8.Cracked etc.</p>
     </c:when>
      <c:when test="${breakdownDetail.breakdownPhenomenon==2}">
        <input type="checkbox" name="breakdownPhenomenon" value="1" />1.Not working<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="2" checked="checked"/>2.Machine stopped<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="3"/>3.Jammed<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="4"/>4.Broken<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="5"/>5.Damaged<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="6"/>6.Short Circuit<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="7"/>7.Tripped<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="8"/>8.Cracked etc.</p>
     </c:when>
      <c:when test="${breakdownDetail.breakdownPhenomenon==3||whyWhyF18.failureCode eq 'Tight/Rusty/Jam'}">
        <input type="checkbox" name="breakdownPhenomenon" value="1" />1.Not working<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="2"/>2.Machine stopped<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="3" checked="checked"/>3.Jammed<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="4"/>4.Broken<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="5"/>5.Damaged<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="6"/>6.Short Circuit<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="7"/>7.Tripped<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="8"/>8.Cracked etc.</p>
     </c:when>
      <c:when test="${breakdownDetail.breakdownPhenomenon==4||whyWhyF18.failureCode eq 'Broken'}">
        <input type="checkbox" name="breakdownPhenomenon" value="1" />1.Not working<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="2"/>2.Machine stopped<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="3"/>3.Jammed<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="4"checked="checked"/>4.Broken<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="5"/>5.Damaged<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="6"/>6.Short Circuit<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="7"/>7.Tripped<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="8"/>8.Cracked etc.</p>
     </c:when>
      <c:when test="${breakdownDetail.breakdownPhenomenon==5||whyWhyF18.failureCode eq 'Damaged'}">
        <input type="checkbox" name="breakdownPhenomenon" value="1"/>1.Not working<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="2"/>2.Machine stopped<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="3"/>3.Jammed<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="4"/>4.Broken<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="5" checked="checked" />5.Damaged<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="6"/>6.Short Circuit<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="7"/>7.Tripped<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="8"/>8.Cracked etc.</p>
     </c:when>
      <c:when test="${breakdownDetail.breakdownPhenomenon==6||whyWhyF18.failureCode eq 'Short Circuit'}}">
        <input type="checkbox" name="breakdownPhenomenon" value="1" />1.Not working<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="2"/>2.Machine stopped<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="3"/>3.Jammed<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="4"/>4.Broken<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="5"/>5.Damaged<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="6" checked="checked" />6.Short Circuit<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="7"/>7.Tripped<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="8"/>8.Cracked etc.</p>
     </c:when>
       <c:when test="${breakdownDetail.breakdownPhenomenon==7||whyWhyF18.failureCode eq 'Tripped'}">
        <input type="checkbox" name="breakdownPhenomenon" value="1" />1.Not working<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="2"/>2.Machine stopped<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="3"/>3.Jammed<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="4"/>4.Broken<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="5"/>5.Damaged<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="6" />6.Short Circuit<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="7" checked="checked" />7.Tripped<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="8"/>8.Cracked etc.</p>
     </c:when>
     <c:when test="${breakdownDetail.breakdownPhenomenon==7||whyWhyF18.failureCode eq 'Crack'}">
        <input type="checkbox" name="breakdownPhenomenon" value="1" />1.Not working<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="2"/>2.Machine stopped<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="3"/>3.Jammed<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="4"/>4.Broken<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="5"/>5.Damaged<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="6" />6.Short Circuit<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="7"  />7.Tripped<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="8" checked="checked"/>8.Cracked etc.</p>
     </c:when>
     <c:otherwise>
      <input type="checkbox" name="breakdownPhenomenon" value="1"/>1.Not working<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="2"/>2.Machine stopped<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="3"/>3.Jammed<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="4"/>4.Broken<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="5"/>5.Damaged<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="6"/>6.Short Circuit<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="7"/>7.Tripped<br></br>
 <input type="checkbox" name="breakdownPhenomenon" value="8"/>8.Cracked etc.</p> 
     </c:otherwise>
     </c:choose>
    </p>
    </td>
    </tr>
      
      </table>
      </div>
      
        <div class="row" align="center">
						<div class="col-sm-9 col-sm-offset-3 col-lg-8 col-lg-offset-2">
							<button type="submit" class="btn btn-info" id="submitbtn">Save</button>  &nbsp;&nbsp;
		                   <input type="button" margin-right: 5px;" id="btn_submit"
											class="btn btn-primary" onclick="breakdownPdf()" 
											value="PDF" />
		                   
						</div>
						</div>
						</form>
      </div></div></div></div></div></div></div>
    
    <jsp:include page="/WEB-INF/views/include/left.jsp"></jsp:include>
    </div>
   <script type="text/javascript">
   $('input[type="checkbox"]').on('change', function() {
	    $('input[name="' + this.name + '"]').not(this).prop('checked', false);
	});
   function enableDisable(bEnable, textBoxID)
   {
        document.getElementById(textBoxID).disabled = !bEnable
   }
   function disableDisable(bEnable, textBoxID)
   {
        document.getElementById(textBoxID).disabled = bEnable
   }
   
   
   </script>
   <script type="text/javascript">
function breakdownPdf()
{
	   var id=$("#id").val();
	   window.open('${pageContext.request.contextPath}/pdf?url=pdf/showWhyWhyPdf/'+id);
}
</script>
</body>
</html>