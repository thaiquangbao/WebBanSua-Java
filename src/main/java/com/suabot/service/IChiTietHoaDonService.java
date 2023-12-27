package com.suabot.service;

import java.util.List;

import com.suabot.dto.ChiTietHoaDonDTO;



public interface IChiTietHoaDonService {
	List<ChiTietHoaDonDTO> findAll();
	List<ChiTietHoaDonDTO> findAllTrash();
	ChiTietHoaDonDTO create(ChiTietHoaDonDTO chiTietHoaDonDTO);
	ChiTietHoaDonDTO update(ChiTietHoaDonDTO chiTietHoaDonDTO,Long id);
	ChiTietHoaDonDTO findByID(Long id);
	ChiTietHoaDonDTO deleteOne(Long id);
	void deleteAll(Long[] ids);
	int getTotal();
	int destroy(Long id);
	void destroyAll(Long[] ids);
	void restoreOne(Long id);
	void restoreAll(Long[] ids);
	
}
