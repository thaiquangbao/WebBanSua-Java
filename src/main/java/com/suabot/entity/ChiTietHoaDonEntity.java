package com.suabot.entity;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name ="chiTietHoaDon")
public class ChiTietHoaDonEntity extends BaseEntity{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "chiTietHoaDon_id")
	private Long id;
	@Column(name = "soLuong")
	private int soLuong;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_id")
	private ProductEntity product;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="hoadon_id")
	private HoaDonEntity hoaDon;
	@Column(name = "tongtientunghang")
	private int tongTienTungHang;
	
	
	public int getTongTienTungHang() {
		return tongTienTungHang;
	}
	public void setTongTienTungHang(int tongTienTungHang) {
		this.tongTienTungHang = tongTienTungHang;
	}
	

	
	public HoaDonEntity getHoaDon() {
		return hoaDon;
	}
	public void setHoaDon(HoaDonEntity hoaDon) {
		this.hoaDon = hoaDon;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
	public ProductEntity getProduct() {
		return product;
	}
	public void setProduct(ProductEntity product) {
		this.product = product;
	}
	public Long getId() {
		return id;
	}
	
	public ChiTietHoaDonEntity() {
		
	}
	
}
