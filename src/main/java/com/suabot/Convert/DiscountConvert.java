package com.suabot.Convert;

import org.springframework.stereotype.Component;

import com.suabot.dto.DiscountDTO;
import com.suabot.entity.DiscountEntity;

@Component
public class DiscountConvert {
	public DiscountDTO toDto(DiscountEntity discountEntity) {
		DiscountDTO discountDTO = new DiscountDTO();
		discountDTO.setId(discountEntity.getId());
		discountDTO.setNameDiscount(discountEntity.getNameDiscount());
		discountDTO.setMoTa(discountEntity.getMoTa());
		discountDTO.setDateStart(discountEntity.getDateStart());
		discountDTO.setDateEnd(discountEntity.getDateEnd());
		return discountDTO;
		
	}
	public DiscountEntity toEntity(DiscountDTO discountDTO) {
		DiscountEntity discountEntity = new DiscountEntity();
		discountEntity.setNameDiscount(discountDTO.getNameDiscount());
		discountEntity.setMoTa(discountDTO.getMoTa());
		discountEntity.setDateStart(discountDTO.getDateStart());
		discountEntity.setDateEnd(discountDTO.getDateEnd());
		return discountEntity ;
	}
	public DiscountEntity oldToNew(DiscountEntity discountEntity,DiscountDTO discountDTO) {
		discountEntity.setNameDiscount(discountDTO.getNameDiscount());
		discountEntity.setMoTa(discountDTO.getMoTa());
		discountEntity.setDateStart(discountDTO.getDateStart());
		discountEntity.setDateEnd(discountDTO.getDateEnd());
		return discountEntity;
		
	}
}
