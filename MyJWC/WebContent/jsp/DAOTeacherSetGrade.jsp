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
	ArrayList<StudentCurriculum> studentCurriculum = teacherDAO.findALLStudent(teacher, request.getParameter("curriculum"));
	//System.out.println(request.getParameter("curriculum"));
	for(int i = 0; i < studentCurriculum.size(); i += 1)
	{
		//其实这里总感觉有问题，因为参数是一个一个传递的
		String cache = "grade" + studentCurriculum.get(i).getStudentId();
		float grade = request.getParameter(cache) == null ? -1 :  Float.parseFloat(request.getParameter(cache));
		System.out.println(studentCurriculum.get(i).getCurriculumName());
		studentCurriculum.get(i).setGrade(grade);
	}
	teacherDAO.UpdateStudentGrade(studentCurriculum, teacher);
%>
	<script>
		alert('更新成功');
	</script>
</body>
</html>