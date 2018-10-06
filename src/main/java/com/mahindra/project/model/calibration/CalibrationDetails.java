package com.mahindra.project.model.calibration;

import java.io.Serializable;

public class CalibrationDetails implements Serializable{

	private int id;

	private String eqName;
	
	private String srNo;
	
	private String cardNo;
	
	private String machineNo;
	
	private String line;
	
	private int frequency;
	
	private String lastCalDate;
	
	private String nextCalDate;
	
	private int delStatus;
	
	private int inta;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEqName() {
		return eqName;
	}

	public void setEqName(String eqName) {
		this.eqName = eqName;
	}

	public String getSrNo() {
		return srNo;
	}

	public void setSrNo(String srNo) {
		this.srNo = srNo;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
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

	public int getFrequency() {
		return frequency;
	}

	public void setFrequency(int frequency) {
		this.frequency = frequency;
	}

	public String getLastCalDate() {
		return lastCalDate;
	}

	public void setLastCalDate(String lastCalDate) {
		this.lastCalDate = lastCalDate;
	}

	public String getNextCalDate() {
		return nextCalDate;
	}

	public void setNextCalDate(String nextCalDate) {
		this.nextCalDate = nextCalDate;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public int getInta() {
		return inta;
	}

	public void setInta(int inta) {
		this.inta = inta;
	}

	@Override
	public String toString() {
		return "CalibrationDetails [id=" + id + ", eqName=" + eqName + ", srNo=" + srNo + ", cardNo=" + cardNo
				+ ", machineNo=" + machineNo + ", line=" + line + ", frequency=" + frequency + ", lastCalDate="
				+ lastCalDate + ", nextCalDate=" + nextCalDate + ", delStatus=" + delStatus + ", inta=" + inta + "]";
	}
	
	
	
}
