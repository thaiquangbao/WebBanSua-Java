<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>	
<c:url var="categoryAPI" value="/admin/sanpham/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mt-4">
    <div class="form-write" style="justify-content: space-between;display: inline-flex;">
            <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                <div class="col">
                    <label for="categoryName" >Tên loại sữa bột</label>
                    <input type="text" class="form-control" id="categoryName" data-origin="${model.categoryName}" name="categoryName" style="width: 500px;">
                </div>
                </div> 
              <div class="form-row" style="margin-left: 200px; flex-basis: 50%"> 
                <div class="col">
                
	                <div style="font-style: oblique;">Ảnh sản phẩm</div>
	                    <img data-origin="${model.anhBanner}"  style="width: 80px; height: 80px;border-radius: 50%;margin-left: 10px;margin-right: 50px;" id="loadAvatar" alt="" class="ava">
	                        <div class="form-ava" style=" margin-top: 2px;margin-left: 5px;">
	                            <input type="file" class="image-user" id="file" name="file"  accept=".jpg, .png" /><br>
	                           
	                        </div> 
                
                </div>    
                
        </div>
        </div>
            <div class="them" style="text-align: center;">
                <button type="button" onclick="updateCategory()" class="btn btn-outline-success" style="width: 1400px; margin-top: 50px;">Sửa</button>
            </div>
        
    
</div>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
	var model = {
			categoryName : "${model.categoryName}",
			anhBanner :"${model.anhBanner}"
	}
	document.getElementById("categoryName").value = model.categoryName;
    document.getElementById("loadAvatar").src = model.anhBanner;
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
});
	
</script>
<script type="text/javascript">
function updateCategory() {
	var name = $('#categoryName').val();
	 var imged = $('#loadAvatar').data().origin;
    
    var img = document.getElementById('loadAvatar');
    var anh = img.src;
	var checkName = $('#categoryName').data().origin;
	
	if (name.trim() === '' || anh === '' ) {
		alert('Không được để trống');
		return;
	}
	 else if (name != name.toUpperCase()) {
         alert("Tên loại sản phẩm phải viết hoa");
         return;
     }     
	else if(name === checkName && anh === imged.toString()){
		alert('Do bạn không thay đổi thông tin nào, nên không có dữ liệu nào được cập nhật');
		window.location.href = '${categoryAPI}'+'category';
		return;
	}
	else if(name !== checkName){
		$.ajax({
			url: '${categoryAPI}'+'/checkNameCategory',
			type:'POST',
			contentType: 'application/json',
       	 	data: JSON.stringify({
       	 	categoryName: name
     	   
       		})
		})
		.then(data =>{
			if(data.errorMessage === 1){
				alert('Loại sữa bột đã tồn tại');
				window.location.reload();
			}
			else{
				update();
			}
		})
		.catch(error =>{
			alert('Lỗi');
		})
	}
	else{
		update();
	}
	function update() {
		$.ajax({
			url:'${categoryAPI}'+'category/'+${model.id}+'/update',
			type:'PUT',
			contentType: 'application/json',
		 	data: JSON.stringify({
		 		categoryName: name,
		 		anhBanner: anh 
			}),
			dataType: 'json'
		})
		.then(data =>{
			alert('Cập nhật thành công');
			window.location.href = '${categoryAPI}'+'category';
		})
		.catch(error =>{
			alert('Cập nhật không thành công');
		})
	}
	
}
</script>
</body>
</html>