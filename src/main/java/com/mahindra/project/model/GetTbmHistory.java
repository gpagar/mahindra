package com.mahindra.project.model;

import java.io.Serializable;


public class GetTbmHistory{

	private int tTbmId;

	private int machineId;
	
	private String machineName;
	
	private String machineNo;
	
	private int locationId;
	
	private String locationName;
	
	private int itemId;
	
	private String itemName;
	
	private int frequency;
	
	private String lastDate;
	
	private String lastDoneMonth;
	
	private String nextDate;
	
	private String nextDoneMonth;
	
	private String lastDoneDate;
	
	private String lastObservation;
	
	private String lastObDate;

	private String nextDoneDate;
	
	private String nextObservation;

	private String nextObDate;
	
	private int status;
	
	private int delStatus;

	public int gettTbmId() {
		return tTbmId;
	}

	public void settTbmId(int tTbmId) {
		this.tTbmId = tTbmId;
	}

	public int getMachineId() {
		return machineId;
	}

	public void setMachineId(int machineId) {
		this.machineId = machineId;
	}

	public String getMachineName() {
		return machineName;
	}

	public void setMachineName(String machineName) {
		this.machineName = machineName;
	}

	public String getMachineNo() {
		return machineNo;
	}

	public void setMachineNo(String machineNo) {
		this.machineNo = machineNo;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
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

	public String getLastDoneMonth() {
		return lastDoneMonth;
	}

	public void setLastDoneMonth(String lastDoneMonth) {
		this.lastDoneMonth = lastDoneMonth;
	}

	public String getNextDate() {
		return nextDate;
	}

	public void setNextDate(String nextDate) {
		this.nextDate = nextDate;
	}

	public String getNextDoneMonth() {
		return nextDoneMonth;
	}

	public void setNextDoneMonth(String nextDoneMonth) {
		this.nextDoneMonth = nextDoneMonth;
	}

	public String getLastDoneDate() {
		return lastDoneDate;
	}

	public void setLastDoneDate(String lastDoneDate) {
		this.lastDoneDate = lastDoneDate;
	}

	public String getLastObservation() {
		return lastObservation;
	}

	public void setLastObservation(String lastObservation) {
		this.lastObservation = lastObservation;
	}

	public String getLastObDate() {
		return lastObDate;
	}

	public void setLastObDate(String lastObDate) {
		this.lastObDate = lastObDate;
	}

	public String getNextDoneDate() {
		return nextDoneDate;
	}

	public void setNextDoneDate(String nextDoneDate) {
		this.nextDoneDate = nextDoneDate;
	}

	public String getNextObservation() {
		return nextObservation;
	}

	public void setNextObservation(String nextObservation) {
		this.nextObservation = nextObservation;
	}

	public String getNextObDate() {
		return nextObDate;
	}

	public void setNextObDate(String nextObDate) {
		this.nextObDate = nextObDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "GetTbmHistory [tTbmId=" + tTbmId + ", machineId=" + machineId + ", machineName=" + machineName
				+ ", machineNo=" + machineNo + ", locationId=" + locationId + ", locationName=" + locationName
				+ ", itemId=" + itemId + ", itemName=" + itemName + ", frequency=" + frequency + ", lastDate="
				+ lastDate + ", lastDoneMonth=" + lastDoneMonth + ", nextDate=" + nextDate + ", nextDoneMonth="
				+ nextDoneMonth + ", lastDoneDate=" + lastDoneDate + ", lastObservation=" + lastObservation
				+ ", lastObDate=" + lastObDate + ", nextDoneDate=" + nextDoneDate + ", nextObservation="
				+ nextObservation + ", nextObDate=" + nextObDate + ", status=" + status + ", delStatus=" + delStatus
				+ "]";
	}
	
	

}
