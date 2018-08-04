package com.mahindra.project.model;



public class DailySearchedTarget{

	
	private int id;
	
	private float yearL3target;
	
	private float yearL5target;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getYearL3target() {
		return yearL3target;
	}

	public void setYearL3target(float yearL3target) {
		this.yearL3target = yearL3target;
	}

	public float getYearL5target() {
		return yearL5target;
	}

	public void setYearL5target(float yearL5target) {
		this.yearL5target = yearL5target;
	}

	@Override
	public String toString() {
		return "DailySearchedTarget [id=" + id + ", yearL3target=" + yearL3target + ", yearL5target=" + yearL5target
				+ "]";
	}

    
}
