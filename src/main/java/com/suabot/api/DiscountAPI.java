package com.suabot.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.suabot.dto.DiscountDTO;
import com.suabot.service.IDiscountService;
import com.suabot.service.IProductService;

@RestController(value = "discountAPI")
public class DiscountAPI {
	@Autowired
	private IDiscountService discountService;
	@Autowired
	private IProductService productService;
	@PostMapping(value = "/admin/sanpham/discount/createDiscount")
	 public DiscountDTO createDiscount(@RequestBody DiscountDTO discountDTO) {
		boolean check = discountService.checkName(discountDTO.getNameDiscount());
		if (!check) {
			DiscountDTO createdDiscount = discountService.create(discountDTO);
			return createdDiscount;
		}
		else {
			DiscountDTO mess = new DiscountDTO();
			mess.setErrorMessage(1);
			return mess;
		}
		
	}
	@PostMapping(value = "/admin/sanpham/discount/check")
	public DiscountDTO checkDiscount(@RequestBody DiscountDTO discountDTO) {
		boolean check = discountService.checkName(discountDTO.getNameDiscount());
		DiscountDTO mess = new DiscountDTO();
		if (check) {
			
			mess.setErrorMessage(1);
			return mess;
		}	
		else {
			mess.setErrorMessage(0);
			return mess;
		}
	}
	
	@PutMapping(value = "/admin/sanpham/discount/formUpdateDiscount/{id}/update")
	public DiscountDTO updateDiscount(@RequestBody DiscountDTO discountDTO , @PathVariable Long id) {
		DiscountDTO ma = discountService.findByID(id);
		if (ma != null) {
			return discountService.update(id, discountDTO);
		}
		else {
			DiscountDTO mess = new DiscountDTO();
			mess.setErrorMessage(1);
			return mess;
		}
	}
	@PatchMapping(value = "/admin/sanpham/discount/deleteDiscount/{id}")
	public DiscountDTO deleteOne(@PathVariable Long id) {
		DiscountDTO exist = discountService.findByID(id);
		if (exist != null) {
			return discountService.deleteOne(id);
		}
		else {
			DiscountDTO mess = new DiscountDTO();
			mess.setErrorMessage(1);
			return mess;
		}
	}
	@PatchMapping(value = "/admin/sanpham/discount/deleteAllDiscount")
	public void deleteAll(@RequestBody Long[] ids) {
		discountService.deleteAll(ids);
	}
	@DeleteMapping(value = "/admin/sanpham/discount/destroyDiscount/{id}")
	public int destroyOne(@PathVariable Long id) {
		
		if (productService.regexDestroyDiscount(id) == true) {
			discountService.destroyOne(id);
			return 200;
		}
		else {
			return 500;
		}
	}
	@DeleteMapping(value = "/admin/sanpham/discount/destroyAllDiscount")
	public int destroyAll(@RequestBody Long[] ids) {
		int mess = 0;
		for (Long id : ids) {
			if (productService.regexDestroyDiscount(id) == true) {
				
				mess = 1;
			}
			else {
				mess = 0;
				break;
			}
		}
		if (mess == 1) {
			discountService.destroyAll(ids);
			return 200;
		}
		else {
			return 500;
		}
		
	}
	@PatchMapping(value = "/admin/sanpham/discount/restoreDiscount/{id}")
	public DiscountDTO restoreOne(@PathVariable Long id) {
		DiscountDTO exist = discountService.findByID(id);
		if (exist != null) {
			return discountService.restoreOne(id);
		}
		else {
			DiscountDTO mess = new DiscountDTO();
			mess.setErrorMessage(1);
			return mess;
		}
	}
	@PatchMapping(value = "/admin/sanpham/discount/restoreAllDiscount")
	public void restoreAll(@RequestBody Long[] ids) {
		discountService.restoreAll(ids);
	}
}

