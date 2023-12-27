<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.suabot.until.SecurityUntil" %>
<%@include file="/common/tablib.jsp"%>	
<c:url var="userNVAPI" value="/"/>
<c:url var="userAPI" value="/account"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sữa bột</title>
</head>
<style>
.avatar{
  display: flex;
  margin-left: 30px;
}
.menu-item {
        font-size: 17px;
        text-align: start;
        margin: 15px 0;
        cursor: pointer;
        transition: 0.5s;
        background-color: white;
}
.active  {
   color: black;
}
.cut-across {
        padding: 5px 0;
        width: 300px;
        border-bottom: 1px solid  #cecccc;
        margin-left: 1px;
}

.menu-and-treatment{
  
  font-family: 'Roboto', sans-serif;
  
 
}
</style>
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
                    <div class="col-lg-4 menus" style="margin-top: 10px; padding-top: 20px;">
                        <div class='menu-item general active' style="background-color: white; margin-bottom: 25px;padding-left: 10px;">
                            <a class="" style="width: 300px; margin-left: 1px; color: black;" href="/suabot/General/<%=SecurityUntil.getPrincipal().getUsername() %>">General</a>
                        </div>
                        <div class='menu-item general active' style="background-color: white;margin-bottom: 25px;padding-left: 10px;">
                            <a class="" style="width: 300px; margin-left: 1px; color: black;" href="/suabot/EditProfile/<%=SecurityUntil.getPrincipal().getUsername() %>">Edit Profile</a>
                        </div>
                        <div class='menu-item general active' style="background-color: white;margin-bottom: 30px;padding-left: 10px;">
                            <a class="" style="width: 300px; margin-left: 1px; color: black;" href="/suabot/PassWord/<%=SecurityUntil.getPrincipal().getUsername() %>">Password</a>
                        </div>
                        <div class='cut-across' style="border-bottom: 1px solid black; margin: 10px 0; margin-top: 20px; margin-right: 30px;"></div>
                        <button class='menu-item' onclick="deleteUser()" style='color: red; text-align: left; background-color: white; border: 0;margin-top: 10px;'>Delete Account</button>
                    </div>
                    <div class="col-lg-8" style="border-left: 1px solid black;">
                       
                            
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="username" class="form-control" id="username" disabled > 
                            </div>
                            <div class="form-group">
                                <label for="email">Email </label>
                                <input type="email" class="form-control"  name="email" data-origin="${model.email}" id="email" aria-describedby="emailHelp" >
                                
                            </div>
                            <button onclick="saveChange()" type="submit" class="btn btn-primary" style="float: right;">Save Change</button>
                        
            
                    </div>
                </div>
            </div>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    // Lấy dữ liệu từ đối tượng model
    var model1 = {
    		hoTen: "${model.fullName}",
            userName:"${model.userName}",
            email:"${model.email}"
    	
    }
    

    // Đặt giá trị cho các trường dữ liệu
    document.getElementById("titleName").innerHTML= model1.hoTen;
    document.getElementById("username").value = model1.userName;
    document.getElementById("email").value = model1.email;
});   
</script>
<script type="text/javascript">
    function saveChange(){
        var email = $('#email').val();
        var emailRegex = /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
        var emailed = $('#email').data().origin;
        if (email.trim() === '') {
            alert('Không được để trống email');
        }
        else if(!emailRegex.test(email.trim())){
			alert('Email không hợp lệ');
			return;
		}
        else if (email === emailed) {
            alert('Mời bạn thay đổi thông tin')
            window.location.reload();
        }
        else if(email !== emailed){
        	$.ajax({
                url:'${userAPI}'+'/checkEmail',
                type:'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    email : email
                }),
                dataType: 'json'
            })
            .then(data =>{
                if (data.errorMessage === 1) {
                    alert("Email đã tồn tại");
                    window.location.reload();
                }
                else{
                    update();
                }
            })
            .catch(error =>{
                alert("Lỗi hệ thống");
            })
        }
        else{
            alert('Cập nhật không thành công');
            window.location.reload();
        }
        function update() {
            $.ajax({
                url:'${userAPI}'+'/update/email/'+'<%=SecurityUntil.getPrincipal().getUsername() %>',
                type:'PUT',
                contentType: 'application/json',
                data: JSON.stringify({
                    email : email
                }),
                dataType: 'json'
            })
            .then(data =>{
                alert('Cập nhật thông tin tài khoản thành công');
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
			console.log("ook")
		} 
        else{
        	window.location.reload();
        }
           
        
    }
</script>
</body>
</html>