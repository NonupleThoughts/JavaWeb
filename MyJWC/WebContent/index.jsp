<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import = "dao.*"%>
<%@ page import = "domain.*"%>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gb2312">
<title>MyJWC</title>
</head>
<body>
	<div id = "top">
	</div>
	<div id = "Information">
		<h1>This is MyJWC</h1>
	</div>
	<div id = "files">  
<%
		//ͨ��servlet���������ļ�
		FilesDAO filesDAO = new FilesDAO();
		ArrayList<Files> allFiles = filesDAO.getAllFiles();
%>
		<ul>
<%		
		for(int i = 0; i < allFiles.size(); i += 1)
		{
%>
			<li><a href="/MyJWC/ServletDownload?fileID=<%= allFiles.get(i).getFileID()%>"><%= allFiles.get(i).getName()%></a></li>
<%	
		}
%>		
		</ul>
	</div>
	<div id = "log">
		<form action = "jsp/log.jsp" method = "post">
			<table>
				<tr>
					<td>�û���</td>
					<!--
					<td><input type = "text" name = "username"  value = "01111111" /></td>
					-->
					<td><input type = "text" name = "username"   /></td>
				</tr>
				<tr>
					<td>��&nbsp;&nbsp;��</td>
					<!--
					<td><input type = "password" name = "password" value = "01111111" /></td>
					-->
					<td><input type = "password" name = "password" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>
						<input type = "submit" value = "��½"/>&nbsp;
						<input type = "reset" value = "����"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	

</body>
</html>