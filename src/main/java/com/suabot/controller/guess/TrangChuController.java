package com.suabot.controller.guess;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.suabot.dto.ProductDTO;
import com.suabot.service.IProductService;

@Controller(value = "trangChuControllerGuest")
public class TrangChuController {
	@Autowired
	private IProductService productService;
	@RequestMapping(value = "/guest/trang-chu", method = RequestMethod.GET)
	   public ModelAndView homePage(@ModelAttribute("model") ProductDTO productDTO,@ModelAttribute("modelKM") ProductDTO productKM) {
	      ModelAndView mav = new ModelAndView("guest/trangchu");
	      
	      productDTO.setListResult(productService.findAllSPNB());
	      mav.addObject("model",productDTO);
	      productKM.setListResult(productService.findAllSPKM());
	      mav.addObject("modelKM",productKM);
	      return mav;
	      
	   }
}
