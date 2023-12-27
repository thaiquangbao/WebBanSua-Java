package com.suabot.service;

import java.util.List;

import com.suabot.dto.DiscountDTO;

public interface IDiscountService {
	List<DiscountDTO> findAll();
	List<DiscountDTO> findAllTrash();
	DiscountDTO findByID(Long id);
	DiscountDTO create(DiscountDTO discountDTO);
	DiscountDTO update(Long id, DiscountDTO discountDTO);
	DiscountDTO deleteOne(Long id);
	void deleteAll(Long[] ids);
	void destroyOne(Long id);
	void destroyAll(Long[] ids);
	DiscountDTO restoreOne(Long id);
	void restoreAll(Long[] ids);
	boolean checkName(String nameDiscount);
	int getTotal();
}
