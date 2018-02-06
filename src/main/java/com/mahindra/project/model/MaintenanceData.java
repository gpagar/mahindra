package com.mahindra.project.model;

public class MaintenanceData {
	
	private int itemId;
	private String activity;
	private String item;
	private String checkpoint;
	private String method;
	private String requiredValue;
	private String month1;
	private String month2;
	private String month3;
	private String remark;
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getActivity() {
		return activity;
	}
	public void setActivity(String activity) {
		this.activity = activity;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getCheckpoint() {
		return checkpoint;
	}
	public void setCheckpoint(String checkpoint) {
		this.checkpoint = checkpoint;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getRequiredValue() {
		return requiredValue;
	}
	public void setRequiredValue(String requiredValue) {
		this.requiredValue = requiredValue;
	}
	public String getMonth1() {
		return month1;
	}
	public void setMonth1(String month1) {
		this.month1 = month1;
	}
	public String getMonth2() {
		return month2;
	}
	public void setMonth2(String month2) {
		this.month2 = month2;
	}
	public String getMonth3() {
		return month3;
	}
	public void setMonth3(String month3) {
		this.month3 = month3;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "MaintenanceData [itemId=" + itemId + ", activity=" + activity + ", Item=" + item + ", checkpoint="
				+ checkpoint + ", Method=" + method + ", requiredValue=" + requiredValue + ", month1=" + month1
				+ ", month2=" + month2 + ", month3=" + month3 + ", remark=" + remark + "]";
	}
	
	
	
	
}
