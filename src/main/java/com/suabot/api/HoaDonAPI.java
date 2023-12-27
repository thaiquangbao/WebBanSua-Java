package com.suabot.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.suabot.dto.HoaDonDTO;
import com.suabot.service.IHoaDonService;

@RestController(value ="hoadonAPI")
public class HoaDonAPI {
	@Autowired
	private IHoaDonService hoaDonService;
	@Autowired
	MailSender mailSender;
	@PatchMapping(value = "/api/admin/hoadon/deleteHD/{id}")
	public HoaDonDTO deleteHD(@PathVariable Long id) {
		return hoaDonService.deleteOne(id);
	}//
	@PatchMapping(value = "/api/admin/hoadon/deleteAllHD")
	public void deleteAllHD(@RequestBody Long[] ids) {
		hoaDonService.deleteAll(ids);
	}
	@PatchMapping(value = "/api/admin/hoadon/restoreHD/{id}")
	public void restoreHD(@PathVariable Long id) {
		hoaDonService.restoreOne(id);
	}
	@PatchMapping(value = "/api/admin/hoadon/restoreAllHD")
	public void restoreAllHD(@RequestBody Long[] ids) {
		hoaDonService.restoreAll(ids);
	}
	@DeleteMapping(value = "/admin/hoadon/destroyHD/{id}")
	public void destroyHD(@PathVariable Long id) {
		hoaDonService.destroy(id);
	}
	@DeleteMapping(value = "/admin/hoadon/destroyAllHD")
	public void destroyAllHD(@RequestBody Long[] ids) {
		hoaDonService.destroyAll(ids);
	}
	@PatchMapping(value = "/admin/hoadon/xacNhan/{id}")
	public void xacNhanPage(@PathVariable Long id) {
		HoaDonDTO hoaDonDTO = hoaDonService.findByID(id);
		sendEmail(hoaDonDTO.getEmail(), "Đơn hàng của bạn đã được "
				+ "chấp nhận"
				+ "\n Đơn hàng sẽ được chuyển tới địa chỉ: "+ hoaDonDTO.getDiaChiNhanHang()
				+ "\n Tổng tiền đơn hàng là" + hoaDonDTO.getTongTien()
				+ "\n Cảm ơn bạn đã mua hàng bên suabot:>>");
		hoaDonService.xacNhan(id);
	}
	@DeleteMapping(value = "/hoadon/destroyHD/{id}")
	public void destroyHDUser(@PathVariable Long id) {
		hoaDonService.destroy(id);
	}
	@DeleteMapping(value = "/hoadon/destroyAllHD")
	public void destroyAllHDDUser(@RequestBody Long[] ids) {
		hoaDonService.destroyAll(ids);
	}
	public void sendEmail(String toEmail,String noiDung) {
		
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setFrom("icgaming26zs@gmail.com");
		mailMessage.setTo(toEmail);
		mailMessage.setSubject("Đơn hàng đã được xác nhận");
		mailMessage.setText(noiDung);
		mailSender.send(mailMessage);
	}
}
