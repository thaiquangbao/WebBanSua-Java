<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>	
<c:url var="supplierAPI" value="/admin/sanpham/nhacungcap"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sữa bột</title>


</head>
<body>
    <div class="container-fluid body-table" >
        <div class="head" >
        <div style="margin-top: 30px; background-color: white;">
			      <h1 style="color: white">--------</h1>
        </div>
            <h1 style="text-align: center; ">Danh sách nhà cung cấp</h1>
            <div style="margin-bottom: 25px;">
            <label class="form-check-label" for="checkBox-all" style="margin-left: 1400px; ">
                <button onclick="trash()" style="font-size: 18px"><i class="fas fa-trash-alt" style="width: 40px;height: 30px;"></i>
                </button>                  
            </label>
            <i id="deletedCount" style="font-size: 20px;color: red">(${count})</i>
        </div>
            <div class="form-check" style="float: left; margin-bottom: 20px;">
                <input class="form-check-input" type="checkbox" style="width: 18px; height: 18px;"  id="checkBox-all">
                <label class="form-check-label" for="checkBox-all" style="margin-left: 15px;">
                	<p style="font-size: 18px">Chọn tất cả</p>                  
                </label>
                <button onclick="deleteAll()" class="btn btn-primary disabled btn-deleteAll"  style="margin-left: 15px" >Xóa tất cả</button>
            	 <input type="text" class="search-box" id="searchInput" placeholder="Search..." style="margin-left: 1000px;height: 35px;" onchange="searchTable()">
                    <button class="search-button-id" style="width: 40px; height: 35px;" onclick="searchTable()">
                        <i class="fas fa-search"  ></i>
                    </button>
            </div>
            
        </div>
        
        <div class="table-students" style="margin-top: 20px; margin-right: 20px;">
            <table class="table" id="myTable" >
                <thead class="thead-dark "  style="background-color: black; color: white">
                    <tr >
                    <th style="width: 50px;">Chọn</th>
                    <th scope="col" style="width: 50px;">#</th>
                    <th scope="col" style="width: 200px ;">
                        Tên nhà cung cấp
                    </th>
                    <th scope="col" style="width: 200px ;">
                        Địa chỉ nhà cung cấp
                    </th>
                    <th scope="col" style="width: 150px ;">
                       Số điện thoại
                    </th>
                   <th scope="col" style="width: 150px ;">
                       Địa chỉ Email
                    </th>
                            
                    <th class="col" style=" width: 100px;  " >Chỉnh sửa</th>
                    </tr>
                </thead>
                <tbody>
                	 <c:set var="rowNumber" value="1" />
                    <c:forEach var="item" items="${model.listResult}" >
                   
                    <tr>
	                    <td>
	                        <div class="form-check">
	                            <input class="form-check-input" type="checkbox" name="supplierItem[]" value="${item.id}">
	
	                        </div>
	                    </td>
	                    <th scope="row">${rowNumber}</th>
	                    <td style="font-size: 15px">${item.tensupplier}</td>
	                    <td style="font-size: 15px">${item.address}</td>
	                    <td style="font-size: 15px">${item.phone}</td>
	                    <td style="font-size: 15px">${item.email}</td>
	                    <td>
	                        <a href="<c:url value='/admin/sanpham/nhacungcap/${item.id}'/>" class="btn btn-link " >Sửa</a>
	                        
	                        <button onclick="deleteOne('${item.id}')" id="delete" data-id="${item.id}" type="button" class="btn btn-link ">Xóa</button>
	                    </td>
                    </tr>
                     <c:set var="rowNumber" value="${rowNumber + 1}" />
                    </c:forEach> 
                    
                    
                </tbody>
               
            </table>
            	<c:if test="${empty model.listResult}">
					<div style="text-align: center;">		
						<p>Bạn chưa đăng nhà cung cấp nào hãy bấm vào thêm khóa học để thêm nhà cung cấp mới bạn nhé :3</p>
					</div>	
				</c:if>
            <div class="inserthv" style="margin-top: 50px; text-align: center;">
                <a class="btn btn-primary" href="<c:url value='/admin/sanpham/nhacungcap/formsupplier' />" style="font-size: 18px; border-top: 30px;,height: 300px; width: 200px; text-align: center; background-color: chocolate; border-color: chocolate;">Thêm nhà cung cấp</a>
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
document.addEventListener("DOMContentLoaded", function() {
    // Lấy dữ liệu từ đối tượng model
	var deletedCount = ${count};
	document.getElementById("deletedCount").textContent = "("+deletedCount+")" ;
    
});
</script>
<script type="text/javascript">
	
	function deleteOne(id) {
		$.ajax({
			url:'${supplierAPI}'+'/'+id+'/delete',
			type: "PUT",
			contentType: 'application/json',
			data : JSON.stringify({
    	 		deleted : true, 	   
    		}),
    		dataType: 'json'
			
		})
		.then(data =>{
			alert('Xóa thành công');
			window.location.reload();
		})
		.catch(error =>{
			alert('Xóa không thành công');
		})
	}
</script>
<script>
    var checkBoxAll = document.querySelectorAll('#checkBox-all')
    var checkBoxItem = document.querySelectorAll('input[name="supplierItem[]"]')
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
                var isCheckedAll = checkBoxItem.length === document.querySelectorAll('input[name="supplierItem[]"]:checked').length;
                checkBoxAll.forEach(checkAll=>
                checkAll.checked = isCheckedAll
                
                )
                ableCheckBox()
            })
        })
        function ableCheckBox(){
            var checkedCount = document.querySelectorAll('input[name="supplierItem[]"]:checked').length;
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
     if(isSubmitable)
     {
    	 var ids = [];
		
         // Sử dụng jQuery để lặp qua các hộp kiểm đã chọn
         $('input[name="supplierItem[]"]:checked').each(function() {
             ids.push($(this).val());
         });
         deleteCheckBox(ids);
     }
    
     function deleteCheckBox(data){
    	 $.ajax({
    		 url:'${supplierAPI}'+'/deleteAll',
    		 type: 'PUT',
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
<script type="text/javascript">
	function trash() {
		window.location.href = '${supplierAPI}'+'/trash'
	}
</script>
</body>
</html>