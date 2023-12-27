package com.suabot.service.impl;

import java.util.ArrayList;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suabot.Convert.ProductConvert;

import com.suabot.dto.ProductDTO;
import com.suabot.entity.CategoryEntity;
import com.suabot.entity.ChiTietHoaDonEntity;
import com.suabot.entity.DiscountEntity;
import com.suabot.entity.ProductEntity;
import com.suabot.entity.SupplierEntity;
import com.suabot.repository.CategoryRepository;
import com.suabot.repository.ChiTietHoaDonRepository;
import com.suabot.repository.DiscountRepository;
import com.suabot.repository.ProductRepository;
import com.suabot.repository.SupplierRepository;
import com.suabot.service.IProductService;

@Service
public class ProductService implements IProductService{
	@Autowired
	private ProductRepository productRepository;
	@Autowired 
	private ProductConvert convert;
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private DiscountRepository discountRepository;
	@Autowired
	private SupplierRepository supplierRepository;
	@Autowired 
	private ChiTietHoaDonRepository chiTietHoaDonRepository;
	@Override
	public List<ProductDTO> findAll() {
		List<ProductDTO> dtos = new ArrayList<>();
		List<ProductEntity> entities = productRepository.findAll();
			for (ProductEntity productEntity : entities) {
				if (!productEntity.isDeleted()) {
					if (productEntity.getDiscount() == null) {
						ProductDTO dto1 = convert.toDtoNoD(productEntity);
						dtos.add(dto1);
					}
					else {
						ProductDTO dto2 = convert.toDto(productEntity);
						dtos.add(dto2);
					}
					
				}
				
				
			}
		
		return dtos;
	}
	@Override
	@Transactional
	public ProductDTO create(ProductDTO productDTO) {
		CategoryEntity categoryentity = categoryRepository.findOne(productDTO.getCategoryID());
		 long checkDiscount = productDTO.getDiscountID();
		 SupplierEntity supplierEntity = supplierRepository.findOne(productDTO.getSupplierID());
			String banChay = productDTO.getBanChay();
			
			if (banChay.equals("Có") ) {
				productDTO.setNoiBat(true);
			}
			else if (banChay.equals("Không") ){
				productDTO.setNoiBat(false);
			}
			ProductDTO converDto = null;
		if (checkDiscount == 0) {
			ProductEntity productEntity = convert.toEntityNoDis(productDTO,categoryentity,supplierEntity);
			ProductEntity add = productRepository.save(productEntity);
			converDto = convert.toDtoNoD(add);
		}
		else if (checkDiscount > 0) {
			 DiscountEntity discountEntity = discountRepository.findOne(productDTO.getDiscountID());
			 ProductEntity productEntity = convert.toEntity(productDTO,categoryentity,discountEntity,supplierEntity);
			 ProductEntity add = productRepository.save(productEntity);
			 converDto = convert.toDto(add);
		}
		return converDto;
		
	}
	@Override
	public ProductDTO findOne(Long id) {
		ProductEntity product = productRepository.findOne(id);
		ProductDTO convered = null;
		if (product.getDiscount() == null) {
			convered = convert.toDtoNoD(product);
			
		}
		else {
			convered = convert.toDto(product);
			
		}
		return convered;
	}
	@Override
	@Transactional
	public ProductDTO update(Long id, ProductDTO productDTO) {
		ProductEntity old = productRepository.findOne(id);
		if (old != null) {
			CategoryEntity categoryentity = categoryRepository.findOne(productDTO.getCategoryID());
			
			SupplierEntity supplierEntity = supplierRepository.findOne(productDTO.getSupplierID());
			String banChay = productDTO.getBanChay();
			if (banChay.equals("Có") ) {
				productDTO.setNoiBat(true);
			}
			else if (banChay.equals("Không") ){
				productDTO.setNoiBat(false);
			}
			long checkDiscount = productDTO.getDiscountID();
			ProductDTO converDto = null;
			if (checkDiscount == 0) {
				convert.oldToNewNoD(old, productDTO,categoryentity,supplierEntity);
				ProductEntity update1 = productRepository.save(old);
				converDto = convert.toDtoNoD(update1);
			}
			else if (checkDiscount > 0) {
				DiscountEntity discountEntity = discountRepository.findOne(productDTO.getDiscountID());
				 convert.oldToNew(old, productDTO,categoryentity,discountEntity,supplierEntity);
				 ProductEntity update2 = productRepository.save(old);
				 converDto = convert.toDto(update2);
				
			}
			
			
			return converDto;
		}
		else {
			return null;
		}
		
	}
	@Override
	@Transactional
	public ProductDTO deleteOne(Long id) {
		ProductEntity entity = productRepository.findOne(id);
		if (entity != null) {
			entity.setDeleted(true);
			if (entity.getDiscount() == null) {
				return convert.toDtoNoD(productRepository.save(entity));
			}
			else {
				return convert.toDto(productRepository.save(entity));
			}
			
			
		}
		else {
			return null;
		}
		
		
		
	}
	@Override
	@Transactional
	public void deleteAll(Long[] ids) {
		for (Long id : ids) {
			ProductEntity entity = productRepository.findOne(id);
			entity.setDeleted(true);
			if (entity.getDiscount() == null) {
				convert.toDtoNoD(productRepository.save(entity));
			}
			else {
				convert.toDto(productRepository.save(entity));
			}
			
			
		}
		
	}
	@Override
	public List<ProductDTO> findAllTrash() {
		List<ProductDTO> dtos = new ArrayList<>();
		List<ProductEntity> entities = productRepository.findAll();
			for (ProductEntity productEntity : entities) {
				if (productEntity.isDeleted()) {
					if (productEntity.getDiscount() == null) {
						ProductDTO dto = convert.toDtoNoD(productEntity);
						dtos.add(dto);
					}
					else {
						ProductDTO dto1 = convert.toDto(productEntity);
						dtos.add(dto1);
					}
					
				}
				
				
			}
		
		return dtos;
		
	}
	@Override
	@Transactional
	public ProductDTO restoreOne(Long id) {
		ProductEntity entity = productRepository.findOne(id);
		if (entity != null) {
			entity.setDeleted(false);
			if (entity.getDiscount() == null) {
				return convert.toDtoNoD(productRepository.save(entity));
			}
			else {
				return convert.toDto(productRepository.save(entity));
			}
			
		}
		else {
			return null;
		}
		
	}
	@Override
	@Transactional
	public void restoreAll(Long[] ids) {
		for (Long id : ids) {
			ProductEntity entity = productRepository.findOne(id);
			entity.setDeleted(false);
			if (entity.getDiscount() == null) {
				convert.toDtoNoD(productRepository.save(entity));
			}
			else {
				convert.toDto(productRepository.save(entity));
			}
			
		}
		
	}
	@Override
	@Transactional
	public void destroyOne(Long id) {
		ProductEntity entity = productRepository.findOne(id);
		if (entity!=  null) {
			productRepository.delete(id);
		}
		else {
			System.out.println("Không tìm thấy sản phẩm");
		}
		
	}
	@Override
	@Transactional
	public void destroyAll(Long[] ids) {
		for (Long id : ids) {
			ProductEntity entity = productRepository.findOne(id);
			if (entity != null) {
				productRepository.delete(id);
			}
			else {
				System.out.println("Không tìm thấy sản phẩm" + entity);
			}
		}
		
	}
	@Override
	public boolean checkName(String nameProduct) {
		boolean findName = productRepository.existsByTenProduct(nameProduct);
		return findName;
		
		
	}
	@Override
	public int getTotal() {
		int deletedCount = productRepository.countByDeleted(true);
		
		return deletedCount;
		
	}
	@Override
	public ProductDTO findNameProduct(String tenProduct) {
		ProductEntity entity = productRepository.findOneByTenProduct(tenProduct);
		ProductDTO convered = null;
		if (entity.getDiscount() == null) {
			convered = convert.toDtoNoD(entity);
			
		}
		else {
			convered = convert.toDto(entity);
			
		}
		return convered;
	}
	@Override
	public List<ProductDTO> findAllSPNB() {
		List<ProductDTO> dtos = new ArrayList<>();
		List<ProductEntity> entities = productRepository.findAll();
			for (ProductEntity productEntity : entities) {
				if (!productEntity.isDeleted()) {
					if (productEntity.isNoiBat()) {
						ProductDTO dto = convert.toDtoNoD(productEntity);
							dtos.add(dto);
					}
					
				}
				
				
			}
		
		return dtos;
	}
	@Override
	public List<ProductDTO> findAllSPKM() {
		List<ProductDTO> dtos = new ArrayList<>();
		List<ProductEntity> entities = productRepository.findAll();
			for (ProductEntity productEntity : entities) {
				if (!productEntity.isDeleted()) {
					if (productEntity.getDiscount() != null) {
						ProductDTO dto = convert.toDto(productEntity);
							dtos.add(dto);
					}
					
				}
				
				
			}
		return dtos;
	}
	@Override
	@Transactional
	public int updateSoLuong(String nameProduct, int soLuong) {
		ProductEntity entity = productRepository.findOneByTenProduct(nameProduct);
		if (entity.getSoLuong() > 0) {
			int updateSL = entity.getSoLuong() - soLuong;
			int updateDaBan = entity.getDaBan() + soLuong;
			entity.setSoLuong(updateSL);
			entity.setDaBan(updateDaBan);
			
			productRepository.save(entity);
			return 200;
		}
		else {
			return 500;
		}
		
	}
	@Override
	@Transactional
	public boolean regexDestroyHD(long id) {
		List<ChiTietHoaDonEntity>chiTiet  = chiTietHoaDonRepository.findOneByProduct_Id(id);
			if (chiTiet.size() > 0) {
				return false;
			}
			else {
				return true;
			}
			
		
			
			
	}
	@Override
	@Transactional
	public boolean regexDestroyLSP(long id) {
		List<ProductEntity> lsp = productRepository.findOneByCategory_Id(id);
		if (lsp.size() > 0) {
			return false;
		}
		else {
			return true;
		}
		
	}
	@Override
	public boolean regexDestroyDiscount(long id) {
		List<ProductEntity> discount = productRepository.findOneByDiscount_Id(id);
		if (discount.size() > 0) {
			return false;
		}
		else {
			return true;
		}
		
	}
	@Override
	public boolean regexDestroySupplier(long id) {
		List<ProductEntity> supplier = productRepository.findOneBySupplier_Id(id);
		if (supplier.size() > 0) {
			return false;
		}
		else {
			return true;
		}
		
	}

}
