package com.mahindra.project.model.tbm;

 
public class TbmMachineItem {

	
	 
	int itemId;
 
	int locationId;
	 
	int machineId;
	
 	String 	itemName;
	
 
	int 	frequency;
 
	String 	lastDate;
	 
	int delStatus;
 
	int int1;
 
	int int2;

	 
	String string1;
	
 
	String string2;

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public int getMachineId() {
		return machineId;
	}

	public void setMachineId(int machineId) {
		this.machineId = machineId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	 

	public int getFrequency() {
		return frequency;
	}

	public void setFrequency(int frequency) {
		this.frequency = frequency;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
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
		return "TbmMachineItem [itemId=" + itemId + ", locationId=" + locationId + ", machineId=" + machineId
				+ ", itemName=" + itemName + ", frequency=" + frequency + ", lastDate=" + lastDate + ", delStatus="
				+ delStatus + ", int1=" + int1 + ", int2=" + int2 + ", string1=" + string1 + ", string2=" + string2
				+ "]";
	}
	
	
	
}
