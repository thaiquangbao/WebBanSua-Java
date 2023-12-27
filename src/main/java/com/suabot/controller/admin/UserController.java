package com.suabot.controller.admin;

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
import com.suabot.dto.RoleDTO;
import com.suabot.dto.UserDTO;
import com.suabot.entity.ChiTietHoaDonEntity;
import com.suabot.repository.ChiTietHoaDonRepository;
import com.suabot.service.IHoaDonService;
import com.suabot.service.IUserService;

@Controller(value = "userController")
public class UserController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IHoaDonService hoaDonService;
	@Autowired
	private ChiTietHoaDonConvert chiTietHoaDonConvert;
	@Autowired
	 private ChiTietHoaDonRepository chiTietHoaDonRepository;
	@RequestMapping(value = "/admin/General/{userName}",method = RequestMethod.GET)
	 public ModelAndView UserPage(@PathVariable String userName,@ModelAttribute("model") UserDTO userDTO) {
		 ModelAndView mav = new ModelAndView("admin/user/ThongTinCaNhan");
		 UserDTO findUser = userService.findOne(userName);
	      mav.addObject("model", findUser);
	     
	      return mav;
	   }
	@RequestMapping(value = "/admin/EditProfile/{userName}",method = RequestMethod.GET)
	 public ModelAndView GerneralPage(@PathVariable String userName,@ModelAttribute("model") UserDTO userDTO) {
	      ModelAndView mav = new ModelAndView("admin/user/EditProfile");
	      UserDTO findUser = userService.findOne(userName);
	      mav.addObject("model", findUser);
	      return mav;
	   }
	@RequestMapping(value = "/admin/PassWord/{userName}",method = RequestMethod.GET)
	 public ModelAndView PasswordPage(@PathVariable String userName,@ModelAttribute("model") UserDTO userDTO) {
	      ModelAndView mav = new ModelAndView("admin/user/PassWord");
	      UserDTO findUser = userService.findOne(userName);
	      mav.addObject("model", findUser);
	      return mav;
	   }
	@RequestMapping(value = "/admin/users",method = RequestMethod.GET)
	public ModelAndView ListUserPage(@ModelAttribute("models") UserDTO userDTO) {
		ModelAndView mav = new ModelAndView("admin/user/ListKhachHang");
		List<UserDTO> models = new ArrayList<UserDTO>();
		List<UserDTO> users = userService.findAll();
		for (UserDTO userDTO2 : users) {
			userDTO2.setCountDonDaDat(userService.countDonDanhUser(userDTO2.getId()));
			models.add(userDTO2);
		}
		userDTO.setListResult(models) ;
		
		mav.addObject("models",userDTO);
		 int countDeleted = userService.getToTal();
		   mav.addObject("count", countDeleted);
		  
		return mav;
	}
	@RequestMapping(value = "/admin/users/trash",method = RequestMethod.GET)
	public ModelAndView ListUserTrashPage(@ModelAttribute("models") UserDTO userDTO) {
		ModelAndView mav = new ModelAndView("admin/user/TrashKhachHang");
		userDTO.setListResult(userService.findAllTrash()) ;
		mav.addObject("models",userDTO);
		return mav;
	}
	@RequestMapping(value = "/admin/users/formAddUser",method = RequestMethod.GET)
	public ModelAndView AddUserPage(@ModelAttribute("models") UserDTO userDTO) {
		ModelAndView mav = new ModelAndView("admin/user/FormAddKhachHang");
		
		return mav;
	}
	@RequestMapping(value = "/admin/users/formUpdateKhachHang/{id}",method = RequestMethod.GET)
	 public ModelAndView FormUpdatePage(@PathVariable Long id,@ModelAttribute("model") UserDTO userDTO,@ModelAttribute("role") RoleDTO roleDTO) {
	      ModelAndView mav = new ModelAndView("admin/user/FormUpdateKhachHang");
	      UserDTO findUser = userService.findById(id);
	      mav.addObject("model", findUser);
	      
	      return mav;
	   }
	@RequestMapping(value = "/admin/hoaDon/hoaDonDaDat/{userName}",method = RequestMethod.GET)
	 public ModelAndView hoaDonDaDatPage(@PathVariable String userName,@ModelAttribute("model") HoaDonDTO hoaDonDTO) {
	      ModelAndView mav = new ModelAndView("admin/user/hoaDonDaDat");
	      hoaDonDTO.setListResult(userService.findHoaDonDaDat(userName));
	      mav.addObject("model", hoaDonDTO);
	      
	      return mav;
	   }
	@RequestMapping(value ="/admin/hoaDon/hoaDonDaDat/{userName}/{id}",method = RequestMethod.GET)
	public ModelAndView findChiTiet(@PathVariable String userName,@PathVariable Long id,@ModelAttribute("modelCTHD") ChiTietHoaDonDTO chiTietHoaDonDTO) {
		ModelAndView mav = new ModelAndView("admin/user/ChiTietHoaDon");
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
	

