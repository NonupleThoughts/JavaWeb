<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@	page import = "dao.*"%>
<%@	page import = "domain.*"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.util.TreeSet"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="charset=gb2312">
<title>Insert title here</title>
</head>
<%
	if((Account)session.getAttribute("account") == null)
	{
		out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='/MyJWC/index.jsp'</script>");
	}
%>
	<frameset rows="20%,*" frameborder="0" framespacing="10">
		<frame src="TeacherSetGradeTop.jsp" noresize="noresize" />
		<frame src="" name="containGrade" />
	</frameset>
</html>
</html>