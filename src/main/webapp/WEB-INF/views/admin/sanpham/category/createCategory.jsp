<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>	
<c:url var="categoryAPI" value="/admin/sanpham/category/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sữa bột</title>
</head>
<body>
<div class="mt-4">
    <div class="form-write" style="justify-content: space-between;display: inline-flex;">
            <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                <div class="col">
                    <label for="categoryName" >Tên loại sữa bột</label>
                    <input type="text" class="form-control" id="categoryName" name="categoryName" style="width: 500px;">
                </div>
              </div> 
              <div class="form-row" style="margin-left: 200px; flex-basis: 50%"> 
               <div class="col">
              	<label>Ảnh sản phẩm</label><br>
	                    <img data-origin="${model.anhBanner}"  style="width: 80px; height: 80px;border-radius: 50%;margin-left: 10px;margin-right: 50px;" id="loadAvatar" alt="" class="ava">
	                        <div class="form-ava" style=" margin-top: 2px;margin-left: 5px;">
	                            <input type="file" class="image-user" id="file" name="file"  accept=".jpg, .png" /><br>
	                           
	                        </div> 
                
                </div>    
                
        	</div>
        	</div>
            <div class="them" style="text-align: center;">
                <button type="button" onclick="addCategory()" class="btn btn-outline-success" style="width: 1400px; margin-top: 50px;">Thêm</button>
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
	function addCategory() {
		var name = $('#categoryName').val();
		var img = document.getElementById('loadAvatar');
	    var anh = img.src;
	    if (name.trim() === '' || anh === '' ) {
			alert('Không được để trống');
			return;
		}
	    else if (name != name.toUpperCase()) {
            alert("Tên loại sản phẩm phải viết hoa");
            return;
        }     
		$.ajax({
			url : '${categoryAPI}'+'createCategory',
			type: 'POST',	
			contentType: 'application/json',
            data: JSON.stringify({
            	categoryName: name,
            	anhBanner : anh
            }),
            dataType: 'json'
		})
		.then(data =>{
			if(data.errorMessage == 1){
				alert('Loại sữa đã tồn tại');
			}
			else{
				alert('Thêm thành công');
				window.location.href='${categoryAPI}';
			}
			
		})
		.catch(error =>{
			alert('Thêm không thành công');
		})
	}
</script>
</body>
</html>