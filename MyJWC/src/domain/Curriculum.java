package domain;

import java.util.TreeSet;

public class Curriculum {
	private String teacher;
	private String curriculumName;
	private String classroom;
	private int start;
	private int end;
	private TreeSet<Integer> day = new TreeSet<Integer>();
	public void setTeacher(String teacher)
	{
		this.teacher = teacher;
	}
	public void setCurriculumName(String curriculumName)
	{
		this.curriculumName = curriculumName;
	}
	public void setClassroom(String classroom)
	{
		this.classroom = classroom;
	}
	public void setStartEnd(int start, int end)
	{
		this.start = start;
		this.end = end;
	}
	public void setWeek(String day)
	{
		for(int i = 0; i < day.length(); i += 1)
		{
			if(Character.isDigit(day.charAt(i)))
			{
				this.day.add(Integer.valueOf(day.charAt(i)) - 48);
			}
		}
	}
	public void setWeek(TreeSet<Integer> day)
	{
		this.day = day;
	}	
	public String getTeacher()
	{
		return this.teacher;
	}
	public String getCurriculumName()
	{
		return this.curriculumName;
	}
	public String getClassroom()
	{
		return this.classroom;
	}
	public int getStart()
	{
		return this.start;
	}
	public int getEnd()
	{
		return this.end;
	}
	public TreeSet<Integer> getWeek()
	{
		return this.day;
	}
}
