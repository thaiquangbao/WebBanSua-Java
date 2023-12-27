package com.suabot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


import com.suabot.entity.HoaDonEntity;

public interface HoaDonRepository extends JpaRepository<HoaDonEntity, Long>{
	int countByDeleted(boolean deleted);
	List<HoaDonEntity> findOneByUser_Id(long userId);
	long countByTrangThai(String trangThai);
}
