package com.suabot.controller.guess;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller(value = "signupControllerGuest")
public class SignupController {
	@RequestMapping(value = "/guest/signup", method = RequestMethod.GET)
	   public ModelAndView signupPage() {
	      ModelAndView mav = new ModelAndView("guest/signup");
	      return mav;
	   }
		
	
		 
}
