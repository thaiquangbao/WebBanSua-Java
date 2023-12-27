package com.suabot.controller.admin;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.suabot.dto.DiscountDTO;
import com.suabot.service.IDiscountService;



@Controller(value = "discountControllerAdmin")
public class DiscountController {
	@Autowired
	IDiscountService discountService;
	
	@RequestMapping(value = "/admin/sanpham/discount",method = RequestMethod.GET)
	 public ModelAndView listDiscountPage(@ModelAttribute("model") DiscountDTO discountDTO) {
	      ModelAndView mav = new ModelAndView("admin/sanpham/discount/listDiscount");
	      discountDTO.setListResult(discountService.findAll());
	      mav.addObject("model", discountDTO);
	      int countDeleted = discountService.getTotal();
	      mav.addObject("count", countDeleted);
	      return mav;
	   }
	@RequestMapping(value = "/admin/sanpham/discount/trash",method = RequestMethod.GET)
	 public ModelAndView listTrashDiscountPage(@ModelAttribute("model") DiscountDTO discountDTO) {
	      ModelAndView mav = new ModelAndView("admin/sanpham/discount/trashDiscount");
	      discountDTO.setListResult(discountService.findAllTrash());
	      mav.addObject("model", discountDTO);
	      //int countDeleted = discountDTO.getTotal();
	      //mav.addObject("count", countDeleted);
	      return mav;
	   }
	@RequestMapping(value = "/admin/sanpham/discount/formDiscount",method = RequestMethod.GET)
	 public ModelAndView formDiscountPage() {
	      ModelAndView mav = new ModelAndView("admin/sanpham/discount/formDiscount");
	      return mav;
	   }
	@RequestMapping(value = "/admin/sanpham/discount/formUpdateDiscount/{id}" ,method = RequestMethod.GET)
	public ModelAndView formUpdateDiscountPage(@ModelAttribute("model") DiscountDTO discountDTO) {
		DiscountDTO dto = discountService.findByID(discountDTO.getId());

		ModelAndView mav = new ModelAndView();
		if (dto != null) {
			mav.setViewName("admin/sanpham/discount/formUpdateDiscount");
			mav.addObject("model", dto);
			
			
		}
		else {
			 mav.setViewName("admin/error-page"); // Thay thế "error-page" bằng tên trang lỗi bạn muốn hiển thị
		       
		}
		return mav;
		
		
	}
	
}
