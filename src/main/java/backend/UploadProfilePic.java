//package backend;
//
//import java.io.File;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.List;
//
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.FileUploadException;
//import org.apache.commons.fileupload.RequestContext;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.MultipartConfig;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@WebServlet("/UploadProfilePic")
//@MultipartConfig
//public class UploadProfilePic extends HttpServlet{
//		
//	protected void doPost(javax.servlet.http.HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//		PrintWriter out = resp.getWriter();
//		try {
//			DiskFileItemFactory factory = new DiskFileItemFactory();
//			ServletFileUpload sfu = new ServletFileUpload(factory);
//			List <FileItem> items = sfu.parseRequest(req);
//			
//			FileItem item = items.get(0);
//			String file_path = item.getName();
//			File file = new File(file_path);
//			String file_name = file.getName();
//			
//			File f1 = new File(PathDetails.PROFILE_PIC_PATH+file_name);
//			item.write(f1);
//			
//			
//			
//		} catch (Exception e) {
//			out.print(e);
//		}
//		
//		
//		
//	}	
//}