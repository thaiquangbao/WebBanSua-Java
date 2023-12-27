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
	<div style="text-align: center; "><h1>Form cập nhật phản hồi</h1></div>
        <div class="form-write" style="justify-content: space-between;display: inline-flex;">
                <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                    <div class="col">
                        <label for="tieuDe">Tiêu đề feedback</label>
                        <input type="text" class="form-control" id="tieuDe"  name="tieuDe" style="width: 500px;" data-origin="${modelF.tieuDe}">
                    </div>
                    <div class="col">
                        <label for="moTa" class="form-label">Nội dung</label>
                        <textarea class="form-control" id="noiDung" name="noiDung"  style="width: 500px;" data-origin="${modelF.noiDung}"></textarea>
                        
                    </div>
                    </div>
                     <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                    <div class="col">
                        <label for="start" class="form-label">Ngày feedback</label>
                        <input type="date" class="form-control" id="ngayGui" name="ngayGui"  style="width: 500px;" data-origin="${modelF.ngayGui}">
                    </div>
                    <div class="col">
                        <label for="end" class="form-label">Tài khoản feedback</label>
                        <input value="<%=SecurityUntil.getPrincipal().getUsername() %>" type="text" class="form-control" id="userName" name="userName" disabled style="width: 500px;" data-origin="${modelF.userName}">
                    </div>
            </div>
            </div>
                <div class="them" style="text-align: center;">
                    <button type="button" onclick="updateFeedBack('${modelF.id}')" class="btn btn-outline-success" style="width: 75%;margin-left:50px ;background-color:green;color:white; margin-top: 50px;">Sửa</button>
                </div>
            </div>

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
	var model = {
        tieuDe : "${modelF.tieuDe}",
        noiDung :"${modelF.noiDung}",
        ngayGui:"${modelF.ngayGui}",
        userName:"${modelF.userName}"
			
	}
	document.getElementById("tieuDe").value = model.tieuDe;
    document.getElementById("noiDung").value = model.noiDung;
    
    document.getElementById("userName").value = model.userName;
	
   	function convertDate(date) {
		{
			 var parts = date.split(" ")[0];
			 return parts;
		}
	}
    
    
  
    document.getElementById("ngayGui").value = convertDate(model.ngayGui);
   
    
});


	
</script>   
<script type="text/javascript">
function updateFeedBack(id) {
	var tieude= $('#tieuDe').val();
    var noidung = $('#noiDung').val();
    var ngaygui = new Date($('#ngayGui').val());
    var username= $('#userName').val();
    var tieuded = $('#tieuDe').data().origin;
    var noidunged = $('#noiDung').data().origin;
    var ngayguied = new Date($('#ngayGui').data().origin);
    var usernamed = $('#userName').data().origin;
    if (tieude === '' || noidung === '' || isNaN(ngaygui) || username === '' ) {
        alert('Không được để rỗng');
        return;
    }
   else if (tieude === tieuded && noidung === noidunged && ngaygui.getTime() === ngayguied.getTime() && username === usernamed) {
        alert("Do không có dữ liệu nào được thay đổi nên không có dữ liệu nào được cập nhật !!!");
        window.location.href='${feedBackAPI}';
   }
   else{
    $.ajax({
        url:'${feedBackAPI}'+'/'+id+'/update',
        type: 'PUT',
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
       
         alert('Sửa thành công')
       window.location.href= '${feedBackAPI}';
        
    	
    })
    .catch(error =>{
        alert('ERROR!!!');
    })
   }
   
}
</script>    
</body>
</html>