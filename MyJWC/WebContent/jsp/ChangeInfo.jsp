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
		out.print("<script language='JavaScript'>alert('���ȵ�¼��');window.location.href='/MyJWC/index.jsp'</script>");
	}
%>	
	<div>
		<form action = "DAOChangeInfo.jsp" method = "post">
			ѧ�ţ�<input type = "text" name = "userid" value = '<%= account.getUserid()%>' readonly = "readonly"><br/>
			������<input type = "text" name = "userName" <%if(account.getName() != null){%>value = <%= account.getName()%><%}%> required = "required"><br/>
			�Ա�
			<select name = "userGender">
				<option value = "��">��</option>
				<option value = "Ů">Ů</option>
			</select><br/>
			���᣺<input type = "text" name = "userAddr" <%if(account.getAddr() != null){%>value = <%= account.getAddr()%><%}%> required = "required"><br/>
			���գ�<input type = "date" name = "userBirthday" <%if(account.getBirthday() != null){%>value = <%= account.getBirthday()%><%}%> required = "required"><br/>
			Ժϵ��<input type = "text" name = "userDepartment" <%if(account.getDepartment() != null){%>value = <%= account.getDepartment()%><%}%> required = "required"><br/>
			�绰��<input type = "text" name = "userPhone" <%if(account.getPhone() != null){%>value = <%= account.getPhone()%><%}%> required = "required"><br/>
			<input type = "submit" value = "�ύ">&nbsp;&nbsp;<input type = "reset" value = "����"><br/>
		</form>
	</div>
</body>
</html>