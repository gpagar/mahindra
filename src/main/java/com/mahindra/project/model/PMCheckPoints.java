package com.mahindra.project.model;
 
public class PMCheckPoints {

	
 
	int checkPointId;
	
	 
	int itemId;
	 
	String checkPointName;
	 
	String checkPointDesc;
	 
	int delStatus;
	 
	int int1;
	 
	int int2;
	 
	String string1;
	 
	String string2;

	public int getCheckPointId() {
		return checkPointId;
	}

	public void setCheckPointId(int checkPointId) {
		this.checkPointId = checkPointId;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getCheckPointName() {
		return checkPointName;
	}

	public void setCheckPointName(String checkPointName) {
		this.checkPointName = checkPointName;
	}

	public String getCheckPointDesc() {
		return checkPointDesc;
	}

	public void setCheckPointDesc(String checkPointDesc) {
		this.checkPointDesc = checkPointDesc;
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
		return "PMChickPoints [checkPointId=" + checkPointId + ", itemId=" + itemId + ", checkPointName="
				+ checkPointName + ", checkPointDesc=" + checkPointDesc + ", delStatus=" + delStatus + ", int1=" + int1
				+ ", int2=" + int2 + ", string1=" + string1 + ", string2=" + string2 + "]";
	}
	
	
}
