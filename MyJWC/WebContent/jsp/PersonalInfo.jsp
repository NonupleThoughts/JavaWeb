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
		out.print("<script language='JavaScript'>alert('���ȵ�¼��');window.location.href='/MyJWC/index.jsp'</script>");
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
					<td>ѧ��</td><td><%= account.getUserid() %></td>
<%
				}
				else
				{
%>
					<td>����</td><td><%= account.getUserid() %></td>
<%
				}
					
%>
				
				<td>����</td><td><%= account.getName() %></td>
			</tr>
			<tr>
				<td>�Ա�</td><td><%= account.getGender() %></td>
				<td>����</td><td><%= account.getBirthday() %></td>
			</tr>
			<tr>
				<td>�绰</td><td><%= account.getPhone() %></td>
				<td>����</td><td><%= account.getAddr() %></td>
			</tr>			
			<tr>
				<td>Ժϵ</td><td><%= account.getDepartment() %></td>
			</tr>
		</table>
	</div>
</body>
</html>