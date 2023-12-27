package com.suabot.dto;

import java.util.Date;



public class DiscountDTO extends AbstractDTO<DiscountDTO>{
	
	private String nameDiscount;
	private String moTa;
	private Date dateStart;
	private Date dateEnd;
	public String getNameDiscount() {
		return nameDiscount;
	}
	public void setNameDiscount(String nameDiscount) {
		this.nameDiscount = nameDiscount;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public Date getDateStart() {
		return dateStart;
	}
	public void setDateStart(Date dateStart) {
		this.dateStart = dateStart;
	}
	public Date getDateEnd() {
		return dateEnd;
	}
	public void setDateEnd(Date dateEnd) {
		this.dateEnd = dateEnd;
	}
	
	public DiscountDTO() {
		
	}
	
}
