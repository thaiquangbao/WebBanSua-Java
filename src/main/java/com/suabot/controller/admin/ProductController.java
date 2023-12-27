package com.suabot.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.suabot.dto.CategoryDTO;
import com.suabot.dto.DiscountDTO;
import com.suabot.dto.ProductDTO;
import com.suabot.dto.SupplierDTO;
import com.suabot.service.ICategoryService;
import com.suabot.service.IDiscountService;
import com.suabot.service.IProductService;
import com.suabot.service.ISupplierService;

@Controller(value = "productController")
public class ProductController {
	@Autowired
	private IProductService productService;
	@Autowired 
	private ICategoryService categoryService;
	@Autowired
	private ISupplierService supplierService;
	@Autowired
	private IDiscountService discountService;
	@RequestMapping(value = "/admin/sanpham/listSanPham" ,method = RequestMethod.GET)
	public ModelAndView listProductPage(@ModelAttribute("model") ProductDTO productDTO)
	{
		ModelAndView mav = new ModelAndView("admin/sanpham/listSanPham");
		productDTO.setListResult(productService.findAll());
		mav.addObject("model",productDTO);
		int countDeleted = productService.getTotal();
	    mav.addObject("count", countDeleted);
		return mav;
		
	}
	@RequestMapping(value = "/admin/sanpham/formAddSanPham",method = RequestMethod.GET)		
	public ModelAndView formAddProductPage(@ModelAttribute("modelC") CategoryDTO categoryDTO, 
			@ModelAttribute("modelS") SupplierDTO supplierDTO, @ModelAttribute("modelD") DiscountDTO discountDTO) {
		ModelAndView mav = new ModelAndView("admin/sanpham/formAddProduct");
		categoryDTO.setListResult(categoryService.findAll());
		mav.addObject("modelC",categoryDTO);
		supplierDTO.setListResult(supplierService.findAll());
		mav.addObject("modelS",supplierDTO);
		discountDTO.setListResult(discountService.findAll());
		mav.addObject("modelD",discountDTO);
		
		return mav;
		
	}
	@RequestMapping(value = "/admin/sanpham/formUpdateSanPham/{id}", method = RequestMethod.GET)
	public ModelAndView formUpdateProduct(@PathVariable Long id,@ModelAttribute("modelC") CategoryDTO categoryDTO, 
			@ModelAttribute("modelS") SupplierDTO supplierDTO, @ModelAttribute("modelD") DiscountDTO discountDTO) {
		ModelAndView mav = new ModelAndView("admin/sanpham/formUpdateProduct");
		ProductDTO product = productService.findOne(id);
		mav.addObject("model", product);
		categoryDTO.setListResult(categoryService.findAll());
		mav.addObject("modelC",categoryDTO);
		supplierDTO.setListResult(supplierService.findAll());
		mav.addObject("modelS",supplierDTO);
		discountDTO.setListResult(discountService.findAll());
		mav.addObject("modelD",discountDTO);
		return mav;
	}
	@RequestMapping(value = "/admin/sanpham/listSanPham/trash" ,method = RequestMethod.GET)
	public ModelAndView listProductTrashPage(@ModelAttribute("model") ProductDTO productDTO)
	{
		ModelAndView mav = new ModelAndView("admin/sanpham/trashSanPham");
		
		
		productDTO.setListResult(productService.findAllTrash());
		mav.addObject("model",productDTO);
		
		return mav;
		
	}
}
