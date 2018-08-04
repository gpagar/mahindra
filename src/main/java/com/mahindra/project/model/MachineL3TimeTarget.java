package com.mahindra.project.model;

import java.io.Serializable;

public class MachineL3TimeTarget implements Serializable{

	private int id;
	
	private float year1lTtarget;
	
	private float year2lTtarget;
	
	private float year3lTtarget;
	
	private float year4lTtarget;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getYear1lTtarget() {
		return year1lTtarget;
	}

	public void setYear1lTtarget(float year1lTtarget) {
		this.year1lTtarget = year1lTtarget;
	}

	public float getYear2lTtarget() {
		return year2lTtarget;
	}

	public void setYear2lTtarget(float year2lTtarget) {
		this.year2lTtarget = year2lTtarget;
	}

	public float getYear3lTtarget() {
		return year3lTtarget;
	}

	public void setYear3lTtarget(float year3lTtarget) {
		this.year3lTtarget = year3lTtarget;
	}

	public float getYear4lTtarget() {
		return year4lTtarget;
	}

	public void setYear4lTtarget(float year4lTtarget) {
		this.year4lTtarget = year4lTtarget;
	}

	@Override
	public String toString() {
		return "MachineL3TimeTarget [id=" + id + ", year1lTtarget=" + year1lTtarget + ", year2lTtarget=" + year2lTtarget
				+ ", year3lTtarget=" + year3lTtarget + ", year4lTtarget=" + year4lTtarget + "]";
	}
	
	
}
