<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>	
<%@ page import="com.suabot.until.SecurityUntil" %>
<c:url var="feedBackAPI" value="/feedback"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sữa bột</title>
</head>
<body>
	
    <div class="feedback-container">
      <h2 style=" text-align: center;color: #333; margin-top: 200px">Give Us Your Feedback</h2>
     
      <div class="form-feedback">
        <label for="name" class="label-feedback">Tài khoản:</label>
        <input type="text" id="userName" name="userName" class="input-feedback" disabled="disabled" value="<%=SecurityUntil.getPrincipal().getUsername() %>">

        <label for="date" class="label-feedback">Date:</label>
        <input type="date" id="ngayGui" name="ngayGui" disabled="disabled" class="input-feedback" required readonly>

        <label for="tieude" class="label-feedback">Tieu De:</label>
        <input type="tieude" id="tieuDe" name="tieuDe" class="input-feedback" >
  
        <label for="feedback" class="label-feedback">Your Feedback:</label>
        <textarea id="noiDung" name="noiDung" rows="4" required class="input-feedback" ></textarea>
  
        <button class="submit-feedback" onclick="addFeedBack()" type="button">Submit Feedback</button>
        
      </div>
    </div>
    <div class="modal-feedback" id="cart-modal-feedback">
        <div class="modal-content-feedback">
            <div class="modal-header">
                <h3>Cám ơn sự đóng góp của bạn!</h3>
              
            </div>
            <div class="modal-body-feedback">
                <p>Hẹn bạn một ngày gần nhất </p>
               
            </div>
            
        </div>
    </div>
 <script type="text/javascript">



const currentDate = new Date().toISOString().split('T')[0];
document.getElementById('ngayGui').value = currentDate;
</script>
<script type="text/javascript">
function addFeedBack() {
	var tieude= $('#tieuDe').val();
    var noidung = $('#noiDung').val();
    var ngaygui = new Date($('#ngayGui').val());
    var username= $('#userName').val();
    if (tieude.trim() === '' || noidung.trim() === ''  ) {
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
       
         alert("Cảm ơn bạn đã đóng góp ý kiến !!!")
    	window.location.reload();
       
    	
    })
    .catch(error =>{
        alert('Thêm không thành công');
    })
   
  
}
	
</script>        
</body>
</html>