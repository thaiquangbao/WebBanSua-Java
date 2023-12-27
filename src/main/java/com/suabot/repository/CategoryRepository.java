package com.suabot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.suabot.entity.CategoryEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long>{
	boolean existsByCategoryName(String categoryName);
	int countByDeleted(boolean deleted);
}
