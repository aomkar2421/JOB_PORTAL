package backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import connection.DBConnect;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddExperiance")
public class AddExperiance extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		PrintWriter out=resp.getWriter();

		HttpSession hp=req.getSession();
		String email2=(String) hp.getAttribute("semail");
		String company2=req.getParameter("company1");
		String location2=req.getParameter("location1");
		String year2=req.getParameter("year1");
		String title2=req.getParameter("title1");
		String description2=req.getParameter("description1");
		System.out.println(company2+"omk");

		Connection con=null;
		try {

			con=DBConnect.getConnect();
			con.setAutoCommit(false);
			PreparedStatement ptst=con.prepareStatement("insert into experiance(company, location, year, title, description, email) values(?,?,?,?,?,?)");
			ptst.setString(1, company2);
			ptst.setString(2, location2);
			ptst.setString(3, year2);
			ptst.setString(4, title2);
			ptst.setObject(5, description2);
			ptst.setObject(6, email2);
			int a1= ptst.executeUpdate();
			System.out.println(company2);

			if (a1>0 ) {
				con.commit();
				resp.sendRedirect("profile.jsp");

				//				hp.setAttribute("sschool", school2);
				//				hp.setAttribute("sdegree", degree2);
				//				hp.setAttribute("syear", year2);
				//				hp.setAttribute("sgrade", grade2);
				//				hp.setAttribute("sdescription", description2);
				//				
			} else {
				con.rollback();
				RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
				rd1.include(req, resp);

				RequestDispatcher rd2=req.getRequestDispatcher("add-profile-experiance.jsp");
				rd2.include(req, resp);
			}

		} catch (Exception e) {
			out.print(e);
		}
		finally {
			try {
				con.close();
			} catch (Exception e2) {
				out.print(e2);
			}
		}

	}
}
