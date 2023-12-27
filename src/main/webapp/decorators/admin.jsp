<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/tablib.jsp"%>	
<%@ page import="com.suabot.until.SecurityUntil" %>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Sữa bột</title>
	<link  rel="shortcut icon" type="image/png" href="https://res.cloudinary.com/dk41ftplg/image/upload/v1700458938/Teach-Node/dd1laejnh3gvf67obnd6.png">
	<link rel="stylesheet" type="text/css" href="<c:url value='/template/admin/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/sua.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/sanpham.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/style.css'/>" type="text/css">
	
</head>
<body>
	<div class="container-fluid">
	 <%@ include file="/common/admin/header.jsp" %>
	 
	 	<dec:body />
	 	
     <%@ include file="/common/admin/footer.jsp" %>
    </div>

    <script src="<c:url value='/template/admin/JS/ap.js'/>"></script>
	<script src="<c:url value='/template/admin/JS/jquery-3.5.1.min.js'/>"></script>
	<script src="<c:url value='/template/admin/JS/bootstrap.min.js'/>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" ></script>
</body>
</html>