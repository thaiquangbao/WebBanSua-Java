package com.suabot.Convert;

import org.springframework.stereotype.Component;

import com.suabot.dto.SupplierDTO;
import com.suabot.entity.SupplierEntity;

@Component
public class SupplierConvert {
	public SupplierDTO toDto(SupplierEntity supplierEntity) {
		SupplierDTO supplier = new SupplierDTO();
		supplier.setId(supplierEntity.getId());
		supplier.setTensupplier(supplierEntity.getTenSupplier());
		supplier.setAddress(supplierEntity.getAddress());
		supplier.setPhone(supplierEntity.getPhone());
		supplier.setEmail(supplierEntity.getEmail());
		supplier.setDeleted(supplierEntity.isDeleted());
		return supplier;
		
	}
	public SupplierEntity toEntity(SupplierDTO supplierDTO) {
		SupplierEntity supplier1 = new SupplierEntity();
		supplier1.setTenSupplier(supplierDTO.getTensupplier());
		supplier1.setAddress(supplierDTO.getAddress());
		supplier1.setPhone(supplierDTO.getPhone());
		supplier1.setEmail(supplierDTO.getEmail());
		supplier1.setDeleted(supplierDTO.isDeleted());
		return supplier1;
	}
	public SupplierEntity oldToNew(SupplierEntity supplierEntity,SupplierDTO supplierDTO) {
		supplierEntity.setTenSupplier(supplierDTO.getTensupplier());
		supplierEntity.setAddress(supplierDTO.getAddress());
		supplierEntity.setPhone(supplierDTO.getPhone());
		supplierEntity.setEmail(supplierDTO.getEmail());
		supplierEntity.setDeleted(supplierDTO.isDeleted());
		return supplierEntity;
	}
}	
