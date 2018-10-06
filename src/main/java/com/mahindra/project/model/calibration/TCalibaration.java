package com.mahindra.project.model.calibration;
 
 

public class TCalibaration {
	
	 
	int id; 
	String eqName; 
	String srNo; 
	String cardNo; 
	String machineNo; 
	String line; 
	float frequency;
	String lastCalDate; 
	String calibrationDoneDate; 
	int status; 
	int delStatus; 
	int mCalId; 
	int deptId; 
	int int1; 
	int int2;
	String fileName;
	
	
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
	 
	public int getmCalId() {
		return mCalId;
	}
	public void setmCalId(int mCalId) {
		this.mCalId = mCalId;
	}
	 
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
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
	
	public float getFrequency() {
		return frequency;
	}
	public void setFrequency(float frequency) {
		this.frequency = frequency;
	}
	
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "TCalibaration [id=" + id + ", eqName=" + eqName + ", srNo=" + srNo + ", cardNo=" + cardNo
				+ ", machineNo=" + machineNo + ", line=" + line + ", frequency=" + frequency + ", lastCalDate="
				+ lastCalDate + ", calibrationDoneDate=" + calibrationDoneDate + ", status=" + status + ", delStatus="
				+ delStatus + ", mCalId=" + mCalId + ", deptId=" + deptId + ", int1=" + int1 + ", int2=" + int2
				+ ", fileName=" + fileName + "]";
	}
	
	

}
