package domain;

import java.sql.Date;

public class Account {
	//�û���/ѧ��
	private String userid;
	//����
	private String password;
	//����
	private String name;
	//�Ա�
	private String gender;
	//��ַ
	private String addr;
	//��������
	private String birthday;
	//��ϵ��ʽ
	private String phone;
	//����Ժϵ
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
