<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.suabot.until.SecurityUntil" %>
<%@include file="/common/tablib.jsp"%>	
<style>
	 .dropdown {
	    position: relative;
	    display: inline-block;
	    color: white;
	    width: 160px;
	    font-size: 18px;
	    text-align: center;
	    
	    font-family: Arial, sans-serif;
	  }
	  
	  .dropdown-content {
	    display: none;
	    position: absolute;
	    background-color: #f9f9f9;
	    min-width: 160px;
	    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	    z-index: 1;
	    
	  }
	  
	  .dropdown:hover .dropdown-content {
	    display: block;
	    
	  }
	  
	  .dropdown-content a {
	    color: whitesmoke;
	    padding: 12px 16px;
	    text-decoration: none;
	    display: block;
	    background-color: black;
	  }
	  
	  .dropdown-content a:hover {
	    background-color: #f1f1f1;
	    color: black;
	  }
	  .profile-menu {
	  z-index: 1;
	  
	  font-size: 18px;
	  margin: 0;
	  font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
	  padding-left: 20px;
	  margin-left: 15px;
	  margin-bottom: 30px;
	  
	
	}
	
	.profile-menu .action {
	  display: block;
	  margin-top:15px;
	  font-style: normal;
	 text-align:center;
	  overflow: hidden;
	  cursor: pointer;
	  font-size: 18px;
	  
	}
	
	
	.profile-menu .menu {
	  width: 310px;
	  padding: 30px;
	  background-color: #222533;
	  border-radius: 10px;
	  position: absolute;
	  top: 60px;
	  right: 0px;
	  opacity: 0;
	  visibility: hidden;
	  transition: all 0.3s;
	}
	
	.profile-menu .menu.active {
	  opacity: 1;
	  visibility: visible;
	}
	
	.profile-menu .menu::before {
	  content: "";
	  width: 16px;
	  height: 16px;
	  background-color: #222533;
	  border-top-left-radius: 3px;
	  position: absolute;
	  top: -8px;
	  right: 19px;
	  transform: rotate(45deg);
	}
	
	.profile-menu .menu .profile {
	  display: flex;
	  align-items: center;
	  margin-bottom: 30px;
	}
	
	.profile-menu .menu .profile img {
	  width: 56px;
	  height: 56px;
	  border-radius: 50%;
	  user-select: none;
	}
	
	.profile-menu .menu .profile .info {
	  margin-left: 15px;
	}
	
	.profile-menu .menu .profile .info h2 {
	  color: #dadada;
	  font-size: 18px;
	  font-weight: 400;
	  text-transform: capitalize;
	  margin-bottom: 4px;
	}
	
	.profile-menu .menu .profile .info p {
	  color: #7d8193;
	  font-size: 16px;
	  font-weight: 400;
	}
	
	.profile-menu .menu .btn {
	  width: 250px;
	  height: 53px;
	  color: #e5e5e5;
	  background-color: #1a1c29;
	  border-radius: 5px;
	  font-size: 16px;
	  font-weight: 400;
	  text-decoration: none;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  margin-bottom: 30px;
	  transition: all 0.3s;
	}
	
	.profile-menu .menu .btn img {
	  width: 20px;
	  margin-right: 5px;
	  user-select: none;
	}
	
	.profile-menu .menu .btn:hover {
	  background-color: #292c3d;
	}
	
	.profile-menu .menu ul li {
	  list-style: none;
	  display: flex;
	  align-items: center;
	  margin-bottom: 20px;
	  margin-left: 0;
	}
	
	.profile-menu .menu ul li:last-child {
	  margin: 0;
	}
	
	.profile-menu .menu ul li a {
	  color: #e5e5e5;
	  font-size: 16px;
	  font-weight: 400;
	  text-decoration: none;
	}
	
	.profile-menu .menu ul li img {
	  width: 26px;
	  margin-right: 10px;
	  user-select: none;
	}
.cart {
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 20px;
    margin-top: 20px;
}

.cart h2 {
    text-align: center;
    color: #333;
}

.cart-table {
    width: 100%;
    border-collapse: collapse;
}

.cart-table th, .cart-table td {
    padding: 10px;
    text-align: center;
}

.cart-table th {
    background-color: #333;
    color: #fff;
}

.cart-table th.product-remove,
.cart-table th.product-thumbnail,
.cart-table th.product-name,
.cart-table th.product-price,
.cart-table th.product-quantity,
.cart-table th.product-subtotal {
    text-align: center;
}

.cart-item {
    border-bottom: 1px solid #ddd;
}

.cart-item:last-child {
    border-bottom: none;
}

.cart-totals {
    text-align: right;
}
.container1 {
    padding: 20px;
    width: 50%;
    float: left;
}
input[type="text"],
input[type="email"],
input[type="sdt"],
textarea,
.cart-subtotal .subtotal-label, .cart-total .total-label {
    font-weight: bold;
}

.cart-subtotal .subtotal-amount, .cart-total .total-amount {
    font-weight: bold;
}

.cart-actions {
    text-align: right;
    margin-top: 20px;
}

.update-cart {
    height: 40px;
    font-size: 16px;
    border-radius: 5px;
    border: 0;
    width: 250px;
    padding: 0;
    color: white;
    cursor: pointer;
    margin-left: 20px;
}


.checkout-form {
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 20px;
}

.checkout-form h2 {
    text-align: center;
    color: #333;
}
.hovaten,.email,.sdt,.adress,.pay {
    margin-bottom: 20px;
}

.checkout-button2 {
    background-color: #4CAF50;
    color: #fff;
    padding: 10px 20px;
    text-decoration: none;
    border: none;
    cursor: pointer;
    float: right;
}
.anhtt{
    width: 20%;
    height: 20%;
}
.modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }
.modal-content1 {
            background-color: #fff;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            border: 1px solid #ddd;
            text-align: center;
        }
.chonsoluong{
   display: flex;
}
.cart-badge {
            position: absolute;
            top: 0;
            right: 0;
            background-color: red;
            color: white;
            padding: 0.3em 0.5em;
            border-radius: 50%;
            margin-left: 50px;
            font-size:0.8em;
        }
 .feedback-container {
  width: 600px; 
  margin: 50px auto;
  background-color: #fff;
  padding: 40px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
  margin-top: 200px;
}



.form-feedback {
  display: flex;
  flex-direction: column;
}

.label-feedbac {
  margin-top: 15px;
  color: #555;
}

.input-feedback {
  padding: 15px;
  margin: 10px 0 20px 0;
  border: 1px solid #ccc;
  border-radius: 6px;
}

.submit-feedback{
  background-color: #4caf50;
  color: #fff;
  cursor: pointer;
  padding: 15px;
  border: none;
  border-radius: 6px;
  font-size: 16px;
  transition: background-color 0.3s ease;
}




.modal-feedback{
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 1000;
}

.modal-content-feedback{
    background-color: #fff;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 20px;
    border: none;
    text-align: center;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    border-radius: 10px;
}

.modal-header-feedback{
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
}

.modal-header-feedback h3 {
    margin: 0;
    font-size: 24px;
}

.close-button-feedback{
    background: none;
    border: none;
    font-size: 24px;
    cursor: pointer;
    color: #aaa;
}

.close-button-feedback:hover {
    color: #333;
}

.modal-body-feedback{
    padding: 20px;
    font-size: 18px;
}
 .custom-box {
    width: 300px;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    background-color: #fff;
    text-align: center;
    margin-bottom: 20px;
}

.box-header {
    background-color: #e9d95f;
    padding: 10px;
    border-bottom: 1px solid #ccc;
    border-radius: 10px;
}

.product-links 	 {
    display: flex;
    flex-direction: column; 
	padding: 20px;
}
.invoice {
        width: 90%;
        margin: 0 auto;
        border: 1px solid #ccc;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}
.invoice h1 {
        text-align: center;
        font-size: 24px;
        color: #333;
        margin-bottom: 20px;
 }
.invoice-table {
        width: 100%;
        border-collapse: collapse;
}
.invoice-table th, .invoice-table td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: left;
}
.invoice-table th {
        background-color: #f2f2f2;
        color: #333;
        width: 20%;
}
.invoice-table td {
        background-color: #fff;
        color: #666;
}
.product-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
       
}
.product-table th, .product-table td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: left;
        text-align: center;
}
.product-table th {
        background-color: #74b9ff;
        color: #333;
        text-align: center;
}
.product-table td {
        background-color: #fff;
        color: #666;
}
.confirm-button {
            display: block;
            margin-top: 20px;
            padding: 10px;
            width: 10%;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
}
 .navbar-item .action {
  display: block;
  font-style: normal;
  overflow: hidden;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  color: aliceblue;
  font-size: 18px;
}

.profile-menu {
  z-index: 2;
}

.profile-menu .menu {
  width: 310px;
  padding: 30px;
  background-color: #222533;
  border-radius: 10px;
  position: absolute;
  top: 37px;
  right: 0px;
  opacity: 0;
  visibility: hidden;
  transition: all 0.3s;
}

.profile-menu .menu::before {
  content: "";
  width: 16px;
  height: 16px;
  background-color: #222533;
  border-top-left-radius: 3px;
  position: absolute;
  top: -8px;
  right: 19px;
  transform: rotate(45deg);
}

.profile-menu .menu .profile {
  display: flex;
  align-items: center;
  margin-bottom: 30px;
}

.profile-menu .menu .profile img {
  width: 56px;
  height: 56px;
  border-radius: 50%;
  user-select: none;
}

.profile-menu .menu .profile .info {
  margin-left: 15px;
}

.profile-menu .menu .profile .info h2 {
  color: #dadada;
  font-size: 18px;
  font-weight: 400;
  text-transform: capitalize;
  margin-bottom: 4px;
}

.profile-menu .menu .profile .info p {
  color: #7d8193;
  font-size: 16px;
  font-weight: 400;
}

.profile-menu .menu .btn {
  width: 250px;
  height: 53px;
  color: #e5e5e5;
  background-color: #1a1c29;
  border-radius: 5px;
  font-size: 16px;
  font-weight: 400;
  text-decoration: none;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 30px;
  transition: all 0.3s;
}

.profile-menu .menu .btn img {
  width: 20px;
  margin-right: 5px;
  user-select: none;
}

.profile-menu .menu .btn:hover {
  background-color: #292c3d;
}

.profile-menu .menu ul li {
  list-style: none;
  display: flex;
  align-items: center;
  margin-bottom: 20px;
  margin-left: 0;
}

.profile-menu .menu ul li:last-child {
  margin: 0;
}

.profile-menu .menu ul li a {
  color: #e5e5e5;
  font-size: 16px;
  font-weight: 400;
  text-decoration: none;
}

.profile-menu .menu ul li img {
  width: 26px;
  margin-right: 10px;
  user-select: none;
}

.name-price {
  display: flex;
  flex-direction: column;
  align-items: start;
  font-family: 'Poppins', sans-serif;
  width: 100%;
  padding: 0 10px;
}

.name-price .name{
  font-size: 16px;
  line-height: 15px;
}

.name-price .price{
  font-size: 15px;
  line-height: 15px;
  font-weight: bold;
}

.btn-order {
  font-size: 14px;
  border-radius: 5px;
  border: 0;
  padding: 5px 25px;
  background-color: #f17575;
  color: white;
}
</style>
<div class="col-md-12">
<img style="position:absolute ;width: 150px" src="https://res.cloudinary.com/dk41ftplg/image/upload/v1700458938/Teach-Node/dd1laejnh3gvf67obnd6.png" />
	<img src="<c:url value='/template/img/header.png'/>" alt=""
		width="100%">
</div>
<div class="col-md-12">
	<nav class=" bg-info navbar-collapse" style="background-color: black;">
		<ul class="navbar-nav nav">
			<li class="navbar-item" ><a
				href="<c:url value='/trang-chu'/>" class="navbar-link">TRANG
					CHỦ</a></li>
			
			<li class="navbar-item " style="width: 130px; text-align: center;">
			    <a class="nav-link "  href="<c:url value='/sanpham'/>" style="text-align: center;width: 160px">SẢN PHẨM</a>
			   
			  </li>
			
			<li class="navbar-item" style="width: 130px; text-align: center;" ><a href="#lienhe" class="navbar-link">LIÊN
					HỆ</a></li>
			<li class="navbar-item"><a href="<c:url value='/trang-chu#khuyenmai'/>"style="text-align: center;width: 160px" class="navbar-link">KHUYẾN
					MÃI</a></li>
			
			
			<li class="profile-menu">
	              <div class="action"onmouseover="document.querySelector('.profile-menu .menu').style.visibility = 'visible'
              document.querySelector('.profile-menu .menu').style.opacity = 1"
              onmouseout="document.querySelector('.profile-menu .menu').style.visibility = 'hidden'
              document.querySelector('.profile-menu .menu').style.opacity = 0" style="margin-top: 18px;">
	               <a class="navbar-link" ><%=SecurityUntil.getPrincipal().getFullName() %></a>
	                        
	                 <div class="menu" style="margin-top: 20px">
	                     <div class="profile">
	                         <img src='<c:url value="<%=SecurityUntil.getPrincipal().getAvatar() %>" />' />
	                          <div class="info">
	                              <h2><%=SecurityUntil.getPrincipal().getFullName() %></h2>
	                          </div>
	                       </div>
	                            
	                        <ul>
	                            <li>
	                                <img src="<c:url value='/template/img/user/edit.png'/>" />
	                                <a href="/suabot/General/<%=SecurityUntil.getPrincipal().getUsername() %>">Thông tin cá nhân</a>
	                              </li>
	                              <li>
	                                <img src="<c:url value='/template/img/user/shopping-cart.png'/> "/>
	                                <a href="/suabot/hoaDon/hoaDonDaDat/<%=SecurityUntil.getPrincipal().getUsername() %>">Các đơn đã mua</a>
	                              </li>
	                              <li>
	                                <img src="<c:url value='/template/img/user/feedback.png '/> "/>
	                                <a href="/suabot/feedback/<%=SecurityUntil.getPrincipal().getUsername() %>">Phản hồi sản phẩm</a>
	                              </li>
	                             
	                              <li>
	                                <img src="<c:url value='/template/img/user/logout.png' /> "/>
	                                <a href="<c:url value='/logout'/>">Đăng xuất</a>
	                            </li>
	                        </ul>
	                </div>   
            </div>   
         </li>
			<li class="navbar-item" style="text-align: center;">
				<a href="/suabot/giohang" class="navbar-link" id="cart-icon" style="width:100px;">
				<i class="fas fa-shopping-cart" style="width: 25px;height: 20px;"></i>
				
				</a>
			</li> 	
			
		</ul>
	</nav>
</div>

<script type="text/javascript">
//Lắng nghe sự kiện khi người dùng nhấp vào thẻ a trong dropdown
document.addEventListener("DOMContentLoaded", function () {
	$(document).ready(function () {
		  $(".action").on("click", function () {
		    $(".menu").toggleClass("active");
		  });
		});

    const dropdownItems = document.querySelectorAll(".dropdown-item");
    dropdownItems.forEach(function (item) {
        item.addEventListener("click", function (event) {
            event.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ a

            const target = this.getAttribute("href"); // Lấy giá trị href của thẻ a
            navigateToProductPage(target); // Chuyển hướng và nhảy xuống vị trí sản phẩm được chọn
        });
    });
});

// Hàm thực hiện chuyển hướng và nhảy xuống vị trí sản phẩm
function navigateToProductPage(target) {
    const productPageUrl = "http://localhost:8080/suabot/sanpham";
    const productAnchorUrl = "http://localhost:8080/suabot/sanpham" + target;

    // Chuyển hướng đến trang sản phẩm
    window.location.href = productAnchorUrl;

    // Đợi một chút trước khi nhảy xuống vị trí sản phẩm
    setTimeout(function () {
        // Tính toán vị trí Y của sản phẩm để nhảy đến
        const productElement = document.querySelector(target);
        if (productElement) {
            const yOffset = productElement.getBoundingClientRect().top + window.scrollY;
            window.scrollTo({ top: yOffset, behavior: "smooth" });
        }
    }, 1000); // Đợi 1 giây trước khi nhảy xuống
}
</script>