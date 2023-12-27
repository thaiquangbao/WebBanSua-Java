package com.suabot.Convert;

import org.springframework.stereotype.Component;

import com.suabot.dto.CategoryDTO;
import com.suabot.entity.CategoryEntity;

@Component
public class CategoryConvert {
	public CategoryDTO toDto(CategoryEntity categoryEntity) {
		CategoryDTO categoryDTO = new CategoryDTO();
		categoryDTO.setId(categoryEntity.getId());
		categoryDTO.setCategoryName(categoryEntity.getCategoryName());
		categoryDTO.setAnhBanner(categoryEntity.getAnhBanner());
		categoryDTO.setDeleted(categoryEntity.isDeleted());
		return categoryDTO ;
		
	}
	public CategoryEntity toEntity(CategoryDTO categoryDTO) {
		CategoryEntity categoryEntity = new CategoryEntity();
		categoryEntity.setCategoryName(categoryDTO.getCategoryName());
		categoryEntity.setAnhBanner(categoryDTO.getAnhBanner());
		categoryEntity.setDeleted(categoryDTO.isDeleted());
		return categoryEntity;
		
	}
	public CategoryEntity oldToNew(CategoryEntity categoryEntity,CategoryDTO categoryDTO) {
		categoryEntity.setCategoryName(categoryDTO.getCategoryName());
		categoryEntity.setAnhBanner(categoryDTO.getAnhBanner());
		categoryEntity.setDeleted(categoryDTO.isDeleted());
		return categoryEntity;
	}
}
