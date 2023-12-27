package com.suabot.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ThanhToanDTO extends AbstractDTO<ThanhToanDTO>{
	private Date ngayThanhToan;
	private int tongTien;
	private String phuongThucThanhToan;
	private String hoTen;
	private String email;
	private String sdt;
	private String diaChiNhanHang;
	private List<CartDTO> cartDTO = new ArrayList<>();
	
	
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	
	public String getDiaChiNhanHang() {
		return diaChiNhanHang;
	}
	public void setDiaChiNhanHang(String diaChiNhanHang) {
		this.diaChiNhanHang = diaChiNhanHang;
	}
	public Date getNgayThanhToan() {
		return ngayThanhToan;
	}
	public void setNgayThanhToan(Date ngayThanhToan) {
		this.ngayThanhToan = ngayThanhToan;
	}
	
	
	public int getTongTien() {
		return tongTien;
	}
	public void setTongTien(int tongTien) {
		this.tongTien = tongTien;
	}
	public String getPhuongThucThanhToan() {
		return phuongThucThanhToan;
	}
	public void setPhuongThucThanhToan(String phuongThucThanhToan) {
		this.phuongThucThanhToan = phuongThucThanhToan;
	}
	public List<CartDTO> getCartDTO() {
		return cartDTO;
	}
	public void setCartDTO(List<CartDTO> cartDTO) {
		this.cartDTO = cartDTO;
	}
	
	public ThanhToanDTO(Date ngayThanhToan, int tongTien, String phuongThucThanhToan, String hoTen, String email,
			String sdt, String diaChiNhanHang, List<CartDTO> cartDTO) {
		super();
		this.ngayThanhToan = ngayThanhToan;
		this.tongTien = tongTien;
		this.phuongThucThanhToan = phuongThucThanhToan;
		this.hoTen = hoTen;
		this.email = email;
		this.sdt = sdt;
		this.diaChiNhanHang = diaChiNhanHang;
		this.cartDTO = cartDTO;
	}
	@Override
	public String toString() {
		return "ThanhToanDTO [ngayThanhToan=" + ngayThanhToan + ", tongTien=" + tongTien + ", phuongThucThanhToan="
				+ phuongThucThanhToan + ", hoTen=" + hoTen + ", email=" + email + ", sdt=" + sdt + ", diaChiNhanHang="
				+ diaChiNhanHang + ", cartDTO=" + cartDTO + "]";
	}
	
	

	

	
	
	
	
}
