package com.suabot.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.suabot.Convert.CategoryConvert;
import com.suabot.Convert.ProductConvert;
import com.suabot.dto.CategoryDTO;
import com.suabot.entity.CategoryEntity;
import com.suabot.repository.CategoryRepository;
import com.suabot.repository.ProductRepository;
import com.suabot.service.ICategoryService;
@Service
public class CategoryService implements ICategoryService{
	
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired 
	private CategoryConvert categoryConvert;
	
	
	
	@Override
	public List<CategoryDTO> findAll() {
		
		
	
		List<CategoryDTO> models = new ArrayList<>();
		List<CategoryEntity> entities = categoryRepository.findAll();
		for (CategoryEntity categoryEntity : entities) {
			if (!categoryEntity.isDeleted()) {
				CategoryDTO categoryrDTO = categoryConvert.toDto(categoryEntity);
				models.add(categoryrDTO);
			}
		}
		return models;
	}
	@Override
	@Transactional
	public CategoryDTO create(CategoryDTO categoryDTO) {
		CategoryEntity categoryEntity = categoryConvert.toEntity(categoryDTO);
		
		return categoryConvert.toDto(categoryRepository.save(categoryEntity));
	}
	@Override
	@Transactional
	public CategoryDTO update(CategoryDTO categoryDTO, Long id) {
		CategoryEntity old = categoryRepository.findOne(id);
		if (old != null) {
			categoryConvert.oldToNew(old, categoryDTO);
			CategoryEntity updateEntity = categoryRepository.save(old);
			return categoryConvert.toDto(updateEntity );
		}
		else {
			return null;
		}
		
	}
	@Override
	public boolean checkNameCate(String nameCategory) {
		
		return categoryRepository.existsByCategoryName(nameCategory);
	}
	@Override
	public CategoryDTO findByID(Long id) {
		CategoryEntity categoryEntity = categoryRepository.findOne(id);
		return categoryConvert.toDto(categoryEntity);
	}
	@Override
	@Transactional
	public CategoryDTO deleteOne(Long id) {
		CategoryEntity entity = categoryRepository.findOne(id);
		if (entity != null) {
			entity.setDeleted(true);
			categoryRepository.save(entity);
			return categoryConvert.toDto(entity);
		}
		else {
			return null;
		}
		
	}
	@Override
	public List<CategoryDTO> findAllTrash() {
		List<CategoryDTO> models = new ArrayList<>();
		List<CategoryEntity> entities = categoryRepository.findAll();
		for (CategoryEntity categoryEntity : entities) {
			if (categoryEntity.isDeleted()) {
				CategoryDTO categoryrDTO = categoryConvert.toDto(categoryEntity);
				models.add(categoryrDTO);
			}
		}
		return models;
	}
	@Override
	@Transactional
	public void deleteAll(Long[] ids) {
		for (long id: ids) {
			CategoryEntity entity = categoryRepository.findOne(id);
			entity.setDeleted(true);
			CategoryEntity upDelete = categoryRepository.save(entity);
			categoryConvert.toDto(upDelete);
		}
	}
	@Override
	public int getTotal() {
		int deletedCount = categoryRepository.countByDeleted(true);
		return deletedCount;
	}
	@Override
	@Transactional
	public void destroy(Long id) {
		categoryRepository.delete(id);
		
	}
	@Override
	@Transactional
	public void destroyAll(Long[] ids) {
		for (Long id : ids) {
			categoryRepository.delete(id);
		}
		
	}
	@Override
	@Transactional
	public void restoreOne(Long id) {
		CategoryEntity categoryEntity = categoryRepository.findOne(id);
		if (categoryEntity != null) {
			categoryEntity.setDeleted(false);
			CategoryEntity newDeleted = categoryRepository.save(categoryEntity);
			categoryConvert.toDto(newDeleted);
		}
		
	}
	@Override
	@Transactional
	public void restoreAll(Long[] ids) {
		for (Long id : ids) {
			CategoryEntity categoryEntity = categoryRepository.findOne(id);
			categoryEntity.setDeleted(false);
			CategoryEntity newDeleted = categoryRepository.save(categoryEntity);
			categoryConvert.toDto(newDeleted);
		}
		
	}

}
