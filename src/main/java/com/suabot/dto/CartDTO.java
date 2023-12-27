package com.suabot.dto;

public class CartDTO extends AbstractDTO<CartDTO>{
	private ProductDTO productDTO;
	private int tamTinh; 
	private int tongCong;
	private int soLuongBuy;
	private int tongTamTinh;
	private String tenProduct;
	
	
	public String getTenProduct() {
		return tenProduct;
	}
	public void setTenProduct(String tenProduct) {
		this.tenProduct = tenProduct;
	}
	
	public int getSoLuongBuy() {
		return soLuongBuy;
	}
	public void setSoLuongBuy(int soLuongBuy) {
		this.soLuongBuy = soLuongBuy;
	}
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
	
	public int getTamTinh() {
		return tamTinh;
	}
	public void setTamTinh(int tamTinh) {
		this.tamTinh = tamTinh;
	}
	public int getTongCong() {
		return tongCong;
	}
	public void setTongCong(int tongCong) {
		this.tongCong = tongCong;
	}
	public int getTongTamTinh() {
		return tongTamTinh;
	}
	public void setTongTamTinh(int tongTamTinh) {
		this.tongTamTinh = tongTamTinh;
	}
	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CartDTO(ProductDTO productDTO, int tamTinh, int soLuongBuy) {
		super();
		this.productDTO = productDTO;
		this.tamTinh = tamTinh;
		this.soLuongBuy = soLuongBuy;
	}
	
	public CartDTO(ProductDTO productDTO, int tamTinh, int tongCong, int soLuongBuy, int tongTamTinh) {
		super();
		this.productDTO = productDTO;
		this.tamTinh = tamTinh;
		this.tongCong = tongCong;
		this.soLuongBuy = soLuongBuy;
		this.tongTamTinh = tongTamTinh;
	}
	@Override
	public String toString() {
		return "CartDTO [productDTO=" + productDTO + ", tamTinh=" + tamTinh + ", tongCong=" + tongCong + ", soLuongBuy="
				+ soLuongBuy + ", tongTamTinh=" + tongTamTinh + "]";
	}
	public CartDTO(ProductDTO productDTO, int tamTinh, int tongCong, int soLuongBuy) {
		super();
		this.productDTO = productDTO;
		this.tamTinh = tamTinh;
		this.tongCong = tongCong;
		this.soLuongBuy = soLuongBuy;
	}
	
	
	
}
