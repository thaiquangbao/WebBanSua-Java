package com.suabot.Convert;

import org.springframework.stereotype.Component;

import com.suabot.dto.HoaDonDTO;
import com.suabot.entity.HoaDonEntity;
import com.suabot.entity.UserEntity;

@Component
public class HoaDonConvert {
	public HoaDonDTO toDto(HoaDonEntity entity) {
		HoaDonDTO dto = new HoaDonDTO();
		dto.setId(entity.getId());
		dto.setNgayDatHang(entity.getNgayDatHang());
		dto.setTrangThai(entity.getTrangThai());
		dto.setUserName(entity.getUser().getUserName());
		dto.setTenKhachHang(entity.getUser().getFullName());
		dto.setUserID(entity.getUser().getId());
		dto.setEmail(entity.getUser().getEmail());
		dto.setPhone(entity.getUser().getPhone());
		dto.setDiaChiNhanHang(entity.getDiaChiNhanHang());
		dto.setTongTien(entity.getTongTien());
		dto.setPhuongThucThanhToan(entity.getPhuongThucThanhToan());
		dto.setTongTinTatCaSP(entity.getTongTinTatCaSP());
		dto.setPhuongThucVC(entity.getPhuongThucVC());
		dto.setPhiVanChuyen(entity.getPhivanchuyen());
		dto.setDeleted(entity.isDeleted());
		return dto;
	}
	public HoaDonEntity toEntity(HoaDonDTO dto,UserEntity userEntity) {
		HoaDonEntity entity = new HoaDonEntity();
		entity.setNgayDatHang(dto.getNgayDatHang());
		entity.setTrangThai(dto.getTrangThai());
		entity.setTongTien(dto.getTongTien());
		entity.setPhuongThucThanhToan(dto.getPhuongThucThanhToan());
		entity.setPhuongThucVC(dto.getPhuongThucVC());
		entity.setUser(userEntity);
		entity.setDiaChiNhanHang(dto.getDiaChiNhanHang());
		entity.setTongTinTatCaSP(dto.getTongTinTatCaSP());
		entity.setPhivanchuyen(dto.getPhiVanChuyen());
		entity.setDeleted(dto.isDeleted());
		return entity;
	}
	public HoaDonEntity oldtoNew(HoaDonDTO dto,HoaDonEntity entity,UserEntity userEntity) {
		
		entity.setNgayDatHang(dto.getNgayDatHang());
		entity.setTrangThai(dto.getTrangThai());
		entity.setTongTien(dto.getTongTien());
		entity.setPhuongThucThanhToan(dto.getPhuongThucThanhToan());
		entity.setPhuongThucVC(dto.getPhuongThucVC());
		entity.setUser(userEntity);
		entity.setDiaChiNhanHang(dto.getDiaChiNhanHang());
		entity.setTongTinTatCaSP(dto.getTongTinTatCaSP());
		entity.setPhivanchuyen(dto.getPhiVanChuyen());
		entity.setDeleted(dto.isDeleted());
		return entity;
	}
}
