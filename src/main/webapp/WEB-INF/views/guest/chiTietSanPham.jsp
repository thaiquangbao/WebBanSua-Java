<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sữa bột</title>
</head>
<body>
	<div class="row">
        <div class="col-md-12">
         <div class="col-md-3">
          <img src="${modelProduct.imgP}"
           alt="" id="anh" style="margin-left: 60px; margin-top: 50px;" width="80%">
         </div>
         <div class="col-md-5">
          <h2 id="tenProduct">${modelProduct.tenProduct}</h2>
          <p>Đã Bán ${modelProduct.daBan} Sản Phẩm</p>

          <p style="border-bottom: 1px solid gray; margin-right: 30px;"></p>
          <p>ĐỘ TUỔI : Cho Bé từ ${modelProduct.doTuoiSuDung} tuổi</p>
          <p>TRỌNG LƯỢNG : ${modelProduct.trongLuong}g</p>
          <p>Số lượng sản phẩm còn lại : ${modelProduct.soLuong} sản phẩm</p>
          <p style="border-bottom: 1px solid gray; margin-right: 30px;"></p>
          <div id="moTaDis" hidden="true" data-id= "${modelProduct.discountID}">
	          <p style="color: red">Khuyến mãi ${modelProduct.discountName}</p>
	         <p style="color: red">${modelProduct.motaDiscount}</p>
	         <p style="color: red">Ngày bắt đầu: <span id="dateS">${modelProduct.dateStart}</span></p>
	         <p style="color: red">Ngày kết thức: <span id="dateE">${modelProduct.dateEnd}</span></p>
	         <p style="border-bottom: 1px solid gray; margin-right: 30px;"></p>
          </div>
          
          <p style="font-size: 20px; " >Giá: <span id="gia">${modelProduct.gia}</span> VND</p>
         <div class="chonsoluong">
	          <p style="font-size: 20px; margin-right: 0px;">Số Lượng : <i style="color: white">--</i>    </p> 
	         <button id="giamsl" onclick="giamsl()" style="border:  none;background-color: white"  >
	        	 <i class="fa-solid fa-arrow-left" style="margin-right: 10px;margin-top: 5px;"></i>
	         </button> 
	         <span id="pageNumber" style="margin-right: 5px; margin-top: 1px">1</span>
	         <button id="tangsl" onclick="tangsl()" style="border:  none;background-color: white;" >
	         <i class="fa-solid fa-arrow-right" style="margin-left: 10px; margin-top: 5px;"></i>
	         </button>
         
           </div>
          <div class="couplebutton" style=" display: flex;">
            <button onclick="addGioHang()" style="background-color: rgb(240, 84, 84); border-radius: 5px; width: 300px;height: 50px;  text-align: CENTER;color: white;border: 0;margin: 0 10px;">
                <i class="fa-solid fa-money-check-dollar" style="margin-right: 10px; "></i>MUA NGAY
            </button>
        </div>           
         </div>
         <div class="col-md-4">
          <div class="sectionmini1">
           <h3>CAM KẾT DỊCH VỤ</h3>
           <br>
           <p>
            <i class="fa-regular fa-gem" style="margin-right: 10px;"></i>Cam
            Kết 100% Hàng Chính Hãng
           </p>
           <p>
            <i class="fa-solid fa-truck-fast" style="margin-right: 10px;"></i>Vận
            Chuyển Toàn Quốc. Miễn Phí TPHCM
           </p>
           <p>
            <i class="fa-regular fa-hourglass" style="margin-right: 10px;"></i>Hoản
            Trả Miễn Phí Trong 7 Ngày
           </p>
          </div>
          <br>
          <div class="sectionmini2">
           <img src="<c:url value='/template/img/mienphigiaohang.jpg'/>"
            alt="" height="95%" style="border-radius: 30px;">
          </div>
         </div>
        </div>
       </div>
       <div class="col-md-12">
        <div class="col-md-9">
         <h3 style="font-size: 35px;">Thông Tin Chi Tiết</h3>
         
         <p>${modelProduct.moTa}</p>
      
         <h3 style="font-size: 35px;">Hướng dẫn sử dụng</h3>
         <p>
          ${modelProduct.huongDanSuDung}
         </p>
        </div>
      
       
       </div>
       <script type="text/javascript">
       
       var ds = document.getElementById("dateS");
	   	var de = document.getElementById("dateE");
	   	
	   	    var dataS = ds.innerHTML;
	   	    ds.innerHTML = convertDate(dataS);
	   	    var dataE = de.innerHTML;
	   	    de.innerHTML = convertDate(dataE);
	   	
	   	
	   	 function convertDate(date) {
	   			{
   				 var parts = date.split(" ")[0];
   				 return parts;
   			}
   		}
       </script>
       <script type="text/javascript">
        var moTaDisElement = document.getElementById("moTaDis");
           var dataIdValue = moTaDisElement.getAttribute("data-id");
		
          	if (dataIdValue !== "0") {
               moTaDisElement.removeAttribute("hidden");
           }
          
       </script>
       <script type="text/javascript">
       
           
      
      
       var pageNumberElement = document.getElementById("pageNumber");
       var pageNumber = 1;

       function tangsl() {
           pageNumber++;
           updatePageNumber();
       }

       function giamsl() {
           if (pageNumber > 1) {
               pageNumber--;
               updatePageNumber();
           }
       }
       function updatePageNumber(){
           pageNumberElement.textContent = pageNumber;
       }
       function addGioHang() {
		var  nameProduct = $('#tenProduct').text();
		var soluong = pageNumberElement.textContent;
		var anh = $('#anh').attr("src");
		var price = $('#gia').text();
		
		$.ajax({
			url:'/suabot/guest/gioHang/'+${modelProduct.id},
			type: 'POST',
			contentType: 'application/json',
		    data: JSON.stringify({
		   	 tenProduct: nameProduct,
		   	soLuongMuonMua:soluong,
	        imgP:anh,
	        gia:price
	       
	    }),
	    dataType: 'json'
		}) 
		.then(data =>{
			if (data.errorMessage === 1) {
				alert('Sản phẩm đã tồn tại trong giỏ hàng')
			}
			else if(data.errorMessage === 0){
				alert('Thêm sản phẩm vào giỏ hàng thành công')
				window.location.href='/suabot/guest/giohang';
			}
		})
		.catch(error =>{
			alert('Thêm không thành công');
		}) 
	} 

       
       </script>
</body>
</html>