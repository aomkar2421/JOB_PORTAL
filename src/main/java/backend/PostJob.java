package backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import connection.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/postjob")
public class PostJob extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		PrintWriter out = resp.getWriter();

		HttpSession hp = req.getSession();
		String company  = (String)hp.getAttribute("oname");
		String email  = (String)hp.getAttribute("oemail");

		String jobprofile = req.getParameter("jobprofile");
		String experiance = req.getParameter("experiance");
		String salary = req.getParameter("salary");
		String openings = req.getParameter("openings");
		String location = req.getParameter("location");
		String cemail = req.getParameter("cemail");
		String description = req.getParameter("description");
		String skills = req.getParameter("skills");

		Connection con;
		try {
			con = DBConnect.getConnect();
			System.out.println("jobs connection");
			PreparedStatement ptst = con.prepareStatement("insert into jobs (jobprofile,company,salary,experiance,openings,location,cemail,description,skills) values (?,?,?,?,?,?,?,?,?)");
			
			ptst.setString(1, jobprofile);
			ptst.setString(2, company);
			ptst.setString(3, salary);
			ptst.setString(4, experiance);
			ptst.setString(5, openings);
			ptst.setString(6, location);
			ptst.setString(7, cemail);
			ptst.setString(8, description);
			ptst.setString(9, skills);
			ptst.execute();
			System.out.println("Jobs Entered");
			resp.sendRedirect("alljobs.jsp");
		} catch (Exception e) {
			out.print(e);
			
		}


	}
}
