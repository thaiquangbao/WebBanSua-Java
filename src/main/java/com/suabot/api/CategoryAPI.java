package com.suabot.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.suabot.dto.CategoryDTO;
import com.suabot.service.ICategoryService;
import com.suabot.service.IProductService;

@RestController(value = "categoryAPI")
public class CategoryAPI {
	@Autowired
	private ICategoryService categoryService;
	@Autowired 
	private IProductService productService;
	@PostMapping(value = "/admin/sanpham/category/createCategory")
	 public CategoryDTO createsupplier(@RequestBody CategoryDTO categoryDTO) {
		String nameCategory = categoryDTO.getCategoryName();
		boolean checkName = categoryService.checkNameCate(nameCategory);
			if (checkName) {
				CategoryDTO mess = new CategoryDTO();
				mess.setErrorMessage(1);
				return mess;
			}
			else {
				CategoryDTO createdSupplier = categoryService.create(categoryDTO);
			 return createdSupplier;
			}
		 
				
		}
	@PutMapping(value = "/admin/sanpham/category/{id}/update")
	public CategoryDTO updateSupplier(@RequestBody CategoryDTO categoryDTO,@PathVariable Long id) {
		 CategoryDTO updateCategory = categoryService.update(categoryDTO,id);
		return updateCategory;
		
	}
	@PostMapping(value = "/admin/sanpham/checkNameCategory")
	public CategoryDTO checkName(@RequestBody CategoryDTO categoryDTO) {
		String nameCategory = categoryDTO.getCategoryName();
	    boolean checkName = categoryService.checkNameCate(nameCategory);
	    if (checkName) {
			CategoryDTO mess = new CategoryDTO();
			mess.setErrorMessage(1);
			return mess;
		}else {
			return null;
		}
	}
	@PatchMapping(value = "/admin/sanpham/category/{id}/delete")
	public CategoryDTO deleteTrash(@PathVariable Long id) {
		 CategoryDTO updateCate = categoryService.deleteOne(id);
		return updateCate;
		
	}
	@PatchMapping(value = "/admin/sanpham/category/deleteAll")
	public void deleteAllTrash(@RequestBody Long[] ids) {
		categoryService.deleteAll(ids);
		
		
	}
	@DeleteMapping(value = "/admin/sanpham/category/{id}/destroy")
	public int destroyTrash(@PathVariable Long id) {
		int mess = 0;
		if (productService.regexDestroyLSP(id)== true) {
			categoryService.destroy(id);
			 return mess = 200;
		}
		else  {
			return mess = 500;
		}
		 
	}
	@DeleteMapping(value = "/admin/sanpham/category/destroyAll")
	public int destroyAllTrash(@RequestBody Long[] ids) {
		int mess = 0;
		for (Long id : ids) {
			if (productService.regexDestroyLSP(id)== true) {
				
				 mess = 1;
			}
			else  {
				mess = 0;
				break;
			}
		}
		
		if (mess == 1) {
			categoryService.destroyAll(ids);
			return 200;
		}
		else {
			return 500;
		}
		
	}
	@PatchMapping(value = "/admin/sanpham/category/{id}/restore")
	public void restoreTrash(@PathVariable Long id) {
		 categoryService.restoreOne(id);
		
		
	}
	@PatchMapping(value = "/admin/sanpham/category/restoreAll")
	public void restoreAllTrash(@RequestBody Long[] ids) {
		categoryService.restoreAll(ids);

	}
}
