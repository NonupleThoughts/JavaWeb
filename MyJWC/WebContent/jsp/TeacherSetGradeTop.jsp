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
	Account account = (Account)session.getAttribute("account");
	if(account == null)
	{
		out.print("<script>alert('���ȵ�¼');window.location.href('/MyJWC/index.jsp')</script>");
	}
	Teacher teacher = new Teacher();
	teacher.SetFromAccount(account);
	TeacherDAO teacherDAO = new TeacherDAO();
	//���ڿγ����ɿγ�������ʦΨһȷ���ģ����Դ˴�curriculum�洢�Ŀγ���Ψһ��
	ArrayList<Curriculum> curriculum = teacherDAO.findAllCurriculum(teacher);
	//ArrayList<StudentCurriculum> studentCurriculum = teacherDAO.findALLStudent(teacher);
	
%>
<div>
	<form action = "TeacherSetGrade.jsp" target = "containGrade" method = "post">
		<select name = "curriculum">
<%
			for(int i = 0; i < curriculum.size(); i += 1)
			{
				//System.out.println(curriculum.get(i).getCurriculumName());
%>
				<option value = "<%= curriculum.get(i).getCurriculumName()%>"><%= curriculum.get(i).getCurriculumName()%></option>
<%
			}
%>
		</select>&nbsp;&nbsp;&nbsp;
		<input type = "submit" value = "�鿴" />
	</form>
</div>


</body>
</html>