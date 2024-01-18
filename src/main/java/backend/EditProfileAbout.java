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


@WebServlet("/EPA")
public class EditProfileAbout extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		PrintWriter out= resp.getWriter();

		HttpSession hp=req.getSession();
		String email2=(String) hp.getAttribute("semail");

		String name2=req.getParameter(("name1"));
		String gender2=req.getParameter(("gender1"));
		String city2=req.getParameter(("city1"));
		String title2=req.getParameter(("title1"));
		String skills2=req.getParameter(("skills1"));

		Connection con=null;
		try {

			con=DBConnect.getConnect();
			con.setAutoCommit(false);

			PreparedStatement ps1=con.prepareStatement("update register set name=?, city=?, gender=? where email=?");
			ps1.setString(1, name2);
			ps1.setString(2, city2);
			ps1.setString(3, gender2);
			ps1.setString(4, email2);
			int i1=ps1.executeUpdate();

			PreparedStatement ps2=con.prepareStatement("update about_user set title=?, skills=? where email=?");
			ps2.setString(1, title2);
			ps2.setString(2, skills2);
			ps2.setString(3, email2);
			int i2=ps2.executeUpdate();

			if (i1>0 && i2>0) {
				con.commit();
				//Not necessary for this part but required for further part session creates instance of parameters which can be used on other pages
				hp.setAttribute("sname", name2);
				hp.setAttribute("semail", email2);
				hp.setAttribute("sgender", gender2);
				hp.setAttribute("scity", city2);

				hp.setAttribute("stitle", title2);
				hp.setAttribute("sskills", skills2);

				resp.sendRedirect("profile.jsp");
			} else {
				con.rollback();
				RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
				rd1.include(req, resp);

				RequestDispatcher rd2=req.getRequestDispatcher("edit-profile-about.jsp");
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
