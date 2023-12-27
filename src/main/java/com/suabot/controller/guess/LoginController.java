package com.suabot.controller.guess;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "loginControllerGuest")
public class LoginController {
	@RequestMapping(value = "/guest/login", method = RequestMethod.GET)
	   public ModelAndView loginPage() {
	      ModelAndView mav = new ModelAndView("guest/login");
	      return mav;
	   }
		
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/guest/login?accessDenied");
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/guest/trang-chu");
	}
	@RequestMapping(value = "/guest/forgetpassword", method = RequestMethod.GET)
	public ModelAndView forgotPage() {
		ModelAndView mav = new ModelAndView("guest/forgetTaiKhoan");
		return mav;
	}
}
