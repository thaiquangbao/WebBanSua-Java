package com.suabot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.suabot.entity.DiscountEntity;

public interface DiscountRepository extends JpaRepository<DiscountEntity, Long>{
	boolean existsByNameDiscount(String nameDiscount);
	int countByDeleted(boolean deleted);
}
