package com.suabot.dto;

public class CategoryDTO extends AbstractDTO<CategoryDTO>{
	private String categoryName;
	private String anhBanner;
	
	

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

	public CategoryDTO() {
		
	}
	
}
