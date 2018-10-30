package com.mahindra.project.model.cbm;
 
public class CbmMagazineChain {
	 
	private int cmcId; 
	private String machineNo; 
	private String machineName; 
	private String requiredValue; 
	private String actualValue1; 
	private String remark1; 
	private String date1; 
	private String actualValue2; 
	private String remark2; 
	private String date2; 
	private int status;  
	private String yearEnd; 
	private int deptId; 
	private int schId; 
	private int extra1; 
	private int extra2; 
	private String varchar1; 
	private String varchar2;
	public int getCmcId() {
		return cmcId;
	}
	public void setCmcId(int cmcId) {
		this.cmcId = cmcId;
	}
	public String getMachineNo() {
		return machineNo;
	}
	public void setMachineNo(String machineNo) {
		this.machineNo = machineNo;
	}
	public String getMachineName() {
		return machineName;
	}
	public void setMachineName(String machineName) {
		this.machineName = machineName;
	}
	public String getRequiredValue() {
		return requiredValue;
	}
	public void setRequiredValue(String requiredValue) {
		this.requiredValue = requiredValue;
	}
	public String getActualValue1() {
		return actualValue1;
	}
	public void setActualValue1(String actualValue1) {
		this.actualValue1 = actualValue1;
	}
	public String getRemark1() {
		return remark1;
	}
	public void setRemark1(String remark1) {
		this.remark1 = remark1;
	}
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public String getActualValue2() {
		return actualValue2;
	}
	public void setActualValue2(String actualValue2) {
		this.actualValue2 = actualValue2;
	}
	public String getRemark2() {
		return remark2;
	}
	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}
	public String getDate2() {
		return date2;
	}
	public void setDate2(String date2) {
		this.date2 = date2;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getYearEnd() {
		return yearEnd;
	}
	public void setYearEnd(String yearEnd) {
		this.yearEnd = yearEnd;
	}
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	public int getSchId() {
		return schId;
	}
	public void setSchId(int schId) {
		this.schId = schId;
	}
	public int getExtra1() {
		return extra1;
	}
	public void setExtra1(int extra1) {
		this.extra1 = extra1;
	}
	public int getExtra2() {
		return extra2;
	}
	public void setExtra2(int extra2) {
		this.extra2 = extra2;
	}
	public String getVarchar1() {
		return varchar1;
	}
	public void setVarchar1(String varchar1) {
		this.varchar1 = varchar1;
	}
	public String getVarchar2() {
		return varchar2;
	}
	public void setVarchar2(String varchar2) {
		this.varchar2 = varchar2;
	}
	@Override
	public String toString() {
		return "CbmMagazineChain [cmcId=" + cmcId + ", machineNo=" + machineNo + ", machineName=" + machineName
				+ ", requiredValue=" + requiredValue + ", actualValue1=" + actualValue1 + ", remark1=" + remark1
				+ ", date1=" + date1 + ", actualValue2=" + actualValue2 + ", remark2=" + remark2 + ", date2=" + date2
				+ ", status=" + status + ", yearEnd=" + yearEnd + ", deptId=" + deptId + ", schId=" + schId
				+ ", extra1=" + extra1 + ", extra2=" + extra2 + ", varchar1=" + varchar1 + ", varchar2=" + varchar2
				+ "]";
	}
	
	

}
