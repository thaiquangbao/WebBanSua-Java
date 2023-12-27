<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>	
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
            <h1 style="text-align: center; ">Danh sách đơn hàng</h1>
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
            <table class="table" id="myTable" >
                <thead class="thead-dark "  style="background-color: black; color: white">
                    <tr >
                    <th style="width: 50px;">Chọn</th>
                    <th scope="col" style="width: 50px; text-align: center;">#</th>
                    <th scope="col" style="width: 150px ; text-align: center;">
                        Tài khoản
                    </th>         
                    <th scope="col" style="width: 150px ;text-align: center;">
                       Tên khách hàng
                    </th>
                   
                     <th scope="col" style="width: 150px ;text-align: center;" >
                        Ngày đặt hàng
                    </th>   
                    <th scope="col" style="width: 200px ;text-align: center;">
                        Phương thức thanh toán
                    </th>  
                    <th scope="col" style="width: 100px ;text-align: center;">
                        Tổng tiền
                     </th> 
                    <th scope="col" style="width: 150px ; text-align: center;">
                        Trạng thái
                    </th>
                    
                    <th class="col" style=" width: 150px;text-align: center;  " >Chỉnh sửa</th>
                    </tr>
                   
                </thead>

                <tbody>
                    <tr>
                              
                        <td style="text-align: center; font-weight: bold;">Thống kê</td>
                        <td></td>  
                        <td style="text-align: center;  font-weight: bold;">Tổng số đơn hàng <p>${count}</p></td>
                        <td style="text-align: center;  font-weight: bold;">Số khách hàng<p>${countUser}</p></td>
                        <td style="text-align: center;  font-weight: bold;">Số đơn hàng đã duyệt<p>${countDaDuyet}</p></td>
                        <td style="text-align: center;  font-weight: bold;">Số đơn hàng chưa duyệt<p>${countChuaDuyet}</p></td> 
                        <td style="text-align: center;  font-weight: bold; width: 200px ;">Tống doanh thu<p>${doanhThu}</p> VND</td>
                        <td style="text-align: center;  font-weight: bold;">Số sản phẩm đã bán<p>${sanPhamDB}</p></td>
                        <td style="text-align: center;  font-weight: bold;">Số sản phẩm còn lại<p>${spConLai}</p></td>
                    </tr>
                    <c:set var="rowNumber" value="1" />
                    <c:forEach var="item" items="${model.listResult}">
                    <tr>
	                    <td>
	                        <div class="form-check">
	                            <input class="form-check-input" type="checkbox" name="productItem[]" value="${item.id}">
	
	                        </div>
	                    </td>
	                    <th scope="row" style="text-align: center;">${rowNumber}</th>
	                    <td style="text-align: center;font-size: 15px">${item.userName}</td>
	                    <td style="text-align: center;font-size: 15px">${item.tenKhachHang}</td>
	                    <td style="text-align: center;font-size: 15px" id="dateS">${item.ngayDatHang}</td>
	                    <td style="text-align: center;font-size: 15px">${item.phuongThucThanhToan}</td>
	                    <td style="text-align: center;font-size: 15px">${item.tongTien} VND</td>
	                    <td style="text-align: center;font-size: 15px">${item.trangThai}</td>
	                   <td style="text-align: center;">
	                        <a href="<c:url value='/admin/donhang/chitietdonhang/${item.id}' />" class="btn btn-link " style="text-align: center;">Chi tiết</a>
	                        <button onclick="destroyOne('${item.id}')" id="delete" data-id="${item.id}" type="button" class="btn btn-link ">Xóa</button>
	                    </td>
                    </tr>
                  <c:set var="rowNumber" value="${rowNumber + 1}"/>
                </c:forEach>
                </tbody>
            </table>
           		<c:if test="${empty model.listResult}">
					<div style="text-align: center;">		
						<p>Hiện tại chưa có đơn hàng nào :3</p>
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
    	
    	function destroyOne(id) {
    		var confirmation = confirm("Bạn chắc có muốn xóa đơn hàng này :<<");
    		 if (confirmation) {
		   		 $.ajax({
		   				url:'/suabot/admin/hoadon/destroyHD/'+id,
		   				type: "DELETE"
		   			})
		   			.then(data =>{
		   				alert('Xóa thành công');
		   				window.location.reload();
		   			})
		   			.catch(error =>{
		   				alert('Xóa không thành công');
		   			}) 
    		 }
    		 else{
    			 window.location.reload();
    		 }
   	}
</script>
<script type="text/javascript">
var ds = document.querySelectorAll("#dateS");


for (var i = 0; i < ds.length; i++) {
    var dataS = ds[i].innerHTML;
    
    ds[i].innerHTML = convertDate(dataS);
    
}


 function convertDate(date) {
		{
			 var parts = date.split(" ")[0];
			 return parts;
		}
	}
</script>
<script>
    var checkBoxAll = document.querySelectorAll('#checkBox-all')
    var checkBoxItem = document.querySelectorAll('input[name="productItem[]"]')
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
                var isCheckedAll = checkBoxItem.length === document.querySelectorAll('input[name="productItem[]"]:checked').length;
                checkBoxAll.forEach(checkAll=>
                checkAll.checked = isCheckedAll
                
                )
                ableCheckBox()
            })
        })
        function ableCheckBox(){
            var checkedCount = document.querySelectorAll('input[name="productItem[]"]:checked').length;
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
		var confirmation = confirm("Bạn chắc có muốn xóa đơn hàng này :<<");
		 if (confirmation) {
			if (isSubmitable) {
				var ids=[];
				 $('input[name="productItem[]"]:checked').each(function() {
		             ids.push($(this).val());
		         });
				 
		         deleteCheckBox(ids);
			}
		 }else{
			 window.location.reload();
		 }	
		function deleteCheckBox(data) {
			$.ajax({
	    		 url:'/suabot/admin/hoadon/destroyAllHD',
	    		 type: 'DELETE',
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