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
<div class="container mt-5" >
    <div style="height: 400px; color: white	">
        <h3>uduwqdw</h3>
    </div>
        <div class="avatar" style="margin-left: 30px; ">
            <img style="width: 100px; height: 100px; border-radius: 50%; margin-left: 10px; margin-right: 50px;" src="${model.avartar}" alt="">
            <div class="HoTen">
                <h1 id="titleName"></h1>
                <p>Update your username and manage your account</p>
            </div>
        </div>
        <div class="col-lg-12 menu-and-treatment" style="display: flex; font-family: sans-serif;margin-top: 30px;">
            <div class="col-lg-3 menus" style=" padding-top: 20px;">
                <div class="menu-item general active" style="background-color: white; margin-bottom: 25px;padding-left: 10px;">
                    <a class="" style="width: 300px; margin-left: 1px; color: black;" href="/suabot/admin/General/<%=SecurityUntil.getPrincipal().getUsername()%>">General</a>
                </div>
                <div class="menu-item general active" style="background-color: white;margin-bottom: 25px;padding-left: 10px;">
                    <a class="" style="width: 300px; margin-left: 1px; color: black;" href="/suabot/admin/EditProfile/<%=SecurityUntil.getPrincipal().getUsername()%>">Edit Profile</a>
                </div>
                <div class="menu-item general active" style="background-color: white;margin-bottom: 30px;padding-left: 10px;">
                    <a class="" style="width: 300px; margin-left: 1px; color: black;" href="/suabot/admin/PassWord/<%=SecurityUntil.getPrincipal().getUsername()%>">Password</a>
                </div>
                <div class="cut-across" style="border-bottom: 1px solid black; margin: 10px 0; margin-top: 20px; margin-right: 30px;"></div>
                <button class="menu-item" onclick="deleteUser()" style="color: red; text-align: left; background-color: white; border: 0;margin-top: 10px;">Delete Account</button>
        </div>
        <div class="col-lg-8" style="border-left: 1px solid black;">
                
            <div class="changeava" style="display: flex;margin-left: 2px">
                <img src="${model.avartar}" style="width: 80px; height: 80px;border-radius: 50%;margin-left: 10px;margin-right: 50px;" id="loadAvatar" alt="" class="ava">
                    <div class="form-ava" style=" margin-top: 2px;margin-left: 5px;">
                        <input type="file" class="image-user" id="file" name="file"  accept=".jpg, .png" /><br>
                        <div class="btns">
                            <button disabled onclick="dangAnh()" class="btn btn-save"  >Save Picture</button>
                            <button onclick="deleteImg()" id="btn-delete" class="btn btn-primary" style=" background-color: rgb(231, 59, 88);">Delete</button>
                        </div>
                    </div> 
            </div>    
        
        <div  style="margin-top: 20px;">
            <div class="form-group">
                <label for="name">Họ tên</label>
                <input type="text" class="form-control" id="name" name="name" data-origin="${model.fullName}" value="" required> 
            </div>
            <div class="form-group">
                <label for="">Giới tính</label>
                <select type="text" class="form-control" id="sex" name="sex" data-origin="${model.gioiTinh}" value="">
                    <option>Nam</option>
                    <option>Nữ</option>
                    <option>Khác</option>
                </select>
                
            </div>
            <div class="form-group">
                <label for="">Ngày tháng năm sinh </label>
                <input type="date" class="form-control date" id="dateOfBirth" name="dateOfBirth" data-origin="${model.dateOfBirth}" value="" >
            </div>
           <div class="form-group">
                <label for="">Địa chỉ </label>
                <input type="text" class="form-control " id="address" name="address" data-origin="${model.diaChi}" value="" >
            </div>
            <div class="form-group">
                <label for="">Số điện thoại </label>
                <input type="text" class="form-control " id="phone" name="phone" data-origin="${model.phone}" value="" >
            </div>
            <button onclick="update()" class="btn btn-primary" style="float: right;">Save Change</button>
            
        </div>

    </div>
</div>
</div>
<script type="text/javascript">
    var fileSelect = document.getElementById('file');
    var img = document.getElementById('loadAvatar');
    fileSelect.addEventListener('change', () => {
       if (fileSelect.files && fileSelect.files[0]) {
        var fileLoader = fileSelect.files[0];
        var fileReader = new FileReader();
        
        fileReader.onload = function (fileLoaderEvent) {
            var srcData = fileLoaderEvent.target.result;
            img.src = srcData; // Set the src of the img element
        }

        fileReader.readAsDataURL(fileLoader);
    }
    })

 function dangAnh() {
    var img = document.getElementById('loadAvatar');
    var anh = img.src;
    
    if (anh === undefined) {
        console.log("Vui lòng chọn file ảnh");
    }

    else{
        $.ajax({
            url: '/suabot/admin/uploadFile/'+'<%=SecurityUntil.getPrincipal().getUsername() %>',
            type: "POST",
            contentType: 'application/json',
                data: JSON.stringify({
                    avartar:anh
                }),
                dataType: 'json'
            
       })
       .then(data =>{
    	   //console.log(data);
    	   window.location.reload();
       })
       .catch(error =>{
    	   alert("Lỗi hệ thống");
       }) 
    }
    
    
    
     } 

</script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    // Lấy dữ liệu từ đối tượng model
    var model1 = {
    		hoTen: "${model.fullName}",
            gioiTinh:"${model.gioiTinh}",
            dateOfBirth:"${model.dateOfBirth}",
            diaChi:"${model.diaChi}",
            phone : "${model.phone}",
           
        }
	function convertDate(date) {
		{
			 var parts = date.split(" ")[0];
			 return parts;
		}
	}

    // Đặt giá trị cho các trường dữ liệu
    document.getElementById("titleName").innerHTML= model1.hoTen;
    document.getElementById("name").value= model1.hoTen;
    document.getElementById("sex").value = model1.gioiTinh;
    document.getElementById("dateOfBirth").value = convertDate(model1.dateOfBirth) ;
    document.getElementById("address").value = model1.diaChi;
    document.getElementById("phone").value = model1.phone;
    
});   
</script>
<script type="text/javascript">
var checkIMG = document.querySelector('.image-user');
var saveBtn = document.querySelector('.btn-save');
checkIMG.onchange = (e) =>{
        const value = e.target.value
        if (!value) {
            
            saveBtn.disabled = true
            
        }
        else{
            saveBtn.disabled = false
        }
    }
   
</script>

<script type="text/javascript">
    function update() {
        var hoTen = $('#name').val();
        var gioiTinh = $('#sex').val();
        var dateOfBirth = $('#dateOfBirth').val();
        var diaChi = $('#address').val();
        var phone = $('#phone').val();
        var hoTened = $('#name').data().origin;
        var gioiTinhed = $('#sex').data().origin;
        var dateOfBirthed = $('#dateOfBirth').data().origin;
        var diaChied = $('#address').data().origin;
        var phoned = $('#phone').data().origin;
        function convertDate(date) {
    		{
    			 var parts = date.split(" ")[0];
    			 return parts;
    		}
    	}
        if (hoTen.trim() === ''||gioiTinh.trim() === ''||dateOfBirth.trim() === ''||diaChi.trim() === ''||phone.trim() === '') {
            alert("Không được để trống dữ liệu");
        }
        else if (hoTen === hoTened &&gioiTinh === gioiTinhed && dateOfBirth === convertDate(dateOfBirthed) && diaChi === diaChied && phone === phoned ) {
            alert("Mời bạn thay đổi dữ liệu");
        }
        else{
            $.ajax({
                url:'${userAPI}'+'/update/profile/'+'<%=SecurityUntil.getPrincipal().getUsername() %>',
                type:'PUT',
                contentType: 'application/json',
                data: JSON.stringify({
                    fullName:hoTen,
                    gioiTinh:gioiTinh,
                    dateOfBirth:dateOfBirth,
                    diaChi:diaChi,
                    phone:phone
                    
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
    	  } else {
    	        // Nếu người dùng không xác nhận, không làm gì cả
    	        window.location.reload();
    	    }
            
        
    }   
    function deleteImg() {
        var img = document.getElementById('loadAvatar');
        var anh = img.src;
      
        if (anh === "https://res.cloudinary.com/dk41ftplg/image/upload/v1688965244/Teach-Node/wkz0upebb9k3danolvbc.png") {
            alert("Mời bạn thêm ảnh vào ");
        }
        else{
            
            $.ajax({
                url:'${userNVAPI}'+'updateImg/'+'${model.id}',
                type:'PATCH'

            })
            .then(data =>{
                if(data.errorMessage === 1){
                    alert('Xóa ảnh thành công');
                    window.location.reload();
                    
                }
                else if(data.errorMessage === 0){
                    alert("Xóa ảnh không thành công")
                }
            })
            .catch(error =>{
                alert("ERROR")
            })
        }
       
    }

</script>
</body>
</html>