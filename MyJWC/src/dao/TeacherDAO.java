package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import domain.Curriculum;
import domain.StudentCurriculum;
import domain.Teacher;

public class TeacherDAO extends AccountDAO{
//	//student�̳���Account�࣬�����ǹ���findByUserid��update
//	//��û�б�Ҫ���ж��⴦��ģ�ֱ�ӵ��ø���ķ����Ϳ�����
//	public Student findByUserid(String userid, String password)
//	public boolean update(Student user)
	//TODO: ������Ҫ����Ĳ���
	//��ʦ����Ļ���ֻҪ�����������Ϳ����ˣ�һ���ǻ�ȡ�Լ��Ŀα���һ���Ǹ�ѧ�����
	//ǰ��ֱ��ʹ��Curriculum��Ϳ����ˣ����߿���ʹ��StudentCurriculum��
	//ͨ���û�id���Ҹ���ʦ������
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
	//���Ҹ���ʦ���еĿγ�
	public ArrayList<Curriculum> findAllCurriculum(Teacher user)
	{
		String userid = user.getUserid();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rst = null;
		ArrayList<Curriculum> res = new ArrayList<Curriculum>();
		try
		{
			conn = SQLAccess.getConncetion();
			pstmt = conn.prepareStatement("SELECT * FROM ALLCURRICULUM WHERE TEACHER = ?");
			pstmt.setString(1, userid);
			rst = pstmt.executeQuery();
			while(rst.next())
			{
				Curriculum cache = new Curriculum();
				cache.setClassroom(rst.getString("CLASSROOM"));
				cache.setCurriculumName(rst.getString("CURRICULUM"));
				cache.setStartEnd(rst.getInt("START"), rst.getInt("END"));
				cache.setTeacher(rst.getString("TEACHER"));
				cache.setWeek(rst.getString("DAY"));
				res.add(cache);
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
	public ArrayList<Curriculum> findAllCurriculumByUserid(String userid)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rst = null;
		ArrayList<Curriculum> res = new ArrayList<Curriculum>();
		try
		{
			conn = SQLAccess.getConncetion();
			pstmt = conn.prepareStatement("SELECT * FROM ALLCURRICULUM WHERE TEACHER = ?");
			pstmt.setString(1, userid);
			rst = pstmt.executeQuery();
			while(rst.next())
			{
				Curriculum cache = new Curriculum();
				cache.setClassroom(rst.getString("CLASSROOM"));
				cache.setCurriculumName(rst.getString("CURRICULUM"));
				cache.setStartEnd(rst.getInt("START"), rst.getInt("END"));
				cache.setTeacher(rst.getString("TEACHER"));
				cache.setWeek(rst.getString("DAY"));
				res.add(cache);
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
	//��ѯ����ʦ���е�ѧ�������ۿγ̣�
	public ArrayList<StudentCurriculum> findALLStudent(Teacher user)
	{
		String userid = user.getUserid();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rst = null;
		ArrayList<StudentCurriculum> res = new  ArrayList<StudentCurriculum>();
		try
		{
			conn = SQLAccess.getConncetion();
			pstmt = conn.prepareStatement("SELECT * FROM STUDENTCUR WHERE TEACHER = ?");
			pstmt.setString(1, userid);
			rst = pstmt.executeQuery();
			while(rst.next())
			{
				StudentCurriculum cache = new StudentCurriculum();
				cache.setStudentID(rst.getString("USERID"));
				cache.setGrade(rst.getFloat("GRADE"));
				cache.setCurriculumName(rst.getString("CURRICULUM"));
				res.add(cache);
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
	//��ѯ����ʦ�ƶ��γ̵�����ѧ��
	public ArrayList<StudentCurriculum> findALLStudent(Teacher user, String Curriculum)
	{
		String userid = user.getUserid();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rst = null;
		ArrayList<StudentCurriculum> res = new  ArrayList<StudentCurriculum>();
		try
		{
			conn = SQLAccess.getConncetion();
			pstmt = conn.prepareStatement("SELECT * FROM STUDENTCUR WHERE TEACHER = ? AND CURRICULUM = ?");
			pstmt.setString(1, userid);
			pstmt.setString(2, Curriculum);
			rst = pstmt.executeQuery();
			while(rst.next())
			{
				StudentCurriculum cache = new StudentCurriculum();
				cache.setStudentID(rst.getString("USERID"));
				cache.setGrade(rst.getFloat("GRADE"));
				cache.setCurriculumName(rst.getString("CURRICULUM"));
				res.add(cache);
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
	//���
	public boolean UpdateStudentGrade(ArrayList<StudentCurriculum> grade, Teacher user)
	{
		String userid = user.getUserid();
		Connection conn = null;
		PreparedStatement pstmt = null;
		try
		{
			conn = SQLAccess.getConncetion();
			pstmt = conn.prepareStatement("UPDATE STUDENTCUR SET GRADE = ? WHERE USERID = ? AND CURRICULUM = ? AND TEACHER = ?");
			pstmt.setString(4, userid);
			for(StudentCurriculum cache : grade)
			{
				pstmt.setFloat(1, cache.getGrade());
				pstmt.setString(2, cache.getStudentId());
				pstmt.setString(3, cache.getCurriculumName());
				pstmt.executeUpdate();
			}
			return true;
		}catch(SQLException e)
		{
			e.printStackTrace();
			return false;
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
		}
		
	}
	//for test
	public static void main(String[] args)
	{
		TeacherDAO temp = new TeacherDAO();
		Teacher user = new Teacher(); 
		user.SetFromAccount(temp.findByUserid("11111111", "11111111"));
		
		ArrayList<StudentCurriculum> temp1111 = temp.findALLStudent(user, "�ߵ���ѧ");
		//System.out.println("hello");
		//System.out.println(temp.findName("11111111"));
		for(StudentCurriculum cache : temp1111)
		{
			System.out.printf("%s\t%s\n",cache.getStudentId(),cache.getCurriculumName());
			cache.setGrade(10.0f);
		}
		temp.UpdateStudentGrade(temp1111, user);
//		System.out.println("bye");
//		System.out.println(user == null);
//		System.out.println(user.getUserid());
//		System.out.println(user.getPassword());
//		System.out.println(user.getAddr() == null);
//		System.out.println(user.getDepartment() == null);
//		System.out.println(user.getGender() == null);
//		System.out.println(user.getName() == null);
//		System.out.println(user.getPhone() == null);		
//		System.out.println(user.getBirthday() == null);
	}

}
