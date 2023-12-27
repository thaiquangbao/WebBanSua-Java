package com.suabot.dto;

import java.util.Date;

public class ProductDTO extends AbstractDTO<ProductDTO>{

	private String tenProduct;
	private String moTa;
	private String trongLuong;
	private String huongDanSuDung;
	private String doTuoiSuDung;
	private int daBan;
	private int soLuong;
	private long supplierID;
	private long categoryID;
	private long discountID;
	private String supplierName;
	private String categoryName;
	private String discountName;
	private String motaDiscount;

	private Date dateStart;
	private Date dateEnd;
	private String imgP;
	private int gia;
	private int soLuongMuonMua;
	private boolean noiBat;
	private String banChay;
	
	public String getMotaDiscount() {
		return motaDiscount;
	}

	public void setMotaDiscount(String motaDiscount) {
		this.motaDiscount = motaDiscount;
	}



	public Date getDateStart() {
		return dateStart;
	}

	public void setDateStart(Date dateStart) {
		this.dateStart = dateStart;
	}

	public Date getDateEnd() {
		return dateEnd;
	}

	public void setDateEnd(Date dateEnd) {
		this.dateEnd = dateEnd;
	}

	public String getBanChay() {
		return banChay;
	}

	public void setBanChay(String banChay) {
		this.banChay = banChay;
	}

	public int getSoLuongMuonMua() {
		return soLuongMuonMua;
	}

	public void setSoLuongMuonMua(int soLuongMuonMua) {
		this.soLuongMuonMua = soLuongMuonMua;
	}

	public String getDoTuoiSuDung() {
		return doTuoiSuDung;
	}

	public void setDoTuoiSuDung(String doTuoiSuDung) {
		this.doTuoiSuDung = doTuoiSuDung;
	}



	public int getGia() {
		return gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}

	public String getImgP() {
		return imgP;
	}

	public void setImgP(String imgP) {
		this.imgP = imgP;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getDiscountName() {
		return discountName;
	}

	public void setDiscountName(String discountName) {
		this.discountName = discountName;
	}

	public String getTenProduct() {
		return tenProduct;
	}

	public void setTenProduct(String tenProduct) {
		this.tenProduct = tenProduct;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getTrongLuong() {
		return trongLuong;
	}

	public void setTrongLuong(String trongLuong) {
		this.trongLuong = trongLuong;
	}

	public String getHuongDanSuDung() {
		return huongDanSuDung;
	}

	public void setHuongDanSuDung(String huongDanSuDung) {
		this.huongDanSuDung = huongDanSuDung;
	}

	public int getDaBan() {
		return daBan;
	}

	public void setDaBan(int daBan) {
		this.daBan = daBan;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public long getSupplierID() {
		return supplierID;
	}

	public void setSupplierID(long supplierID) {
		this.supplierID = supplierID;
	}

	public long getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(long categoryID) {
		this.categoryID = categoryID;
	}

	public long getDiscountID() {
		return discountID;
	}

	public void setDiscountID(long discountID) {
		this.discountID = discountID;
	}

	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public boolean isNoiBat() {
		return noiBat;
	}

	public void setNoiBat(boolean noiBat) {
		this.noiBat = noiBat;
	}

	@Override
	public String toString() {
		return "ProductDTO [tenProduct=" + tenProduct + ", moTa=" + moTa + ", trongLuong=" + trongLuong
				+ ", huongDanSuDung=" + huongDanSuDung + ", doTuoiSuDung=" + doTuoiSuDung + ", daBan=" + daBan
				+ ", soLuong=" + soLuong + ", supplierID=" + supplierID + ", categoryID=" + categoryID + ", discountID="
				+ discountID + ", supplierName=" + supplierName + ", categoryName=" + categoryName + ", discountName="
				+ discountName + ", imgP=" + imgP + ", gia=" + gia + ", soLuongMuonMua=" + soLuongMuonMua + ", noiBat="
				+ noiBat + ", banChay=" + banChay + "]";
	}
	
}
