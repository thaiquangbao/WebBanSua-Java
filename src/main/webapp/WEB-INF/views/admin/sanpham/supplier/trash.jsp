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
            <h1 style="text-align: center; ">Danh sách nhà cung cấp đã xóa</h1>
            <button style="border:  none;background-color: white; float: left;"  onclick="back()">
                    <i class="fas fa-arrow-left" style=" height: 30px;"></i> 
            </button>   
      
            <div class="form-check" style="float: left; margin-bottom: 20px; margin-top: 50px ">
                <input class="form-check-input" type="checkbox" style="width: 18px; height: 18px;"  id="checkBox-all">
                <label class="form-check-label" for="checkBox-all" style="margin-left: 15px;">
                	<p style="font-size: 18px">Chọn tất cả</p>                  
                </label>
                <button name="restore-allCourse" disabled onclick="restoreAll()" class="btn btn-primary  btn-restoreAll" style="margin-left: 15px" >Khôi phục tất cả</button>
            	<button onclick="destroyAll()" class="btn btn-primary disabled btn-deleteAll"  style="margin-left: 15px" >Xóa tất cả</button>
            	<input type="text" class="search-box" id="searchInput" placeholder="Search..." style="margin-left: 1200px;height: 35px;" onchange="searchTable()">
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
	                        <button onclick="restoreOne('${item.id}')" class="btn btn-link " >Khôi phục</button>
	                        
	                        <button onclick="destroyOne('${item.id}')" id="delete" data-id="${item.id}" type="button" class="btn btn-link ">Xóa</button>
	                    </td>
                    </tr>
                     <c:set var="rowNumber" value="${rowNumber + 1}" />
                    </c:forEach> 
                    
                    
                </tbody>
               
            </table>
            	<c:if test="${empty model.listResult}">
					<div style="text-align: center;">		
						<p>Bạn chưa xóa nhà cung cấp nào :3</p>
					</div>	
				</c:if>
           	
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
	function back() {
		window.location.href = '${supplierAPI}';
	}
</script>	
<script type="text/javascript">
	
	function restoreOne(id) {
		
		 $.ajax({
			url:'${supplierAPI}'+'/'+id+'/restore',
			type: "POST"
			
			
		})
		.then(data =>{
			alert('Restore thành công');
			window.location.reload();
		})
		.catch(error =>{
			alert('Restore không thành công');
		}) 
	}
	function destroyOne(id) {
		var confirmation = confirm("Bạn chắc có muốn xóa discount này không :<<");
		 if (confirmation) {
		 $.ajax({
				url:'${supplierAPI}'+'/'+id+'/destroy',
				type: "DELETE"
			})
			.then(data =>{
				if (data === 200) {
					alert('Xóa thành công nhà cung cấp');
   					window.location.reload();
				}else if(data === 500){
					alert('Nhà cung cấp đang tồn tại trong sản phẩm nên không thể xóa!!!');
				}
				else{
					alert("Xóa không thành công");
				}
			})
			.catch(error =>{
				alert('Xóa không thành công');
			}) 
		 }else{
			 window.location.reload();
		}
	}
</script>
<script>
    var checkBoxAll = document.querySelectorAll('#checkBox-all')
    var checkBoxItem = document.querySelectorAll('input[name="supplierItem[]"]')
    var restoreAllBtn = document.querySelectorAll('button[name="restore-allCourse"]');
    var restoreAll = document.querySelectorAll('.btn-restoreAll')
    var deleteAllBtn = document.querySelectorAll('.btn-deleteAll')
    var btnDeleteAll = document.querySelectorAll('#btn-delete-all')
    document.addEventListener('DOMContentLoaded',()=>{
        checkBoxAll.forEach((checkAll) =>{
            checkAll.addEventListener('click',(e) =>{
                var isCheckedAll = e.target.checked;
                checkBoxItem.forEach(checkItem =>{
                    checkItem.checked = isCheckedAll
                });
                ableButtonDe();
                ableButtonRe();
                
            })
        })
        checkBoxItem.forEach((checkItem) =>{
            checkItem.addEventListener('click' ,(e) =>{
                var isCheckedAll = checkBoxItem.length === document.querySelectorAll('input[name="supplierItem[]"]:checked').length
                checkBoxAll.forEach((checkAll) => {
                    checkAll.checked = isCheckedAll;
                });
                ableButtonDe();
                ableButtonRe();
                
            })
        })
        function ableButtonRe(){
            var checkedRestore = document.querySelector('button[name="restore-allCourse"]');
            var checkedCount = document.querySelectorAll('input[name="supplierItem[]"]:checked').length;
            if(checkedCount>0)
            {
                checkedRestore.disabled = false;
            }
            else{
                checkedRestore.disabled = true;
            }
        }
        function ableButtonDe(){
            var checkedCount = document.querySelectorAll('input[name="supplierItem[]"]:checked').length;
            if(checkedCount>0)
            {
                deleteAllBtn.forEach(btn => btn.classList.remove('disabled'));
            }
            else{
                deleteAllBtn.forEach(btn => btn.classList.add('disabled'));
            }
        }
      
    
       
    })
</script>
<script type="text/javascript">
function restoreAll() {
	 var isSubmitable = !$('.btn-restoreAll').hasClass('disabled');
    if(isSubmitable)
    {
   	 var ids = [];
		
        // Sử dụng jQuery để lặp qua các hộp kiểm đã chọn
        $('input[name="supplierItem[]"]:checked').each(function() {
            ids.push($(this).val());
        });
        restoreCheckBox(ids);
    }
   
    function restoreCheckBox(data){
   	 $.ajax({
   		 url:'${supplierAPI}'+'/restoreAllSupplier',
   		 type: 'POST',
	         contentType: 'application/json',
	         data: JSON.stringify(data)
	         
   	 })
   	 .then(data =>{
   		 alert('Khôi phục thành công');
   		 window.location.reload();
   	 })
   	 .catch(error =>{
   		 alert('Khôi phục không thành công');
   	 })
    }
    
}
</script>
<script type="text/javascript">
function destroyAll() {
	 var isSubmitable = !$('.btn-deleteAll').hasClass('disabled');
	 var confirmation = confirm("Bạn chắc có muốn xóa discount này không :<<");
	 if (confirmation) {
	    if(isSubmitable)
	    {
	   	 var ids = [];
			
	        // Sử dụng jQuery để lặp qua các hộp kiểm đã chọn
	        $('input[name="supplierItem[]"]:checked').each(function() {
	            ids.push($(this).val());
	        });
	        destroyCheckBox(ids);
	    }
	}
	 else{
		 window.location.reload();
	 }
    function destroyCheckBox(data){
   	 $.ajax({
   		 url:'${supplierAPI}'+'/destroyAllSupplier',
   		 type: 'DELETE',
	         contentType: 'application/json',
	         data: JSON.stringify(data)
	         
   	 })
   	 .then(data =>{
   		if (data === 200) {
			alert('Xóa thành công');
				window.location.reload();
		}else if(data === 500){
			alert('Danh sách nhà cung cấp bạn đang muốn xóa đang tồn tại sản phẩm không thể xóa!!!');
		}
		else{
			alert("Xóa không thành công!!!")
		}
   	 })
   	 .catch(error =>{
   		 alert('Xóa không thành công');
   	 })
    }
    
}
</script>
</body>
</html>