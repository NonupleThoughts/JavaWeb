package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//import com.mysql.cj.jdbc.Driver;

public class SQLAccess {
	private final static String url  = "jdbc:mysql://localhost:3306/jwc_information? useUnicode = true & characterEncoding = utf-8 & useSSL = false & serverTimezone = GMT & allowPublicKeyRetrieval=true";
	private final static String driverClass = "com.mysql.cj.jdbc.Driver";
	private final static String user = "root";
	private final static String password = "1092";
	static Connection conn;
	static
	{
		System.out.println("加载驱动..");
		try
		{
			Class.forName(driverClass);
			System.out.println("加载成功..");
		}catch(ClassNotFoundException e)
		{
			System.out.println("加载失败..");
			e.printStackTrace();
		}
	}
	public static Connection getConncetion() throws SQLException
	{
		System.out.println("连接数据库..");
		try
		{
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("连接成功..");
			return conn;
		}catch(SQLException e)
		{
			System.out.println("连接失败..");
			e.printStackTrace();
			return null;
		}
	}
//	public static void main(String[] args)
//	{
//		Connection conn = getConncetion();		
//	}
}
