<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>
<c:url var="discountAPI" value="/admin/sanpham/discount"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sữa bột</title>
</head>
<body>
	<div class="mt-4">
	<div style="color: white">---</div>
	<div style="text-align: center; "><h1>Form cập nhật discount</h1></div>
    <div class="form-write" style="justify-content: space-between;display: inline-flex;">
            <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                <div class="col">
                    <label for="nameDiscount">Tên nhà discount</label>
                    <input type="text" class="form-control" id="nameDiscount" data-origin="${model.nameDiscount}" name="nameDiscount" style="width: 500px;">
                </div>
                <div class="col">
                    <label for="moTa" class="form-label">Mô tả</label>
                    <input type="text" class="form-control" id="moTa" data-origin="${model.moTa}" name="moTa"  style="width: 500px;">
                </div>
                </div>
                 <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                <div class="col">
                    <label for="start" class="form-label">Ngày bắt đầu</label>
                    <input type="date" class="form-control" id="dateStart" name="dateStart" data-origin="${model.dateStart}" style="width: 500px;">
                </div>
                <div class="col">
                    <label for="end" class="form-label">Ngày kết thúc</label>
                    <input type="date" class="form-control" id="dateEnd" name="dateEnd" data-origin="${model.dateEnd}" style="width: 500px;">
                </div>
        </div>
        </div>
            <div class="them" style="text-align: center;">
                <button type="button" onclick="updateDiscount()" class="btn btn-outline-success" style="width: 78%;margin-left:50px ;margin-top: 50px; background-color: green; color: white">Sửa</button>
            </div>
        
    

</div>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
	var model = {
			nameDiscount : "${model.nameDiscount}",
			moTa :"${model.moTa}",
			dateStart:"${model.dateStart}",
			dateEnd:"${model.dateEnd}"
			
	}
	document.getElementById("nameDiscount").value = model.nameDiscount;
    document.getElementById("moTa").value = model.moTa;
	
   	function convertDate(date) {
		{
			 var parts = date.split(" ")[0];
			 return parts;
		}
	}
    
    
    document.getElementById("dateStart").value = convertDate(model.dateStart);
    
    document.getElementById("dateEnd").value =  convertDate(model.dateEnd) ;
    
});
</script>
<script type="text/javascript">

	function updateDiscount() {
		var name = $('#nameDiscount').val();
		var nameRegex = /^[A-Z][a-zA-Z]*(\s[A-Z][a-zA-Z]*)*$/;
	    var mota = $('#moTa').val();
	    var start = new Date($('#dateStart').val());
	    var end = new Date($('#dateEnd').val());
		var named = $('#nameDiscount').data().origin;
		var motaed = $('#moTa').data().origin;
	    var started = new Date($('#dateStart').data().origin);
	    var ended = new Date($('#dateEnd').data().origin);
		
		
	    if (name.trim() === '' || mota.trim() === '' || isNaN(start) || isNaN(end) ) {
	        alert('Không được để rỗng');
	        return;
	    }
	    else if(nameRegex.test(name.trim())){
	    	alert("Tên Discount phải bắt đầu bằng chữ cái viết hoa và sau dấu cách cũng phải là chữ cái viết hoa");
	        return;
	    }
	    else if(end <= start){
	    	alert('Ngày kết thúc phải lớn hơn ngày bắt đầu');
	    	return;
	    }
		else if (name === named && mota === motaed && start.toString() === started.toString() && end.toString() && ended.toString()) {
			update();
		}
	   
		else if(name !== named){
			$.ajax({
				url:'${discountAPI}'+'/check',
					type:'POST',
					contentType: 'application/json',
					data: JSON.stringify({
						nameDiscount : name
				
					})
					
			})
			.then(data =>{
				if (data.errorMessage === 1) {
					alert('Discount đã tồn tại');
				}
				else{
					update();
				}
			})
			.catch(error =>{
				alert("Lỗi máy chủ");
			})
		}
		else{
			update();
		}
		function update() {
			$.ajax({
	        url:'${discountAPI}'+'/formUpdateDiscount/'+${model.id}+'/update',
	        type: 'PUT',
	        	 contentType: 'application/json',
	             data: JSON.stringify({
	                nameDiscount : name,
	                moTa : mota,
	                dateStart: start,
	                dateEnd : end
	             }),
	             dataType: 'json'
			})
			.then(data =>{
				 if(data.errorMessage === 1){
					alert("Không tìm thấy Discount bạn muốn chỉnh sửa");
				}else{
					alert('Sửa thành công');
					window.location.href= '${discountAPI}';
				}
				
			})
			.catch(error =>{
				alert('Sửa không thành công');
			})
		}
	   
	}
</script>
</body>
</html>