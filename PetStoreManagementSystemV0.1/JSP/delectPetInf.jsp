<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gb2312">
<title>delete.jsp</title>
</head>
<body>

<%!
	final String SQLUrl  = "jdbc:mysql://localhost:3306/petstore? useUnicode = true & characterEncoding = utf-8&useSSL = false&serverTimezone = GMT";
	final String SQLDriverClass = "com.mysql.cj.jdbc.Driver";
	final String SQLUser = "root";
	final String SQLPassword = "1234";
	Connection conn = null;
	Statement stmt  = null;
%>
<%
	//加载驱动类
	System.out.println("加载驱动类...");
	try
	{
		Class.forName(SQLDriverClass);
		System.out.println("加载成功...");
	}catch(ClassNotFoundException e)
	{
		System.out.println("加载失败...");
		e.printStackTrace();
	}
	//连接数据库
	try
	{
		conn = DriverManager.getConnection(SQLUrl, SQLUser, SQLPassword);
		stmt = conn.createStatement();
		stmt.executeUpdate("DELETE FROM PRODUCT WHERE PRODUCTID ="  + "'" + request.getParameter("productid") +"'");
%>
		删除成功<br>
		<a href = "../welcome.html">首页</a>&nbsp;&nbsp;
		<a href = "../HTML/delete.html">继续删除</a>
<%		
	}catch(SQLException e)
	{
		e.printStackTrace();
	}finally
	{
		try
		{
			conn.close();
		}catch(SQLException e){}
	}
%>


</body>
</html>