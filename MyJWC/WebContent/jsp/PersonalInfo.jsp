<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import = "domain.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="gb2312">
<title>Insert title here</title>
</head>
<body>
<%
	if((Account)session.getAttribute("account") == null)
	{
		out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='/MyJWC/index.jsp'</script>");
	}
%>

<%
	Account account = (Account)session.getAttribute("account");
%>
	<div id = "PersonalInfo">
		<table border = "1">
			<tr>
			<%
				if(account.getUserid().charAt(0) == '0')
				{
%>
					<td>学号</td><td><%= account.getUserid() %></td>
<%
				}
				else
				{
%>
					<td>工号</td><td><%= account.getUserid() %></td>
<%
				}
					
%>
				
				<td>姓名</td><td><%= account.getName() %></td>
			</tr>
			<tr>
				<td>性别</td><td><%= account.getGender() %></td>
				<td>生日</td><td><%= account.getBirthday() %></td>
			</tr>
			<tr>
				<td>电话</td><td><%= account.getPhone() %></td>
				<td>籍贯</td><td><%= account.getAddr() %></td>
			</tr>			
			<tr>
				<td>院系</td><td><%= account.getDepartment() %></td>
			</tr>
		</table>
	</div>
</body>
</html>