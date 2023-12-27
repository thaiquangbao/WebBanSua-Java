package com.suabot.service.impl;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.suabot.Convert.SupplierConvert;
import com.suabot.dto.SupplierDTO;
import com.suabot.entity.SupplierEntity;
import com.suabot.repository.SupplierRepository;
import com.suabot.service.ISupplierService;

@Service
public class SupplierService implements ISupplierService{
	
	
	@Autowired
	private SupplierRepository supplier;
	
	@Autowired
	private SupplierConvert supplierConvert;
	
	@Override
	public List<SupplierDTO> findAll() {
		List<SupplierDTO> models = new ArrayList<>();
		List<SupplierEntity> entities = supplier.findAll();
		
		for (SupplierEntity items : entities) {
			if (!items.isDeleted()) {
				SupplierDTO supplierDTO = supplierConvert.toDto(items);
				models.add(supplierDTO);
			}
		}
		
		return models;
	}
	@Override
	public SupplierDTO findById(Long id) {
		SupplierEntity supplierEntity = supplier.findOne(id);
		return supplierConvert.toDto(supplierEntity);
	}
	@Override
	@Transactional
	public SupplierDTO create(SupplierDTO supplierDTO) {
		SupplierEntity supplierEntity = supplierConvert.toEntity(supplierDTO);
		
		return supplierConvert.toDto(supplier.save(supplierEntity));
	}
	@Override
	public boolean findOne(String tenSupplier) {
		return supplier.existsByTenSupplier(tenSupplier);
	}
	
	@Override
	@Transactional
	public void delete(Long[] ids) {
		for (long id: ids) {
			supplier.delete(id);
		}
	}
	@Override
	public boolean findEmail(String email) {
		return supplier.existsByEmail(email);
		
	}
	@Override
	@Transactional
	public SupplierDTO updateSupplier(SupplierDTO supplierDTO,Long id) {
		SupplierEntity old = supplier.findOne(id);
		if (old != null) {
	        // Sử dụng đối tượng đã tồn tại để cập nhật dữ liệu
	        supplierConvert.oldToNew(old, supplierDTO);
	        SupplierEntity updatedSupplierEntity = supplier.save(old);
	        
	        return supplierConvert.toDto(updatedSupplierEntity);
	    } else {
	        
	        return null;
	    }
	}
	@Override
	@Transactional
	public void deleteOne(Long id) {
		supplier.delete(id);
		
	}
	@Override
	@Transactional
	public SupplierDTO deleteTrash(SupplierDTO supplierDTO, Long id) {
		SupplierEntity old = supplier.findOne(id);
		if (old != null) {
			old.setDeleted(supplierDTO.isDeleted());
			SupplierEntity supplierEntity = supplier.save(old);
			supplierDTO.setDeleted(supplierEntity.isDeleted());
		}
		else {
			return null;
		}
		
		return supplierDTO;
	}
	@Override
	public List<SupplierDTO> findAllTrash() {
		List<SupplierDTO> models = new ArrayList<>();
		List<SupplierEntity> entities = supplier.findAll();
		
		for (SupplierEntity items : entities) {
			if (items.isDeleted()) {
				SupplierDTO supplierDTO = supplierConvert.toDto(items);
				models.add(supplierDTO);
			}
		}
		
		return models;
	}
	@Override
	@Transactional
	public SupplierDTO deleteTrashAll(SupplierDTO supplierDTO, Long[] ids) {
		for (long id: ids) {
			SupplierEntity old = supplier.findOne(id);
			old.setDeleted(supplierDTO.isDeleted());
			SupplierEntity supplierEntity = supplier.save(old);
			supplierDTO.setDeleted(supplierEntity.isDeleted());
		}
		return  supplierDTO;
	}
	@Override
	@Transactional
	public SupplierDTO restoreSupplier(SupplierDTO supplierDTO, Long id) {
		
		SupplierEntity old = supplier.findOne(id);
		if (old != null) {
			old.setDeleted(supplierDTO.isDeleted());
			SupplierEntity supplierEntity = supplier.save(old);
			supplierDTO.setDeleted(supplierEntity.isDeleted());
		}
		else {
			return null;
		}
		
		return supplierDTO;
	}
	@Override
	@Transactional
	public void restoreSupplierAll(Long[] ids) {
		for (long id: ids) {
			SupplierEntity old = supplier.findOne(id);
			if (old != null) {
				old.setDeleted(false);
				SupplierEntity update = supplier.save(old);
			 	SupplierDTO supplierDTO = new SupplierDTO();
			 	supplierDTO.setDeleted(update.isDeleted());
			}
			else {
				return;
			}
			
		}
		
		
	}
	@Override
	public int getTotal() {
		 int deletedCount = supplier.countByDeleted(true);
		  return deletedCount;
	}

	
	
	
}
