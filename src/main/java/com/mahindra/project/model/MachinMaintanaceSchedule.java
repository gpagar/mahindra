package com.mahindra.project.model;
 

public class MachinMaintanaceSchedule {
	
	 
	int maintId; 
	int machinId; 
	int activityId; 
	int itemId; 
	int type; 
	int fMonth; 
	int fWeek; 
	int sMonth; 
	int sWeek; 
	int tMonth; 
	int tweek; 
	int delStatus; 
	int int1; 
	int int2; 
	String string1; 
	String string2;
	public int getMaintId() {
		return maintId;
	}
	public void setMaintId(int maintId) {
		this.maintId = maintId;
	}
	public int getMachinId() {
		return machinId;
	}
	public void setMachinId(int machinId) {
		this.machinId = machinId;
	}
	public int getActivityId() {
		return activityId;
	}
	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getfMonth() {
		return fMonth;
	}
	public void setfMonth(int fMonth) {
		this.fMonth = fMonth;
	}
	public int getfWeek() {
		return fWeek;
	}
	public void setfWeek(int fWeek) {
		this.fWeek = fWeek;
	}
	public int getsMonth() {
		return sMonth;
	}
	public void setsMonth(int sMonth) {
		this.sMonth = sMonth;
	}
	public int getsWeek() {
		return sWeek;
	}
	public void setsWeek(int sWeek) {
		this.sWeek = sWeek;
	}
	public int gettMonth() {
		return tMonth;
	}
	public void settMonth(int tMonth) {
		this.tMonth = tMonth;
	}
	public int getTweek() {
		return tweek;
	}
	public void setTweek(int tweek) {
		this.tweek = tweek;
	}
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	public int getInt1() {
		return int1;
	}
	public void setInt1(int int1) {
		this.int1 = int1;
	}
	public int getInt2() {
		return int2;
	}
	public void setInt2(int int2) {
		this.int2 = int2;
	}
	public String getString1() {
		return string1;
	}
	public void setString1(String string1) {
		this.string1 = string1;
	}
	public String getString2() {
		return string2;
	}
	public void setString2(String string2) {
		this.string2 = string2;
	}
	@Override
	public String toString() {
		return "MachinMaintanaceSchedule [maintId=" + maintId + ", machinId=" + machinId + ", activityId=" + activityId
				+ ", itemId=" + itemId + ", type=" + type + ", fMonth=" + fMonth + ", fWeek=" + fWeek + ", sMonth="
				+ sMonth + ", sWeek=" + sWeek + ", tMonth=" + tMonth + ", tweek=" + tweek + ", delStatus=" + delStatus
				+ ", int1=" + int1 + ", int2=" + int2 + ", string1=" + string1 + ", string2=" + string2 + "]";
	}
	
	

}
