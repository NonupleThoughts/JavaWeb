package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import domain.FileType;
import domain.Files;

public class FilesDAO {
	//查找服务器上的所有文件
	public ArrayList<Files> getAllFiles()
	{
		ArrayList<Files> res = new ArrayList<Files>();
		try(
			Connection conn = SQLAccess.getConncetion();
			Statement stmt = conn.createStatement();
			ResultSet rst = stmt.executeQuery("SELECT * FROM FILES");
		)
		{
			while(rst.next())
			{
				Files cache = new Files();
				cache.setFileID(rst.getString("FILEID"));
				switch(rst.getInt("TYPE"))
				{
				case 1:
					cache.setFileType(FileType.Inform);
					break;
				case 2:
					cache.setFileType(FileType.Notice);
					break;
				default:
					cache.setFileType(FileType.Others);
					break;
				}
				
				cache.setName(rst.getString("FILENAME"));
				cache.setPath(rst.getString("PATH"));
				res.add(cache);
			}
			return res;
		}catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}		
	}
	
	public Files getFile(String fileID)
	{
		Files res = new Files();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rst = null;
		try
		{
			conn = SQLAccess.getConncetion();
			pstmt = conn.prepareStatement("SELECT * FROM FILES WHERE FILEID = ?");
			pstmt.setString(1, fileID);
			rst = pstmt.executeQuery();
			while(rst.next())
			{
				res.setFileID(rst.getString("FILEID"));
				switch(rst.getInt("TYPE"))
				{
				case 1:
					res.setFileType(FileType.Inform);
					break;
				case 2:
					res.setFileType(FileType.Notice);
					break;
				default:
					res.setFileType(FileType.Others);
					break;
				}
				res.setName(rst.getString("FILENAME"));
				res.setPath(rst.getString("PATH"));
			}
			return res;
		}catch(SQLException e)
		{
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
	//TODO:
	public void download()
	{

	}
//	public static void main(String[] args)
//	{
//		FilesDAO filesDAO = new FilesDAO();
//		ArrayList<Files> allFiles = filesDAO.getAllFiles();
//	}

}
