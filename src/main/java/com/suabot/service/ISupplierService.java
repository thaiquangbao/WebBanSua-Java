package com.suabot.service;

import java.util.List;

import com.suabot.dto.SupplierDTO;


public interface ISupplierService {
	List<SupplierDTO> findAll();
	SupplierDTO findById(Long id);
	SupplierDTO create(SupplierDTO supplierDTO);
	boolean findOne(String tenSupplier);
	boolean findEmail(String email);
	void delete(Long[] ids);
	SupplierDTO updateSupplier(SupplierDTO supplierDTO,Long id);
	void deleteOne(Long id);
	SupplierDTO deleteTrash(SupplierDTO supplierDTO,Long id);
	SupplierDTO deleteTrashAll(SupplierDTO supplierDTO,Long[] ids);
	List<SupplierDTO> findAllTrash();
	SupplierDTO restoreSupplier(SupplierDTO supplierDTO,Long id);
	void restoreSupplierAll(Long[] ids);
	public int getTotal();
}
