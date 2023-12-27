package com.suabot.Convert;

import org.springframework.stereotype.Component;


import com.suabot.dto.ProductDTO;
import com.suabot.entity.CategoryEntity;
import com.suabot.entity.DiscountEntity;
import com.suabot.entity.ProductEntity;
import com.suabot.entity.SupplierEntity;

@Component
public class ProductConvert {
	public ProductDTO toDto(ProductEntity entity) {
		ProductDTO dto = new ProductDTO();
		dto.setId(entity.getId());
		dto.setTenProduct(entity.getTenProduct());
		dto.setMoTa(entity.getMoTa());
		dto.setTrongLuong(entity.getTrongLuong());
		dto.setHuongDanSuDung(entity.getHuongDanSuDung());
		dto.setDaBan(entity.getDaBan());
		dto.setSoLuong(entity.getSoLuong());
		dto.setDoTuoiSuDung(entity.getDoTuoiSuDung());
		dto.setCategoryID(entity.getCategory().getId());
		dto.setSupplierID(entity.getSupplier().getId());
		dto.setDiscountID(entity.getDiscount().getId());
		dto.setCategoryName(entity.getCategory().getCategoryName());
		dto.setDiscountName(entity.getDiscount().getNameDiscount());
		dto.setMotaDiscount(entity.getDiscount().getMoTa());
		dto.setDateStart(entity.getDiscount().getDateStart());
		dto.setDateEnd(entity.getDiscount().getDateEnd());
		dto.setSupplierName(entity.getSupplier().getTenSupplier());
		dto.setImgP(entity.getImgP());
		dto.setGia(entity.getGia());
		dto.setNoiBat(entity.isNoiBat());
		dto.setDeleted(entity.isDeleted());
		return dto;
		
	}
	public ProductDTO toDtoNoD(ProductEntity entity) {
		ProductDTO dto = new ProductDTO();
		dto.setId(entity.getId());
		dto.setTenProduct(entity.getTenProduct());
		dto.setMoTa(entity.getMoTa());
		dto.setTrongLuong(entity.getTrongLuong());
		dto.setHuongDanSuDung(entity.getHuongDanSuDung());
		dto.setDaBan(entity.getDaBan());
		dto.setSoLuong(entity.getSoLuong());
		dto.setDoTuoiSuDung(entity.getDoTuoiSuDung());
		dto.setCategoryID(entity.getCategory().getId());
		dto.setSupplierID(entity.getSupplier().getId());
		dto.setCategoryName(entity.getCategory().getCategoryName());
		dto.setDiscountName(null);
		dto.setSupplierName(entity.getSupplier().getTenSupplier());
		dto.setImgP(entity.getImgP());
		dto.setGia(entity.getGia());
		dto.setNoiBat(entity.isNoiBat());
		dto.setDeleted(entity.isDeleted());
		return dto;
		
	}
	public ProductEntity toEntity(ProductDTO dto,CategoryEntity categoryEntity,DiscountEntity discountEntity,SupplierEntity supplierEntity) {
		ProductEntity entity= new ProductEntity();
		entity.setTenProduct(dto.getTenProduct());
		entity.setMoTa(dto.getMoTa());
		entity.setTrongLuong(dto.getTrongLuong());
		entity.setHuongDanSuDung(dto.getHuongDanSuDung());
		entity.setDaBan(dto.getDaBan());
		entity.setSoLuong(dto.getSoLuong());
		entity.setCategory(categoryEntity);
		entity.setDiscount(discountEntity);
		entity.setSupplier(supplierEntity);
		entity.setImgP(dto.getImgP());
		entity.setGia(dto.getGia());
		entity.setDoTuoiSuDung(dto.getDoTuoiSuDung());
		entity.setNoiBat(dto.isNoiBat());
		entity.setDeleted(entity.isDeleted());
		return entity;
		
	}
	public ProductEntity toEntityNoDis(ProductDTO dto,CategoryEntity categoryEntity,SupplierEntity supplierEntity) {
		ProductEntity entity= new ProductEntity();
		entity.setTenProduct(dto.getTenProduct());
		entity.setMoTa(dto.getMoTa());
		entity.setTrongLuong(dto.getTrongLuong());
		entity.setHuongDanSuDung(dto.getHuongDanSuDung());
		entity.setDaBan(dto.getDaBan());
		entity.setSoLuong(dto.getSoLuong());
		entity.setCategory(categoryEntity);
		
		entity.setSupplier(supplierEntity);
		entity.setImgP(dto.getImgP());
		entity.setGia(dto.getGia());
		entity.setDoTuoiSuDung(dto.getDoTuoiSuDung());
		entity.setNoiBat(dto.isNoiBat());
		entity.setDeleted(entity.isDeleted());
		return entity;
		
	}
	public ProductEntity oldToNew(ProductEntity entity,ProductDTO dto ,CategoryEntity categoryEntity,DiscountEntity discountEntity,SupplierEntity supplierEntity)
	{
		entity.setTenProduct(dto.getTenProduct());
		entity.setMoTa(dto.getMoTa());
		entity.setTrongLuong(dto.getTrongLuong());
		entity.setHuongDanSuDung(dto.getHuongDanSuDung());
		entity.setDaBan(dto.getDaBan());
		entity.setSoLuong(dto.getSoLuong());
		entity.setCategory(categoryEntity);
		entity.setDiscount(discountEntity);
		entity.setSupplier(supplierEntity);
		entity.setImgP(dto.getImgP());
		entity.setGia(dto.getGia());
		entity.setDoTuoiSuDung(dto.getDoTuoiSuDung());
		entity.setNoiBat(dto.isNoiBat());
		entity.setDeleted(entity.isDeleted());
		return entity;
		
	}
	public ProductEntity oldToNewNoD(ProductEntity entity,ProductDTO dto ,CategoryEntity categoryEntity,SupplierEntity supplierEntity)
	{
		entity.setTenProduct(dto.getTenProduct());
		entity.setMoTa(dto.getMoTa());
		entity.setTrongLuong(dto.getTrongLuong());
		entity.setHuongDanSuDung(dto.getHuongDanSuDung());
		entity.setDaBan(dto.getDaBan());
		entity.setSoLuong(dto.getSoLuong());
		entity.setCategory(categoryEntity);
		entity.setDiscount(null);
		entity.setSupplier(supplierEntity);
		entity.setImgP(dto.getImgP());
		entity.setGia(dto.getGia());
		entity.setDoTuoiSuDung(dto.getDoTuoiSuDung());
		entity.setNoiBat(dto.isNoiBat());
		entity.setDeleted(entity.isDeleted());
		return entity;
		
	}
}
