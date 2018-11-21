<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import = "domain.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gb2312">
<title>Insert title here</title>
</head>
<body>
<%
	Account account = (Account)session.getAttribute("account");

	if(account == null)
	{
		out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='/MyJWC/index.jsp'</script>");
	}
%>	
	<div>
		<form action = "DAOChangeInfo.jsp" method = "post">
			学号：<input type = "text" name = "userid" value = '<%= account.getUserid()%>' readonly = "readonly"><br/>
			姓名：<input type = "text" name = "userName" <%if(account.getName() != null){%>value = <%= account.getName()%><%}%> required = "required"><br/>
			性别：
			<select name = "userGender">
				<option value = "男">男</option>
				<option value = "女">女</option>
			</select><br/>
			籍贯：<input type = "text" name = "userAddr" <%if(account.getAddr() != null){%>value = <%= account.getAddr()%><%}%> required = "required"><br/>
			生日：<input type = "date" name = "userBirthday" <%if(account.getBirthday() != null){%>value = <%= account.getBirthday()%><%}%> required = "required"><br/>
			院系：<input type = "text" name = "userDepartment" <%if(account.getDepartment() != null){%>value = <%= account.getDepartment()%><%}%> required = "required"><br/>
			电话：<input type = "text" name = "userPhone" <%if(account.getPhone() != null){%>value = <%= account.getPhone()%><%}%> required = "required"><br/>
			<input type = "submit" value = "提交">&nbsp;&nbsp;<input type = "reset" value = "重置"><br/>
		</form>
	</div>
</body>
</html>