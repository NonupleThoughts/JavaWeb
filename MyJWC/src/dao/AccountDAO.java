package dao;

import domain.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO {
	public Account findByUserid(String userid, String password)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rst = null;
		Account user = null; 
		try
		{
			conn = SQLAccess.getConncetion();
			pstmt = conn.prepareStatement("SELECT * FROM ACCOUNT WHERE USERID = ? AND PASSWORD = ?");
			pstmt.setString(1, userid);
			pstmt.setString(2, password);
			rst = pstmt.executeQuery();
			while(rst.next())
			{
				user = new Account();
				user.setUserid(userid);
				user.setAddr(rst.getString("ADDR"));
				user.setBirthday(rst.getString("BIRTHDAY"));
				user.setDepartment(rst.getString("DEPARTMENT"));
				user.setGender(rst.getString("GENDER"));
				user.setName(rst.getString("NAME"));
				user.setPassword(rst.getString("PASSWORD"));
				user.setPhone(rst.getString("PHONE"));
			}
			return user;
		}catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}finally
		{
			try
			{
				conn.close();
			}catch(SQLException e){}
			try
			{
				pstmt.close();
			}catch(SQLException e){}
			try
			{
				rst.close();
			}catch(SQLException e){}			
		}
	}
	
	public boolean update(Account user)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try
		{
			conn = SQLAccess.getConncetion();
			pstmt = conn.prepareStatement("UPDATE ACCOUNT SET"
					+ " PASSWORD  = ?,"
					+ " NAME = ?,"
					+ " GENDER = ?,"
					+ " ADDR = ?,"
					+ " BIRTHDAY = ?,"
					+ " PHONE = ?,"
					+ " DEPARTMENT = ?"
					+ " WHERE USERID = ?");
			pstmt.setString(1, user.getPassword());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getGender());
			pstmt.setString(4, user.getAddr());
			pstmt.setString(5, user.getBirthday());
			pstmt.setString(6, user.getPhone());
			pstmt.setString(7, user.getDepartment());
			pstmt.setString(8, user.getUserid());
			return pstmt.executeUpdate() == 1 ? true : false;
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
//	//for test
	public static void main(String[] args)
	{
		AccountDAO temp = new AccountDAO();
		Account user = temp.findByUserid("01234567", "01234567");
		String date = "1111-01-11";
		
		user.setAddr("江苏省按南京市");
		user.setBirthday(date);
		user.setDepartment("大苏打");
		user.setGender("男");
		user.setPhone("123123");
		user.setName("张三");
		temp.update(user);
		System.out.println(user == null);
		System.out.println(user.getUserid());
		System.out.println(user.getPassword());
		System.out.println(user.getAddr() == null);
		System.out.println(user.getDepartment() == null);
		System.out.println(user.getGender() == null);
		System.out.println(user.getName() == null);
		System.out.println(user.getPhone() == null);		
		System.out.println(user.getBirthday() == null);
	}
}
