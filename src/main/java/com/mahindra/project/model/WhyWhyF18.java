package com.mahindra.project.model;

import java.io.Serializable;
import java.util.Date;

public class WhyWhyF18{


	private int id;
	
	private int machineId;
	
	private String machineNo;

	private String month;

	private String date;

	private String dept;

	private String cellCircle;

	private String problemReported;

	private int bdTimeLoss;

	private String engineLoss;

	private String partStatus;

	private String partDesc;

	private String bdMsPt;

	private String action;

	private String why1;

	private String why2;

	private String why3;

	private String why4;

	private String why5;

	private String rootCause;

	private String clarificationOfCause;

	private String failureCode;

	private String counterMeasure;

	private String category;

	private String recurNonRecurr;

	private String linkageWith;

	private int status;
	
	private String refNo;
	
	private String sapNotifNo;
	
	private int delStatus;

	
	public int getMachineId() {
		return machineId;
	}

	public void setMachineId(int machineId) {
		this.machineId = machineId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMachineNo() {
		return machineNo;
	}

	public void setMachineNo(String machineNo) {
		this.machineNo = machineNo;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getCellCircle() {
		return cellCircle;
	}

	public void setCellCircle(String cellCircle) {
		this.cellCircle = cellCircle;
	}

	public String getProblemReported() {
		return problemReported;
	}

	public void setProblemReported(String problemReported) {
		this.problemReported = problemReported;
	}

	public int getBdTimeLoss() {
		return bdTimeLoss;
	}

	public void setBdTimeLoss(int bdTimeLoss) {
		this.bdTimeLoss = bdTimeLoss;
	}

	public String getEngineLoss() {
		return engineLoss;
	}

	public void setEngineLoss(String engineLoss) {
		this.engineLoss = engineLoss;
	}

	public String getPartStatus() {
		return partStatus;
	}

	public void setPartStatus(String partStatus) {
		this.partStatus = partStatus;
	}

	public String getPartDesc() {
		return partDesc;
	}

	public void setPartDesc(String partDesc) {
		this.partDesc = partDesc;
	}

	public String getBdMsPt() {
		return bdMsPt;
	}

	public void setBdMsPt(String bdMsPt) {
		this.bdMsPt = bdMsPt;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getWhy1() {
		return why1;
	}

	public void setWhy1(String why1) {
		this.why1 = why1;
	}

	public String getWhy2() {
		return why2;
	}

	public void setWhy2(String why2) {
		this.why2 = why2;
	}

	public String getWhy3() {
		return why3;
	}

	public void setWhy3(String why3) {
		this.why3 = why3;
	}

	public String getWhy4() {
		return why4;
	}

	public void setWhy4(String why4) {
		this.why4 = why4;
	}

	public String getWhy5() {
		return why5;
	}

	public void setWhy5(String why5) {
		this.why5 = why5;
	}

	public String getRootCause() {
		return rootCause;
	}

	public void setRootCause(String rootCause) {
		this.rootCause = rootCause;
	}

	public String getClarificationOfCause() {
		return clarificationOfCause;
	}

	public void setClarificationOfCause(String clarificationOfCause) {
		this.clarificationOfCause = clarificationOfCause;
	}

	public String getFailureCode() {
		return failureCode;
	}

	public void setFailureCode(String failureCode) {
		this.failureCode = failureCode;
	}

	public String getCounterMeasure() {
		return counterMeasure;
	}

	public void setCounterMeasure(String counterMeasure) {
		this.counterMeasure = counterMeasure;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getRecurNonRecurr() {
		return recurNonRecurr;
	}

	public void setRecurNonRecurr(String recurNonRecurr) {
		this.recurNonRecurr = recurNonRecurr;
	}

	public String getLinkageWith() {
		return linkageWith;
	}

	public void setLinkageWith(String linkageWith) {
		this.linkageWith = linkageWith;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getRefNo() {
		return refNo;
	}

	public void setRefNo(String refNo) {
		this.refNo = refNo;
	}

	public String getSapNotifNo() {
		return sapNotifNo;
	}

	public void setSapNotifNo(String sapNotifNo) {
		this.sapNotifNo = sapNotifNo;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "WhyWhyF18 [id=" + id + ", machineId=" + machineId + ", machineNo=" + machineNo + ", month=" + month
				+ ", date=" + date + ", dept=" + dept + ", cellCircle=" + cellCircle + ", problemReported="
				+ problemReported + ", bdTimeLoss=" + bdTimeLoss + ", engineLoss=" + engineLoss + ", partStatus="
				+ partStatus + ", partDesc=" + partDesc + ", bdMsPt=" + bdMsPt + ", action=" + action + ", why1=" + why1
				+ ", why2=" + why2 + ", why3=" + why3 + ", why4=" + why4 + ", why5=" + why5 + ", rootCause=" + rootCause
				+ ", clarificationOfCause=" + clarificationOfCause + ", failureCode=" + failureCode
				+ ", counterMeasure=" + counterMeasure + ", category=" + category + ", recurNonRecurr=" + recurNonRecurr
				+ ", linkageWith=" + linkageWith + ", status=" + status + ", refNo=" + refNo + ", sapNotifNo="
				+ sapNotifNo + ", delStatus=" + delStatus + "]";
	}
    
}
