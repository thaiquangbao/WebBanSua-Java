package com.suabot.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.suabot.dto.FeedBackDTO;
import com.suabot.service.IFeedBackService;

@Controller(value = "feedBackController")
public class FeedBackController {
@Autowired
private IFeedBackService feedBackService;

	@RequestMapping(value = "/admin/feedback", method = RequestMethod.GET)
	public ModelAndView feedBackPage(@ModelAttribute("modelFeedBack") FeedBackDTO feedBackDTO)
	{
		ModelAndView mav = new ModelAndView("admin/feedback/listFeedBack");
		feedBackDTO.setListResult(feedBackService.findAll());
		mav.addObject("modelFeedBack", feedBackDTO);
		int countDeleted = feedBackService.getTotal();
		mav.addObject("count",countDeleted);
		return mav;
	}
	@RequestMapping(value = "/admin/feedback/formAddFeedback", method = RequestMethod.GET)
	public ModelAndView feedBackPage()
	{
		ModelAndView mav = new ModelAndView("admin/feedback/formAddFeedBack");
		
		return mav;
	}
	@RequestMapping(value = "/admin/feedback/formUpdateFeedback/{id}", method = RequestMethod.GET)
	public ModelAndView feedBackOnePage(@PathVariable Long id,@ModelAttribute("modelF") FeedBackDTO feedBackDTO)
	{
		ModelAndView mav = new ModelAndView("admin/feedback/formUpdateFeedBack");
		FeedBackDTO fb = feedBackService.findByID(id);
		mav.addObject("modelF", fb);
		return mav;
	}
	@RequestMapping(value = "/admin/feedback/trash", method = RequestMethod.GET)
	public ModelAndView feedBackTrashPage(@ModelAttribute("modelFeedBack") FeedBackDTO feedBackDTO)
	{
		ModelAndView mav = new ModelAndView("admin/feedback/trashFeedBack");
		feedBackDTO.setListResult(feedBackService.findAllTrash());
		mav.addObject("modelFeedBack", feedBackDTO);
		
		return mav;
	}
	@RequestMapping(value = "admin/feedback/{userName}", method = RequestMethod.GET)
	public ModelAndView fAndView () {
		ModelAndView mav = new ModelAndView("admin/feedback");
		return mav;
	}
}
