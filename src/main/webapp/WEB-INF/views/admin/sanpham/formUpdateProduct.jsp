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
	<div class="mt-4">
	<div style="color: white">---</div>
	<div style="text-align: center; "><h1>Form cập nhập sản phẩm</h1></div>
     <div class="form-write" style="justify-content: space-between;display: inline-flex;">
            <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                <div class="col">
                    <label for="tenProduct" >Tên sản phẩm</label>
                    <input type="text" class="form-control" id="tenProduct" data-origin="${model.tenProduct}" name="tenProduct"  style="width: 500px;">
                </div>
                <div class="col">
                    <label for="trongLuong" >Trọng lượng</label>
                    <input type="text" class="form-control" id="trongLuong" data-origin="${model.trongLuong}" name="trongLuong"  style="width: 500px;">
                </div>
                 <div class="col">
                    <label for="moTa" >Mô tả</label>
                    <textarea class="form-control" id="moTa" data-origin="${model.moTa}" name="moTa" style="width: 500px;"> </textarea>
                    
                </div>
                <div class="col">
                    <label for="huongDanSuDung" >Hướng dẫn sử dụng</label>
                    <textarea class="form-control" id="huongDanSuDung" data-origin="${model.huongDanSuDung}" name="huongDanSuDung" style="width: 500px;"></textarea>
                    
                </div>
                <div class="col">
                    <label for="daBan" >Đã bán</label>
                    <input type="text" class="form-control" id="daBan" data-origin="${model.daBan}" name="daBan"  style="width: 500px;">
                </div>
                <div class="col">
                    <label for="soLuong" >Số lượng</label>
                    <input type="text" class="form-control" id="soLuong" data-origin="${model.soLuong}" name="soLuong"  style="width: 500px;">
                </div>
                 <div class="col">
                	<label>Nổi bật</label>
                   <select  data-origin="${model.noiBat}" name="noiBat" id="noiBat" style="width: 500px" class="form-control">
                   		<option value="Có">Có</option>
                  		<option value="Không">Không</option>
                   </select>
                </div>
                </div>
                <div class="form-row" style="margin-left: 200px; flex-basis: 50%">
                <div class="col">
                    <label for="gia" >Giá bán</label>
                    <input type="text" class="form-control" id="gia" data-origin="${model.gia}" name="gia"  style="width: 500px;">
                </div>
                 <div class="col">
                    <label for="doTuoiSuDung" >Độ tuổi sử dụng</label>
                    <input type="text" class="form-control" id="doTuoiSuDung" name="doTuoiSuDung" data-origin="${model.doTuoiSuDung}" style="width: 500px;">
                </div>
                <div class="col">
                	<label>Nhà chung cấp</label>
                   <select name="supplierName" data-origin="${model.supplierID}" id="supplierName" style="width: 500px" class="form-control">
                  
                   <c:forEach var="listSupplier" items="${modelS.listResult}">
                   		<option value="${listSupplier.id}">${listSupplier.tensupplier}</option>
                   	</c:forEach>
                   </select>
                </div>
                <div class="col">
                <label>Loại sữa</label>
                   <select name="categoryName" data-origin="${model.categoryID}" id="categoryName" style="width: 500px" class="form-control">
                   		
                   <c:forEach var="listCate" items="${modelC.listResult}">
                   		<option value="${listCate.id}">${listCate.categoryName}</option>
                   	</c:forEach>
                   	
                   </select>
                </div>
                <div class="col">
                <label>Discount</label>
                    <select name="discountName" data-origin="${model.discountID}" id="discountName" style="width: 500px" class="form-control discountName">
                    
                    <c:forEach var="listDis" items="${modelD.listResult}">
                   		<option value="${listDis.id }">${listDis.nameDiscount}</option>
                   	</c:forEach>
                    <option value="0" >Không có</option>   
                   </select>
                </div>
                 <div class="col">
                
	                <label>Ảnh sản phẩm</label><br>
	                    <img data-origin="${model.imgP}"  style="width: 80px; height: 80px;border-radius: 50%;margin-left: 10px;margin-right: 50px;" id="loadAvatar" alt="" class="ava">
	                        <div class="form-ava" style=" margin-top: 2px;margin-left: 5px;">
	                            <input type="file" class="image-user" id="file" name="file"  accept=".jpg, .png" /><br>
	                           
	                        </div> 
                
                </div>    
                </div>
   			 </div>
        	
            <div class="them" style="text-align: center;">
                <button type="button" onclick="updateProduct()" class="btn btn-outline-success" style="width: 80%;background:green;color: white ;margin-top: 50px; margin-left: 90px">Sửa</button>
            </div>
   

</div>

<script type="text/javascript">

document.addEventListener("DOMContentLoaded", function() {
    // Lấy dữ liệu từ đối tượng model
    var model1 = {
    		tenProduct: "${model.tenProduct}",
            trongLuong:"${model.trongLuong}",
            moTa : "${model.moTa}",
            huongDanSuDung : "${model.huongDanSuDung}",
            daBan:"${model.daBan}",
            soLuong:"${model.soLuong}",
            supplierName:"${model.supplierID}",
            categoryName:"${model.categoryID}",
            discountName:"${model.discountID}",
            img:"${model.imgP}",
    		gia:"${model.gia}",
    		doTuoiSuDung : "${model.doTuoiSuDung}",
    		noiBat : "${model.noiBat}"
    }
    
  	
    
    // Đặt giá trị cho các trường dữ liệu
    document.getElementById("tenProduct").value = model1.tenProduct;
    document.getElementById("trongLuong").value = model1.trongLuong;
    document.getElementById("moTa").value = model1.moTa;
    document.getElementById("huongDanSuDung").value = model1.huongDanSuDung;
    document.getElementById("daBan").value = model1.daBan;
    document.getElementById("soLuong").value = model1.soLuong;
    document.getElementById("supplierName").value = model1.supplierName;
    document.getElementById("categoryName").value = model1.categoryName;
    document.getElementById("discountName").value = model1.discountName;
    document.getElementById("loadAvatar").src = model1.img;
    document.getElementById("gia").value = model1.gia;
    document.getElementById("doTuoiSuDung").value = model1.doTuoiSuDung;
    document.getElementById("discountName").value = model1.discountName;
   
   
    if(model1.noiBat === "true"){
        document.getElementById("noiBat").value = "Có";
    }
    else if(model1.noiBat === "false"){
        document.getElementById("noiBat").value = "Không";
    }
    
});
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
/* var discountName = $('#discountName').val()
if (discountName === null) {
	discountName = "0"
} */
	function updateProduct() {
		var nameProduct = $('#tenProduct').val();
		var trongLuong= $('#trongLuong').val();
        var moTa = $('#moTa').val();
        var huongDanSuDung = $('#huongDanSuDung').val();
        var daBan = $('#daBan').val();
        var soLuong = $('#soLuong').val();
        var supplierName = $('#supplierName').val();
        var categoryName = $('#categoryName').val();
       var discountName = $('.discountName').val();
        var doTuoiSuDung = $('#doTuoiSuDung').val();
		var price = $('#gia').val();
       var named = $('#tenProduct').data().origin;
       var trongLuonged = $('#trongLuong').data().origin;
       var moTaed = $('#moTa').data().origin;
        var huongDanSuDunged =$('#huongDanSuDung').data().origin;
        var daBaned = $('#daBan').data().origin;
        var soLuonged = $('#soLuong').data().origin;
        var suppliered = $('#supplierName').data().origin;
        var categoried = $('#categoryName').data().origin;
        var discounted = $('#discountName').data().origin;
         var imged = $('#loadAvatar').data().origin;
         var priced =$('#gia').data().origin;
        var img = document.getElementById('loadAvatar');
        var anh = img.src;
        var doTuoiSuDunged = $('#doTuoiSuDung').data().origin;
        var noibat = $('#noiBat').val();
        var nobated = $('#noiBat').data().origin;
        var trongLuongRegex = /^\d*\.?\d+$/;
        var priceRegex = /^\d*\.?\d+$/;
        var doTuoiSuDungRegex = /^\d+$/;
        var soLuongRegex = /^\d+$/;
        var daBanRegex = /^\d+$/;
       if (discountName === null) {
           discountName = "0";
       }
        
   
        if(nobated.toString() === "true")
        {
            nobated = "Có"
        }
        else if (nobated.toString() === "false") {
            nobated = "Không"
        }
        
		if (nameProduct.trim() === '' || trongLuong.trim() === '' ||moTa.trim() === '' ||huongDanSuDung.trim() === '' ||daBan.trim() === '' 
        ||soLuong.trim() === '' ||supplierName.trim() === '' ||categoryName.trim() === '' ||discountName.trim() === '' || categoryName === '-- Chọn loại sản phẩm --'
        || supplierName === '-- Chọn nhà cung cấp --'|| discountName === '-- Chọn loại discount --' || price.trim() === '' || doTuoiSuDung.trim() === '') {
            alert("Vui lòng điền đầy đủ thông tin !!!");
            return;
        }
      else if (nameProduct === named && trongLuong === trongLuonged.toString() && moTa === moTaed.toString() && huongDanSuDung === huongDanSuDunged.toString()
            && daBan === daBaned.toString() && soLuong === soLuonged.toString() && priced.toString() === price && doTuoiSuDung === doTuoiSuDunged.toString() &&
        supplierName === suppliered.toString() && categoried.toString() === categoryName && discounted.toString() === discountName && anh === imged.toString()
        && noibat === nobated) {
            alert("Không có dữ liệu nào được thay đổi nên không có dữ liệu nào được cập nhật");
            window.location.href='${sanphamAPI}'+'/listSanPham';
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
       else if (nameProduct !== named) {
            $.ajax({
                url: "${sanphamAPI}"+"/check",
                    type:"POST",
                    contentType: 'application/json',
					data: JSON.stringify({
						tenProduct: nameProduct
				
					})
            })
            .then(data =>{
                if (data.errorMessage === 1) {
                    alert("Tên sản phẩm đã tồn tại");
                    window.location.reload();
                }
                else{
                    update();
                }
            })
            .catch(error => {
                alert('Lỗi hệ thống')
            })
       }
       else{
            update();
       }
       function update() {
            $.ajax({
                url : "${sanphamAPI}"+"/formUpdateSanPham/"+${model.id}+"/update",
                type: "PUT",	
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
                        doTuoiSuDung: doTuoiSuDung,
                        imgP:anh,
                        gia : price,
                        banChay:noibat
                    }),
                    dataType: 'json'
            })
            .then(data =>{
                alert('Update sản phẩm thành công');
                window.location.href='${sanphamAPI}'+'/listSanPham';
                
            })
            .catch(error =>{
                
                alert('Kích thước ảnh không cho phep');
            })
        }  
    }    


</script>
</body>
</html>