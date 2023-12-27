package com.suabot.dto;

import java.util.Date;

public class HoaDonDTO extends AbstractDTO<HoaDonDTO>{
	
	private Date ngayDatHang;
	private String trangThai;
	private int tongTien;
	private String phuongThucThanhToan;
	private String phuongThucVC;
	private String userName;
	private String tenKhachHang;
	private long userID;
	private String email;
	private String phone;
	private String diaChiNhanHang;
	private int tongTinTatCaSP;
	private int phiVanChuyen;
	
	public int getPhiVanChuyen() {
		return phiVanChuyen;
	}

	public void setPhiVanChuyen(int phiVanChuyen) {
		this.phiVanChuyen = phiVanChuyen;
	}

	public Date getNgayDatHang() {
		return ngayDatHang;
	}
	
	public String getTenKhachHang() {
		return tenKhachHang;
	}

	public void setTenKhachHang(String tenKhachHang) {
		this.tenKhachHang = tenKhachHang;
	}

	
	

	public void setNgayDatHang(Date ngayDatHang) {
		this.ngayDatHang = ngayDatHang;
	}
	
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}


	
	
	public String getPhuongThucVC() {
		return phuongThucVC;
	}

	public void setPhuongThucVC(String phuongThucVC) {
		this.phuongThucVC = phuongThucVC;
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
	
	
	
	

	public long getUserID() {
		return userID;
	}

	public void setUserID(long userID) {
		this.userID = userID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public HoaDonDTO() {
		
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDiaChiNhanHang() {
		return diaChiNhanHang;
	}

	public void setDiaChiNhanHang(String diaChiNhanHang) {
		this.diaChiNhanHang = diaChiNhanHang;
	}

	public int getTongTinTatCaSP() {
		return tongTinTatCaSP;
	}

	public void setTongTinTatCaSP(int tongTinTatCaSP) {
		this.tongTinTatCaSP = tongTinTatCaSP;
	}

	public HoaDonDTO(Date ngayDatHang, String trangThai, int tongTien, String phuongThucThanhToan, String phuongThucVC,
			String userName, String tenKhachHang, long userID, String email, String phone, String diaChiNhanHang,
			int tongTinTatCaSP, int phiVanChuyen) {
		super();
		this.ngayDatHang = ngayDatHang;
		this.trangThai = trangThai;
		this.tongTien = tongTien;
		this.phuongThucThanhToan = phuongThucThanhToan;
		this.phuongThucVC = phuongThucVC;
		this.userName = userName;
		this.tenKhachHang = tenKhachHang;
		this.userID = userID;
		this.email = email;
		this.phone = phone;
		this.diaChiNhanHang = diaChiNhanHang;
		this.tongTinTatCaSP = tongTinTatCaSP;
		this.phiVanChuyen = phiVanChuyen;
	}

	

	
	
	
	
	

	
	

	

	

	

	
	
}
