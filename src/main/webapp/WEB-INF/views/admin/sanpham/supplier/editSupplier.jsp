<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>
<c:url var="supplierAPI" value="/admin/sanpham/nhacungcap"/>
<c:url var="checkAPI" value="/admin/sanpham"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mt-4">
	<div style="color: white">---</div>
	<div style="text-align: center; "><h1>Form cập nhật nhà cung cấp</h1></div>
    <div class="form-write" style="justify-content: space-between;display: inline-flex;">
            <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                <div class="col">
                    <label for="tensupplier" >Tên nhà cung cấp</label>
                    <input type="text" class="form-control" id="tensupplier" data-origin="${model.tensupplier}" name="tensupplier"  style="width: 500px;">
                </div>
                <div class="col">
                    <label for="address" class="form-label">Địa chỉ</label>
                    <input type="text" class="form-control" id="address" name="address" data-origin="${model.address}" style="width: 500px;">
                </div>
               </div>
               <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                <div class="col">
                    <label for="phone" class="form-label">Số điện thoại</label>
                    <input type="text" class="form-control" id="phone" name="phone" data-origin="${model.phone}"  style="width: 500px;">
                </div>
                <div class="col">
                    <label for="email" class="form-label">Email</label>
                    <input type="text" class="form-control" id="email" name="email" data-origin="${model.email}" style="width: 500px;">
                </div>
        	</div>
        	</div>
            <div class="them" style="text-align: center;">
                <button type="button" onclick="updateSupplier()" class="btn btn-outline-success" style="width: 80%;background-color: green;color:white;margin-left:40px ;margin-top: 50px;">Sửa</button>
            </div>
        
    

</div>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Lấy dữ liệu từ đối tượng model
        var model1 = {
        	tensupplier: "${model.tensupplier}",
        	address: "${model.address}",
       		phone: "${model.phone}",
        	email: "${model.email}",
        	
        }
        

        // Đặt giá trị cho các trường dữ liệu
        document.getElementById("tensupplier").value = model1.tensupplier;
        document.getElementById("address").value = model1.address;
        document.getElementById("phone").value = model1.phone;
        document.getElementById("email").value = model1.email;
    });
    
    function updateSupplier(){
    	  var name = $('#tensupplier').val();
          var address = $('#address').val();
          var sdt = $('#phone').val();
          var email = $('#email').val();
          const phoneRegex = /^\(\+84\)[0-9]{9}$/;
          var emailRegex = /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
          var checkTen = $('#tensupplier').data().origin;
          var checkAddress = $('#address').data().origin;
          var checkPhone = $('#phone').data().origin;
          var checkEmail = $('#email').data().origin;
          var supplierData = {
                  tensupplier: name,
                  address: address,
                  phone: sdt,
                  email: email
              };
         if(name === '' || address.trim() === '' ||sdt.trim() === '' || sdt === '(+84)' || email.trim() === '' ){
              alert('Điền đầy đủ thông tin')
              return;
          }
         else if(!phoneRegex.test(sdt.trim())){
      	   alert('Số điện thoại không hợp lệ. Vui lòng nhập theo định dạng (+84)123456789');
             return;
         }
         else if (name !== name.toUpperCase())
         {
              alert('Tên nhà cung cấp phải viết hoa toàn bộ');
              return;
         }
         else if(!emailRegex.test(email.trim())){
      	   alert('Email không hợp lệ');
      	   return;
         }
 		else if(name === checkTen && address === checkAddress && sdt === checkPhone && email === checkEmail){
        	 
        	 alert('Do bạn không thay đổi thông tin nào, nên không có dữ liệu nào được cập nhật');
        	 window.location.href = '${supplierAPI}';
        	
         }
 		else if(name !== checkTen)
 		{
 			$.ajax({
 				url : '${checkAPI}'+'/checkTen',
 				type:'POST',
           	 	contentType: 'application/json',
           	 	data: JSON.stringify({
           	 	 tensupplier: name
         	   
           		})
           		
                
 			})
 			.then(data => {
 				if(data.errorMessage === 1){
 					alert('Tên nhà cung cấp đã tồn tại');
 					window.location.reload();
 				}
 				else{
 					update();
 				}
             })
             .catch(error =>{
            	 console.log(error)
             })
 		}
 		else if(email !== checkEmail)
 		{
 			$.ajax({
 				url : '${checkAPI}'+'/checkEmail',
 				type:'POST',
           	 	contentType: 'application/json',
           	 	data: JSON.stringify({
           	 	 email: email
         	   
           		})
           		
                
 			})
 			.then(data => {
 				if(data.errorMessage === 2){
 					alert('Email đã tồn tại');
 				}
 				else{
 					update();
 				}
             })
             .catch(error =>{
            	 alert("Lỗi !!!");
             })
 		}
 		else{
 			update();
 		}
         function update() {
        	 $.ajax({
  				url : '${supplierAPI}'+'/'+${model.id}+'/edit',
  				type:'PUT',
            	 	contentType: 'application/json',
            	 	data: JSON.stringify({
            	 		tensupplier: name,
                	    address: address,
                	    phone: sdt,
                	    email: email
          	   
            		}),
            		dataType: 'json'
                 
  			})
  			.then(data => {
  				
  					alert("Cập nhật thành công");
  					window.location.href = '${supplierAPI}';
  				
              })
              .catch(error =>{
             	 alert(" Cập nhật dữ liệu không thành công");
              })
		}
         
        	
		
         
    }
</script>
</body>
</html>