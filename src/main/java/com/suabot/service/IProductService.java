package com.suabot.service;

import java.util.List;

import com.suabot.dto.ProductDTO;

public interface IProductService {
	List<ProductDTO>findAllSPKM();
	List<ProductDTO> findAll();
	List<ProductDTO>findAllTrash();
	ProductDTO create(ProductDTO productDTO);
	ProductDTO findOne(Long id);
	ProductDTO update(Long id, ProductDTO productDTO);
	ProductDTO findNameProduct(String tenProduct);
	ProductDTO deleteOne(Long id);
	void deleteAll(Long[] ids);
	ProductDTO restoreOne(Long id);
	void restoreAll(Long[] ids);
	void destroyOne(Long id);
	void destroyAll(Long[] ids);
	boolean checkName(String nameProduct);
	int getTotal();
	List<ProductDTO> findAllSPNB();
	int updateSoLuong(String nameProduct, int soLuong);
	boolean regexDestroyHD(long id);
	boolean regexDestroyLSP(long id);
	boolean regexDestroyDiscount(long id);
	boolean regexDestroySupplier(long id);
}
