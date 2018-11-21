package servlet;
import dao.*;
import domain.*;  

import java.io.FileInputStream;  
import java.io.IOException;  
import java.io.InputStream;  
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

/** 
 * Servlet implementation class ServletDownload 
 */  
@WebServlet(asyncSupported = true, urlPatterns = { "/ServletDownload" })  
public class ServletDownload extends HttpServlet {  
    private static final long serialVersionUID = 1L;  
         
    /** 
     * @see HttpServlet#HttpServlet() 
     */  
    public ServletDownload() {  
        super();  
        // TODO Auto-generated constructor stub  
    }  
  
    /** 
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response) 
     */  
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        // TODO Auto-generated method stub  
  
        String fileID = request.getParameter("fileID");  
        System.out.println(fileID);
        FilesDAO filesDAO = new FilesDAO();
        Files file = filesDAO.getFile(fileID);
        
        response.setContentType(getServletContext().getMimeType(file.getName()));

        //这里有一个问题，就是中文文件名下载的时候会出现乱码
        response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(file.getName(), "utf-8"));    
        String fullFilePath = getServletContext().getRealPath("/files/"+file.getFileType() + "/" + file.getName());  
        System.out.println(fullFilePath);  
        
        InputStream in = new FileInputStream(fullFilePath);  
        OutputStream out = response.getOutputStream();  
          
        //写文件  
        int b;  
        while((b=in.read())!= -1)  
        {  
            out.write(b);  
        }  
          
        in.close();  
        out.close();  
    }  
  
    /** 
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response) 
     */  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        // TODO Auto-generated method stub  
    }  
  
}  