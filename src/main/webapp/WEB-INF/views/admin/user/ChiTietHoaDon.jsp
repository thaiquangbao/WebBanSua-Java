<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sữa bột</title>
</head>
<body>
	<div style="color: white;">----</div>
	<div class="invoice" >
    <h1 >Chi tiết hóa đơn</h1>
    <table class="invoice-table">
        <tr>
            <th>Username:</th>
            <td>${modelHD.userName}</td>
        </tr>
        <tr>
            <th>Họ và tên:</th>
            <td>${modelHD.tenKhachHang}</td>
        </tr>
        <tr>
            <th>Email:</th>
            <td>${modelHD.email}</td>
        </tr>
        <tr>
            <th>Số điện thoại:</th>
            <td>${modelHD.phone}</td>
        </tr>
        <tr>
            <th>Địa chỉ:</th>
            <td>${modelHD.diaChiNhanHang}</td>
        </tr>
        <tr>
            <th>Ngày đặt hàng:</th>
            <td id="dateS">${modelHD.ngayDatHang}</td>
        </tr>
         <tr>
            <th>Trạng thái:</th>
            <td>${modelHD.trangThai}</td>
        </tr>
        <tr>
            <th>Phương thức thanh toán:</th>
            <td>${modelHD.phuongThucThanhToan}</td>
        </tr>
        <tr>
            <th>Phí giao hàng:</th>
            <td>${modelHD.phiVanChuyen} VND</td>
        </tr>
        <tr>
            <th>Tổng đơn hàng</th>
            <td>${modelHD.tongTien} VND</td>
        </tr>
    </table>

    <h2>Danh sách sản phẩm:</h2>
    <table class="product-table">
    <thead>
        <tr>
            <th>STT</th>
            <th>Hình</th>
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>
            <th>Giá</th>
            <th>Tổng</th>
        </tr>
        </thead>
        <tbody>
        <c:set var="rowNumber" value="1" />
        <c:forEach var="chiTietHoaDon" items="${modelCTHD.listResult}">
        <tr>
        
            <td>${rowNumber}</td>
            <td style="width: 10%;"><img src="${chiTietHoaDon.imgP}" alt="" style="width: 60%;"></td>
            <td>${chiTietHoaDon.productName}</td>
            <td>${chiTietHoaDon.soLuong}</td>
            <td>${chiTietHoaDon.donGiaBan}</td>
            <td>${chiTietHoaDon.tongTienTungHang} VND</td>
        </tr>
        <c:set var="rowNumber" value="${rowNumber + 1}"/>
        </c:forEach>
		</tbody>
    </table>
    <h4 style="margin-left: 1000px">Tổng tiền các sản phẩm : ${modelHD.tongTinTatCaSP} VND</h4>
   
    </div>
    <script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
    var ds = document.getElementById("dateS");
    var dataS = ds.innerHTML;
		ds.innerHTML = convertDate(dataS);
	    
    });
	
	 function convertDate(date) {
			{
				 var parts = date.split(" ")[0];
				 return parts;
			}
		}
    </script>
</body>
</html>