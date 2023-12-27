package com.suabot.api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.suabot.dto.SupplierDTO;
import com.suabot.service.IProductService;
import com.suabot.service.ISupplierService;



@RestController(value = "supplierAPI")

public class SupplierAPI {
	@Autowired
	private ISupplierService supplierService;
	@Autowired
	private IProductService productService;
	@PostMapping(value = "/admin/sanpham/nhacungcap/createSupplier")
	 public SupplierDTO createsupplier(@RequestBody SupplierDTO supplierDTO) {
		String tenSupplier = supplierDTO.getTensupplier();
		String email = supplierDTO.getEmail();
		boolean checkEmail = supplierService.findEmail(email);
	    boolean checkTen = supplierService.findOne(tenSupplier);
		if (checkTen) {
			SupplierDTO mess = new SupplierDTO();
			mess.setErrorMessage(1);
			return mess;
		}
		else if(checkEmail) {
			SupplierDTO mess2 = new SupplierDTO();
			mess2.setErrorMessage(2);
			return mess2;
		}
		else {
			 SupplierDTO createdSupplier = supplierService.create(supplierDTO);
				return createdSupplier;
				
		}
   
	}
	@PutMapping(value = "/admin/sanpham/nhacungcap/{id}/edit")
	public SupplierDTO updateSupplier(@RequestBody SupplierDTO supplierDTO,@PathVariable Long id) {
		 SupplierDTO updateSupplier = supplierService.updateSupplier(supplierDTO,id);
		return updateSupplier;
		
	}

	@PostMapping(value = "/admin/sanpham/checkTen")
	public SupplierDTO checkTen(@RequestBody SupplierDTO supplierDTO) {
		String tenSupplier = supplierDTO.getTensupplier();
	    boolean checkTen = supplierService.findOne(tenSupplier);
	    if (checkTen) {
			SupplierDTO mess = new SupplierDTO();
			mess.setErrorMessage(1);
			return mess;
		}else {
			return null;
		}
	    
		
		
		
	}
	@PostMapping(value = "/admin/sanpham/checkEmail")
	public SupplierDTO checkEmail(@RequestBody SupplierDTO supplierDTO) {
		String emailSupplier = supplierDTO.getEmail();
	    boolean checkEmail = supplierService.findEmail(emailSupplier);
	    if (checkEmail) {
			 SupplierDTO mess = new SupplierDTO();
			 mess.setErrorMessage(2);
			 return mess;
		}
	    else {
			return null;
		}
	   
	}	
	@PutMapping(value = "/admin/sanpham/nhacungcap/{id}/delete")
	public SupplierDTO deleteTrash(@RequestBody SupplierDTO supplierDTO,@PathVariable Long id) {
		 SupplierDTO updateSupplier = supplierService.deleteTrash(supplierDTO,id);
		return updateSupplier;
		
	}	
	@PutMapping(value = "/admin/sanpham/nhacungcap/deleteAll")
	public SupplierDTO deleteAllTrash(@RequestBody Long[] ids) {
		SupplierDTO supplierDTO = new SupplierDTO();
		supplierDTO.setDeleted(true);
		 SupplierDTO updateSupplier = supplierService.deleteTrashAll(supplierDTO,ids);
		return updateSupplier;
		
	}
	@DeleteMapping(value = "/admin/sanpham/nhacungcap/destroyAllSupplier")
	 public int deletesupplier(@RequestBody Long[] ids) {
		int mess = 0;
		for (Long id : ids) {
			if (productService.regexDestroySupplier(id)== true) {
				
				 mess = 1;
			}
			else  {
				mess = 0;
				break;
			}
		}
		
		if (mess == 1) {
			supplierService.delete(ids);
			return 200;
		}
		else {
			return 500;
		}
		
		
		
	}
	@DeleteMapping(value = "/admin/sanpham/nhacungcap/{id}/destroy")
	public int deleteOne(@PathVariable Long id) {
		if (productService.regexDestroySupplier(id) == true) {
			supplierService.deleteOne(id);
			return 200;
		}
		else {
			return 500;
		}
		
	}
	@PostMapping(value = "/admin/sanpham/nhacungcap/{id}/restore")
	public void restoreOne(@PathVariable Long id) {
		SupplierDTO supplierDTO = new SupplierDTO();
		supplierDTO.setDeleted(false);
		supplierService.restoreSupplier(supplierDTO,id);
		
	}
	@PostMapping(value = "/admin/sanpham/nhacungcap/restoreAllSupplier")
	public void restoreAllSupplier(@RequestBody Long[] ids) {
		supplierService.restoreSupplierAll(ids);
	}
}
