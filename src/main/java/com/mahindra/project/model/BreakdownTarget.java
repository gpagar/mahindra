package com.mahindra.project.model;

import java.io.Serializable;


public class BreakdownTarget implements Serializable{

	private int targetId;
	
	private int year;
	
	private float targetL3;
	
	private float targetL5;
	
	private int status;
	
	private int assignedBy;
	
	private int graphType;
	
	private String remark;
	
	private int exInt;
	
	private String exString;

	public int getTargetId() {
		return targetId;
	}

	public void setTargetId(int targetId) {
		this.targetId = targetId;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public float getTargetL3() {
		return targetL3;
	}

	public void setTargetL3(float targetL3) {
		this.targetL3 = targetL3;
	}

	public float getTargetL5() {
		return targetL5;
	}

	public void setTargetL5(float targetL5) {
		this.targetL5 = targetL5;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getAssignedBy() {
		return assignedBy;
	}

	public void setAssignedBy(int assignedBy) {
		this.assignedBy = assignedBy;
	}

	public int getGraphType() {
		return graphType;
	}

	public void setGraphType(int graphType) {
		this.graphType = graphType;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getExInt() {
		return exInt;
	}

	public void setExInt(int exInt) {
		this.exInt = exInt;
	}

	public String getExString() {
		return exString;
	}

	public void setExString(String exString) {
		this.exString = exString;
	}

	@Override
	public String toString() {
		return "BreakdownTarget [targetId=" + targetId + ", year=" + year + ", targetL3=" + targetL3 + ", targetL5="
				+ targetL5 + ", status=" + status + ", assignedBy=" + assignedBy + ", graphType=" + graphType
				+ ", remark=" + remark + ", exInt=" + exInt + ", exString=" + exString + "]";
	}
	
	
}
