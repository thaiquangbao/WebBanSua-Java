<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="container-fluid body-table" >
        <div class="head" >
        <div style="margin-top: 30px; background-color: white;">
			      <h1 style="color: white">--------</h1>
        </div>
            <h1 style="text-align: center; ">Danh sách sản phẩm</h1>
            <div class="form-check" style="float: left; margin-bottom: 20px;">
                <input class="form-check-input" type="checkbox" style="width: 18px; height: 18px;" id="checkBox-all">
                <label class="form-check-label" for="checkBox-all" style="margin-left: 15px;">
                <p style="font-size: 18px">Chọn tất cả</p>
                    
                </label>
                <button  data-toggle="modal" onclick="deleteAll()" class="btn btn-primary disabled btn-deleteAll" data-target="#deleteAll-modal" style="margin-left: 15px" >Xóa tất cả</button>
            	<label class="form-check-label" for="checkBox-all" style="margin-left: 1000px;">
                	<button onclick="window.location.href='${sanphamAPI}'+'/listSanPham/trash'" style="font-size: 18px">Thùng rác</button>                  
                </label>
                <i id="deletedCount" style="font-size: 20px;color: red">(${count})</i>
            </div>
            
        </div>
        
        <div class="table-students" style="margin-top: 20px; margin-right: 20px;">
            <table class="table" >
                <thead class="thead-dark "  style="background-color: black; color: white">
                    <tr >
                    <th style="width: 50px;">Chọn</th>
                    <th scope="col" style="width: 50px; text-align: center;">#</th>
                    <th scope="col" style="width: 150px ; text-align: center;">
                        Tên khách hàng
                    </th>         
                    <th scope="col" style="width: 150px ;text-align: center;">
                       Phương thức thanh toán
                    </th>
                   
                     <th scope="col" style="width: 200px ;text-align: center;">
                        Số điện thoại
                    </th>   
                    <th scope="col" style="width: 200px ;text-align: center;">
                        Ngày đặt hàng
                    </th>  
                    <th scope="col" style="width: 100px ;text-align: center;">
                        Tổng tiền
                     </th> 
                    <th scope="col" style="width: 150px ; text-align: center;">
                        Trạng thái
                    </th>
                    
                    <th class="col" style=" width: 150px;text-align: center;  " >Chỉnh sửa</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="rowNumber" value="1" />
                    <c:forEach var="item" items="${model.listResult}">
                    <tr>
	                    <td>
	                        <div class="form-check">
	                            <input class="form-check-input" type="checkbox" name="productItem[]" value="${item.id}">
	
	                        </div>
	                    </td>
	                    <th scope="row" style="text-align: center;">${rowNumber}</th>
	                    <td style="text-align: center;font-size: 15px">${item.tenKhachHang}</td>
	                    <td style="text-align: center;font-size: 15px">${item.phuongThucThanhToan}</td>
	                    <td style="text-align: center;font-size: 15px">${item.phone}</td>
	                    <td style="text-align: center;font-size: 15px">${item.tongTien}</td>
	                    <td style="text-align: center;font-size: 15px">${item.trangThai}</td>
	                   
                    </tr>
                  <c:set var="rowNumber" value="${rowNumber + 1}"/>
                </c:forEach>
                </tbody>
            </table>
           		<c:if test="${empty model.listResult}">
					<div style="text-align: center;">		
						<p>Hiện tại chưa có đơn hàng nào :3</p>
					</div>	
				</c:if>
             <div class="inserthv" style="margin-top: 50px; text-align: center;">
                <a class="btn btn-primary"  href="<c:url value='/admin/sanpham/formAddSanPham' />" style="font-size: 18px; border-top: 30px;,height: 300px; width: 200px; text-align: center; background-color: chocolate; border-color: chocolate;">Thêm sản phẩm</a>
            </div>
        </div>
    </div>
</body>
</html>