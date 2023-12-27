package com.suabot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.suabot.entity.ProductEntity;


public interface ProductRepository extends JpaRepository<ProductEntity, Long>{
	boolean existsByTenProduct(String tenProduct);
	int countByDeleted(boolean deleted);
	ProductEntity findOneByTenProduct(String tenProduct);
	List<ProductEntity> findOneByCategory_Id(long cateId);
	List<ProductEntity> findOneByDiscount_Id(long discountId);
	List<ProductEntity> findOneBySupplier_Id(long suppliId);

}
