package com.suabot.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "feedBackControllerUser")
public class FeedBackController {


	
	@RequestMapping(value = "/feedback/{userName}", method = RequestMethod.GET)
	public ModelAndView fAndView () {
		ModelAndView mav = new ModelAndView("users/feedback");
		return mav;
	}
}
