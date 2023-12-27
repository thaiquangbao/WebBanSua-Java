$(document).ready(function() {
    $("#btndangnhap").click(function() {
        $("#mymodaldangnhap").modal();
    })
});


$(document).ready(function() {
    $("#btndangki").click(function() {
        $("#mymodaldangki").modal();
    })
});


function kiemtratendangnhap() {
    let maukt = /(^[a-z][a-z0-9]{1,})$/;
    if ($("#tendangnhap").val() == "") {
        $("#tbtendangnhap").html("Không Được Rỗng")
        return false;
    }
    if (!maukt.test($("#tendangnhap").val())) {
        $("#tbtendangnhap").html("Tên Đăng Nhập Không Viết Hoa Và Có Thể Dùng Số")
        return false;
    }
    $("#tbtendangnhap").html("OK");
    return true;

}

function kiemtramatkhau() {
    let maukt = /([A-Za-z0-9]{8,})$/;
    if ($("#matkhau").val() == "") {
        $("#tbmatkhau").html("Không Được Rỗng")
        return false;
    }
    if (!maukt.test($("#matkhau").val())) {
        $("#tbmatkhau").html("Mật Khẩu Phải Chứa 8 Kí Tự Trở Lên")
        return false;
    }
    $("#tbmatkhau").html("OK");
    if (kiemtratendangnhap() == true) {
        $("#travedangnhap").html("Đăng Nhập")
    }
    return true;

}

function kiemtraTen() {
    let maukt = /([A-Z]{1}[a-z]+)((\s{1}[A-Z]{1}[a-z]+){1,})$/;
    if ($("#Name").val() == "") {
        $("#tbName").html("Không Được Rỗng");
        return false;
    }
    if (!maukt.test($("#Name").val())) {
        $("#tbName").html("Mỗi Kí Tự Đầu Viết Hoa Và Không Sử Dụng Số")
        return false;
    }
    $("#tbName").html("OK");
    return true;
}

function kiemtratendangnhap1() {
    let maukt = /(^[a-z][a-z0-9]{1,})$/;
    if ($("#tendangnhap1").val() == "") {
        $("#tbtendangnhap1").html("Không Được Rỗng")
        return false;
    }
    if (!maukt.test($("#tendangnhap1").val())) {
        $("#tbtendangnhap1").html("Tên Đăng Nhập Không Viết Hoa Và Có Thể Dùng Số")
        return false;
    }
    $("#tbtendangnhap1").html("OK");
    return true;

}

function kiemtramatkhau1() {
    let maukt = /([A-Za-z0-9]{8,})$/;
    if ($("#matkhau1").val() == "") {
        $("#tbmatkhau1").html("Không Được Rỗng")
        return false;
    }
    if (!maukt.test($("#matkhau1").val())) {
        $("#tbmatkhau1").html("Mật Khẩu Phải Chứa 8 Kí Tự Trở Lên")
        return false;
    }
    $("#tbmatkhau1").html("OK");
    return true;

}

function kiemtrarematkhau() {
    if ($("#rematkhau").val() == "") {
        $("#tbrematkhau").html("Không Được Rỗng")
        return false;
    }
    if ($("#rematkhau").val() != $("#matkhau1").val()) {
        $("#tbrematkhau").html("Mật Khẩu Nhập Lại Phải Giống Mật Khẩu");
        return false;
    }
    $("#tbrematkhau").html("OK")
    return true;

}

function kiemtrasdt() {
    let maukt = /(^0[0-9]{9})$/
    if ($("#SD").val() == "") {
        $("#tbSDT").html("Không Được Rỗng");
        return false;
    }
    if (!maukt.test($("#SD").val())) {
        $("#tbSDT").html("Số Điện Thoại Phải Được VIết Bằng 10 Số")
        return false;
    }
    $("#tbSDT").html("OK");
    return true;
}

function kiemtradiachi() {
    let maukt = /(^[A-Z0-9][a-z0-9]*)(\s{1}[A-Z0-9][a-z0-9]*){1,}$/
    if ($("#DC").val() == "") {
        $("#tbDC").html("Không Được Rỗng");
        return false;
    }
    if (!maukt.test($("#DC").val())) {
        $("#tbDC").html("VD : 63 Tran Phu Quan 1 TPHCM");
        return false;
    }
    $("#tbDC").html("OK");
    return true;
}

function kiemtraemail() {
    let maukt = /(^[a-z][a-z0-9]+)(@gmail.com)$/
    if ($("#email").val() == "") {
        $("#tbemail").html("Không Được Rỗng");
        return false;
    }
    if (!maukt.test($("#email").val())) {
        $("#tbemail").html("VD : vutienduc26122002@gmail.com");
        return false;
    }
    $("#tbemail").html("OK");
    if (kiemtratendangnhap1() == true && kiemtraTen() == true && kiemtramatkhau1() == true && kiemtrarematkhau() == true && kiemtrasdt() == true &&
        kiemtradiachi() == true) {
        $("#travedangki").html("Đăng Kí")
    }
    return true;
}

$(document).ready(function() {
    $("#btndathang").click(function() {
        $("#mymodaldathang").modal();
    })
});

function kiemtraTen1() {
    let maukt = /([A-Z]{1}[a-z]+)((\s{1}[A-Z]{1}[a-z]+){1,})$/;
    if ($("#Name1").val() == "") {
        $("#tbName1").html("Không Được Rỗng");
        return false;
    }
    if (!maukt.test($("#Name1").val())) {
        $("#tbName1").html("Mỗi Kí Tự Đầu Viết Hoa Và Không Sử Dụng Số")
        return false;
    }
    $("#tbName1").html("OK");
    return true;
}

function kiemtradiachi1() {
    let maukt = /(^[A-Z0-9][a-z0-9]*)(\s{1}[A-Z0-9][a-z0-9]*){1,}$/
    if ($("#DC1").val() == "") {
        $("#tbDC1").html("Không Được Rỗng");
        return false;
    }
    if (!maukt.test($("#DC1").val())) {
        $("#tbDC1").html("VD : 63 Tran Phu Quan 1 TPHCM");
        return false;
    }
    $("#tbDC1").html("OK");
    return true;
}

function kiemtrasdt1() {
    let maukt = /(^0[0-9]{9})$/
    if ($("#SD1").val() == "") {
        $("#tbSDT1").html("Không Được Rỗng");
        return false;
    }
    if (!maukt.test($("#SD1").val())) {
        $("#tbSDT1").html("Số Điện Thoại Phải Được VIết Bằng 10 Số")
        return false;
    }
    $("#tbSDT1").html("OK");
    if (kiemtraTen1() == true && kiemtradiachi1() == true) {
        $("#travedathang").html("Đặt Hàng")
    }
    return true;
}