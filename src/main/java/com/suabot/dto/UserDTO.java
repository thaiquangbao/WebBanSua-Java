package com.suabot.dto;


import java.util.Date;
import java.util.List;

public class UserDTO extends AbstractDTO<UserDTO>{
	private String userName;
	private String passWord;
	private int status;
	private String fullName;
	private List<RoleDTO> roles;
	private String email;
	private String diaChi;
	private String gioiTinh;
	private String phone;
	private Date dateOfBirth;
	private String avartar;
	private String role;
	private int countDonDaDat;
	
	public int getCountDonDaDat() {
		return countDonDaDat;
	}
	public void setCountDonDaDat(int countDonDaDat) {
		this.countDonDaDat = countDonDaDat;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getAvartar() {
		return avartar;
	}
	public void setAvartar(String avartar) {
		this.avartar = avartar;
	}
	public List<RoleDTO> getRoles() {
		return roles;
	}
	public void setRoles(List<RoleDTO> roles) {
		this.roles = roles;
	}
	public String getUserName() {
		return userName;
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
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public UserDTO() {
		
	}
	
	
}
