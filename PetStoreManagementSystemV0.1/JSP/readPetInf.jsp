<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import = "java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="gb2312">
<title>readStuInf.jsp</title>
</head>
<body>
<%!
	final String SQLUrl  = "jdbc:mysql://localhost:3306/petstore? useUnicode = true & characterEncoding = utf-8&useSSL = false&serverTimezone = GMT";
	final String SQLDriverClass = "com.mysql.cj.jdbc.Driver";
	final String SQLUser = "root";
	final String SQLPassword = "1234";
%>
<%
	//����������
	System.out.println("����������...");
	try
	{
		Class.forName(SQLDriverClass);
		System.out.println("���سɹ�...");
	}catch(ClassNotFoundException e)
	{
		System.out.println("����ʧ��...");
		e.printStackTrace();
	}
	//�������ݿ�
	try(
			Connection conn = DriverManager.getConnection(SQLUrl, SQLUser, SQLPassword);
			Statement stmt  = conn.createStatement();
			ResultSet rst = stmt.executeQuery("SELECT * FROM PRODUCT");
		)
	{
		while(rst.next())
		{
%>
			<%= rst.getString("productid")%>&nbsp;&nbsp;
			<%= rst.getString("category")%>&nbsp;&nbsp;
			<%= rst.getString("cName")%>&nbsp;&nbsp;
			<%= rst.getString("eName")%>&nbsp;&nbsp;
			<%= rst.getFloat("unitCost")%><br/>
<%			
		}
%>
	<a href = "../welcome.html">��ҳ</a><br/>
<%	
	}catch(SQLException e)
	{
		e.printStackTrace();
	}
%>
</body>
</html>