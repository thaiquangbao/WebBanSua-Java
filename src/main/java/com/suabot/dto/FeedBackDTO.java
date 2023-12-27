package com.suabot.dto;

import java.util.Date;

public class FeedBackDTO extends AbstractDTO<FeedBackDTO>{
	
	private String noiDung;
	private Date ngayGui;
	private String tieuDe;
	private long userID;
	private String userName;
	
	public String getTieuDe() {
		return tieuDe;
	}
	public void setTieuDe(String tieuDe) {
		this.tieuDe = tieuDe;
	}
	public String getNoiDung() {
		return noiDung;
	}
	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}
	public Date getNgayGui() {
		return ngayGui;
	}
	public void setNgayGui(Date ngayGui) {
		this.ngayGui = ngayGui;
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
	public FeedBackDTO() {
		
	}
	
	
}
