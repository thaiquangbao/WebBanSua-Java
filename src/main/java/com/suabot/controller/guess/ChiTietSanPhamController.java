package com.suabot.controller.guess;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "chiTietSanPhamControllerGuest")
public class ChiTietSanPhamController {
	@RequestMapping(value = "guest/sanpham/optimum", method = RequestMethod.GET)
	   public ModelAndView homePage() {
	      ModelAndView mav = new ModelAndView("guest/chiTietSanPham");
	      return mav;
	   }
}
