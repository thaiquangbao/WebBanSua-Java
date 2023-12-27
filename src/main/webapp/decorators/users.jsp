<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Sữa bột</title>
	<link  rel="shortcut icon" type="image/png" href="https://res.cloudinary.com/dk41ftplg/image/upload/v1700458938/Teach-Node/dd1laejnh3gvf67obnd6.png">
	<link rel="stylesheet" href="<c:url value='/template/users/css/dathang.css'/>" type="text/css">
	<link rel="stylesheet" type="text/css" href="<c:url value='/template/users/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='/template/users/css/sua.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/users/css/sanpham.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/users/css/style.css'/>" type="text/css">
</head>
<body>
	<div class="container-fluid">
	 <%@ include file="/common/users/header.jsp" %>
	 
	 	<dec:body />
	 	
     <%@ include file="/common/users/footer.jsp" %>
    </div>

    
    <script src="<c:url value='/template/users/JS/ap.js'/>"></script>
	<script src="<c:url value='/template/users/JS/jquery-3.5.1.min.js'/>"></script>
	<script src="<c:url value='/template/users/JS/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/template/users/JS/dangnhapanddangkianddathang.js'/>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" ></script>
</body>
</html>