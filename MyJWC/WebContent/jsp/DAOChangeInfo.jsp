<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import = "domain.*"%>
<%@ page import = "dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gb2312">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("gb2312");
	Account account = (Account)session.getAttribute("account");
	if(account == null)
	{
		out.print("<script>alert('请先登录！');window.location.href = '/MyJWC/index.jsp'</script>");
	}
	account.setName(request.getParameter("userName"));
	account.setGender(request.getParameter("userGender"));
	account.setAddr(request.getParameter("userAddr"));
	//account.setBirthday(java.sql.Date.valueOf(request.getParameter("userBirthday")));
	account.setBirthday(request.getParameter("userBirthday"));
	account.setDepartment(request.getParameter("userDepartment"));
	account.setPhone(request.getParameter("userPhone"));
	AccountDAO accountDAO = new AccountDAO();
	if(accountDAO.update(account))
	{
%>
		<script>
			alert('更新成功');
		</script>		
<%		
	}
	else
	{
%>
		<script>
			alert('更新失败');
		</script>		
<%		
	}
%>
</body>
</html>
