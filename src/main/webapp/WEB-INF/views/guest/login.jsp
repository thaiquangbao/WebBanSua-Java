<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa bột</title>

</head>
<body>

        <div class="modal-dialog " style="margin-top: 500px; ">
            <div class="modal-content ">
                <div class="modal-header ">
                    <h2 style="text-align: center; ">Đăng Nhập</h2>
                </div>
                <c:if test="${param.incorrectAccount != null}">
					<div class="alert alert-danger">	
							Username hoặc password không đúng
					</div>
				</c:if>
				<c:if test="${param.accessDenied != null}">
					<div class="alert alert-danger">	
							Bạn không có quyền truy cập vào trang này!!!
					</div>
				
				</c:if>
                <form action="login/j_spring_security_check" method="post" >
	                <div class="modal-body ">
	                    <div class="container ">
	                        <div class="col-md-12 ">
	                            <label for="Name" class="control-label col-md-12 " style="font-size: 23px; ">Tên Đăng Nhập</label>
	                            <div class="col-md-12 ">
	                                <input style="width: 500px;" type="text" id="userName" name="j_username" class="form-control">
	                            </div>
	                        </div>
	
	                        <div class="col-md-12 ">
	                            <br><label for="Name" class="control-label col-md-12 " style="font-size: 20px; ">Mật Khẩu</label>
	                            <div class="col-md-12 ">
	                                <input type="password" style="width: 500px;" id="passWord" name="j_password"  class="form-control" >
	                            </div>
	                        </div>
	                        <div class="col-md-12 ">
	
	                            <br><button class="btn btn-Sucess btn-group-justified "  type="submit" style="color:white; background-color: green; width: 100%; height: 50px; ">ĐĂNG NHẬP</button><br>
	
	                        </div>
	                         <div>
                            	<br><button onclick="window.location.href='/suabot/guest/forgetpassword'" class="btn btn-Sucess btn-group-justified "  id="dangki" type="button" style="color:white; background-color: green; width: 95%; height: 45px; margin-left: 15px ">QUÊN MẬT KHẨU</button><br>
                            </div>
	                    </div>
	                </div>
                </form>
            </div>
        </div>
  	
</body>
</html>