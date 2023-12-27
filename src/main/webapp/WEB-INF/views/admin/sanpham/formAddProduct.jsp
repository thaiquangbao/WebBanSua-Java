<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>	
<c:url var="sanphamAPI" value="/admin/sanpham"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mt-4" >
	<div style="color: white">---</div>
	<div style="text-align: center; "><h1>Form nhập thêm sản phẩm</h1></div>
	 
        <div class="form-write" style="justify-content: space-between;display: inline-flex;">
           
            <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                <div class="col">
                    <label for="tenProduct" >Tên sản phẩm</label>
                    <input type="text" class="form-control" id="tenProduct" name="tenProduct" style="width: 500px;">
                </div>
                <div class="col">
                    <label for="trongLuong" >Trọng lượng</label>
                    <input type="text" class="form-control" id="trongLuong" name="trongLuong" style="width: 500px;">
                </div>
                <div class="col">
                    <label for="moTa" >Mô tả</label>
                    <textarea class="form-control" id="moTa" name="moTa" style="width: 500px;"> </textarea>
                    
                </div>
                <div class="col">
                    <label for="huongDanSuDung" >Hướng dẫn sử dụng</label>
                    <textarea class="form-control" id="huongDanSuDung" name="huongDanSuDung" style="width: 500px;"></textarea>
                    
                </div>
                <div class="col">
                    <label for="daBan" >Đã bán</label>
                    <input disabled="disabled" type="text" value="0" class="form-control" id="daBan" name="daBan" style="width: 500px;">
                </div>
                <div class="col">
                    <label for="soLuong" >Số lượng</label>
                    <input type="text" class="form-control" id="soLuong" name="soLuong" style="width: 500px;">
                </div>
                <div class="col">
                	<label>Nổi bật</label>
                   <select name="noiBat" id="noiBat" style="width: 500px" class="form-control">
                   <option>-- Nổi bật --</option>
                  
                   		<option value="Có">Có</option>
                  		<option value="Không">Không</option>
                   </select>
                </div>
               </div>
                <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                <div class="col">
                    <label for="soLuong" >Giá bán</label>
                    <input type="text" class="form-control" id="gia" name="gia" style="width: 500px;">
                </div>
                <div class="col">
                    <label for="doTuoiSuDung" >Độ tuổi sử dụng</label>
                    <input type="text" class="form-control" id="doTuoiSuDung" name="doTuoiSuDung" style="width: 500px;">
                </div>
                <div class="col">
                	<label>Nhà chung cấp</label>
                   <select name="supplierName" id="supplierName" style="width: 500px" class="form-control">
                   <option>-- Chọn nhà cung cấp --</option>
                   <c:forEach var="listSupplier" items="${modelS.listResult}">
                   		<option value="${listSupplier.id}">${listSupplier.tensupplier}</option>
                   	</c:forEach>
                   </select>
                </div>
                <div class="col">
                <label>Loại sữa</label>
                   <select name="categoryName" id="categoryName" style="width: 500px" class="form-control">
                   		<option>-- Chọn loại sản phẩm --</option>
                   <c:forEach var="listCate" items="${modelC.listResult}">
                   		<option value="${listCate.id }">${listCate.categoryName}</option>
                   	</c:forEach>
                   </select>
                </div>
                <div class="col">
                <label>Discount</label>
                    <select name="discountName" id="discountName" style="width: 500px" class="form-control">
                    <option value="0">-- Chọn loại discount --</option>
                    <c:forEach var="listDis" items="${modelD.listResult}">
                   		<option value="${listDis.id }">${listDis.nameDiscount}</option>
                   	</c:forEach>
                   </select>
                </div>
                <div class="col">
                
                <label>Ảnh sản phẩm</label><br>
                    <img src="" style="width: 80px; height: 80px;border-radius: 50%;margin-left: 10px;margin-right: 50px;" id="loadAvatar" alt="" class="ava">
                        <div class="form-ava" style=" margin-top: 2px;margin-left: 5px;">
                            <input type="file" class="image-user" id="file" name="file"  accept=".jpg, .png" /><br>
                           
                        </div> 
                
                </div>    
            </div>
        </div>   
        
            <div class="them" style="text-align: center;">
                <button type="button" onclick="addProduct()" class="btn btn-outline-success" style="width: 1200px;margin-left:60px ;margin-top: 50px; background-color: green; color: white;">Thêm</button>
            </div>
</div>
<script type="text/javascript">
var fileSelect = document.getElementById('file');
var img = document.getElementById('loadAvatar');
fileSelect.addEventListener('change', () => {
   if (fileSelect.files && fileSelect.files[0]) {
    var fileLoader = fileSelect.files[0];
    var fileReader = new FileReader();
    
    fileReader.onload = function (fileLoaderEvent) {
        var srcData = fileLoaderEvent.target.result;
        img.src = srcData; // Set the src of the img element
    }

    fileReader.readAsDataURL(fileLoader);
}
})
	function addProduct() {
		var nameProduct = $('#tenProduct').val();
		var trongLuong= $('#trongLuong').val();
        var moTa = $('#moTa').val();
        var huongDanSuDung = $('#huongDanSuDung').val();
        var daBan = $('#daBan').val();
        var soLuong = $('#soLuong').val();
        var supplierName = $('#supplierName').val();
        var categoryName = $('#categoryName').val();
        var discountName = $('#discountName').val();
        var doTuoiSuDung = $('#doTuoiSuDung').val();
        var noibat = $('#noiBat').val();
        var price = $('#gia').val();
        var img = document.getElementById('loadAvatar');
        var anh = img.src;
        var trongLuongRegex = /^\d*\.?\d+$/;
        var priceRegex = /^\d*\.?\d+$/;
        var doTuoiSuDungRegex = /^\d+$/;
        var soLuongRegex = /^\d+$/;
        var daBanRegex = /^\d+$/;
		if (nameProduct.trim() === '' || trongLuong.trim() === '' ||moTa.trim() === '' ||huongDanSuDung.trim() === '' ||daBan.trim() === '' 
        ||soLuong.trim() === '' ||supplierName.trim() === '' ||categoryName.trim() === '' ||discountName.trim() === '' || categoryName === '-- Chọn loại sản phẩm --'
        || supplierName === '-- Chọn nhà cung cấp --' || price.trim() === '' || doTuoiSuDung.trim() ==='' || noibat=== '-- Nổi bật --') {
            alert("Vui lòng điền đầy đủ thông tin !!!");
            return;
        }
        else if (nameProduct != nameProduct.toUpperCase()) {
            alert("Tên sản phẩm phải viết hoa");
            return;
        }     
        else if(!trongLuongRegex.test(trongLuong.trim())){
            alert("Trọng lượng là số và không có chữ");
            return;
        }
        else if(!soLuongRegex.test(soLuong.trim())){
            alert("Số lượng > 0 và không có chữ");
            return;
        } 
        else if(Number(soLuong) < Number(daBan))
        {
            alert("Số lượng sản phẩm phải lớn hơn số lượng đã bán");
        }
        else if (!priceRegex.test(price)) {
            alert("Giá là số và không có chữ");
            return;
        }
       
        else{
        	$.ajax({
         			url : '${sanphamAPI}'+'/formAddSanPham/create',
         			type: 'POST',	
         			contentType: 'application/json',
                     data: JSON.stringify({
                    	 tenProduct: nameProduct,
                         trongLuong:trongLuong,
                     	moTa : moTa,
                         huongDanSuDung:huongDanSuDung,
                         daBan:daBan,
                         soLuong:soLuong,
                         supplierID:supplierName,
                         categoryID:categoryName,
                         discountID:discountName,
                         imgP:anh,
                         gia:price,
                         doTuoiSuDung:doTuoiSuDung,
                         banChay:noibat
                     }),
                     dataType: 'json'
         		})
         		.then(data =>{
                 if (data.errorMessage === 1) {
                     alert("Sản phẩm này đã tồn tại");
                 }
                 else{
                     alert('Thêm sản phẩm thành công');
                     window.location.href='${sanphamAPI}'+'/listSanPham'
                 }
     			
     			
     		})
     		.catch(error =>{
     			alert('Kích thước ảnh quá lớn');
     		})
		}
        
        	 
     	
        
       
	}
</script>
</body>
</html>