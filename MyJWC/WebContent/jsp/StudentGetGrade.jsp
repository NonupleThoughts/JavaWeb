<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@	page import = "dao.*"%>
<%@	page import = "domain.*"%>
<%@ page import = "java.util.ArrayList"%>
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
		out.print("<script>alert('���ȵ�¼');window.location.href('/MyJWC/index.jsp')</script>");
	}
	Student student = new Student();
	student.SetFromAccount(account);
	StudentDAO studentDAO = new StudentDAO();
	ArrayList<StudentCurriculum> studentCurriculum = studentDAO.findStudentCurriculum(student);
	TeacherDAO teacherDAO = new TeacherDAO();
%>
	<table>
	<tr>
		<th>�γ���</th>
		<th>��ʦ��</th>
		<th>�ɼ�</th>
	</tr>
<%	
	for(StudentCurriculum i : studentCurriculum)
	{
		if(i.getGrade() >= 0)
		{
%>
			<tr>
				<td><%= i.getCurriculumName()%></td>
				<td><%= teacherDAO.findName(i.getTeacher())%></td>
				<td><%= i.getGrade()%></td>
			</tr>	
<%	
		}
	}
	
%>
	</table>
</body>
</html>