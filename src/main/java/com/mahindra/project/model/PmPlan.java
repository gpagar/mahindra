package com.mahindra.project.model;

import java.io.Serializable;


public class PmPlan implements Serializable{
	
	int maintId; 
	String machinName;
	String machineNo;
	String line;
	int machinId; 
	int fStatus; 
	int sStatus; 
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
	int tStatus;
	int status;
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getMaintId() {
		return maintId;
	}
	public void setMaintId(int maintId) {
		this.maintId = maintId;
	}
	public String getMachinName() {
		return machinName;
	}
	public void setMachinName(String machinName) {
		this.machinName = machinName;
	}
	public String getMachineNo() {
		return machineNo;
	}
	public void setMachineNo(String machineNo) {
		this.machineNo = machineNo;
	}
	public String getLine() {
		return line;
	}
	public void setLine(String line) {
		this.line = line;
	}
	public int getMachinId() {
		return machinId;
	}
	public void setMachinId(int machinId) {
		this.machinId = machinId;
	}
	public int getfStatus() {
		return fStatus;
	}
	public void setfStatus(int fStatus) {
		this.fStatus = fStatus;
	}
	public int getsStatus() {
		return sStatus;
	}
	public void setsStatus(int sStatus) {
		this.sStatus = sStatus;
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
	public int gettStatus() {
		return tStatus;
	}
	public void settStatus(int tStatus) {
		this.tStatus = tStatus;
	}
	@Override
	public String toString() {
		return "PmPlan [maintId=" + maintId + ", machinName=" + machinName + ", machineNo=" + machineNo + ", line="
				+ line + ", machinId=" + machinId + ", fStatus=" + fStatus + ", sStatus=" + sStatus + ", type=" + type
				+ ", fMonth=" + fMonth + ", fWeek=" + fWeek + ", sMonth=" + sMonth + ", sWeek=" + sWeek + ", tMonth="
				+ tMonth + ", tweek=" + tweek + ", delStatus=" + delStatus + ", int1=" + int1 + ", int2=" + int2
				+ ", string1=" + string1 + ", string2=" + string2 + ", tStatus=" + tStatus + "]";
	}
    
	
}
