package domain;

public class StudentCurriculum extends Curriculum {
	private String studentID;
	private float grade = -1;
	public void setStudentID(String studentID)
	{
		this.studentID = studentID;
	}
	public void setGrade(float grade)
	{
		this.grade = grade;
	}
	public String getStudentId()
	{
		return this.studentID; 
	}
	public float getGrade()
	{
		return this.grade;
	}
	public void setFromCurriculum(Curriculum curriculum)
	{
		this.setClassroom(curriculum.getClassroom());
		this.setCurriculumName(curriculum.getCurriculumName());
		this.setStartEnd(curriculum.getStart(), curriculum.getEnd());
		this.setTeacher(curriculum.getTeacher());
		this.setWeek(curriculum.getWeek());
	}
}
