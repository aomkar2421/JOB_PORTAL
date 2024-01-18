package backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SimpleJobSearch")
public class SimpleJobSearch extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter out=resp.getWriter();
		String tech1= req.getParameter("technology");
		String id="",job_profile="",company="",experiance="",salary="",description="";

		try {
			
			Connection connection=DBConnect.getConnect();
			PreparedStatement ptst = connection.prepareStatement("select * from jobs where job_profile=?");			
			ptst.setString(1, tech1);
			ResultSet rs=ptst.executeQuery();
			
			while (rs.next()) {
				id=rs.getString("id");
				job_profile=rs.getString("job_profile");
				company=rs.getString("company");
				experiance=rs.getString("experiance");
				salary=rs.getString("salary");
				description=rs.getString("description");
				
				out.print("<div class=\"col-md-12 display_job_div\">\n" +
						"                                <b>"+job_profile+"</b> <span style=\"font-size: 12px; color: #9f9d9d; float: right\"> ("+description+")</span> <br>\n" +
						"                            <span class=\"glyphicon glyphicon-home\"></span> <span style=\"color: #9f9d9d\"> Company : </span> "+company+"</span> <br>\n" +
						"                                <span> <span class=\"glyphicon glyphicon-book\"></span> <span style=\"color: #9f9d9d\"> Experience : </span> "+experiance+"</span> <br>\n" +
						"                                <span> <span class=\"glyphicon glyphicon-file\"></span>  <span style=\"color: #9f9d9d\"> Job Description : </span> "+description+"</span> <br>\n" +
						"                                <br><a href=\"job-description.jsp?jid="+id+"\"> See Full Details </a>\n" +
						"                            </div>");
			}
			
			
		} catch (Exception e) {
			out.print(e);
		}
		
	}
}
