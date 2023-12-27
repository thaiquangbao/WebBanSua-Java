package com.suabot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.suabot.entity.SupplierEntity;



public interface SupplierRepository extends JpaRepository<SupplierEntity, Long>{
	boolean existsByTenSupplier(String tenSupplier);
	boolean existsByEmail(String email);
	int countByDeleted(boolean deleted);
}
