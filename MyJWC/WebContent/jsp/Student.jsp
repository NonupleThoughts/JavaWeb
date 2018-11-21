<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import = "dao.*" %>
<%@ page import = "domain.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="charset=gb2312">
<title>Student.jsp</title>
</head>
<%
	if((Account)session.getAttribute("account") == null)
	{
		out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='/MyJWC/index.jsp'</script>");
	}
%>
	<frameset rows="70%,*" frameborder="0" framespacing="10">
		<frameset cols="30%,*">
			<frame src="../html/StudentLeft.html" noresize="noresize" />
			<frame src="PersonalInfo.jsp" name="contain" />
		</frameset>
	</frameset>
</html>