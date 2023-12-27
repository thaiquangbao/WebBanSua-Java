package com.suabot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.suabot.entity.ChiTietHoaDonEntity;

public interface ChiTietHoaDonRepository extends JpaRepository<ChiTietHoaDonEntity, Long>{
	int countByDeleted(boolean deleted);
	List<ChiTietHoaDonEntity> findOneByHoaDon_Id(long hoaDonId);
	List<ChiTietHoaDonEntity> findOneByProduct_Id(long productId);
}
