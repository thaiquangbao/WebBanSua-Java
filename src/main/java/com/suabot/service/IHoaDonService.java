package com.suabot.service;

import java.util.List;

import com.suabot.dto.HoaDonDTO;

public interface IHoaDonService {
	List<HoaDonDTO> findAll();
	List<HoaDonDTO> findAllTrash();
	HoaDonDTO create(HoaDonDTO hoaDonDTO);
	HoaDonDTO update(HoaDonDTO hoaDonDTO,Long id);
	HoaDonDTO findByID(Long id);
	HoaDonDTO deleteOne(Long id);
	void deleteAll(Long[] ids);
	long getTotal();
	int destroy(Long id);
	void destroyAll(Long[] ids);
	void restoreOne(Long id);
	void restoreAll(Long[] ids);
	HoaDonDTO createhoaDon(String[] tenProducts,String userName);
	void xacNhan(Long id);
	long countNameUser();
	long countDaDuyet();
	long countChuaDuyet();
	long tongDoanhthu();
	long soSanPhamDaBan();
	long countHangTon();
}
