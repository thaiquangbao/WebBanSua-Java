package com.suabot.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.suabot.Convert.DiscountConvert;
import com.suabot.dto.DiscountDTO;
import com.suabot.entity.DiscountEntity;
import com.suabot.repository.DiscountRepository;
import com.suabot.service.IDiscountService;
@Service
public class DiscountService implements IDiscountService{
	@Autowired 
	private DiscountRepository discountRepository;
	@Autowired
	private DiscountConvert discountConvert;
	
	@Override
	public List<DiscountDTO> findAll() {
		List<DiscountDTO> models = new ArrayList<>();
		List<DiscountEntity> entities = discountRepository.findAll();
		for (DiscountEntity discountEntity : entities) {
			if (!discountEntity.isDeleted()) {
				DiscountDTO discountDTO = discountConvert.toDto(discountEntity);
				models.add(discountDTO);
			}
			
		}
		return models;
	}

	@Override
	@Transactional
	public DiscountDTO create(DiscountDTO discountDTO) {
		DiscountEntity discountEntity = discountConvert.toEntity(discountDTO);
		
		return discountConvert.toDto(discountRepository.save(discountEntity));
	}

	@Override
	public DiscountDTO findByID(Long id) {
		DiscountEntity entity = discountRepository.findOne(id);
		if (entity != null) {
			return discountConvert.toDto(entity);
		}
		else {
			return null;
		}
		
	}

	@Override
	@Transactional
	public DiscountDTO update(Long id, DiscountDTO discountDTO) {
		DiscountEntity old = discountRepository.findOne(id);
		if (old != null) {
			discountConvert.oldToNew(old, discountDTO);
			DiscountEntity newDiscount = discountRepository.save(old);
			return discountConvert.toDto(newDiscount);
		}
		else {
			return null;
		}
		
	}

	@Override
	@Transactional
	public DiscountDTO deleteOne(Long id) {
		DiscountEntity findID = discountRepository.findOne(id);
		if (findID != null) {
			findID.setDeleted(true);
			DiscountEntity newDTO = discountRepository.save(findID);
			return discountConvert.toDto(newDTO);
		}
		else {
			return null;
		}
		
	}

	@Override
	@Transactional
	public void deleteAll(Long[] ids) {
		String error = null;
		for (Long id : ids) {
			DiscountEntity findID = discountRepository.findOne(id);
			if (findID != null) {
				findID.setDeleted(true);
				DiscountEntity newDTO = discountRepository.save(findID);
				discountConvert.toDto(newDTO);
			}
			else {
				error = "rỗng";
			}
		}
		
	}

	@Override
	@Transactional
	public void destroyOne(Long id) {
		String error = null;
		DiscountEntity findID = discountRepository.findOne(id);
		if (findID != null) {
			discountRepository.delete(id);
		}
		else {
			error = "Rỗng";
		}
		
	}

	@Override
	@Transactional
	public void destroyAll(Long[] ids) {
		String error = null;
		for (Long id : ids) {
			DiscountEntity findID = discountRepository.findOne(id);
			if (findID != null) {
				discountRepository.delete(id);
			}
			else {
				error = "Rỗng";
			}
		}
		
	}

	@Override
	public List<DiscountDTO> findAllTrash() {
		List<DiscountDTO> models = new ArrayList<>();
		List<DiscountEntity> entities = discountRepository.findAll();
		for (DiscountEntity discountEntity : entities) {
			if (discountEntity.isDeleted()) {
				DiscountDTO discountDTO = discountConvert.toDto(discountEntity);
				models.add(discountDTO);
			}
			
		}
		return models;
	}

	@Override
	@Transactional
	public DiscountDTO restoreOne(Long id) {
		DiscountEntity findID = discountRepository.findOne(id);
		if (findID != null) {
			findID.setDeleted(false);
			DiscountEntity newDTO = discountRepository.save(findID);
			return discountConvert.toDto(newDTO);
		}
		else {
			return null;
		}
	}

	@Override
	@Transactional
	public void restoreAll(Long[] ids) {
		String error = null;
		for (Long id : ids) {
			DiscountEntity findID = discountRepository.findOne(id);
			if (findID != null) {
				findID.setDeleted(false);
				DiscountEntity newDTO = discountRepository.save(findID);
				discountConvert.toDto(newDTO);
			}
			else {
				error = "rỗng";
			}
		}
		
	}

	@Override
	public boolean checkName(String nameDiscount) {
		boolean check = discountRepository.existsByNameDiscount(nameDiscount);
		if (check) {
			return true;
		}
		else {
			return false;
		}
		
	}

	@Override
	public int getTotal() {
		int deletedCount = discountRepository.countByDeleted(true);
		
		return deletedCount;
	}
	
}
