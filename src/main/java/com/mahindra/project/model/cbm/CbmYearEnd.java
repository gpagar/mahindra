package com.mahindra.project.model.cbm;
 

public class CbmYearEnd {
	
 
	private int yearEndId; 
	private String year;   
	private String date; 
	private int status; 
	private String fromYear; 
	private String toYear; 
	private int userId; 
	private int cbmType; 
	private int deptId;
	 
	public int getYearEndId() {
		return yearEndId;
	}
	public void setYearEndId(int yearEndId) {
		this.yearEndId = yearEndId;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getFromYear() {
		return fromYear;
	}
	public void setFromYear(String fromYear) {
		this.fromYear = fromYear;
	}
	public String getToYear() {
		return toYear;
	}
	public void setToYear(String toYear) {
		this.toYear = toYear;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getCbmType() {
		return cbmType;
	}
	public void setCbmType(int cbmType) {
		this.cbmType = cbmType;
	}
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	@Override
	public String toString() {
		return "CbmYearEnd [yearEndId=" + yearEndId + ", year=" + year + ", date=" + date + ", status=" + status
				+ ", fromYear=" + fromYear + ", toYear=" + toYear + ", userId=" + userId + ", cbmType=" + cbmType
				+ ", deptId=" + deptId + "]";
	}
	
	

}
