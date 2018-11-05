<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="gb2312">
<title>Insert.jsp</title>
</head>
<body>
<%!
	final String SQLUrl  = "jdbc:mysql://localhost:3306/petstore? useUnicode = true & characterEncoding = utf-8&useSSL = false&serverTimezone = GMT";
	final String SQLDriverClass = "com.mysql.cj.jdbc.Driver";
	final String SQLUser = "root";
	final String SQLPassword = "1234";
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
	Connection conn = null;
	PreparedStatement pstmt = null;
	try
	{
		conn = DriverManager.getConnection(SQLUrl, SQLUser, SQLPassword);
		pstmt = conn.prepareStatement("INSERT INTO PRODUCT(productid,category,cname,ename,image,descn,listprice,unitcost)" 
		+"VALUES"
		+ "(?,?,?,?,?,?,?,?)");
/* 		String productid = request.getParameter("productid");
		String category = request.getParameter("category");
		String cname = request.getParameter("cname");
		String ename = request.getParameter("ename");
		String image = request.getParameter("image");
		String descn = request.getParameter("descn");
		float listprice = Float.parseFloat(request.getParameter("listprice"));
		float unitcost = Float.parseFloat(request.getParameter("unitcost")); */ 
		request.setCharacterEncoding("gb2312");
 		pstmt.setString(1, request.getParameter("productid"));
		pstmt.setString(2, request.getParameter("category"));
		pstmt.setString(3, request.getParameter("cname"));
		pstmt.setString(4, request.getParameter("ename"));
		pstmt.setString(5, request.getParameter("image"));
		pstmt.setString(6, request.getParameter("descn"));
		pstmt.setFloat(7, Float.parseFloat(request.getParameter("listprice")));
		pstmt.setFloat(8, Float.parseFloat(request.getParameter("unitcost")));
		pstmt.executeUpdate();
		System.out.println("添加成功...");
%>
		添加成功<br>
		<a href = "../welcome.html">首页</a>&nbsp;&nbsp;
		<a href = "../HTML/insert.html">继续插入</a>
<%
	}catch(SQLException e)
	{
		e.printStackTrace();
	}finally
	{
		try
		{
			conn.close();
		}catch(SQLException e) {}
		try
		{
			pstmt.close();
		}catch(SQLException e) {}		
	}
%>
</body>
</html>