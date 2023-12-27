<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.suabot.until.SecurityUntil" %>
<%@include file="/common/tablib.jsp"%>
<c:url var="userNVAPI" value="/"/>
<c:url var="userAPI" value="/admin/account"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sữa bột</title>
</head>
<body>
    <div class="container mt-5">
    <div style="height: 400px; color: white	">
        <h3>uduwqdw</h3>
    </div>
        <div class="avatar" style="margin-left: 30px;">
            <img style="width: 100px; height: 100px; border-radius: 50%; margin-left: 10px; margin-right: 50px;" src="${model.avartar}" alt="">
            <div class="HoTen">
                <h1 id="titleName"></h1>
                
                <p>Update your username and manage your account</p>
            </div>
        </div>
        <div class="col-lg-12 menu-and-treatment" style="display: flex; font-family: sans-serif;margin-top: 30px;">
            <div class="col-lg-4 menus" style=" padding-top: 20px;">
                <div class='menu-item general active' style="background-color: white; margin-bottom: 25px;padding-left: 10px;">
                    <a class="" style="width: 300px; margin-left: 1px; color: black;" href="/suabot/admin/General/<%=SecurityUntil.getPrincipal().getUsername() %>">General</a>
                </div>
                <div class='menu-item general active' style="background-color: white;margin-bottom: 25px;padding-left: 10px;">
                    <a class="" style="width: 300px; margin-left: 1px; color: black;" href="/suabot/admin/EditProfile/<%=SecurityUntil.getPrincipal().getUsername() %>">Edit Profile</a>
                </div>
                <div class='menu-item general active' style="background-color: white;margin-bottom: 30px;padding-left: 10px;">
                    <a class="" style="width: 300px; margin-left: 1px; color: black;" href="/suabot/admin/PassWord/<%=SecurityUntil.getPrincipal().getUsername() %>">Password</a>
                </div>
                <div class='cut-across' style="border-bottom: 1px solid black; margin: 10px 0; margin-top: 20px; margin-right: 30px;"></div>
                <button class='menu-item' onclick="deleteUser()" style='color: red; text-align: left; background-color: white; border: 0;margin-top: 10px;'>Delete Account</button>
            </div>
            <div class="col-lg-8" style="border-left: 1px solid black;">
                <div class="form-group" style="margin-top: 15px;">
                    <label for="oldPassword">Mật khẩu hiện tại</label>
                    <input type="password" class="form-control" id="oldPassword">
                </div>
                <div class="form-group">
                    <label for="newPassword">Mật khẩu mới</label>
                    <input type="password" class="form-control" name="newPassword" id="newPassword">
                </div>
                <div class="form-group">
                    <label for="rePassword">Nhập lại mật khẩu mới</label>
                    <input type="password" class="form-control" id="rePassword" name="password">
                </div>
                <button type="submit" onclick="updatePass()" class="btn btn-primary" style="float: right;">Save Change</button>
            </div>
        </div>
    </div>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    // Lấy dữ liệu từ đối tượng model
    var model1 = {
    		hoTen: "${model.fullName}",
            
    	
    }
    

    // Đặt giá trị cho các trường dữ liệu
    document.getElementById("titleName").innerHTML= model1.hoTen;
    
});   
</script>
<script type="text/javascript">
     function updatePass() {
        var passWord = $('#newPassword').val();
        var oldPass = $('#oldPassword').val();
        var rePass = $('#rePassword').val();
        if(passWord.trim()=== '' || oldPass.trim() === '' || rePass.trim()=== ''){
            alert('Vui lòng nhập vào form để thay đổi PassWord')
            return;
        }
        else if(passWord != rePass)
        {
            alert('NewPassword và RePassWord không giống nhau')
            return;
        }
        else{
            $.ajax({
                url:'${userAPI}'+'/checkPassword/'+'<%=SecurityUntil.getPrincipal().getUsername() %>',
                type:'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    passWord : oldPass
                }),
                dataType: 'json'
            })
            .then(data=>{
                if(data.errorMessage === 0){
                	update();
                }
                else if (data.errorMessage === 1) {
                    alert('Mật khẩu hiện tại bạn nhập không đúng');
                }
                else{
                    alert('Lỗi');
                }
            })
            .catch(error =>{
                alert('Lỗi hệ thống');
            })

        }
        function update() {
            $.ajax({
                url:'${userAPI}'+'/update/password/'+'<%=SecurityUntil.getPrincipal().getUsername() %>',
                type:'PUT',
                contentType: 'application/json',
                data: JSON.stringify({
                    passWord : passWord
                }),
                dataType: 'json'
            })
            .then(data =>{
                alert('Cập nhật mật khẩu mới khoản thành công');
                window.location.reload();
            })
            .catch(error =>{
                alert('Lỗi hệ thống');
            })
        }
       
        
    }
     function deleteUser(){
     	var confirmation = confirm("Bạn chắc có muốn xóa tài khoản, những đơn hàng bạn đã đặt sẽ mất :<<");
     	 if (confirmation) {
     		 $.ajax({
                  url:'${userNVAPI}'+'/deleteUser/'+'<%=SecurityUntil.getPrincipal().getUsername() %>/'+'${model.id}',
                  type:'DELETE'

              })
              .then(data =>{
                  if(data.errorMessage === 1){
                      alert('Xóa thành công');
                      window.location.href="<c:url value='/logout'/>"
                      alert('Mời bạn đăng nhập lại');
                  }
                  else if(data.errorMessage === 0){
                      alert("Xóa không thành công")
                  }
              })
              .catch(error =>{
                  alert("ERROR")
              })
     	  } else {
     	        // Nếu người dùng không xác nhận, không làm gì cả
     	        window.location.reload();
     	    }
             
         
     }
</script>
</body>
</html>