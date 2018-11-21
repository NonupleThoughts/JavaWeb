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
/*这个是在网上复制下来的
/*想弄成每个表格单元都是一样大的,但是还是不一样大,这里就不废功夫了*/
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
		out.print("<script>alert('请先登录！');window.location.href = '/MyJWC/index.jsp'</script>");
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
	//将每一天的课程按照顺序排序
	for(int i = 0; i < allDay.size(); i += 1)
	{
		//结合lambda表达式进行拍寻
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
	<!--将课表放置在table中-->
	<table  class="curriculumTable" border="1">
		<tr>
			<th></th>
			<th>星期一</th>
			<th>星期二</th>
			<th>星期三</th>
			<th>星期四</th>
			<th>星期五</th>
			<th>星期六</th>
			<th>星期日</th>
		</tr>
<%
	//放置课程教室与节数
	//一天共有十节课
	for(int i = 0; i < 10; i += 1)
	{
%>
		<tr>
			<td><%= i + 1%></td>
<%
		//j代表天数，星期几
		for(int j = 0; j < allDay.size(); j += 1)
		{
			//第i节课 星期j有没有课
			if(!allDay.get(j).isEmpty())
			{
				//System.out.println(j);
				boolean flag = false;
				//k代表是星期j时的课程
				for(int k = 0; k < allDay.get(j).size(); k += 1)
				{
					//System.out.println(j+"   "+k+"   "+i+1);
					//这里判断完成 其实可以将对应的课程弹出的
					//因为所有的课程都放在第一节课的位置
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