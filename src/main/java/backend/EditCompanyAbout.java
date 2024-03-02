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

@WebServlet("/companyabout")
public class EditCompanyAbout extends HttpServlet{

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		PrintWriter out = resp.getWriter();

		HttpSession session = req.getSession();
		String name= (String) session.getAttribute("oname");
		String email= (String) session.getAttribute("oemail");
		String pass= (String) session.getAttribute("opass");
		String city= (String) session.getAttribute("ocity");
		String profile= (String) session.getAttribute("profile");	


		String industry2 = req.getParameter("industry1");
		String website2 = req.getParameter("website1");
		String speciaities2 = req.getParameter("speciaities1");
		String empno2 = req.getParameter("empno1");
		String cabout2 = req.getParameter("cabout1");


		Connection con=null;
		try {

			con=DBConnect.getConnect();
			con.setAutoCommit(false);
			System.out.println("CONNECTION");
			PreparedStatement ps2=con.prepareStatement("update about_company set industry=?, website=?, specialities=?, empno=?, about=? where oemail=?");
			ps2.setString(1, industry2);
			ps2.setString(2, website2);
			ps2.setString(3, speciaities2);
			ps2.setString(4, empno2);
			ps2.setString(5, cabout2);
			ps2.setString(6, email);
			int i2=ps2.executeUpdate();
			System.out.println("ABOUT DATA");
			if (i2>0) {
				con.commit();
				//Not necessary for this part but required for further part session creates instance of parameters which can be used on other pages
				session.setAttribute("industry", industry2);
				session.setAttribute("website", website2);
				session.setAttribute("speciaities", speciaities2);
				session.setAttribute("empno", empno2);
				session.setAttribute("cabout", cabout2);

				resp.sendRedirect("companyprofile.jsp");
			} else {
				con.rollback();
				RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
				rd1.include(req, resp);

				RequestDispatcher rd2=req.getRequestDispatcher("edit-companyabout.jsp");
				rd2.include(req, resp);			}

		} catch (Exception e) {
			out.print(e);
		}
		finally {
			try {
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}


		}
	}
}
