package com.suabot.Convert;

import org.springframework.stereotype.Component;

import com.suabot.dto.ChiTietHoaDonDTO;
import com.suabot.entity.ChiTietHoaDonEntity;
import com.suabot.entity.HoaDonEntity;
import com.suabot.entity.ProductEntity;

@Component
public class ChiTietHoaDonConvert {
	public ChiTietHoaDonDTO toDto(ChiTietHoaDonEntity chiTietHoaDonEntity) {
		ChiTietHoaDonDTO dto = new ChiTietHoaDonDTO();
		dto.setId(chiTietHoaDonEntity.getId());
		dto.setSoLuong(chiTietHoaDonEntity.getSoLuong());
		dto.setDonGiaBan(chiTietHoaDonEntity.getProduct().getGia());
		dto.setProductID(chiTietHoaDonEntity.getProduct().getId());
		dto.setProductName(chiTietHoaDonEntity.getProduct().getTenProduct());
		dto.setImgP(chiTietHoaDonEntity.getProduct().getImgP());
		dto.setHoaDonID(chiTietHoaDonEntity.getHoaDon().getId());
		dto.setTongTienTungHang(chiTietHoaDonEntity.getTongTienTungHang());
			
		dto.setDeleted(chiTietHoaDonEntity.isDeleted());
		return dto;
		
	}
	public ChiTietHoaDonEntity toEntity(ChiTietHoaDonDTO dto,ProductEntity productEntity,HoaDonEntity hoaDonEntity) {
		ChiTietHoaDonEntity entity = new ChiTietHoaDonEntity();
		entity.setTongTienTungHang(dto.getTongTienTungHang());
		entity.setSoLuong(dto.getSoLuong());
		entity.setProduct(productEntity);	
		entity.setHoaDon(hoaDonEntity);
		entity.setDeleted(dto.isDeleted());
		return entity;
		
	}
	public ChiTietHoaDonEntity oldToNew(ChiTietHoaDonEntity entity,ChiTietHoaDonDTO dto,HoaDonEntity hoaDonEntity,ProductEntity productEntity) {
		entity.setTongTienTungHang(dto.getTongTienTungHang());
		entity.setSoLuong(dto.getSoLuong());
		entity.setProduct(productEntity);	
		entity.setHoaDon(hoaDonEntity);
		entity.setDeleted(dto.isDeleted());
		return entity;
	}
	
}
