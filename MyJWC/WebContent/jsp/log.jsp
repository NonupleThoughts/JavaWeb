<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import = "dao.*" %>
<%@ page import = "domain.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="gb2312">
<title>check</title>
</head>
<body>
<%!
	private String username = new String();
	private String userPassword = new String();
	private AccountDAO accountDao = new AccountDAO();
	private Account account = null;
%>
<%
	username = request.getParameter("username");
	userPassword = request.getParameter("password");
	
	account = accountDao.findByUserid(username, userPassword);
	if(account != null)
	{
		session.setAttribute("account", account);
		
		if(username.charAt(0) == '0')
		{
			response.sendRedirect("Student.jsp");
%>
<%--			
			<jsp:forward page = "/MyJWC/jsp/Student.jsp">
				<jsp:param name = "account" value = "<%= account %>"/>
			</jsp:forward>
--%>			
<%
		}
		else
		{
			response.sendRedirect("Teacher.jsp");
%>
<%--
			<jsp:forward page = "/MyJWC/jsp/Teacher.jsp">
				<jsp:param name = "account" value = "<%= account %>"/>
			</jsp:forward>
--%>
<%			
		}
		
	}
	else
	{
		System.out.println("dasdas");
		String path = request.getContextPath();
		System.out.println(path);
		//这里有个问题是弹出的窗口是在log.jsp中弹出的，如何能直接在index.html中弹出错误窗口？？ 
		out.print("<script>alert('您的用户名或密码有误，请重新输入或者注册');window.location.href='../index.jsp'</script>");	
	}
%>
</body>
</html>