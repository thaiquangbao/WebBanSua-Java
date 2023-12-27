package com.suabot.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.suabot.dto.ProductDTO;
import com.suabot.service.IProductService;

@RestController(value = "productAPI")
public class ProductAPI {
	@Autowired
	private IProductService productService;
	
	@PostMapping(value = "/admin/sanpham/formAddSanPham/create")
	public ProductDTO createProduct(@RequestBody ProductDTO productDTO) {
		if (productService.checkName(productDTO.getTenProduct())){
			ProductDTO mess = new ProductDTO();
			mess.setErrorMessage(1);
			return mess;
		}
		else {
			ProductDTO createProduct = productService.create(productDTO);
			return createProduct;
		}
		
		
	}
	@PutMapping(value = "/admin/sanpham/formUpdateSanPham/{id}/update")
		public ProductDTO updateProduct(@RequestBody ProductDTO productDTO,@PathVariable Long id) {
			ProductDTO update = productService.update(id, productDTO);
			return update;
	}
	@PatchMapping(value = "/admin/sanpham/deleteSanPham/{id}")
	public ProductDTO deleteProduct(@PathVariable Long id) {
		return productService.deleteOne(id);
	}
	@PatchMapping(value = "/admin/sanpham/deleteAllSanPham")
	public void deleteAllProduct(@RequestBody Long[] ids) {
		productService.deleteAll(ids);
	}
	@PatchMapping(value = "/admin/sanpham/trash/restoreSanPham/{id}")
	public ProductDTO restoreProduct(@PathVariable Long id) {
		ProductDTO restore = productService.restoreOne(id);
		return restore;
	}
	@PatchMapping(value = "/admin/sanpham/trash/restoreAllSanPham")
	public void restoreAllProduct(@RequestBody Long[] ids) {
		productService.restoreAll(ids);
	}
	@DeleteMapping(value = "/admin/sanpham/trash/destroySanPham/{id}")
	public int destroyProduct(@PathVariable Long id) {
		
		int mess = 0;
		if (productService.regexDestroyHD(id)== true) {
			productService.destroyOne(id);
			 return mess = 200;
		}
		else  {
			return mess = 500;
		}
		
	}
	@DeleteMapping(value = "/admin/sanpham/trash/destroyAllSanPham")
	public int destroyAllProduct(@RequestBody Long[] ids) {
		int mess = 0;
		for (Long id : ids) {
			if (productService.regexDestroyHD(id)== true) {
				
				 mess = 1;
			}
			else  {
				mess = 0;
				break;
			}
		}
		
		if (mess == 1) {
			productService.destroyAll(ids);
			return 200;
		}
		else {
			return 500;
		}
		
	}
	@PostMapping(value = "admin/sanpham/check")
	public ProductDTO checkProduct(@RequestBody ProductDTO productDTO) {
		boolean check = productService.checkName(productDTO.getTenProduct());
		ProductDTO mess = new ProductDTO();
		if (check) {
			mess.setErrorMessage(1);
			return mess;
		}
		else {
			mess.setErrorMessage(0);
			return mess;
		}
	}
	
}
