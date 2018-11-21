<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import = "domain.*"%>
<%@ page import = "dao.*"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.util.Collections"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="gb2312">
<style type="text/css"> 
/*����������ϸ���������
/*��Ū��ÿ�����Ԫ����һ�����,���ǻ��ǲ�һ����,����Ͳ��Ϲ�����*/
/*
#curriculumTable
  {
  font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
  width:100%;
  border-collapse:collapse;
  }

#curriculumTable td, #curriculumTable th 
  {
  font-size:1em;
  border:1px solid #98bf21;
  padding:3px 7px 2px 7px;
  }

#curriculumTable th 
  {
  font-size:1.1em;
  text-align:left;
  padding-top:5px;
  padding-bottom:4px;
  background-color:#A7C942;
  color:#ffffff;
  }
  */
</style>
<title>Insert title here</title>
</head>
<body>
<%
	Account account = (Account)session.getAttribute("account");
	if(account == null)
	{
		out.print("<script>alert('���ȵ�¼��');window.location.href = '/MyJWC/index.jsp'</script>");
	}
	Teacher teacher = new Teacher();
	teacher.SetFromAccount(account);
	TeacherDAO teacherDAO = new TeacherDAO();
	ArrayList<Curriculum> curriculum = teacherDAO.findAllCurriculum(teacher);
	ArrayList<ArrayList<Curriculum>> allDay = new ArrayList<ArrayList<Curriculum>>();
	for(int i = 0; i < 7; i += 1)
	{
		ArrayList<Curriculum> cache = new ArrayList<Curriculum>(); 
		for(int j = 0; j < curriculum.size(); j += 1)
		{
			if(curriculum.get(j).getWeek().contains(i + 1))
					cache.add(curriculum.get(j));
		}
		allDay.add(cache);
	}
	//System.out.println(allDay.size());
	//��ÿһ��Ŀγ̰���˳������
	for(int i = 0; i < allDay.size(); i += 1)
	{
		//���lambda���ʽ������Ѱ
		Collections.sort(allDay.get(i), (Curriculum a, Curriculum b)->{return a.getStart() - b.getStart();});
		/*
		for(int j = 0;j < allDay.get(i).size(); j += 1)
		{
			
			System.out.printf("%d\t" + "%s\t" + "%s\t" + "%s\t" + "%s\t" + "%s\t"
					+ "%d-%d\t" + "%f\n",
					i,
					allDay.get(i).get(j).getStudentId(), 
					allDay.get(i).get(j).getCurriculumName(),
					allDay.get(i).get(j).getTeacher(),
					allDay.get(i).get(j).getWeek().toString(),
					allDay.get(i).get(j).getClassroom(),
					allDay.get(i).get(j).getStart(),allDay.get(i).get(j).getEnd(),
					allDay.get(i).get(j).getGrade()
					);
		}
		*/
	}
%>
	<!--���α������table��-->
	<table  class="curriculumTable" border="1">
		<tr>
			<th></th>
			<th>����һ</th>
			<th>���ڶ�</th>
			<th>������</th>
			<th>������</th>
			<th>������</th>
			<th>������</th>
			<th>������</th>
		</tr>
<%
	//���ÿγ̽��������
	//һ�칲��ʮ�ڿ�
	for(int i = 0; i < 10; i += 1)
	{
%>
		<tr>
			<td><%= i + 1%></td>
<%
		//j�������������ڼ�
		for(int j = 0; j < allDay.size(); j += 1)
		{
			//��i�ڿ� ����j��û�п�
			if(!allDay.get(j).isEmpty())
			{
				//System.out.println(j);
				boolean flag = false;
				//k����������jʱ�Ŀγ�
				for(int k = 0; k < allDay.get(j).size(); k += 1)
				{
					//System.out.println(j+"   "+k+"   "+i+1);
					//�����ж���� ��ʵ���Խ���Ӧ�Ŀγ̵�����
					//��Ϊ���еĿγ̶����ڵ�һ�ڿε�λ��
					if(allDay.get(j).get(k).getStart() <= i + 1 && i + 1 <= allDay.get(j).get(k).getEnd())
					{
						if(allDay.get(j).get(k).getStart() == i + 1)
						{
%>
							<!--<td>1<br/></td>-->
							<td rowspan="<%= allDay.get(j).get(k).getEnd() - allDay.get(j).get(k).getStart() + 1%>">
								<%= allDay.get(j).get(k).getCurriculumName()%><br/><%= allDay.get(j).get(k).getClassroom()%>
							</td>
							
<%													
						}
						flag = true;
						break;
					}
				}
				if(flag == false)
				{
%>
					<!--<td>2<br/></td>-->
					<td><br/></td>
<%											
				}

			}
			else
			{
%>
				<!--<td>3<br/></td>-->
				<td><br/></td>
<%
			}
		}
%>
		</tr>
<%
	}
%>

	</table>
</body>
</html>