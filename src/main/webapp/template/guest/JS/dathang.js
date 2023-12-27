$(document).ready(function() {
    $("#btndangki").click(function() {
        $("#mymodal").modal();
    })
});

function kiemtraTen() {
    let maukt = /([A-Z]{1}[a-z]+)((\s{1}[A-Z]{1}[a-z]+){1,})$/;
    if ($("#Name").val() == "") {
        $("#tbName").html("Không để trống");
        return false;
    }
    if (!maukt.test($("#Name").val())) {
        $("#tbName").html("Mỗi ký tự đầu viết hoa không sử dụng số");
        return true;
    }
    $("#tbName").html("*");
    return true;
}

function kiemtrasdt() {
    let maukt = /(^0[0-9]{3}-[0-9]{3}-[0-9]{3})$/
    if ($("#SD").val() == "") {
        $("#tbSDT").html("Không Để Trống");
        return false;
    }
    if (!maukt.test($("#SD").val())) {
        $("#tbSDT").html("Số Điện Thoại Phải Được VIết Bằng 10 Số")
        return true;
    }
    $("#tbSDT").html("*");
    return true;
}

function kiemtradiachi() {
    let maukt = /(^[A-Z0-9][a-z]*)(\s{1}[A-Z0-9][a-z]*){1,}$/
    if ($("#DC").val() == "") {
        $("#tbDC").html("Không Để Trống");
        return false;
    }
    if (!maukt.test($("#DC").val())) {
        $("#tbDC").html("Không Đúng Form");
        return true;
    }
    $("#tbDC").html("*");
    return true;
}

function kiemtratensanpham() {
    let maukt = /() $/
}