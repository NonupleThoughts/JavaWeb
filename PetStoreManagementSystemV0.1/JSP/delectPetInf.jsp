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
	try
	{
		conn = DriverManager.getConnection(SQLUrl, SQLUser, SQLPassword);
		stmt = conn.createStatement();
		stmt.executeUpdate("DELETE FROM PRODUCT WHERE PRODUCTID ="  + "'" + request.getParameter("productid") +"'");
%>
		ɾ���ɹ�<br>
		<a href = "../welcome.html">��ҳ</a>&nbsp;&nbsp;
		<a href = "../HTML/delete.html">����ɾ��</a>
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