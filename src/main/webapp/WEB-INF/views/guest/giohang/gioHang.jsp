<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<!-- label, input, textarea, select {
    display: block;
    margin-bottom: 10px;
}

input, textarea, select {
    width: 600px;
    padding: 10px;
} -->
<body>
  
  <div style="width: 50px; color: white"  >ddddd</div>
    <div class="container">
        <div class="cart">
            <h2>Danh sách sản phẩm trong giỏ hàng</h2>
             <div style="margin-bottom: 30px;">
              <input type="text" class="search-box" id="searchInput" placeholder="Search..." style="margin-left: 1200px;height: 35px;" onchange="searchTable()">
                    <button class="search-button-id" style="width: 40px; height: 35px;" onclick="searchTable()">
                        <i class="fas fa-search"  ></i>
                    </button>
              </div>     
            <table class="cart-table" id="myTable">
                <thead>
                    <tr>
                        <th class="product-remove">Xóa</th>
                        <th class="product-thumbnail">Hình ảanh</th>
                        <th class="product-name">Sản phẩm</th>
                        <th class="product-price">Giá</th>
                        <th class="product-quantity">Số lượng</th>
                        <th class="product-subtotal">Tạm tính</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="model" items="${gioHang}">
                    <tr class="cart-item" id="form-cart">
                        <td class="product-remove">
                            <button onclick="deleteOne('${model.getProductDTO().getTenProduct()}')" id="delete" data-id="${item.id}" type="button" class="btn btn-link ">Xóa</button>
                        </td>
                        <td class="product-thumbnail">
                            <img class="anh" style="width: 80px; height: 80px"  src="${model.getProductDTO().getImgP()}" alt="Sản phẩm 1">
                        </td>
                        <td class="product-name ">
                            <span class="name-product">${model.getProductDTO().getTenProduct()}</span>
                            
                        </td>
                        <td class="product-price"><span class="gia">${model.getProductDTO().getGia() }</span> VND</td>
                        <td class="product-quantity">
                            <input class="txt-quantity" data-origin="${model.getProductDTO().getTenProduct()}" type="number" value="${model.soLuongBuy}" min="1">
                        </td>
                        <td class="product-subtotal">
                            <span class="tinh">${model.tamTinh}</span> VND
                        </td>
                    </tr>
                </c:forEach>
                    
                
                </tbody>
                
            </table>
            <c:if test="${empty gioHang}">
				<div style="text-align: center; margin-top: 100px; margin-left: 200px">		
                        <h1>Bạn chưa thêm sản phẩm nào vào giỏ hàng!!!</h1>
                    </div>
               
			</c:if>
             <div id="checkoutSection" style="display: flex;width: 100%;margin: 20px 0;flex-direction: column;align-items: end;">
                    <div style="display: flex; align-items: center;margin: 3px 0;">
                        <div class="cart-subtotal" style="width: 200px;">
                            <span class="subtotal-label">Tạm tính:</span>
                            <span class="subtotal-amount"></span> VND
                        </div>
                        <button style="background-color: blue;" class="update-cart">Cập nhật giỏ hàng</button>
                    </div>
                    <div style="display: flex; align-items: center;margin: 3px 0;">
                        <div class="cart-total" style="width: 200px;">
                            <span class="total-label">Tổng cộng:</span>
                            <span class="total-amount"></span> VND
                        </div>
                        <button style="background-color: green;" class="update-cart" onclick="thanhToan()"><div style="color: white;text-decoration: none;" class="checkout-button">Tiến hành thanh toán</div></button>
                    </div>
                </div>		
            
        </div>
    </div>
 <script type="text/javascript">
        function searchTable() {
   
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");

            
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td");
                for (var j = 0; j < td.length; j++) {
                    if (td[j]) {
                        txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                            break;
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
            }

     </script>
 <script type="text/javascript">
    window.onload = function() {
    var table = document.querySelector("table");
    var checkoutSection = document.getElementById("checkoutSection");

    if (table.rows.length <= 1) {
        checkoutSection.style.display = "none"; // Ẩn div khi bảng rỗng
    } else {
        checkoutSection.style.display = "flex"; // Hiển thị div khi bảng có dữ liệu
    }
    };
 	function deleteOne(tenProduct) {
 		var confirmation = confirm("Bạn muốn xóa sản phẩm này khỏi giỏ hàng không:<<");
	 	 if (confirmation) {
		$.ajax({
			url:'/suabot/admin/gioHang/deleteSP/'+tenProduct,
			type: 'POST',
			dataType: 'json'
		})
		.then(data =>{
			if (data.errorMessage === 0) {
				alert('Xóa sản phẩm thành công');
				window.location.reload();
			}
			else if(data.errorMessage === 1){
				alert('Không tìm thấy sản phẩm trong giỏ hàng của bạn')
				window.location.reload();
			}
		})
		.catch(error =>{
			alert('Xóa không thành công');
		})
	 	 }else{
	 		 window.location.reload();
	 	 }
	}
 </script>  
<script type="text/javascript">

const quantityInputs = document.querySelectorAll('input[type="number"]');
const subtotalAmounts = document.querySelectorAll('.tinh');
const giaElement = document.querySelectorAll('.gia');
const tamtinh = document.querySelector('.subtotal-amount');
let mang = []
quantityInputs.forEach((input, index) => {
let giaText = giaElement[index].textContent ; // Lấy nội dung của thẻ span
        let productPrice = parseFloat(giaText.split('.')[0]); // Chuyển đổi chuỗi thành số
        let quantity = parseInt(input.value);
        let total = quantity * productPrice ;
        subtotalAmounts[index].textContent = total;
        mang = []
        for (let i = 0; i<quantityInputs.length; i++) {
            mang.push({
                quantity : parseInt(quantityInputs[i].value),
                price : parseFloat(giaElement[i].textContent.split('.')[0])
            })
        }
        let tong = mang.reduce((total, current) => {
            return total + (current.quantity * current.price)
        }, 0)
        tamtinh.textContent = tong;
    });
document.addEventListener('DOMContentLoaded',function(){
// Sử dụng vòng lặp để lắng nghe sự kiện cho từng sản phẩm
quantityInputs.forEach((input, index) => {
    input.addEventListener('change', () => {
        let giaText = giaElement[index].textContent ; // Lấy nội dung của thẻ span
        let productPrice = parseFloat(giaText.split('.')[0]); // Chuyển đổi chuỗi thành số
        let quantity = parseInt(input.value);
        let total = quantity * productPrice ;
        subtotalAmounts[index].textContent = total;
        mang = []
        for (let i = 0; i<quantityInputs.length; i++) {
            mang.push({
                quantity : parseInt(quantityInputs[i].value),
                price : parseFloat(giaElement[i].textContent.split('.')[0])
            })
        }
        let tong = mang.reduce((total, current) => {
            return total + (current.quantity * current.price)
        }, 0)
        tamtinh.textContent = tong;
        
        
    });
    
 });
// function formatCurrency(amount) {
//     return amount.toLocaleString('en-US', { style: 'currency', currency: 'USD' });
// }
const updateCartButton = document.querySelector('.update-cart');

const totalamount = document.querySelector('.total-amount');
updateCartButton.addEventListener('click', function() {
    let tong = mang.reduce((total, current) => {
            return total + (current.quantity * current.price)
        }, 0)
    totalamount.textContent = tong;
     updateCartOnServer()
    
    });
    
    function updateCartOnServer() {
    const quantityInputs = document.querySelectorAll('.txt-quantity');
    const updatedCart = [];

    quantityInputs.forEach(input => {
        const productId = input.dataset.origin;
        const quantity = parseInt(input.value);

        updatedCart.push({
            tenProduct: productId ,
            soLuongBuy: quantity
        });

    });
    
    $.ajax({
        url: '/suabot/guest/updateCart',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(updatedCart),
        success: function(response) {
        	 if (response === '200') {
                 alert("Cập nhật thành công giỏ hàng");
             } else {
                 alert(response + " không đủ số lượng");
                 window.location.reload();
             } 
            
        },
        error: function(error) {
            alert('Cập nhật không thành công');
        }
    });
}




})
</script>
<script type="text/javascript">
function thanhToan() {
	 const totalamount = document.querySelector('.total-amount').textContent;
	 const tamtinh = document.querySelector('.subtotal-amount');
	 if(totalamount === ''){
		alert("Mời bạn nhấn vào cập nhật giỏ hàng để thanh toán!!!");
	 } 	
	 else if (totalamount !== tamtinh.textContent) {
		alert("Mời bạn nhấn vào cập nhật giỏ hàng để thanh toán!!!");
        
	 }
	 else{
	 	alert("Mời bạn đăng nhập để có thể thanh toán!!!")
	 	window.location.href="/suabot/guest/login";
	 }
    
    
}
</script>
    
</body>
</html>