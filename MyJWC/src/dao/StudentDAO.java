package dao;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import domain.Curriculum;
import domain.Student;
import domain.StudentCurriculum;

public class StudentDAO extends AccountDAO{
//	//student继承自Account类，这里是关于findByUserid与update
//	//是没有必要进行额外处理的，直接调用父类的方法就可以了
//	public Student findByUserid(String userid, String password)
//	public boolean update(Student user)
	//TODO: 额外需要处理的部分
	//获取学生课表（包含对应课程的分数），如果分数为-1说明该课程还没有给分
	public ArrayList<StudentCurriculum> findStudentCurriculum(Student user)
	{
		String userid = user.getUserid();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rst = null;
		ArrayList<StudentCurriculum> res = new ArrayList<StudentCurriculum>(); 
		try
		{
			conn = SQLAccess.getConncetion();
			pstmt = conn.prepareStatement("SELECT * FROM STUDENTCUR WHERE USERID = ?");
			pstmt.setString(1, userid);
			rst = pstmt.executeQuery();
			while(rst.next())
			{
				StudentCurriculum cache = new StudentCurriculum();
				cache.setStudentID(rst.getString("USERID"));
				cache.setCurriculumName(rst.getString("CURRICULUM"));
				cache.setTeacher(rst.getString("TEACHER"));
				//这里有个问题，就是在数据库中GRADE默认是NULL（即未评分），这里读出来的是0，那么如何评判0是未评分还是0分呢？
				//没有想到好的解决办法，于是将GRADE的默认值改为了-1
				cache.setGrade(rst.getFloat("Grade"));
				res.add(cache);
			}
			for(StudentCurriculum i : res)
			{
				pstmt = conn.prepareStatement("SELECT * FROM ALLCURRICULUM WHERE TEACHER = ? AND CURRICULUM = ?");
				pstmt.setString(1, i.getTeacher());
				pstmt.setString(2, i.getCurriculumName());
				rst = pstmt.executeQuery();
				Curriculum cache = new Curriculum();
				while(rst.next())
				{
					cache.setClassroom(rst.getString("CLASSROOM"));
					cache.setCurriculumName(rst.getString("CURRICULUM"));
					cache.setStartEnd(rst.getInt("START"), rst.getInt("END"));
					cache.setWeek(rst.getString("DAY"));
					cache.setTeacher(rst.getString("TEACHER"));
				}
				i.setFromCurriculum(cache);
			}
			return res;
		}catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}finally
		{
			try
			{
				conn.close();
			}catch(SQLException e) {}
			try
			{
				pstmt.close();
			}catch(SQLException e) {}
			try
			{
				rst.close();
			}catch(SQLException e) {}
		}
		
	}
	public String findName(String userid)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rst = null;
		String name = null;
		try
		{
			conn = SQLAccess.getConncetion();
			pstmt = conn.prepareStatement("SELECT NAME FROM ACCOUNT WHERE USERID = ?");
			pstmt.setString(1, userid);
			rst = pstmt.executeQuery();
			while(rst.next())
			{
				name = rst.getString("NAME"); 
			}
			return name;
		}catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}finally
		{
			try
			{
				conn.close();
			}catch(SQLException e) {}
			try
			{
				pstmt.close();
			}catch(SQLException e) {}
			try
			{
				rst.close();
			}catch(SQLException e) {}			
		}		
	}
	//for test
	public static void main(String[] args)
	{
		StudentDAO temp = new StudentDAO();
		Student user = new Student();
		user.setUserid("01111111");
//		StudentCurriculum crouse = new StudentCurriculum();
//		String day = "1,2,3,4";
//		crouse.setWeek(day);
//		for(int i = 0; i < day.length(); i += 1)
//		{
//			if(Character.isDigit(day.charAt(i)))
//			{
//				System.out.printf("%c\t",day.charAt(i));
//				System.out.printf("%d\t",Integer.valueOf(day.charAt(i)) - 48);
//				System.out.println(Integer.valueOf(day.charAt(i)));
//				//this.day.add(Integer.valueOf(day.charAt(i)));
//			}
//		}
		ArrayList<StudentCurriculum> curriculum = temp.findStudentCurriculum(user);
		
		ArrayList<ArrayList<StudentCurriculum>> allDay = new ArrayList<ArrayList<StudentCurriculum>>();
		for(int i = 0; i < 7; i += 1)
		{
			ArrayList<StudentCurriculum> cache = new ArrayList<StudentCurriculum>(); 
			for(int j = 0; j < curriculum.size(); j += 1)
			{
				if(curriculum.get(j).getWeek().contains(i));
					cache.add(curriculum.get(j));
			}
			allDay.add(cache);
		}
		StudentCurriculum a;
		
		//将每一天的课程按照顺序排序
		for(int i = 0; i < allDay.size(); i += 1)
		{
			//结合lambda表达式进行拍寻
			
			for(int j = 0;j < allDay.get(i).size(); j += 1)
			{
				System.out.printf("%s\t" + "%s\t" + "%s\t" + "%s\t" + "%s\t"
						+ "%d-%d\t" + "%f\n", 
						allDay.get(i).get(j).getStudentId(), 
						allDay.get(i).get(j).getCurriculumName(),
						allDay.get(i).get(j).getTeacher(),
						allDay.get(i).get(j).getWeek(),
						allDay.get(i).get(j).getClassroom(),
						allDay.get(i).get(j).getStart(),allDay.get(i).get(j).getEnd(),
						allDay.get(i).get(j).getGrade()
						
						);
			}
		}		
//		
//		for(int i = 0; i < res.size(); i += 1)
//		{
//			System.out.printf("%s\t" + "%s\t" + "%s\t" + "%s\t" + "%s\t"
//					+ "%d-%d\t" + "%f\n", 
//					res.get(i).getStudentId(), 
//					res.get(i).getCurriculumName(),
//					res.get(i).getTeacher(),
//					res.get(i).getWeek(),
//					res.get(i).getClassroom(),
//					res.get(i).getStart(),res.get(i).getEnd(),
//					res.get(i).getGrade()
//					);
//		}
	}

}
