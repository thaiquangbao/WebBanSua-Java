package com.suabot.controller.guess;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.suabot.dto.CartDTO;
import com.suabot.dto.ProductDTO;
import com.suabot.service.IChiTietHoaDonService;
import com.suabot.service.IHoaDonService;
import com.suabot.service.IProductService;
import com.suabot.service.IUserService;

@Controller(value = "gioHangControllerGuest")
public class GioHangController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IHoaDonService hoaDonService;
	@Autowired
	private IProductService productService;
	
	@Autowired
	private IChiTietHoaDonService chiTietHoaDonService;
	private String gioHang1 = "cart";
//	private String thanhToan2 = "the";
//	private ThanhToanDTO thanhToanDTO;
//	private List<CartDTO> cartes;
	@RequestMapping(value = "/guest/giohang",method = RequestMethod.GET)
	public ModelAndView gioHangPage(HttpSession session ) {
		ModelAndView mav = new ModelAndView("guest/giohang/gioHang");
		List<CartDTO> models = (List<CartDTO>) session.getAttribute(gioHang1);
		List<CartDTO> model = new ArrayList<>();
		if (models!= null) {
			for (CartDTO cartDTO : models) {
				ProductDTO product = cartDTO.getProductDTO();
				int tamTinh = cartDTO.getTamTinh();
				
				if (product != null ) {
					CartDTO cart = new CartDTO(product, tamTinh,product.getSoLuongMuonMua());
					model.add(cart);
				}
			}
			mav.addObject("gioHang", model);
			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/guest/updateCart", method = RequestMethod.POST)
	public ResponseEntity<String> updateCart(HttpSession session,@RequestBody List<CartDTO> updatedCart) {
		List<CartDTO> models = (List<CartDTO>) session.getAttribute(gioHang1);
		for (CartDTO cartDTO : models) {
			for (CartDTO cartDTO2 : updatedCart) {
			if (cartDTO.getProductDTO().getTenProduct().equals(cartDTO2.getTenProduct())) {
				ProductDTO findDataProduct = productService.findNameProduct(cartDTO2.getTenProduct());
				if (findDataProduct.getSoLuong() >= cartDTO2.getSoLuongBuy()) {
					cartDTO.setSoLuongBuy(cartDTO2.getSoLuongBuy());
					
					
				}
				else {
					 return new ResponseEntity<>(cartDTO2.getTenProduct() , HttpStatus.OK);
				}
				
			}
		}
			
		}
		
		
	    
		return new ResponseEntity<>("200", HttpStatus.OK);
	}
	
	
	
}
