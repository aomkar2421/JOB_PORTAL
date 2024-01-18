package backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import connection.DBConnect;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteMyJobs")
public class DeleteMyJobs extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session=req.getSession();
		String email=(String) session.getAttribute("semail");
		String jobid=req.getParameter("jobid");	
		
		try {
			Connection con=DBConnect.getConnect();
			PreparedStatement ptst=con.prepareStatement("delete from applied_jobs where email=? and jid=?");
			ptst.setString(1, email);
			ptst.setString(2, jobid);
			int a=ptst.executeUpdate();
			
			if(a>0) {
				RequestDispatcher rd1=req.getRequestDispatcher("job-delete-success.jsp");
				rd1.include(req, resp);
				RequestDispatcher rd2=req.getRequestDispatcher("jobs-desc.jsp?jid="+jobid);
				rd2.include(req, resp);
			}else {
				RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
				rd1.include(req, resp);
				RequestDispatcher rd2=req.getRequestDispatcher("jobs-desc.jsp?jid="+jobid);
				rd2.include(req, resp);
			}
			
			} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
