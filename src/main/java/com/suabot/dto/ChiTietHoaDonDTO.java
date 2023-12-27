package com.suabot.dto;

public class ChiTietHoaDonDTO extends AbstractDTO<ChiTietHoaDonDTO>{
	
	private int soLuong;
	private int donGiaBan;
	private Long productID;
	private String productName;
	private Long hoaDonID;
	private int tongTienTungHang;
	private String imgP;
	
	public int getTongTienTungHang() {
		return tongTienTungHang;
	}
	public void setTongTienTungHang(int tongTienTungHang) {
		this.tongTienTungHang = tongTienTungHang;
	}

	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public int getDonGiaBan() {
		return donGiaBan;
	}
	public void setDonGiaBan(int donGiaBan) {
		this.donGiaBan = donGiaBan;
	}
	public Long getProductID() {
		return productID;
	}
	public void setProductID(Long productID) {
		this.productID = productID;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public ChiTietHoaDonDTO() {
		
	}
	
	public Long getHoaDonID() {
		return hoaDonID;
	}
	public void setHoaDonID(Long hoaDonID) {
		this.hoaDonID = hoaDonID;
	}
	
	public String getImgP() {
		return imgP;
	}
	public void setImgP(String imgP) {
		this.imgP = imgP;
	}
	public ChiTietHoaDonDTO(int soLuong, int donGiaBan, Long productID, String productName, Long hoaDonID,
			int tongTienTungHang, String imgP) {
		super();
		this.soLuong = soLuong;
		this.donGiaBan = donGiaBan;
		this.productID = productID;
		this.productName = productName;
		this.hoaDonID = hoaDonID;
		this.tongTienTungHang = tongTienTungHang;
		this.imgP = imgP;
	}
	
	
	
	
}
