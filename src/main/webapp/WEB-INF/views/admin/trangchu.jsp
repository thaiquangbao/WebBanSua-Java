<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>

</head>
<body>
	
	
	<div class="col-md-12">
		<div class="col-md-8">
			<div class="container">
				<div class="main">
					<br><img src="<c:url value='/template/img/dielac.jpg'/>" alt="" class="img-feature"
						width="100%" style="border-radius: 2px;">
					<div class="control next">
						<i class="fa-solid fa-arrow-right"></i>
					</div>
					<div class="control prev">
						<i class="fa-solid fa-arrow-left"></i>
					</div>
				</div>
				<div class="list-image">
					<br>
					<div class="active">
						<img src="<c:url value='/template/img/dielac.jpg' />" alt="">
					</div>
					<div>
					<img src="<c:url value='/template/img/2.png' />" alt="">
						
					</div>
					<div>
						<img src="<c:url value='/template/img/enfagrow.jpg' />" alt="">
					</div>
					<div>
						<img src="<c:url value='/template/img/ensure gold.jpg' /> " alt="">
					</div>
					<div>
						<img src="<c:url value='/template/img/grown plus.png' />" alt="">
					</div>
					<div>
						<img src="<c:url value='/template/img/optimun.jpg' />" alt="">
					</div>
					<div>
						<img src="<c:url value='/template/img/pedia.jpg' />" alt="">
					</div>
					<div>
						<img src="<c:url value='/template/img/similac.jpg' />" alt="">
					</div>
				</div>
			</div>

		</div>
		<div class="col-md-4">
			<div class="aside-top">
				<br>
				<h2 style="text-align: center; font-size: 35px;">Lời Giới Thiệu</h2>
				<p>Sữa bột là một sản phẩm sản xuất từ sữa ở dạng bột khô, được
					thực hiện bằng cách làm bốc hơi sữa để khô sau đó nghiền nhỏ, tán
					nhỏ thành bột. Một mục đích của sữa dạng bột khô này là phục vụ cho
					việc bảo quản, tích trữ, sử dụng. Sữa bột có thời hạn sử dụng lâu
					hơn hẳn so với sữa nước và không cần phải được làm lạnh, do bản
					thân nó đã có độ ẩm thấp.</p>
				<p>Đến vói SỮA TỐT CHO BÉ bạn sẽ được khám phá những sản phẩm
					Sữa Bột tốt nhất trên thị trường hiện nay</p>
				<p>Chào Mừng Đến Với SUATOTCHOBE.COM</p>
				<br>
				<br>
				<br>
			</div>
		</div>
	</div>
	<h2 style="text-align: center; font-size: 35px; margin-top: 10px;">SẢN
		PHẨM NỔI BẬT</h2>
	<div class="col-md-12" style="margin-left: 50px;">
		<div class="col-md-3">
			<br>
			<img src="<c:url value='/template/img/bannernoibat.png'/>" alt="" style="margin-left: 0 px; width: 350px; height: 600px">
		</div>
		<div class="col-md-9">
			<br>
			<br>
			<div class="col-md-12" style="display: flex; flex-wrap: wrap;">
			<c:forEach var="listSanPham" items="${model.listResult}">
				<div  class="formSP" data-id="${listSanPham.categoryID}" style="display: flex;width: 225px;background-color: #f1f1f136;margin: 10px 5px;padding: 10px 15px ; flex-direction: column; justify-content: center;align-items: center;">
					<div onclick="pick('${listSanPham.tenProduct}')" style="text-align: center;">
						
						<img src="${listSanPham.imgP}" class="anh"  alt="" width="75%" style="margin-bottom: 10px;">
							<div class="name-price" style="font-size: 15px; text-align: center;">
								<p style="width: 100%;" class="name" id="tenProduct" >${listSanPham.tenProduct}</p>
								<p  class="price" style="width: 100%;">Giá: <i class="gia">${listSanPham.gia}</i>  VND</p>
								
							</div>
					</div>
					<div style="display: flex;width: 100%; ">
						<button style="margin-left: 15px" class="btn-order" onclick="addGioHang('${listSanPham.id}','${listSanPham.imgP}','${listSanPham.tenProduct}','${listSanPham.gia}')"><i class='bx bx-cart-add' ></i> Thêm vào giỏ hàng</button>
					</div>
				</div>
				
			</c:forEach>
			<c:if test="${empty model.listResult}">
					<div style="text-align: center; margin-top: 150px; margin-left: 200px">		
						<h1>COMMING SOON !!!</h1>
					</div>	
				</c:if>
			</div>
		</div>
	</div>

	 <a name="khuyenmai">
		<div class="col-md-12" style="height: 100px;"></div>
	</a>

	<h2 style="text-align: center; font-size: 35px; margin-top: 10px;">SẢN
		PHẨM KHUYẾN MÃI</h2>
	<div class="col-md-12" style="margin-left: 50px;">
		<div class="col-md-3">
			<br>
			<img src="<c:url value='/template/img/top8/banner.jpg' />" alt="" style="margin-left: 0 px;">
		</div>
		<div class="col-md-9">
			<br>
			<br>
			<div class="col-md-12" style="display: flex; flex-wrap: wrap;">
				<c:forEach var="listSanPham1" items="${modelKM.listResult}">
					<div  class="formSP" data-id="${listSanPham1.categoryID}" style="display: flex;width: 225px;background-color: #f1f1f136;margin: 10px 5px;padding: 10px 15px ; flex-direction: column; justify-content: center;align-items: center;">
						<div onclick="pick('${listSanPham1.tenProduct}')" style="text-align: center; position: relative;">
							<img style="width: 85px; position:absolute; left: 120px; bottom: 130px;" src="<c:url value='/template/img/sale.png'/>" alt="">
							<img src="${listSanPham1.imgP}" class="anh"  alt="" width="75%" style="margin-bottom: 10px;">
							<div class="name-price" style="font-size: 15px; text-align: center;">
								<p style="width: 100%;" class="name" id="tenProduct" >${listSanPham1.tenProduct}</p>
								<p  class="price" style="width: 100%;">Giá: <i class="gia">${listSanPham1.gia}</i>  VND</p>
								
							</div>
						</div>
						<div style="display: flex;width: 100%; ">
							<button style="margin-left: 15px" class="btn-order" onclick="addGioHang('${listSanPham1.id}','${listSanPham1.imgP}','${listSanPham1.tenProduct}','${listSanPham1.gia}')"><i class='bx bx-cart-add' ></i> Thêm vào giỏ hàng</button>
						</div>
					</div>
			</c:forEach>
				<c:if test="${empty modelKM.listResult}">
					<div style="text-align: center; margin-top: 150px; margin-left: 200px">		
						<h1>COMMING SOON !!!</h1>
					</div>	
				</c:if>
			</div>
		</div>
	</div> 
	<div class="boxf "></div>
	<div class="col-md-12 ">
		<div class="quality ">
			<ul>
				<li style="border-right: 1px solid black;">
					<h3>CHĂM SÓC KHÁCH HÀNG</h3>
					<p>Đảm Bảo Chất Lượng</p>
					<p>Thời Gian Bảo Hành</p>
					<p>Chính Sách Bảo Hành</p>
					<p>Giới Thiệu Về Chúng Tôi</p>
				</li>
				<li style="border-right: 1px solid black;">
					<h3>PHƯƠNG THỨC THANH TOÁN</h3> <img src="<c:url value='/template/img/thanhtoan.png' /> "
					alt=" " width="91% ">
				</li>
				<li style="border-right: 1px solid black;">
					<h3>KẾT NỐI VỚI CHÚNG TÔI</h3> <img src="<c:url value='/template/img/ketnoivoichungtoi.png'/> " alt=" " width="88% ">
				</li>
				<li>
					<h3>PHƯƠNG THỨC VẬN CHUYỂN</h3> <img src="<c:url value='/template/img/vanchuyen.png' /> "
					alt=" " width="90% ">
				</li>
			</ul>
		</div>
	</div>
	<br>
	
	<script type="text/javascript">
	function pick(tenProduct) {
		window.location.href='/suabot/admin/sanpham/'+tenProduct;
	}
	</script>
<script type="text/javascript">
	function addGioHang(id,img,name,gia) {
		var soluong ="1";
		
		$.ajax({
			url:'/suabot/admin/gioHang/'+id,
			type: 'POST',
			contentType: 'application/json',
		    data: JSON.stringify({
		   	 tenProduct: name,
		   	soLuongMuonMua:soluong,
	        imgP:img,
	        gia:gia
	       
	    }),
	    dataType: 'json'
		}) 
		.then(data =>{
			if (data.errorMessage === 1) {
				alert('Sản phẩm đã tồn tại trong giỏ hàng')
			}
			else if(data.errorMessage === 0){
				alert('Thêm sản phẩm vào giỏ hàng thành công')
				window.location.href='/suabot/admin/giohang';
			}
            
			
			
		})
		.catch(error =>{
			alert('Thêm không thành công');
		}) 
	}
	function addGioHang1(id,img,name,gia) {
		var soluong ="1";
		
		$.ajax({
			url:'/suabot/admin/gioHang/'+id,
			type: 'POST',
			contentType: 'application/json',
		    data: JSON.stringify({
		   	 tenProduct: name,
		   	soLuongMuonMua:soluong,
	        imgP:img,
	        gia:gia
	       
	    }),
	    dataType: 'json'
		}) 
		.then(data =>{
			if (data.errorMessage === 1) {
				alert('Sản phẩm đã tồn tại trong giỏ hàng')
			}
			else if(data.errorMessage === 0){
				alert('Thêm sản phẩm vào giỏ hàng thành công')
				window.location.href='/suabot/admin/giohang';
			}
            
			
			
		})
		.catch(error =>{
			alert('Thêm không thành công');
		}) 
	}
</script>
</body>
</html>