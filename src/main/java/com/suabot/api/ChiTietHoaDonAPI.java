package com.suabot.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.suabot.dto.ChiTietHoaDonDTO;
import com.suabot.service.IChiTietHoaDonService;

@RestController(value = "chitiethoadonAPI")
public class ChiTietHoaDonAPI {
@Autowired
private IChiTietHoaDonService chiTietHoaDonService;
	@PostMapping(value = "/admin/hoadon/chitiethoadon")
	public ChiTietHoaDonDTO createChiTietHD(@RequestBody ChiTietHoaDonDTO chiTietHoaDonDTO) {
		
			ChiTietHoaDonDTO createCTHD =chiTietHoaDonService.create(chiTietHoaDonDTO);
			return createCTHD;
		
	}
	@PutMapping(value = "/admin/hoadon/chitiethoadon/{id}/update")
	public ChiTietHoaDonDTO updateChiTietHoaDon(@RequestBody ChiTietHoaDonDTO chiTietHoaDonDTO,@PathVariable Long id) {
		ChiTietHoaDonDTO update = chiTietHoaDonService.update(chiTietHoaDonDTO, id);
		return update;
	}
	@PatchMapping(value = "/admin/hoadon/chitiethoadon/deleteCTHD/{id}")
	public ChiTietHoaDonDTO deleteChiTietHoaDon(@PathVariable Long id) {
		return chiTietHoaDonService.deleteOne(id);
	}//
	@PatchMapping(value = "/admin/hoadon/chitiethoadon/deleteAllCTHD")
	public void deleteAllChiTietHoaDon(@RequestBody Long[] ids) {
		chiTietHoaDonService.deleteAll(ids);
	}
	@PatchMapping(value = "/admin/hoadon/chitiethoadon/restoreCTHD/{id}")
	public void restoreProduct(@PathVariable Long id) {
		chiTietHoaDonService.restoreOne(id);
	}
	@PatchMapping(value = "/admin/hoadon/chitiethoadon/restoreAllCTHD")
	public void restoreAllProduct(@RequestBody Long[] ids) {
		chiTietHoaDonService.restoreAll(ids);
	}
	@DeleteMapping(value = "/admin/hoadon/chitiethoadon/destroyCTHD/{id}")
	public void destroyProduct(@PathVariable Long id) {
		chiTietHoaDonService.destroy(id);
	}
	@DeleteMapping(value = "/admin/hoadon/chitiethoadon/destroyAllCTHD")
	public void destroyAllProduct(@RequestBody Long[] ids) {
		chiTietHoaDonService.destroyAll(ids);
	}
}
