<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>
<c:url var="discountAPI" value="/admin/sanpham/discount"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="mt-4">
<div style="color: white">---</div>
	<div style="text-align: center; "><h1>Form thêm discount</h1></div>
    <div class="form-write" style="justify-content: space-between;display: inline-flex;">
            <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                <div class="col">
                    <label for="nameDiscount">Tên nhà discount</label>
                    <input type="text" class="form-control" id="nameDiscount" name="nameDiscount" style="width: 500px;">
                </div>
                <div class="col">
                    <label for="moTa" class="form-label">Mô tả</label>
                    <input type="text" class="form-control" id="moTa" name="moTa"  style="width: 500px;">
                </div>
                </div>
                 <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                <div class="col">
                    <label for="start" class="form-label">Ngày bắt đầu</label>
                    <input type="date" class="form-control" id="dateStart" name="dateStart"  style="width: 500px;">
                </div>
                <div class="col">
                    <label for="end" class="form-label">Ngày kết thúc</label>
                    <input type="date" class="form-control" id="dateEnd" name="dateEnd"  style="width: 500px;">
                </div>
        </div>
        </div>
            <div class="them" style="text-align: center;">
                <button type="button" onclick="addDiscount()" class="btn btn-outline-success" style="width: 78%;margin-left:80px; margin-top: 50px; background: green; color: white;">Thêm</button>
            </div>
        
    

</div>
<script type="text/javascript">
function addDiscount() {
	var name = $('#nameDiscount').val();
	var nameRegex = /^[A-Z][a-zA-Z]*(\s[A-Z][a-zA-Z]*)*$/;
    var mota = $('#moTa').val();
    var start = new Date($('#dateStart').val());
    var end = new Date($('#dateEnd').val());
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
    $.ajax({
        url:'${discountAPI}'+'/createDiscount',
        type: 'POST',
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
        if (data.errorMessage === 1) {
            alert('Discount đã tồn tại');
        }
        else{
            alert('Thêm thành công')
        window.location.href= '${discountAPI}';
        }
    	
    })
    .catch(error =>{
        alert('Thêm không thành công');
    })
}
	
</script>
</body>
</html>