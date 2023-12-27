<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>	
<c:url var="feedBackAPI" value="/admin/feedback"/>
<%@ page import="com.suabot.until.SecurityUntil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mt-4">
	<div style="color: white">---</div>
	<div style="text-align: center; "><h1>Form nhập phản hồi</h1></div>
    <div class="form-write" style="justify-content: space-between;display: inline-flex;">
            <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                <div class="col">
                    <label for="tieuDe">Tiêu đề feedback</label>
                    <input type="text" class="form-control" id="tieuDe" name="tieuDe" style="width: 500px;">
                </div>
                <div class="col">
                    <label for="moTa" class="form-label">Nội dung</label>
                    <textarea class="form-control" id="noiDung" name="noiDung"  style="width: 500px;"></textarea>
                    
                </div>
                </div>
                 <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                <div class="col">
                    <label for="start" class="form-label">Ngày feedback</label>
                    <input type="date" class="form-control" id="ngayGui" name="ngayGui"  style="width: 500px;">
                </div>
                <div class="col">
                    <label for="end" class="form-label">Tài khoản feedback</label>
                    <input value="<%=SecurityUntil.getPrincipal().getUsername() %>" type="text" class="form-control" id="userName" name="userName" disabled style="width: 500px;">
                </div>
        </div>
        </div>
            <div class="them" style="text-align: center;">
                <button type="button" onclick="addFeedBack()" class="btn btn-outline-success" style="width: 80%; margin-top: 50px; margin-left: 50px;background-color: green;color: white">Thêm</button>
            </div>
        </div>
 <script type="text/javascript">
function addFeedBack() {
	var tieude= $('#tieuDe').val();
    var noidung = $('#noiDung').val();
    var ngaygui = new Date($('#ngayGui').val());
    var username= $('#userName').val();
    if (tieude.trim() === '' || noidung.trim() === '' || isNaN(ngaygui) || username.trim() === '' ) {
        alert('Không được để rỗng');
        return;
    }
   
    $.ajax({
        url:'${feedBackAPI}'+'/create',
        type: 'POST',
        	 contentType: 'application/json',
             data: JSON.stringify({
                tieuDe : tieude,
                noiDung : noidung,
                ngayGui: ngaygui,
                userName : username
             }),
             dataType: 'json'
    })
    .then(data =>{
       
         alert('Thêm thành công')
       window.location.href= '${feedBackAPI}';
        
    	
    })
    .catch(error =>{
        alert('Thêm không thành công');
    })
}
	
</script>       
    


</body>
</html>