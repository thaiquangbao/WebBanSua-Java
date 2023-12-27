<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>	
<c:url var="sanphamAPI" value="/admin/sanpham"/>	
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
            <h1 style="text-align: center; ">Danh sách sản phẩm đã xóa</h1>
             <button style="border:  none;background-color: white; float: left;"  onclick="window.location.href='${sanphamAPI}'+'/listSanPham'">
                    <i class="fas fa-arrow-left" style=" height: 30px;"></i> 
            </button> 
            <div class="form-check" style="float: left; margin-bottom: 20px;margin-top: 50px">
                <input class="form-check-input" type="checkbox" style="width: 18px; height: 18px;" value="" id="checkBox-all">
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
                    <th scope="col" style="width: 50px; text-align: center;">#</th>
                    <th scope="col" style="width: 150px ; text-align: center;">
                        Tên sản phẩm
                    </th>
                    <th scope="col" style="width: 150px ; text-align: center;">
                        Trọng lượng
                    </th>
                    <th scope="col" style="width: 100px ;text-align: center;">
                       Số lượng
                    </th>
                   
                    <th scope="col" style="width: 100px ;text-align: center;">
                        Nổi bật
                    </th> 
                    <th scope="col" style="width: 100px ;text-align: center;">
                       Đã bán
                    </th> 
                    <th scope="col" style="width: 150px ;text-align: center;">
                        Loại sữa bột
                    </th>
                    <th scope="col" style="width: 100px ;text-align: center;">
                        Discount
                    </th> 
                    <th scope="col" style="width: 150px ;text-align: center;">
                        Nhà cung cấp
                    </th> 
                    <th scope="col" style="width: 150px ;text-align: center;">
                        Giá
                    </th> 
                    <th scope="col" style="width: 150px ;text-align: center;">
                        Ảnh
                    </th> 
                    <th class="col" style=" width: 200px;text-align: center;  " >Chỉnh sửa</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="rowNumber" value="1" />
                    <c:forEach var="item" items="${model.listResult}">
                    <tr>
	                    <td>
	                        <div class="form-check">
	                            <input class="form-check-input" type="checkbox" name="productItem[]" value="${item.id}">
	
	                        </div>
	                    </td>
	                    <th scope="row" style="text-align: center;">${rowNumber}</th>
	                    <td style="text-align: center;font-size: 15px">${item.tenProduct}</td>
	                    <td style="text-align: center;font-size: 15px">${item.trongLuong}</td>
	                    <td style="text-align: center;font-size: 15px">${item.soLuong}</td>
	                    <td id="noiBat" style="text-align: center;font-size: 15px">${item.noiBat}</td>
	                    <td style="text-align: center;font-size: 15px">${item.daBan}</td>
	                    <td style="text-align: center;font-size: 15px">${item.categoryName}</td>
	                    <td style="text-align: center;font-size: 15px" id="discountName">${item.discountName}</td>
	                    <td style="text-align: center;font-size: 15px">${item.supplierName}</td>
	                    <td style="text-align: center;font-size: 15px">${item.gia}</td>
	                    <td style="text-align: center;font-size: 15px"><img alt="" src="${item.imgP}" style="width: 80px"> </td>
	                    <td style="text-align: center;">
	                        <button onclick="restoreOne('${item.id}')" class="btn btn-link " style="text-align: center;">Khôi phục</button>
	                        <button onclick="destroyOne('${item.id}','${item.tenProduct}')" id="delete" data-id="${item.id}" type="button" class="btn btn-link ">Xóa</button>
	                    </td>
                    </tr>
                  <c:set var="rowNumber" value="${rowNumber + 1}"/>
                </c:forEach>
                </tbody>
            </table>
           		<c:if test="${empty model.listResult}">
					<div style="text-align: center;">		
						<p>Bạn chưa xóa sản phẩm sữa bột nào !!!</p>
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
    	function restoreOne(id) {
    		$.ajax({
    			url:'${sanphamAPI}'+'/trash/restoreSanPham/'+id ,
    			type:'PATCH',
    			contentType: 'application/json',
    			dataType: 'json'
    		})
    		.then(data =>{
    			alert('Khôi phục thành công');
    			window.location.reload();
    		})
    		.catch(error =>{
    				alert('Khôi phục không thành công');
    		})
		}
    	function destroyOne(id,ten) {
    		var confirmation = confirm("Bạn chắc có muốn xóa sản phẩm :<<");
          	 if (confirmation) {
          		 $.ajax({
        				url:'${sanphamAPI}'+'/trash/destroySanPham/'+id,
        				type: "DELETE"
        			})
        			.then(data =>{
        				if (data === 200) {
     					alert('Xóa thành công'+ten);
        					window.location.reload();
     				}else if(data === 500){
     					alert('Sản phẩm ' + ten + ' đang tồn tại trong hóa đơn người dùng nên không thể xóa!!!');
     				}
     				else{
     					alert("Xóa không thành công!!!")
     				}
        				
        			})
        			.catch(error =>{
        				alert('ERROR!!!');
        			}) 
          	 }
          	 else{
          		 window.location.reload();
          	 }
   		
   	}
</script>
<script type="text/javascript">
var checkBoxAll = document.querySelectorAll('#checkBox-all')
var checkBoxItem = document.querySelectorAll('input[name="productItem[]"]')
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
	            var isCheckedAll = checkBoxItem.length === document.querySelectorAll('input[name="productItem[]"]:checked').length
	            checkBoxAll.forEach((checkAll) => {
	                checkAll.checked = isCheckedAll;
	            });
	            ableButtonDe();
	            ableButtonRe();
	            
	        })
	    })
	    function ableButtonRe(){
	        var checkedRestore = document.querySelector('button[name="restore-allCourse"]');
	        var checkedCount = document.querySelectorAll('input[name="productItem[]"]:checked').length;
	        if(checkedCount>0)
	        {
	            checkedRestore.disabled = false;
	        }
	        else{
	            checkedRestore.disabled = true;
	        }
	    }
	    function ableButtonDe(){
	        var checkedCount = document.querySelectorAll('input[name="productItem[]"]:checked').length;
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
var discounts = document.querySelectorAll('#discountName');
var noiBat = document.querySelectorAll('#noiBat');
discounts.forEach(e =>{
    if (e.textContent === "") {
        e.textContent = "Không có";
    }
    
})
noiBat.forEach(e =>{
    if (e.textContent === "true") {
        e.textContent = "Có"
    }
    else if(e.textContent === "false")
    {
        e.textContent = "Không"
    }
}) 
function restoreAll() {
	 var isSubmitable = !$('.btn-restoreAll').hasClass('disabled');
   if(isSubmitable)
   {
  	 var ids = [];
		
       // Sử dụng jQuery để lặp qua các hộp kiểm đã chọn
       $('input[name="productItem[]"]:checked').each(function() {
           ids.push($(this).val());
       });
       
       restoreCheckBox(ids);
   }
  
   function restoreCheckBox(data){
  	 $.ajax({
  		 url:'${sanphamAPI}'+'/trash/restoreAllSanPham',
  		 type: 'PATCH',
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
	var confirmation = confirm("Bạn chắc có muốn xóa tài khoản, những đơn hàng của khách hàng đã đặt sẽ mất :<<");
 	 if (confirmation) {
			 var isSubmitable = !$('.btn-deleteAll').hasClass('disabled');
		    if(isSubmitable)
		    {
		   	 var ids = [];
				
		        // Sử dụng jQuery để lặp qua các hộp kiểm đã chọn
		        $('input[name="productItem[]"]:checked').each(function() {
		            ids.push($(this).val());
		        });
		        destroyCheckBox(ids);
		    }
 	 }else{
 		 window.location.reload();
 	 }
    function destroyCheckBox(data){
   	 $.ajax({
   		 url:'${sanphamAPI}'+'/trash/destroyAllSanPham',
   		 type: 'DELETE',
	         contentType: 'application/json',
	         data: JSON.stringify(data)
	         
   	 })
   	 .then(data =>{
   		if (data === 200) {
			alert('Xóa thành công');
				window.location.reload();
		}else if(data === 500){
			alert('Danh sách sản phẩm bạn đang muốn xóa đang tồn tại trong hóa đơn người dùng nên không thể xóa!!!');
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