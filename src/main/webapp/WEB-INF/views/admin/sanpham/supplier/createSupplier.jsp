<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>
<c:url var="supplierAPI" value="/admin/sanpham/nhacungcap"/>
<c:url var="reAPI" value='/admin/sanpham/nhacungcap'/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mt-4">
	<div style="color: white">---</div>
	<div style="text-align: center; "><h1>Form thêm nhà cung cấp</h1></div>
    <div class="form-write" style="justify-content: space-between;display: inline-flex;">
            <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                <div class="col">
                    <label for="tensupplier" >Tên nhà cung cấp</label>
                    <input type="text" class="form-control" id="tensupplier" name="tensupplier" style="width: 500px;">
                </div>
                <div class="col">
                    <label for="address" class="form-label">Địa chỉ</label>
                    <input type="text" class="form-control" id="address" name="address"  style="width: 500px;">
                </div>
                </div>
                <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                <div class="col">
                    <label for="phone" class="form-label">Số điện thoại</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="(+84)" style="width: 500px;">
                </div>
                <div class="col">
                    <label for="email" class="form-label">Email</label>
                    <input type="text" class="form-control" id="email" name="email"  style="width: 500px;">
                </div>
        </div>
        </div>
            <div class="them" style="text-align: center;">
                <button type="button" onclick="addSupplier()" class="btn btn-outline-success" style="width: 75%;margin-left:70px ;margin-top: 50px; background-color: green; color: white">Thêm</button>
            </div>
        
    

</div>

<script>
    function  addSupplier(){
        
        var name = $('#tensupplier').val();
        var address = $('#address').val();
        var sdt = $('#phone').val();
        var email = $('#email').val();
        const phoneRegex = /^\(\+84\)[0-9]{9}$/;
        var emailRegex = /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
        var supplierData = {
                tensupplier: name,
                address: address,
                phone: sdt,
                email: email
            };
       if(name.trim() === '' || address.trim() === '' ||sdt.trim() === '' || sdt === '(+84)' || email.trim() === '' ){
            alert('Điền đầy đủ thông tin')
            return;
        }
       else if(!phoneRegex.test(sdt.trim())){
    	   alert('Số điện thoại không hợp lệ. Vui lòng nhập theo định dạng (+84)123456789');
           return;
       }
       else if (name !== name.toUpperCase())
       {
            alert('Tên nhà cung cấp phải viết hoa toàn bộ')
            return;
       }
       else if(!emailRegex.test(email.trim())){
    	   alert('Email không hợp lệ')
    	   return;
       }
        $.ajax({
        	 url: '${supplierAPI}'+'/createSupplier',
        	 type: 'POST',
        	 contentType: 'application/json',
             data: JSON.stringify(supplierData),
             dataType: 'json',
             success: function (data) {
             	if(data.errorMessage === 1)
             	{
             		alert("Nhà cung cấp đã tồn tại");
             	}
             	else if(data.errorMessage === 2)
             	{
             		alert("Email đã tồn tại")
             	}
             	else{
             		alert("Thêm dữ liệu nhà cung cấp "+name+" thành công");
                    window.location.href = "${reAPI}";
             	}
             	
              },
             error: function (xhr, status, error) {
            		alert("Thêm dữ liệu nhà cung cấp không thành công" ); 
            	
              }
           
              
                
        })   
        
    }  

</script>

</body>
</html>