<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gb2312">
<title>Insert title here</title>
</head>
<body>
<%
	session.removeAttribute("account");
	out.print("<script type='text/javascript'>alert('用户退出成功!');window.location.href='/MyJWC/index.jsp';</script>");
%>
</body>
</html>