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
import com.suabot.entity.ChiTietHoaDonEntity;
import com.suabot.repository.ChiTietHoaDonRepository;
import com.suabot.service.IHoaDonService;

@Controller(value = "donHangController")
public class DonHangController {
	@Autowired
	private IHoaDonService hoaDonService;
	@Autowired
	 private ChiTietHoaDonRepository chiTietHoaDonRepository;

	@Autowired
	private ChiTietHoaDonConvert chiTietHoaDonConvert;
	@RequestMapping(value = "/admin/donhang",method = RequestMethod.GET)
	 public ModelAndView listSupplierPage(@ModelAttribute("model") HoaDonDTO hoaDonDTO) {
	      ModelAndView mav = new ModelAndView("admin/hoadon/donHang");
	    
	    	  hoaDonDTO.setListResult(hoaDonService.findAll());
		      mav.addObject("model",hoaDonDTO);
		      long countDeleted = hoaDonService.getTotal();
		      mav.addObject("count", countDeleted);
		      long soKhachHang = hoaDonService.countNameUser();
		      mav.addObject("countUser", soKhachHang);
		      long donHangDD = hoaDonService.countDaDuyet();
		      mav.addObject("countDaDuyet", donHangDD);
		      long donHangCD = hoaDonService.countChuaDuyet();
		      mav.addObject("countChuaDuyet", donHangCD);
		      long doanhThu = hoaDonService.tongDoanhthu();
		      mav.addObject("doanhThu", doanhThu);
		      long spDB = hoaDonService.soSanPhamDaBan();
		      mav.addObject("sanPhamDB", spDB);
		      long spCB = hoaDonService.countHangTon();
		      mav.addObject("spConLai", spCB);
	      
	      return mav;
	   }

	@RequestMapping(value ="/admin/donhang/chitietdonhang/{id}",method = RequestMethod.GET)
	public ModelAndView findChiTiet(@PathVariable Long id,@ModelAttribute("modelCTHD") ChiTietHoaDonDTO chiTietHoaDonDTO) {
		ModelAndView mav = new ModelAndView("admin/hoadon/chiTietDonHang");
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
