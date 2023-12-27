<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>
<c:url var="userAPI" value="/guest/signup/create"/>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sữa bột</title>

</head>

<body>
	<div class="modal-dialog " style="margin-top: 500px;  ">
		<div class="modal-content ">
			<div class="modal-header ">
				<h2 style="text-align: center; ">Đăng Ký</h2>
			</div>
			<div class="modal-body ">
				<div class="container ">
                        	<div class="form-group">
	                            <label for="Fullname">Họ và Tên</label>
	                            <input type="text" name="fullName" id="fullName" class="form-control" style="width: 500px;" >
                        	</div>
                           	<div class="form-group">
	                            <label for="user">Tên đăng nhập</label>
	                            <input type="text" name="userName" id="userName" class="form-control" style="width: 500px;">
                        	</div>
                        	<div class="form-group">
	                            <label for="password">Mật khẩu</label>
	                            <input type="password" name="passWord" id="passWord" class="form-control" style="width: 500px;">
                        	</div>
                        	<div class="form-group">
	                            <label for="password">Nhập lại mật khẩu</label>
	                            <input type="password" id="rematkhau" class="form-control" style="width: 500px;">
                        	</div>                         
                            <div class="form-group">
	                            <label for="address">Địa chỉ</label>
	                            <input type="text" name="diaChi" id="diaChi" class="form-control" style="width: 500px;">
                        	</div>
							 
                        	<div class="form-group">
                             	<label for="gioiTinh">Giới tính</label><br>
							    <select id="gioiTinh" name="gioiTinh" style="width: 500px;"  class="form-control">
							    	<option>--- Chọn giới tính ---</option>
							        <option value="Nam">Nam</option>
							        <option value="Nữ">Nữ</option>
							        <option value="Khác">Khác</option>
							    </select>
                            </div>
                            <div class="form-group">
	                            <label for="email">Email</label>
	                            <input type="text" name="email" id="email" class="form-control" style="width: 500px;">
                       		</div>
                            <div class="form-group">
	                            <label for="date">Ngày sinh</label>
	                            <input type="date" name="dateOfBirth" id="dateOfBirth" class="form-control" style="width: 500px;">
                        	</div>
                       		<div class="form-group">
	                            <label for="phone">Số điện thoại</label>
	                            <input type="text" name="phone"  id="phone" class="form-control" value="(+84)" style="width: 500px;">
                        	</div>

                            <div class="col-xs-12 ">
                                <br><button onclick="dangky()" class="btn btn-Sucess btn-group-justified "  id="dangki" type="button" style="color:white; background-color: green; width: 100%; height: 50px; ">ĐĂNG KÝ</button><br>
                            </div>
                           
				</div>
			</div>
                        
        </div>
    </div>
      
   	<script type="text/javascript">
   	
   	function dangky() {
   		var ten = $('#fullName').val();
   	   	var username = $('#userName').val();
   	   	var pass = $('#passWord').val();
   	   	var repass = $('#rematkhau').val();
   	   	var address = $('#diaChi').val();
   	   	var sex = $('#gioiTinh').val();
   	   	var email = $('#email').val();
   	   	var date = $('#dateOfBirth').val();
   	   	var sdt = $('#phone').val();
   	 	const phoneRegex = /^\(\+84\)[0-9]{9}$/;
     	var emailRegex = /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
		if(ten.trim() === '' ||username.trim() === '' ||pass.trim() === '' ||repass.trim() === ''
			||address.trim() === ''||sex === '--- Chọn giới tính ---'||email.trim() === ''||date.trim() === ''||sdt.trim() === ''){
			alert('Điền đầy đủ thông tin');
			return;
		}
		else if(!emailRegex.test(email.trim())){
			alert('Email không hợp lệ');
			return;
		}
		else if(!phoneRegex.test(sdt.trim())){
			alert('Số điện thoại không hợp lệ. Vui lòng nhập theo định dạng (+84)9123456789');
			return;
		}
		else if(pass !== repass)
		{
			alert('RePass phải giống Pass');
			return;
		}
		$.ajax({
			url: '${userAPI}',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify({
				fullName : ten,
				userName : username,
				passWord : pass,
				diaChi : address,
				gioiTinh : sex,
				email : email,
				dateOfBirth : date,
				phone : sdt
			}),
			dataType: 'json'
			
		})
		.then(data =>{
			if(data.errorMessage === 1)
				{
					alert("UserName đã tồn tại !!!")
				}
			else if(data.errorMessage === 2)
			{
				alert("Email đã tồn tại !!!")
			}
			else{
				alert("Đăng ký thành công mời bạn kiểm tra vào hộp thư gmail để nhận link đăng nhập !!!")
				
				window.location.reload();
			}
			
		})
		.catch(error =>{
			alert('Đăng ký không thành công');
		})
		
	}
   	</script>
</body>
</html>