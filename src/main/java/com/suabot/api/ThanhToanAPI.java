package com.suabot.api;



import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;


import com.suabot.dto.ThanhToanDTO;


@RestController(value = "thanhToanAPI")
public class ThanhToanAPI {
	private String thanhToan2 = "the";

	
//	@PostMapping(value = "/admin/thanhToan/{userName}")
//	public void addGioHang(HttpSession session,@PathVariable String userName) {
//		if (userName != null) {
//			ThanhToanDTO modelsTT =  (ThanhToanDTO) session.getAttribute(thanhToan2);
//			
//			System.out.println(modelsTT);
//		}
			
			
			
		
		
		
		
//	}
	
}
