package domain;

public class Teacher extends Account {
	public void SetFromAccount(Account user)
	{
		this.setAddr(user.getAddr());
		this.setBirthday(user.getBirthday());
		this.setDepartment(user.getDepartment());
		this.setGender(user.getGender());
		this.setName(user.getName());
		this.setPassword(user.getPassword());
		this.setPhone(user.getPhone());
		this.setUserid(user.getUserid());
	}
}
