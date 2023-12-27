package com.suabot.controller.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.suabot.Convert.ChiTietHoaDonConvert;
import com.suabot.dto.ChiTietHoaDonDTO;
import com.suabot.dto.HoaDonDTO;
import com.suabot.dto.UserDTO;
import com.suabot.entity.ChiTietHoaDonEntity;
import com.suabot.repository.ChiTietHoaDonRepository;
import com.suabot.service.IHoaDonService;
import com.suabot.service.IUserService;

@Controller(value = "userControllerUser")
public class UserDkController {
	@Autowired
	private IUserService userService;	@Autowired
	private IHoaDonService hoaDonService;
	@Autowired
	private ChiTietHoaDonConvert chiTietHoaDonConvert;
	@Autowired
	 private ChiTietHoaDonRepository chiTietHoaDonRepository;
	@RequestMapping(value = "/General/{userName}",method = RequestMethod.GET)
	 public ModelAndView UserPage(@PathVariable String userName,@ModelAttribute("model") UserDTO userDTO) {
		 ModelAndView mav = new ModelAndView("users/user/ThongTinCaNhan");
		 UserDTO findUser = userService.findOne(userName);
	      mav.addObject("model", findUser);
	      return mav;
	   }
	@RequestMapping(value = "/EditProfile/{userName}",method = RequestMethod.GET)
	 public ModelAndView GerneralPage(@PathVariable String userName,@ModelAttribute("model") UserDTO userDTO) {
	      ModelAndView mav = new ModelAndView("users/user/EditProfile");
	      UserDTO findUser = userService.findOne(userName);
	      mav.addObject("model", findUser);
	      return mav;
	   }
	@RequestMapping(value = "/PassWord/{userName}",method = RequestMethod.GET)
	 public ModelAndView PasswordPage(@PathVariable String userName,@ModelAttribute("model") UserDTO userDTO) {
	      ModelAndView mav = new ModelAndView("users/user/PassWord");
	      UserDTO findUser = userService.findOne(userName);
	      mav.addObject("model", findUser);
	      return mav;
	   }
	@RequestMapping(value = "/hoaDon/hoaDonDaDat/{userName}",method = RequestMethod.GET)
	 public ModelAndView hoaDonDaDatPage(@PathVariable String userName,@ModelAttribute("model") HoaDonDTO hoaDonDTO) {
	      ModelAndView mav = new ModelAndView("users/user/hoaDonDaDat");
	      hoaDonDTO.setListResult(userService.findHoaDonDaDat(userName));
	      mav.addObject("model", hoaDonDTO);
	      
	      return mav;
	   }
	@RequestMapping(value ="/hoaDon/hoaDonDaDat/{userName}/{id}",method = RequestMethod.GET)
	public ModelAndView findChiTiet(@PathVariable String userName,@PathVariable Long id,@ModelAttribute("modelCTHD") ChiTietHoaDonDTO chiTietHoaDonDTO) {
		ModelAndView mav = new ModelAndView("users/user/ChiTietHoaDon");
		HoaDonDTO hoaDon = hoaDonService.findByID(id);
		List<ChiTietHoaDonEntity> chiTietEntity = chiTietHoaDonRepository.findOneByHoaDon_Id(id);
		List<ChiTietHoaDonDTO> models = new ArrayList<>();
		if (!chiTietEntity.isEmpty()) {
			for (ChiTietHoaDonEntity chiTietHoaDonEntity : chiTietEntity) {
				
				ChiTietHoaDonDTO convert = chiTietHoaDonConvert.toDto(chiTietHoaDonEntity);
				models.add(convert);
			}
			chiTietHoaDonDTO.setListResult(models);
			mav.addObject("modelCTHD", chiTietHoaDonDTO);
			mav.addObject("modelHD",hoaDon);
		}
		return mav;
	}

}
