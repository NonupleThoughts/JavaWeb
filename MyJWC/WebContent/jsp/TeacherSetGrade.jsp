<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@	page import = "dao.*"%>
<%@	page import = "domain.*"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.util.TreeSet"%>    
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
		out.print("<script>alert('请先登录');window.location.href('/MyJWC/index.jsp')</script>");
	}
	Teacher teacher = new Teacher();
	teacher.SetFromAccount(account);
	TeacherDAO teacherDAO = new TeacherDAO();
	StudentDAO studentDAO = new StudentDAO();
	String curriculum = request.getParameter("curriculum");
	ArrayList<StudentCurriculum> studentCurriculum = teacherDAO.findALLStudent(teacher, curriculum);
	
%>
<form action = "DAOTeacherSetGrade.jsp?work=byname" method = "post">
	<input type="hidden"  name="curriculum" value="<%= curriculum%>">
	<table>
		<tr>
			<th>学号</th>
			<th>姓名</th>
			<th>课程</th>
			<th>分数</th>
		</tr>
<%
		for(int i = 0; i < studentCurriculum.size(); i += 1)
		{
			String cache = "grade" + studentCurriculum.get(i).getStudentId();
%>
			<tr>
				<td><%= studentCurriculum.get(i).getStudentId()%></td>
				<td><%= studentDAO.findName(studentCurriculum.get(i).getStudentId())%></td>
				<td><%= studentCurriculum.get(i).getCurriculumName()%></td>
				<td><input type="number" name="<%= cache%>" min="0" max="100" step="0.01" <%if(studentCurriculum.get(i).getGrade() != -1)%> value="<%= studentCurriculum.get(i).getGrade()%>" /></td>
			</tr>
<%
		}
%>
	</table>
	<input type = "submit" value = "提交" /> &nbsp;&nbsp;
	<input type = "reset" value = "重置" />
</form>
</body>
</html>