package com.suabot.dto;



public class SupplierDTO extends AbstractDTO<SupplierDTO>{
	private String tensupplier;
	private String address;
	private String phone;
	private String email;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTensupplier() {
		return tensupplier;
	}
	public void setTensupplier(String tensupplier) {
		this.tensupplier = tensupplier;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	
}
