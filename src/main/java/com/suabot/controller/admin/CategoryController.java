package com.suabot.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.suabot.dto.CategoryDTO;
import com.suabot.service.ICategoryService;



@Controller(value = "categoryController")
public class CategoryController {
	@Autowired ICategoryService categoryService;
	
	@RequestMapping(value = "/admin/sanpham/category",method = RequestMethod.GET)
	 public ModelAndView listCategoryPage(@ModelAttribute("model") CategoryDTO categoryDTO) {
	      ModelAndView mav = new ModelAndView("admin/sanpham/category/listCategory");
	      categoryDTO.setListResult(categoryService.findAll());
	      mav.addObject("model", categoryDTO);
	      int countDeleted = categoryService.getTotal();
	      mav.addObject("count", countDeleted);
	      return mav;
	   }
	@RequestMapping(value = "/admin/sanpham/category/formCategory",method = RequestMethod.GET)
	 public ModelAndView formCategoryPage() {
	      ModelAndView mav = new ModelAndView("admin/sanpham/category/createCategory");
	      
	      return mav;
	   }
	@RequestMapping(value = "/admin/sanpham/category/{id}",method = RequestMethod.GET)
	 public ModelAndView formUpdateCategoryPage(@PathVariable Long id) {
	      ModelAndView mav = new ModelAndView("admin/sanpham/category/updateCategory");
	      CategoryDTO findOne = categoryService.findByID(id);
	      mav.addObject("model", findOne);
	      return mav;
	   }
	@RequestMapping(value = "/admin/sanpham/category/trash", method =RequestMethod.GET)
	public ModelAndView trashPage(@ModelAttribute("model") CategoryDTO categoryDTO)
	{
		ModelAndView mav = new ModelAndView("admin/sanpham/category/trashCategory");
	      categoryDTO.setListResult(categoryService.findAllTrash());
	      mav.addObject("model", categoryDTO);
	      return mav;
	}
	
}
