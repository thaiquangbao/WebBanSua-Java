<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ page import="com.suabot.until.SecurityUntil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="container" style="display: flex;">
        <div class="container1">
            <div class="checkout-form">
                <h2>Thông tin thanh toán</h2>
                <div>
                    <input type="hidden" id="username" value="<%=SecurityUntil.getPrincipal().getUsername() %>" name="name" class="form-control" disabled="disabled">
                    <div class="col">
                        <label >Họ và tên:</label>
                        <input type="text" id="name" value="${model.hoTen}" name="name" class="form-control" disabled="disabled">
                    </div>
    
                    <div class="col">
                        <label >Email:</label>
                        <input type="email" id="email" value="${model.email}" name="email" class="form-control" disabled="disabled">
                    </div>
                    
                    <div class="col">
                        <label >Số điện thoại:</label>
                        <input type="text" id="sdt" value="${model.sdt}" name="sdt" class="form-control" disabled="disabled">
                    </div>
                    <div class="col">
                        <label >Ngày thanh toán:</label>
                        <input id="date" name="date" readonly class="form-control"></input>
                    </div>
                    <div class="col">
                        <label >Địa chỉ giao hàng:</label>
                        <input id="address" name="address"class="form-control" ></input>
                    </div>
                   
                    <div class="col">
                        <label >Phương thức thanh toán:</label>
                        <select id="payment-method" name="payment-method" class="form-control">
                         <option value="tienmat">Tiền mặt</option>
                        <option value="credit-card">Thẻ tín dụng</option>
                        <option value="paypal">PayPal</option>
                    </select>
                   
                    </div>
                    <div class="col">
                        <label >Phương thức vận chuyển:</label>
                        <select id="vanChuyen" name="vanChuyen" class="form-control">
                        <option value="Tiết kiệm">Tiết kiệm</option>
                        <option value="Hỏa tốc">Hỏa tốc</option>
                        <option value="Nhanh">Nhanh</option>
                    </select>
                    </div>
                    <div class="col">
                        <label >Phí vận chuyển:</label>
                        <input disabled="disabled" id="phi" name="phi"class="form-control" value="50000"></input>
                    </div>
                </div>
            </div>
        </div>
        <div class="container2" style=" padding: 20px; width: 50%;float: right;">
            <table class="cart-table">
                <thead>
                    <tr>
                        <th class="product-thumbnail">Hình ảnh</th>
                        <th class="product-name">Sản phẩm</th>
                        <th class="product-price">Giá</th>
                        <th class="product-quantity">Số lượng</th>
                        <th class="product-subtotal">Tạm tính</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="listCart" items="${model.cartDTO}">
                	
	                    <tr class="cart-item">
	                        <td class="product-thumbnail">
	                            <img src="${listCart.getProductDTO().getImgP()}" style="width: 30px; height: 30px" alt="Sản phẩm 1" class="anhtt">
	                        </td>
	                        <td class="product-name">
	                            <span>${listCart.getProductDTO().getTenProduct()}</span> 
	                        </td>
	                        <td class="product-price"><span>${listCart.getProductDTO().getGia() }</span> VND </td>
	                        <td class="product-quantity">
	                        <span>${listCart.soLuongBuy}</span>
	                          
	                        </td>
	                        <td class="product-subtotal"><span>${listCart.tamTinh}</span> VND</td>
	                    </tr>
	                 
                  </c:forEach>
                    <!-- Các sản phẩm khác ở đây -->
                </tbody>
            </table>
            <div class="cart-totals">
               
              
                <div class="cart-total">
                    <span class="total-label">Tổng cộng:</span>
                    <span class="total-amount">${model.tongTien}</span>
                    <span class="total-label">VND</span>
                </div>
            </div>
            <div class="cart-actions">
                <button onclick="thanhToan()" class="checkout-button2" data-product="product3">Thanh toán</button>
            </div>
        </div>
    </div>
   

<script type="text/javascript">
    
    const currentDate = new Date().toISOString().split('T')[0];

        // Gán ngày hiện tại vào trường nhập ngày
        document.getElementById('date').value = currentDate;
        
    </script>  
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
    let phiVanChuyen = document.getElementById('phi').value;
    let vanchuyen = document.getElementById('vanChuyen');

vanchuyen.addEventListener('change', function() {
    let selectedOption = vanchuyen.value;

    let phiVanChuyen = document.getElementById('phi');
    
    if (selectedOption === 'Tiết kiệm') {
        phiVanChuyen.value = "50000";
    } else if (selectedOption === 'Hỏa tốc') {
        phiVanChuyen.value = "150000";
    } else {
        phiVanChuyen.value = "100000";
    }
});
});
    function thanhToan() {
        var diaChi = $('#address').val();
        if (diaChi.trim() === "") {
            alert("Vui lòng điền địa chỉ nhận hàng");
            return;
        }
        
        let username = $("#username").val()
        
        let hoten = $("#name").val()
        let email = $("#email").val()
        let phone = $("#sdt").val()
        let date = $("#date").val()
        let phiVanChuyen = document.getElementById('phi').value;
    let vanchuyen = document.getElementById('vanChuyen').value;
        let method = $("#payment-method").val()
       
       $.ajax({
        url: "/suabot/admin/thanhToan/"+username,
        type: 'POST',	
        contentType: 'application/json',
         data: JSON.stringify({
           email:email,
           phuongThucVanChuyen: vanchuyen,
          tenKhachHang:hoten,
           phone:phone,
           diaChiNhanHang:diaChi,
           phuongThucThanhToan:method,
           phiVanChuyen:phiVanChuyen,
           ngayThanhToan:date 
           }),
           
       })
       .then(data =>{
         alert('Thanh toán hóa đơn thành công, xin vui lòng chờ xác nhận từ bên của shop thông báo sẽ được gửi vào hộp thư gmail của bạn !!!');
         window.location.href='/suabot/admin/donhang';
       })
       .catch(error =>{
        alert("lỗi")
       })         
    }
</script>  
</body>
</html>