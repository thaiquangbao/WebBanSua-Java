package com.suabot.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.suabot.dto.SupplierDTO;
import com.suabot.service.ISupplierService;

@Controller(value = "listSupplierController")
public class SupplierController {
	@Autowired
	private ISupplierService supplierService;
	
	@RequestMapping(value = "/admin/sanpham/nhacungcap",method = RequestMethod.GET)
	 public ModelAndView listSupplierPage(@ModelAttribute("model") SupplierDTO supplierModel) {
	      ModelAndView mav = new ModelAndView("admin/sanpham/supplier/listSupplier");
	    
	    	  supplierModel.setListResult(supplierService.findAll());
		      mav.addObject("model",supplierModel);
		      int countDeleted = supplierService.getTotal();
		      mav.addObject("count", countDeleted);
	      
	      
	      return mav;
	   }
	@RequestMapping(value = "/admin/sanpham/nhacungcap/formsupplier",method = RequestMethod.GET)
	 public ModelAndView formSupplierPage( ) {
	      ModelAndView mav = new ModelAndView("admin/sanpham/supplier/createSupplier");
	      
	      return mav;
	   }
	@RequestMapping(value = "/admin/sanpham/nhacungcap/{id}",method = RequestMethod.GET)
	 public ModelAndView esidtSupplierPage(@PathVariable Long id) {
	      ModelAndView mav = new ModelAndView("admin/sanpham/supplier/editSupplier");
	      SupplierDTO model = supplierService.findById(id);
	       
	      mav.addObject("model",model);
	      return mav;
	   }
	@RequestMapping(value = "/admin/sanpham/nhacungcap/trash",method = RequestMethod.GET)
	 public ModelAndView trashPage(@ModelAttribute("model") SupplierDTO supplierModel) {
		ModelAndView mav = new ModelAndView("admin/sanpham/supplier/trash");
	      supplierModel.setListResult(supplierService.findAllTrash());
	      mav.addObject("model",supplierModel);
	      return mav;
	   }
	
}
