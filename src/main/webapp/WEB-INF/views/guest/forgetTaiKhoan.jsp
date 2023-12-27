<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
        <div class="modal-dialog " style="margin-top: 500px; ">
            <div class="modal-content ">
                <div class="modal-header ">
                    <h2 style="text-align: center; ">Quên mật khẩu</h2>
                </div>
                
              
	                <div class="modal-body ">
	                    <div class="container ">
	                        <div class="col-md-12 ">
	                            <label for="Name" class="control-label col-md-12 " style="font-size: 23px; ">Tên Đăng Nhập</label>
	                            <div class="col-md-12 ">
	                                <input style="width: 500px;" type="text" id="userName" name="userName" class="form-control">
	                            </div>
	                        </div>
	
	                        <div class="col-md-12 ">
	                            <br><label for="Name" class="control-label col-md-12 " style="font-size: 20px; ">Email</label>
	                            <div class="col-md-12 ">
	                                <input type="text" style="width: 500px;" id="email" name="email"  class="form-control" >
	                            </div>
	                        </div>
	                        <div class="col-md-12 ">
	
	                            <br><button onclick="repassword()" class="btn btn-Sucess btn-group-justified "  type="submit" style="margin-left:10px ;color:white; background-color: green; width: 100%; height: 50px; ">Gửi</button><br>
	
	                        </div>
	                    </div>
	                </div>
             
            </div>
        </div>
<script type="text/javascript">
function repassword() {
			var username = $("#userName").val();
			var email= $('#email').val();
			if(username.trim() === "" || email.trim() ===""){
				alert("Mới bạn điền đầy đủ thông tin!!!")
				return;
			}
			$.ajax({
				url:'/suabot/guest/repass/checkUserName',
				type:'POST',
				contentType: 'application/json',
				data: JSON.stringify({
					
					userName : username
					
				}),
				dataType: 'json'
			})
			.then(data =>{
			if(data.errorMessage === 500)
				{
					alert("UserName hiện không tồn tại !!!")
				}
			
			else if(data.errorMessage === 200){
				sendMail();
			}
			
		})
		.catch(error =>{
			alert('Lỗi xác thực UserName');
		})
		function sendMail(){
			$.ajax({
				url:'/suabot/guest/laylaimk',
				type:'POST',
				contentType: 'application/json',
				data: JSON.stringify({
					
					userName : username,
					email:email
				}),
				dataType: 'json'
			})
			.then(data =>{
			if(data.errorMessage === 200)
				{
					alert("Bạn hãy kiểm tra hộp thư trong mail để lấy lại mật khẩu!!");
					window.location.href='/suabot/guest/login';
				}
			
			else if(data.errorMessage === 503){
				alert("Địa chỉ email bạn nhập không đúng !!!")
				
				
			}
			
		})
		.catch(error =>{
			alert('Lỗi xác thực Email');
		})
		}
}
        </script>
</body>
</html>