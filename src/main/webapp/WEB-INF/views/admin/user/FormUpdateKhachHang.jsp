<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>
<c:url var="userAPI" value="/admin/users"/>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>
    <div class="mt-4">
    	<div style="color: white">---</div>
	<div style="text-align: center; "><h1>Form cập nhập khách hàng</h1></div>
        <div class="form-write" style="justify-content: space-between;display: inline-flex;">
            <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                <div class="col">
                    <label for="Fullname">Họ và Tên</label>
                    <input type="text" name="fullName" id="fullName" data-origin="${model.fullName}" class="form-control" style="width: 500px;">
                </div>
                <div class="col">
                    <label for="user">Tên đăng nhập</label>
                    <input type="text" name="userName" id="userName" data-origin="${model.userName}" disabled class="form-control" style="width: 500px;">
                </div>
                <div class="col">
                    <label for="address">Địa chỉ</label>
                    <input type="text" name="diaChi" id="diaChi" data-origin="${model.diaChi}" class="form-control" style="width: 500px;">
                </div>
                <div class="col">
                    <label for="gioiTinh">Giới tính</label><br>
                    <select id="gioiTinh" name="gioiTinh" style="width: 500px;" data-origin="${model.gioiTinh}" class="form-control">
                        <option>--- Chọn giới tính ---</option>
                        <option value="Nam">Nam</option>
                        <option value="Nữ">Nữ</option>
                        <option value="Khác">Khác</option>
                    </select>
                </div>
                <div class="col">
                    <label for="email">Email</label>
                    <input type="text" name="email" id="email" class="form-control" data-origin="${model.email}" style="width: 500px;">
                </div>
            </div>
            <div class="form-row" style="margin-left: 200px;">
                <div class="col">
                    <label for="date">Ngày sinh</label>
                    <input type="date" name="dateOfBirth" id="dateOfBirth" data-origin="${model.dateOfBirth}" class="form-control" style="width: 500px;">
                </div>
                
                <div class="col">
                    <label for="phone">Số điện thoại</label>
                    <input type="text" name="phone" id="phone" class="form-control" data-origin="${model.phone}" value="(+84)" style="width: 500px;">
                </div>
                <div class="col">
                    <label >Avatar</label> <br>
                    <img data-origin="${model.avartar}"  style="width: 80px; height: 80px;border-radius: 50%;margin-left: 10px;margin-right: 50px;" id="loadAvatar" alt="" class="ava">
	                        <div class="form-ava" style=" margin-top: 2px;margin-left: 5px;">
	                            <input type="file" class="image-user" id="file" name="file"  accept=".jpg, .png" /><br>
	                           
	                        </div> 
                
                </div>    
                
                
            </div>
        </div>
        <div class="col-xs-12 ">
            <br><button onclick="update()" class="btn btn-Sucess btn-group-justified"  id="update" type="button" style="color:white; background-color: green;margin-left:200px; width: 80%; height: 40px; ">Sửa</button><br>
        </div>
    
    </div>
 <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function() {
            // Lấy dữ liệu từ đối tượng model
            var model1 = {
                    hoTen: "${model.fullName}",
                    userName:"${model.userName}",
                    gioiTinh:"${model.gioiTinh}",
                    dateOfBirth:"${model.dateOfBirth}",
                    diaChi:"${model.diaChi}",
                    phone : "${model.phone}",
                    email:"${model.email}",
                   img :"${model.avartar}",
                   roles : "${model.role}"
                }
            function convertDate(date) {
                {
                     var parts = date.split(" ")[0];
                     return parts;
                }
            }
        
            // Đặt giá trị cho các trường dữ liệu
            document.getElementById("fullName").value= model1.hoTen;
            document.getElementById("userName").value= model1.userName;
            document.getElementById("gioiTinh").value = model1.gioiTinh;
            document.getElementById("dateOfBirth").value = convertDate(model1.dateOfBirth) ;
            document.getElementById("diaChi").value = model1.diaChi;
            document.getElementById("phone").value = model1.phone;
            document.getElementById("email").value = model1.email;
            document.getElementById("loadAvatar").src = model1.img;
            var valueUser = document.getElementById("role") ;
            
            if(model1.roles === "[Quản trị]") {
                 valueUser.value = "Quản trị";
                 valueUser.dataset.origin = "Quản trị";
            }
            else if(model1.roles === "[Người dùng]"){
                 valueUser.value = "Người dùng";
                 valueUser.dataset.origin = "Người dùng";
             }
        });
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
        function update() {
        var hoTen = $('#fullName').val();
        var userName = $('#userName').val();
        var gioiTinh = $('#gioiTinh').val();
        var dateOfBirth = $('#dateOfBirth').val();
        var diaChi = $('#diaChi').val();
        var phone = $('#phone').val();
        var email = $('#email').val();
        var anh = img.src;

        var hoTened = $('#fullName').data().origin;
        var userNameed = $('#userName').data().origin;
        var gioiTinhed = $('#gioiTinh').data().origin;
        var dateOfBirthed = $('#dateOfBirth').data().origin;
        var diaChied = $('#diaChi').data().origin;
        var phoned = $('#phone').data().origin;
        var emailed = $('#email').data().origin;
        var anhed = $('#loadAvatar').data().origin;
        function convertDate(date) {
    		{
    			 var parts = date.split(" ")[0];
    			 return parts;
    		}
    	}
        if (hoTen.trim() === ''||gioiTinh.trim() === ''||dateOfBirth.trim() === ''||diaChi.trim() === ''||phone.trim() === ''|| userName.trim()=== ''|| email.trim() === ''|| gioiTinh ==='--- Chọn giới tính ---') {
            alert("Không được để trống dữ liệu");
        }
        else if (hoTen === hoTened && userName === userNameed &&gioiTinh === gioiTinhed && dateOfBirth === convertDate(dateOfBirthed) && diaChi === diaChied && phone === phoned && email === emailed && anh === anhed ) {
            alert("Do không có dữ liệu nào được thay đổi nên không có thông tin nào được cập nhật !!!");
            window.location.href='${userAPI}'
        }
        else{
            $.ajax({
                url:'${userAPI}'+'/update/${model.id}',
                type:'PUT',
                contentType: 'application/json',
                data: JSON.stringify({
                    fullName:hoTen,
                    
                    gioiTinh:gioiTinh,
                    dateOfBirth:dateOfBirth,
                    diaChi:diaChi,
                    phone:phone,
                    email:email,
                    avartar:anh
                }),
                dataType: 'json'
            })
            .then(data =>{
                if (data.errorMessage === 1)  {
                    alert('Cập nhật thông tin tài khoản thành công');
                    window.location.href='${userAPI}'
                }
                else{
                    alert('Cập nhật thông tin tài khoản không thành công');
                }
            })
            .catch(error =>{
                alert('Lỗi hệ thống');
            })
            
        }
    }
</script>
</body>
</html>