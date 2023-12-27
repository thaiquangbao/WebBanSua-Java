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
        <h1 style="text-align: center; ">Danh sách sản phẩm</h1>
        <div style="margin-bottom: 25px;">
            <label class="form-check-label" for="checkBox-all" style="margin-left: 1400px; ">
                <button onclick="window.location.href='${sanphamAPI}'+'/listSanPham/trash'" style="font-size: 18px"><i class="fas fa-trash-alt" style="width: 40px;height: 30px;"></i>
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
                    <th scope="col" style="width: 180px ;text-align: center;">
                        Loại sữa bột
                    </th>
                    <th scope="col" style="width: 100px ;text-align: center;">
                        Discount
                    </th> 
                    <th scope="col" style="width: 150px ;text-align: center;">
                        Nhà cung cấp
                    </th> 
                    <th scope="col" style="width: 150px ;text-align: center;">
                        Độ tuổi sử dụng
                    </th> 
                    <th scope="col" style="width: 150px ;text-align: center;">
                        Giá
                    </th> 
                    <th scope="col" style="width: 150px ;text-align: center;">
                        Ảnh
                    </th> 
                    <th class="col" style=" width: 150px;text-align: center;  " >Chỉnh sửa</th>
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
                        <td style="text-align: center;font-size: 15px">${item.doTuoiSuDung}</td>
	                   <td style="text-align: center;font-size: 15px">${item.gia}</td>
	                    <td style="text-align: center;font-size: 15px"><img  alt="" src="${item.imgP}" style="width: 80px"> </td>
	                    <td style="text-align: center;">
	                        <a href="<c:url value='/admin/sanpham/formUpdateSanPham/${item.id}' />" class="btn btn-link " style="text-align: center;">Sửa</a>
	                        <button onclick="deleteOne('${item.id}')" id="delete" data-id="${item.id}" type="button" class="btn btn-link ">Xóa</button>
	                    </td>
                    </tr>
                  <c:set var="rowNumber" value="${rowNumber + 1}"/>
                </c:forEach>
                </tbody>
            </table>
           		<c:if test="${empty model.listResult}">
					<div style="text-align: center;">		
						<p>Bạn chưa đăng sữa bột nào hãy bấm vào thêm sửa bột để thêm mới bạn nhé :3</p>
					</div>	
				</c:if>
             <div class="inserthv" style="margin-top: 50px; text-align: center;">
                <a class="btn btn-primary"  href="<c:url value='/admin/sanpham/formAddSanPham' />" style="font-size: 18px; border-top: 30px;,height: 300px; width: 200px; text-align: center; background-color: chocolate; border-color: chocolate;">Thêm sản phẩm</a>
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
function deleteOne(id) {
	 $.ajax({
			url:'${sanphamAPI}'+'/deleteSanPham/'+id,
			type: "PATCH",
			contentType: 'application/json',
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
		if (isSubmitable) {
			var ids=[];
			 $('input[name="productItem[]"]:checked').each(function() {
	             ids.push($(this).val());
	         });
			 
	         deleteCheckBox(ids);
		}
		function deleteCheckBox(data) {
			$.ajax({
	    		 url:'${sanphamAPI}'+'/deleteAllSanPham',
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