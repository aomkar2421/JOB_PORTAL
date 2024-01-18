package backend;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/EditEducation")
public class EditEducation extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter out=resp.getWriter();

		HttpSession hp=req.getSession();
		String email2=(String) hp.getAttribute("semail");
		String id2=req.getParameter("id1");
		String school2=req.getParameter("school1");
		String degree2=req.getParameter("degree1");
		String year2=req.getParameter("year1");
		String grade2=req.getParameter("grade1");
		String description2=req.getParameter("description1");

		Connection con = null;
		PreparedStatement ptst = null;
		try {

			con=DBConnect.getConnect();
			con.setAutoCommit(false);
			ptst=con.prepareStatement("update education set school=?, degree=?, year=?, grade=?, description=? where id=? ");
			ptst.setString(1, school2);
			ptst.setString(2, degree2);
			ptst.setString(3, year2);
			ptst.setString(4, grade2);
			ptst.setObject(5, description2);
			ptst.setObject(6, id2);
			int a1= ptst.executeUpdate();


			if (a1>0 ) {
				resp.sendRedirect("profile.jsp");
				con.commit();
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

				RequestDispatcher rd2=req.getRequestDispatcher("edit-profile-education.jsp");
				rd2.include(req, resp);
			}

		} catch (Exception e) {
			try {
				con.rollback();
			} catch (Exception e2) {
				e.printStackTrace();
			}
			e.printStackTrace();
		}
		finally {
			try {
				ptst.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
}
