package com.suabot.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "chiTietSanPhamControllerUsers")
public class ChiTietSanPhamController {
	@RequestMapping(value = "/sanpham/optimum", method = RequestMethod.GET)
	   public ModelAndView homePage() {
	      ModelAndView mav = new ModelAndView("users/chiTietSanPham");
	      return mav;
	   }
}
