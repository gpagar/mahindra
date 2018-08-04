package com.mahindra.project.model.tbm;
 
public class TbmMachineLocation {

 
	int locationId;
	
 
	int machineId;
	
 
	String location;
	
 
	int delStatus;
 	int int1;

 	int int2;

 	String string1;
	
 	String string2;

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

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
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
		return "TbmMachineLocation [locationId=" + locationId + ", machineId=" + machineId + ", location=" + location
				+ ", delStatus=" + delStatus + ", int1=" + int1 + ", int2=" + int2 + ", string1=" + string1
				+ ", string2=" + string2 + "]";
	}
	
	
	
	
}
