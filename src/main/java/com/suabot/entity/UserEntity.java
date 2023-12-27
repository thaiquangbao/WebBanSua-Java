package com.suabot.entity;



import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class UserEntity extends BaseEntity{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private Long id;
	@Column(name = "username")
	private String userName;
	@Column(name = "password")
	private String passWord;
	@Column(name = "status")
	private int status;
	@Column(name = "fullname")
	private String fullName;
	@Column(name="email")
	private String email;
	@Column(name = "diachi")
	private String diaChi;
	@Column(name = "gioitinh")
	private String gioiTinh;
	@Column(name = "phone")
	private String phone;
	@Column(name = "dateofbirth")
	private Date dateOfBirth;
	@Column(name = "avatar",columnDefinition = "TEXT")
	private String avatar;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "user_role", joinColumns = @javax.persistence.JoinColumn(name = "user_id"),
	  inverseJoinColumns = @javax.persistence.JoinColumn(name = "role_id"))
	private List<RoleEntity> roles = new ArrayList<>();
	@OneToMany(mappedBy = "user")
	private List<FeedBackEntity> fEntities = new ArrayList<>();
	@OneToMany(mappedBy = "user")
	private List<HoaDonEntity> hoaDons;
	
	public List<HoaDonEntity> getHoaDons() {
		return hoaDons;
	}
	public void setHoaDons(List<HoaDonEntity> hoaDons) {
		this.hoaDons = hoaDons;
	}
	public List<FeedBackEntity> getfEntities() {
		return fEntities;
	}
	public void setfEntities(List<FeedBackEntity> fEntities) {
		this.fEntities = fEntities;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public List<RoleEntity> getRoles() {
		return roles;
	}
	public void setRoles(List<RoleEntity> roles) {
		this.roles = roles;
	}
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public Long getId() {
		return id;
	}
	public UserEntity() {
		
	}
	
	
	
	
}
