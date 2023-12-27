package com.suabot.controller.admin;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.suabot.Convert.ChiTietHoaDonConvert;
import com.suabot.dto.CategoryDTO;
import com.suabot.dto.ChiTietHoaDonDTO;
import com.suabot.dto.HoaDonDTO;
import com.suabot.entity.ChiTietHoaDonEntity;
import com.suabot.repository.ChiTietHoaDonRepository;
import com.suabot.service.IChiTietHoaDonService;
import com.suabot.service.IHoaDonService;

@Controller(value = "chiTietHoaDonControllerAdmin")
public class ChiTietHoaDonController {
	
}
