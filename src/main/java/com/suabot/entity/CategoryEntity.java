package com.suabot.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class CategoryEntity extends BaseEntity{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "category_id")
	private Long id;
	
	@Column(name = "category_name")
	private String categoryName;
	@Column(name = "img" ,columnDefinition = "TEXT")
	private String anhBanner;
	@OneToMany(mappedBy = "category")
	private List<ProductEntity> produts = new ArrayList<>();
	
	
	
	
	public List<ProductEntity> getProduts() {
		return produts;
	}
	public void setProduts(List<ProductEntity> produts) {
		this.produts = produts;
	}
	public String getAnhBanner() {
		return anhBanner;
	}
	public void setAnhBanner(String anhBanner) {
		this.anhBanner = anhBanner;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Long getId() {
		return id;
	}
	public CategoryEntity() {
		
	}
	
}
