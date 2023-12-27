package com.suabot.entity;

import java.util.Date;
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
@Table(name = "hoadon")
public class HoaDonEntity extends BaseEntity{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "hoadon_id")
	private long id;
	@Column(name = "ngaydathang")
	private Date ngayDatHang;
	@Column(name = "trangthai")
	private String trangThai;
	@Column(name = "tongtien")
	private int tongTien;
	@Column(name = "phuongthucthanhtoan")
	private String phuongThucThanhToan;
	@Column(name = "phuongthucvc")
	private String phuongThucVC;
	@Column(name = "phivanchuyen")
	private int phivanchuyen;
	@Column(name = "diachinhanhang")
	private String diaChiNhanHang; 
	@Column(name ="tongtintatcasp")
	private int tongTinTatCaSP;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private UserEntity user;
	@OneToMany(mappedBy = "hoaDon")
	private List<ChiTietHoaDonEntity> chiTietHoaDones;
	public long getId() {
		return id;
	}
	
	public List<ChiTietHoaDonEntity> getChiTietHoaDones() {
		return chiTietHoaDones;
	}

	public void setChiTietHoaDones(List<ChiTietHoaDonEntity> chiTietHoaDones) {
		this.chiTietHoaDones = chiTietHoaDones;
	}

	public void setId(long id) {
		this.id = id;
	}
	public Date getNgayDatHang() {
		return ngayDatHang;
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
	
	public UserEntity getUser() {
		return user;
	}
	public void setUser(UserEntity user) {
		this.user = user;
	}
	
	public HoaDonEntity() {
		
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

	public String getPhuongThucVC() {
		return phuongThucVC;
	}
	public void setPhuongThucVC(String phuongThucVC) {
		this.phuongThucVC = phuongThucVC;
	}

	public int getPhivanchuyen() {
		return phivanchuyen;
	}

	public void setPhivanchuyen(int phivanchuyen) {
		this.phivanchuyen = phivanchuyen;
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
	
	
}
