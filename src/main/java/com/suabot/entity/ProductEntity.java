package com.suabot.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class ProductEntity extends BaseEntity{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id")
	private Long id;
	@Column(name = "tenproduct")
	private String tenProduct;
	@Column(name = "mota",columnDefinition = "TEXT")
	private String moTa;
	@Column(name = "trongluong")
	private String trongLuong;
	@Column(name = "huongdansudung",columnDefinition = "TEXT")
	private String huongDanSuDung;
	@Column(name = "daban")
	private int daBan;
	@Column(name = "price")
	private int gia;
	@Column(name = "soluong")
	private int soLuong;
	@Column(name = "dotuoisudung")
	private String doTuoiSuDung;
	@Column(name = "img", columnDefinition = "TEXT")
	private String imgP;
	@Column(name="noibat",columnDefinition = "boolean default false")
	private boolean noiBat;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "supplier_id")
	private SupplierEntity supplier;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id")
	private CategoryEntity category;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "discount_id")
	private DiscountEntity discount;
	@OneToMany(mappedBy = "product")
	private List<ChiTietHoaDonEntity> chiTietHoaDons = new ArrayList<>();
	
	
	
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
	public List<ChiTietHoaDonEntity> getChiTietHoaDons() {
		return chiTietHoaDons;
	}
	public void setChiTietHoaDons(List<ChiTietHoaDonEntity> chiTietHoaDons) {
		this.chiTietHoaDons = chiTietHoaDons;
	}
	public CategoryEntity getCategory() {
		return category;
	}
	public void setCategory(CategoryEntity category) {
		this.category = category;
	}
	public DiscountEntity getDiscount() {
		return discount;
	}
	public void setDiscount(DiscountEntity discount) {
		this.discount = discount;
	}
	public SupplierEntity getSupplier() {
		return supplier;
	}
	public void setSupplier(SupplierEntity supplier) {
		this.supplier = supplier;
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
	public Long getId() {
		return id;
	}
	public ProductEntity() {
		
	}
	public boolean isNoiBat() {
		return noiBat;
	}
	public void setNoiBat(boolean noiBat) {
		this.noiBat = noiBat;
	}
	public ProductEntity(Long id) {
		super();
		this.id = id;
	}
	
	
	
}
