package com.suabot.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.suabot.dto.CartDTO;
import com.suabot.dto.ChiTietHoaDonDTO;
import com.suabot.dto.HoaDonDTO;
import com.suabot.dto.ProductDTO;
import com.suabot.dto.ThanhToanDTO;
import com.suabot.dto.ThongTinThanhToanDTO;
import com.suabot.dto.UserDTO;
import com.suabot.service.IChiTietHoaDonService;
import com.suabot.service.IHoaDonService;
import com.suabot.service.IProductService;
import com.suabot.service.IUserService;

@Controller(value = "gioHangControllerAdmin")
public class GioHangController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IHoaDonService hoaDonService;
	@Autowired
	private IProductService productService;
	@Autowired
	MailSender mailSender;
	@Autowired
	private IChiTietHoaDonService chiTietHoaDonService;
	private String gioHang1 = "cart";
	private String thanhToan2 = "the";
	private ThanhToanDTO thanhToanDTO;
	private List<CartDTO> cartes;
	
	@RequestMapping(value = "/admin/giohang",method = RequestMethod.GET)
	public ModelAndView gioHangPage(HttpSession session ) {
		ModelAndView mav = new ModelAndView("admin/giohang/gioHang");
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
	
	@RequestMapping(value = "/admin/updateCart", method = RequestMethod.POST)
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
	@RequestMapping(value = "/admin/thanhtoan/{tongCong}/{userName}",method = RequestMethod.GET)
	public ModelAndView thanhToanPage(HttpSession session,@PathVariable String userName,@PathVariable float tongCong) {
		ModelAndView mav = new ModelAndView("admin/giohang/thanhToan");
		List<CartDTO> modelsCart =(List<CartDTO>) session.getAttribute(gioHang1);
		
		int tong = 0;
		ThanhToanDTO modelsTT =  (ThanhToanDTO) session.getAttribute(thanhToan2);
		List<CartDTO> model = new ArrayList<>();
		
			for (CartDTO cartDTO : modelsCart) {
				ProductDTO product = cartDTO.getProductDTO();
				int tamTinh = cartDTO.getSoLuongBuy() * cartDTO.getProductDTO().getGia();
				tong += tamTinh;
				if (product != null ) {
					CartDTO cart = new CartDTO(product,tamTinh,tong,cartDTO.getSoLuongBuy());
					model.add(cart);
				}
			}
			
			
		
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("list_cart", modelsCart);
		UserDTO findUser = userService.findOne(userName);
		String hoTen= findUser.getFullName();
		String email = findUser.getEmail();
		String phone = findUser.getPhone();
		
		thanhToanDTO = new ThanhToanDTO(null,tong, null, hoTen, email, phone, null, model);
		modelsTT = thanhToanDTO;
		mav.addObject("model",modelsTT);
		
		
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/thanhToan/{userName}", method = RequestMethod.POST)
		public ModelAndView addGioHang(HttpSession session,@PathVariable String userName,
				@RequestBody ThongTinThanhToanDTO thongTinThanhToan) {
			ModelAndView mav = new ModelAndView("admin/hoadon/donHang");
			List<CartDTO> modelsCart =(List<CartDTO>) session.getAttribute(gioHang1);
			if (userName != null) {
				ThanhToanDTO modelsTT =  (ThanhToanDTO) session.getAttribute(thanhToan2);
				UserDTO findUser = userService.findOne(userName);
				
				modelsTT = thanhToanDTO;
				int tong = (int)thanhToanDTO.getTongTien() + thongTinThanhToan.getPhiVanChuyen();
				HoaDonDTO hoaDon = new HoaDonDTO(thongTinThanhToan.getNgayThanhToan(), "Chờ xử lý", tong, thongTinThanhToan.getPhuongThucThanhToan(),thongTinThanhToan.getPhuongThucVanChuyen(),findUser.getUserName() ,modelsTT.getHoTen()
						,findUser.getId(),findUser.getEmail(),findUser.getPhone(),thongTinThanhToan.getDiaChiNhanHang(),thanhToanDTO.getTongTien(),thongTinThanhToan.getPhiVanChuyen());
				
				 HoaDonDTO createdHoaDon = hoaDonService.create(hoaDon);
				 
			        if (createdHoaDon != null) {
			            long hoaDonId = createdHoaDon.getId();
				
				
				for (CartDTO item : modelsTT.getCartDTO()) {
	                CartDTO cart = (CartDTO) item;
	                ProductDTO findP = productService.findNameProduct(cart.getProductDTO().getTenProduct());
	                ChiTietHoaDonDTO c = new ChiTietHoaDonDTO(cart.getSoLuongBuy(), cart.getProductDTO().getGia(), findP.getId(), cart.getProductDTO().getTenProduct(), hoaDonId,  cart.getTamTinh(),findP.getImgP());
	                productService.updateSoLuong(cart.getProductDTO().getTenProduct(), cart.getSoLuongBuy());
	                chiTietHoaDonService.create(c);
	            }
			 }
			        sendEmail(findUser.getEmail(), "Chúc mừng bạn đã đặt hàng thành công !!!\n"+ 
							 "Tổng tiền hóa đơn của bạn là : "+tong+" VND"+
									 "\n Bấm vào chức năng các đơn đã mua để xem chi tiết hóa đơn bạn nhé!!! \n"+
							 "Cảm ơn bạn đã đặt hàng bên suabot :))");
			}
			modelsCart.clear();
			return mav;
	}
		public void sendEmail(String toEmail,String noiDung) {
		
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setFrom("icgaming26zs@gmail.com");
		mailMessage.setTo(toEmail);
		mailMessage.setSubject("Đặt hàng thành công");
		mailMessage.setText(noiDung);
		mailSender.send(mailMessage);
	}
	
}
