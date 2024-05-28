<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg1=(String)request.getAttribute("msg1");
	String loc1=(String)request.getAttribute("loc1");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시스템 메세지</title>
</head>
<body>
	<script>
		alert('<%=msg1%>');
		history.go(-2);
		
	</script>
</body>
</html>