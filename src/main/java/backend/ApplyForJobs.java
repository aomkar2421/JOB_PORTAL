package backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import connection.DBConnect;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ApplyForJobs")
public class ApplyForJobs extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session=req.getSession();
		String email=(String) session.getAttribute("semail");
		
		String jid=req.getParameter("jobid");
		
		try {
			Connection con=DBConnect.getConnect();
			
			PreparedStatement ptst=con.prepareStatement("insert into applied_jobs(email,jid) values(?,?)");
			ptst.setString(1, email);
			ptst.setString(2, jid);
			int a=ptst.executeUpdate();
			
			if (a>0) {
				RequestDispatcher rd1=req.getRequestDispatcher("job-success.jsp");
				rd1.include(req, resp);
				RequestDispatcher rd2=req.getRequestDispatcher("jobs-desc.jsp?jid="+jid);
				rd2.include(req, resp);
			}
			else {
				RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
				rd1.include(req, resp);
				RequestDispatcher rd2=req.getRequestDispatcher("jobs-desc.jsp?jid="+jid);
				rd2 .include(req, resp);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
