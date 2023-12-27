package com.suabot.service;

import java.util.List;

import com.suabot.dto.CategoryDTO;
import com.suabot.dto.ProductDTO;

public interface ICategoryService {
	List<CategoryDTO> findAll();
	List<CategoryDTO> findAllTrash();
	CategoryDTO create(CategoryDTO categoryDTO);
	CategoryDTO update(CategoryDTO categoryDTO,Long id);
	boolean checkNameCate(String nameCategory);
	CategoryDTO findByID(Long id);
	CategoryDTO deleteOne(Long id);
	void deleteAll(Long[] ids);
	int getTotal();
	void destroy(Long id);
	void destroyAll(Long[] ids);
	void restoreOne(Long id);
	void restoreAll(Long[] ids);
	
	
}
