<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>
<c:url var="usersAPI" value="/admin/users"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="container-fluid body-table" >
        <div class="head" >
        <div style="margin-top: 30px; background-color: white;">
			      <h1 style="color: white">--------</h1>
        </div>
            <h1 style="text-align: center; ">Danh sách sách khách hàng</h1>
            <div style="margin-bottom: 25px;">
            <label class="form-check-label" for="checkBox-all" style="margin-left: 1400px; ">
                <button onclick="window.location.href='${usersAPI}'+'/trash'" style="font-size: 18px"><i class="fas fa-trash-alt" style="width: 40px;height: 30px;"></i>
                </button>                  
            </label>
            <i id="deletedCount" style="font-size: 20px;color: red">(${count})</i>
        </div>
            <div class="form-check" style="float: left; margin-bottom: 20px;">
                <input class="form-check-input" type="checkbox" style="width: 18px; height: 18px;" id="checkBox-all">
                <label class="form-check-label" for="checkBox-all" style="margin-left: 15px;">
                <p style="font-size: 18px">Chọn tất cả</p>
                    
                </label>
                <button  data-toggle="modal" onclick="deleteAll()" class="btn btn-primary disabled btn-deleteAll" data-target="#deleteAll-modal" style="margin-left: 15px" >Xóa tất cả</button>
            	      
                <input type="text" class="search-box" id="searchInput" placeholder="Search..." style="margin-left: 1000px;height: 35px;" onchange="searchTable()">
                    <button class="search-button-id" style="width: 40px; height: 35px;" onclick="searchTable()">
                        <i class="fas fa-search"  ></i>
                    </button>
            	
            </div>
            
        </div>
        
        <div class="table-students" style="margin-top: 20px; margin-right: 20px;">
            <table class="table" id="myTable">
                <thead class="thead-dark "  style="background-color: black; color: white">
                    <tr >
                    <th style="width: 50px;">Chọn</th>
                    <th scope="col" style="width: 50px; text-align: center;">#</th>
                    <th scope="col" style="width: 150px ; text-align: center;">
                        UserName
                    </th>
                    <th scope="col" style="width: 150px ; text-align: center;">
                        Họ và tên
                    </th>
                    <th scope="col" style="width: 80px ;text-align: center;">
                       Giới tính
                    </th>
                   
                     <th scope="col" style="width: 200px ;text-align: center;">
                        Địa chỉ
                    </th>  
                     <th scope="col" style="width: 100px ;text-align: center;">
                        Số đơn hàng
                    </th>  
                    <th scope="col" style="width: 200px ;text-align: center;">
                        Email
                    </th>  
                    <th scope="col" style="width: 100px ;text-align: center;">
                       Ngày sinh
                    </th> 
                   <th scope="col" style="width: 150px ;text-align: center;">
                       Chức năng
                    </th>
                    <th scope="col" style="width: 150px ;text-align: center;">
                        Số điện thoại
                    </th>
                    <th scope="col" style="width: 100px ;text-align: center;">
                        Hình ảnh
                    </th> 
                    
                    <th class="col" style=" width: 150px;text-align: center;  " >Chỉnh sửa</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="rowNumber" value="1" />
                    <c:forEach var="item" items="${models.listResult}">
                    <tr>
	                    <td>
	                        <div class="form-check">
	                            <input class="form-check-input" type="checkbox" name="userItem[]" value="${item.id}">
	
	                        </div>
	                    </td>
	                    <th scope="row" style="text-align: center;">${rowNumber}</th>
	                    <td style="text-align: center;font-size: 15px">${item.userName}</td>
	                    <td style="text-align: center;font-size: 15px">${item.fullName}</td>
	                    <td style="text-align: center;font-size: 15px">${item.gioiTinh}</td>
	                    <td style="text-align: center;font-size: 15px">${item.diaChi}</td>
	                    <td style="text-align: center;font-size: 15px">${item.countDonDaDat}</td>
	                    <td style="text-align: center;font-size: 15px">${item.email}</td>
	                    <td style="text-align: center;font-size: 15px" id="dateS">${item.dateOfBirth}</td>
	                    <td style="text-align: center;font-size: 15px">${item.role}</td>
	                    <td style="text-align: center;font-size: 15px">${item.phone}</td>
	                    <td style="text-align: center;font-size: 15px"><img style="width: 50px; height: 50px; border-radius: 50%;" alt="" src="${item.avartar}"> </td>
	                    <td style="text-align: center;">
	                        <a href="<c:url value='/admin/users/formUpdateKhachHang/${item.id}' />" class="btn btn-link " style="text-align: center;">Sửa</a>
	                        <button onclick="deleteOne('${item.id}')" id="delete" data-id="${item.id}" type="button" class="btn btn-link ">Xóa</button>
	                    </td>
                    </tr>
                  <c:set var="rowNumber" value="${rowNumber + 1}"/>
                </c:forEach>
                </tbody>
            </table>
           		<c:if test="${empty models.listResult}">
					<div style="text-align: center;">		
						<p>Bạn chưa có khách nào bạn hãy bấm vào thêm khách hàng để thêm mới bạn nhé :3</p>
					</div>	
				</c:if>
             <div class="inserthv" style="margin-top: 50px; text-align: center;">
                <a class="btn btn-primary"  href="<c:url value='/admin/users/formAddUser' />" style="font-size: 18px; border-top: 30px;height: 40px; width: 200px; text-align: center; background-color: chocolate; border-color: chocolate;">Thêm khách hàng</a>
            </div>
        </div>
    </div>
      <script type="text/javascript">
        function searchTable() {
   
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");

            
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td");
                for (var j = 0; j < td.length; j++) {
                    if (td[j]) {
                        txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                            break;
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
            }

     </script>
    <script type="text/javascript">
        var ds = document.querySelectorAll("#dateS");
        function convertDate(date) {
			{
				 var parts = date.split(" ")[0];
				 return parts;
			}
		}
        for (var i = 0; i < ds.length; i++) {
	    var dataS = ds[i].innerHTML;
	    
	    ds[i].innerHTML = convertDate(dataS);
	    
	    }
    </script>
    <script type="text/javascript">
    function deleteOne(id) {
	 $.ajax({
			url:'${usersAPI}'+'/delete/'+id,
			type: "PATCH",
			contentType: 'application/json',
			dataType: 'json'
		})
		.then(data =>{
            if(data.errorMessage === 1){
                alert('Xóa thành công');
			window.location.reload();
            }
			else{
                alert('Xóa không thành công');
            }
		})
		.catch(error =>{
			alert('ERROR');
		}) 
}
</script>
<script>
    var checkBoxAll = document.querySelectorAll('#checkBox-all')
    var checkBoxItem = document.querySelectorAll('input[name="userItem[]"]')
    var deleteAllBtn = document.querySelectorAll('.btn-deleteAll')
    var deleteAll = document.querySelectorAll('#btn-delete-all')
 

    document.addEventListener('DOMContentLoaded',()=>{
        checkBoxAll.forEach((checkAll) =>{
            checkAll.addEventListener('click',(e)=>{
                var isCheckedAll = e.target.checked;
                checkBoxItem.forEach((checkItem)=>{
                    checkItem.checked=isCheckedAll
                        
                    })
                    ableCheckBox()
                })
            });
        
        checkBoxItem.forEach((check) =>{
            check.addEventListener('click',(e) =>{
                var isCheckedAll = checkBoxItem.length === document.querySelectorAll('input[name="userItem[]"]:checked').length;
                checkBoxAll.forEach(checkAll=>
                checkAll.checked = isCheckedAll
                
                )
                ableCheckBox()
            })
        })
        function ableCheckBox(){
            var checkedCount = document.querySelectorAll('input[name="userItem[]"]:checked').length;
            if(checkedCount > 0)
            {
                deleteAllBtn.forEach(btn => btn.classList.remove('disabled'))
            }
            else{
                deleteAllBtn.forEach(btn => btn.classList.add('disabled'))
            }
            
        }

    })
</script>
<script type="text/javascript">
	function deleteAll() {
		var isSubmitable = !$('.btn-deleteAll').hasClass('disabled');
		if (isSubmitable) {
			var ids=[];
			 $('input[name="userItem[]"]:checked').each(function() {
	             ids.push($(this).val());
	         });
			 
	         deleteCheckBox(ids);
		}
		function deleteCheckBox(data) {
			$.ajax({
	    		 url:'${usersAPI}'+'/deleteAll',
	    		 type: 'PATCH',
		         contentType: 'application/json',
		         data: JSON.stringify(data)
		         
	    	 })
	    	 .then(data =>{
	    		 alert('Xóa thành công');
	    		 window.location.reload();
	    	 })
	    	 .catch(error =>{
	    		 alert('Xóa không thành công');
	    	 })
		}
	}
</script>

</body>
</html>