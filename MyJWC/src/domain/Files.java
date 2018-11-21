package domain;

public class Files {
	private String fileID;
	private FileType type;
	private String path;
	private String name;
	
	public void setFileID(String fileID)
	{
		this.fileID = fileID;
	}
	public void setFileType(FileType type)
	{
		this.type = type;
	}
	public void setPath(String path)
	{
		this.path = path;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getFileID()
	{
		return this.fileID;
	}
	public FileType getFileType()
	{
		return this.type;
	}
	public String getPath()
	{
		return this.path;
	}
	public String getName()
	{
		return this.name;
	}
	
}
