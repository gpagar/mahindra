package com.mahindra.project.model.calibration;

import java.io.Serializable;
import java.util.Date;

public class EqCalDetails implements Serializable{
	
	private int id;

	private String eqName;

	private String srNo;
	
	private String cardNo;
	
	private String machineNo;
	
	private String line;
	
	private int frequency;
	
	private Date lastCalDate;
	
	private int delStatus;

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

	public Date getLastCalDate() {
		return lastCalDate;
	}

	public void setLastCalDate(Date lastCalDate) {
		this.lastCalDate = lastCalDate;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "EqCalDetails [id=" + id + ", eqName=" + eqName + ", srNo=" + srNo + ", cardNo=" + cardNo
				+ ", machineNo=" + machineNo + ", line=" + line + ", frequency=" + frequency + ", lastCalDate="
				+ lastCalDate + ", delStatus=" + delStatus + "]";
	}
	
}
