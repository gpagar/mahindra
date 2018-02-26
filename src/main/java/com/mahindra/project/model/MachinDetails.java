package com.mahindra.project.model;
 
 
public class MachinDetails {

  
	int machinId;

 
	String machinName;
	
 
	String machinNo;
	
	 
	int type;
 
	String string3;
 
	int delStatus;
 
	int int1;
 
	int int2;
 
	String string1;
 
	String string2;
	public int getMachinId() {
		return machinId;
	}
	public void setMachinId(int machinId) {
		this.machinId = machinId;
	}
	public String getMachinName() {
		return machinName;
	}
	public void setMachinName(String machinName) {
		this.machinName = machinName;
	}
	public String getMachinNo() {
		return machinNo;
	}
	public void setMachinNo(String machinNo) {
		this.machinNo = machinNo;
	}
	public String getString3() {
		return string3;
	}
	public void setString3(String string3) {
		this.string3 = string3;
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "MachinDetails [machinId=" + machinId + ", machinName=" + machinName + ", machinNo=" + machinNo
				+ ", type=" + type + ", string3=" + string3 + ", delStatus=" + delStatus + ", int1=" + int1 + ", int2="
				+ int2 + ", string1=" + string1 + ", string2=" + string2 + "]";
	}
 
	
	
}
