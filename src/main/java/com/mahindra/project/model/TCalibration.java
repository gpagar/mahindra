package com.mahindra.project.model;

public class TCalibration{

	private int id;
	
	private int mCalId;
	
	private String eqName;
	
	private String srNo;
	
	private String cardNo;
	
	private String machineNo;
	
	private String line;
	
	private int frequency;
	
	private String lastCalDate;
	
	private String calibrationDoneDate;
	
	private int status;
	
	private int delStatus;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getmCalId() {
		return mCalId;
	}

	public void setmCalId(int mCalId) {
		this.mCalId = mCalId;
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

	public String getCalibrationDoneDate() {
		return calibrationDoneDate;
	}

	public void setCalibrationDoneDate(String calibrationDoneDate) {
		this.calibrationDoneDate = calibrationDoneDate;
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
		return "TCalibration [id=" + id + ", mCalId=" + mCalId + ", eqName=" + eqName + ", srNo=" + srNo + ", cardNo="
				+ cardNo + ", machineNo=" + machineNo + ", line=" + line + ", frequency=" + frequency + ", lastCalDate="
				+ lastCalDate + ", calibrationDoneDate=" + calibrationDoneDate + ", status=" + status + ", delStatus="
				+ delStatus + "]";
	}

	
}
