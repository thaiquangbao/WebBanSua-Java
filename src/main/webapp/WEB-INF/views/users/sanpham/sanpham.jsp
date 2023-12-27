<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sữa bột</title>
</head>
<body>
	<div class="col-md-12">
		<div class="col-md-7">
		<div class="container">
			<div class="main">
				<br> <img src="<c:url value='/template/img/dielac.jpg'/>"
					alt="" class="img-feature" width="100%" style="border-radius: 2px;">
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
					<img src="<c:url value='/template/img/dielac.jpg'/>" alt="">
				</div>
				<div>
					<img src="<c:url value='/template/img/2.png'/>" alt="">
				</div>
				<div>
					<img src="<c:url value='/template/img/enfagrow.jpg'/>" alt="">
				</div>
				<div>
					<img src="<c:url value='/template/img/ensure gold.jpg' />" alt="">
				</div>
				<div>
					<img src="<c:url value='/template/img/grown plus.png '/>" alt="">
				</div>
				<div>
					<img src="<c:url value='/template/img/optimun.jpg'/>" alt="">
				</div>
				<div>
					<img src="<c:url value='/template/img/pedia.jpg '/>" alt="">
				</div>
				<div>
					<img src="<c:url value='/template/img/similac.jpg'/>" alt="">
				</div>
			</div>
		</div>
		</div>
		<div class="col-md-4" style="margin-left:80px;margin-top: 38px; ">
		  <div class="custom-box" style="width: 400px;">
			<div class="box-header">
				<h2 style=" font-family: 'Roboto', sans-serif;
				font-size: 25px;
				font-weight: 700;
				color: #2c3e50;
				text-align: center;
				margin-bottom: 20px;
				letter-spacing: 1px; 
				text-transform: uppercase; 
				text-shadow: 2px 2px 4px rgba(3, 232, 53, 0.2); ">Nhóm sản phẩm</h2>
			</div>
			
			<div class="product-links">
			<c:forEach var="listCate" items="${listProductByCate}">	
				<a href="#${listCate.cate_name}" style="font-size:25px;font-weight:100px;text-decoration: none;color: #000;">${listCate.cate_name} </a><br>
				
			</c:forEach>	
			</div>
		</div>
	</div>
	</div>
	
	<div class="col-md-12" style="margin-top: 50px;"></div>
	<h2
		style="text-align: center; font-size: 35px; margin-top: 10px; border-bottom: 2px solid black;">
		DANH MỤC SẢN PHẨM <br> <br>
	</h2>

	<c:forEach var="listCate" items="${listProductByCate}">
	<div class="col-md-12" style="margin-left: 50px;">
		<div class="bo1"></div>
		<div class="tensua">
			<div class="bo">
				<a name="optimum"></a>
			</div>
			<h2 class="cateName" style="margin-left: 33px; color: black; text-align: center;" id="${listCate.cate_name}">${listCate.cate_name}</h2>
		</div>

		<div class="col-md-3">
			<br> <img
				src="${listCate.cate_banner}"
				alt="" width="100%" style="border-radius: 30px;">
		</div>
		<div class="col-md-9">
			<br> <br>
			<div class="col-md-12" style="display: flex; flex-wrap: wrap;">
				<c:forEach var="listSanPham" items="${listCate.list_product}">
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
					<c:if test="${empty listCate.list_product}">
						<div style="text-align: center; margin-top: 200px; margin-left: 200px">		
							<h1>COMMING SOON !!!</h1>
						</div>	
		</c:if>
					
				</div>
		</div>
	</div>
	</c:forEach>
	
  <script type="text/javascript">
var cateNames = document.querySelectorAll('.cateName');
var formSPs = document.querySelectorAll('.formSP');
function pick(tenProduct) {
	window.location.href='/suabot/sanpham/'+tenProduct;
}

</script>	 
<script type="text/javascript">
function addGioHang(id,img,name,gia) {
    		var soluong ="1";
    		
    		$.ajax({
    			url:'/suabot/gioHang/'+id,
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
    				window.location.href='/suabot/giohang';
    			}
                
    			
    			
    		})
    		.catch(error =>{
    			alert('Thêm không thành công');
    		}) 
    	}

</script>
	
	
	
	


</body>
</html>