package com.suabot.api;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.suabot.dto.CartDTO;
import com.suabot.dto.ProductDTO;
import com.suabot.service.IProductService;

@RestController(value = "gioHangAPIGuest")
public class GioHangGuestAPI {
	@Autowired
	private IProductService productService;
	private String gioHang1 = "cart";
	@PostMapping(value = "/guest/gioHang/{id}")
	public CartDTO addGioHangGuest(HttpSession session,@RequestBody ProductDTO productDTO, @PathVariable long id) {
		ProductDTO product = productService.findOne(id);
		CartDTO mess = new CartDTO() ;
		if (product != null && productDTO!= null) {
			
			
			
			List<CartDTO> models = (List<CartDTO>) session.getAttribute(gioHang1);
			int tinh = productDTO.getGia() * productDTO.getSoLuongMuonMua();
			int tamTinh = tinh;
			

			
			CartDTO cartDTO = new CartDTO(productDTO, tamTinh,productDTO.getSoLuongMuonMua());
			if (models == null) {
				models = new ArrayList<CartDTO>();
				session.setAttribute(gioHang1, models);
			}
			
			boolean productExists = false;
	        for (CartDTO carts : models) {
	            if (carts.getProductDTO().getTenProduct().equals(productDTO.getTenProduct())) {
	                mess.setErrorMessage(1);
	                productExists = true;
	                
	                
	            }
	        }

	        if (!productExists) {
	            // Nếu sản phẩm chưa tồn tại, tạo mới CartDTO
	          
	           
	            models.add(cartDTO);
	            mess.setErrorMessage(0);
	               
                
                
	        }
		}
		return mess;
		
		
	}
	@PostMapping(value = "/guest/gioHang/deleteSP/{tenSanPham}")
	public CartDTO deleteGuestPage(HttpSession session, @PathVariable String tenSanPham) {
	    List<CartDTO> models = (List<CartDTO>) session.getAttribute(gioHang1);
	    CartDTO mess = new CartDTO();

	    if (models != null) {
	        for (CartDTO cartDTO : models) {
	            if (cartDTO.getProductDTO().getTenProduct().equals(tenSanPham)) {
	                models.remove(cartDTO);
	                mess.setErrorMessage(0); // Set thông báo xóa thành công
	                break; // Kết thúc vòng lặp sau khi xóa sản phẩm
	            }
	        }
	    } else {
	        mess.setErrorMessage(1); // Set thông báo không tìm thấy sản phẩm cần xóa
	    }

	    return mess;
	}
}
