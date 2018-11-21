package domain;

import java.sql.Date;

public class Account {
	//用户名/学号
	private String userid;
	//密码
	private String password;
	//姓名
	private String name;
	//性别
	private String gender;
	//地址
	private String addr;
	//出生日期
	private String birthday;
	//联系方式
	private String phone;
	//所在院系
	private String department;
	public void setUserid(String userid)
	{
		this.userid = userid;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public void setAddr(String addr)
	{
		this.addr = addr;
	}
	public void setBirthday(String date)
	{
		this.birthday = date;
	}
	public void setPhone(String phone)
	{
		this.phone = phone;
	}
	public void setDepartment(String department)
	{
		this.department = department;
	}
	public String getUserid()
	{
		return this.userid;
	}
	public String getPassword()
	{
		return this.password;
	}
	public String getName()
	{
		return this.name;
	}
	public String getGender()
	{
		return this.gender;
	}
	public String getAddr()
	{
		return this.addr;
	}
	public String getBirthday()
	{
		return this.birthday;
	}
	public String getPhone()
	{
		return this.phone;
	}
	public String getDepartment()
	{
		return this.department;
	}	
	
	
}
