package com.suabot.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name = "discount")
public class DiscountEntity extends BaseEntity{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "discount_id")
	private long id;
	@Column(name = "name")
	private String nameDiscount;
	@Column(name = "mota")
	private String moTa;
	@Column(name = "datestart")
	private Date dateStart;
	@Column(name = "dateend")
	private Date dateEnd;
	@OneToMany(mappedBy = "discount")
	private List<ProductEntity> suppliers = new ArrayList<>();
	
	public List<ProductEntity> getSuppliers() {
		return suppliers;
	}
	public void setSuppliers(List<ProductEntity> suppliers) {
		this.suppliers = suppliers;
	}
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
	public long getId() {
		return id;
	}
	public DiscountEntity() {
		
	}
	
	
}
