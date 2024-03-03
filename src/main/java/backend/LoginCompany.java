package backend;

import java.awt.color.ProfileDataException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.DBConnect;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logincompany")
public class LoginCompany extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();

		String oemail2=req.getParameter("oemail1");
		String opass2=req.getParameter("opass1");

		//code to be executed while creating profile

		String name3="", email3="",pass3="",city3="";
		Connection con=null;
		PreparedStatement ptst=null;
		try {
			con=DBConnect.getConnect();
			con.setAutoCommit(false);

			ptst=con.prepareStatement("select * from company where oemail=? and opass=?");
			ptst.setString(1, oemail2);
			ptst.setString(2, opass2);

			ResultSet rs=ptst.executeQuery();

			if (rs.next()) {		
				con.commit();
				out.println("Data found");
				//code to be executed while creating this page
				resp.sendRedirect("companyprofile.jsp");


				//code to be executed while creating profile

				name3=rs.getString("oname");
				email3=rs.getString("oemail");
				pass3=rs.getString("opass");
				city3=rs.getString("ocity");

				HttpSession hp=req.getSession();
				hp.setAttribute("oname", name3);
				hp.setAttribute("oemail", email3);
				hp.setAttribute("opass", pass3);
				hp.setAttribute("ocity", city3);
				hp.setAttribute("profile", "c");


				//				//code to be executed while creating edit profile
				String industry="",website="",specialities="",empno="",about="",id="";

				PreparedStatement ptst2=con.prepareStatement("select * from about_company where oemail=?");
				ptst2.setString(1, email3);

				ResultSet rs2=ptst2.executeQuery();

				while(rs2.next()){
					industry= rs2.getString("industry");
					website= rs2.getString("website");
					specialities= rs2.getString("specialities");
					empno= rs2.getString("empno");
					about= rs2.getString("about");
				}
				
				hp.setAttribute("industry", industry);
				hp.setAttribute("website", website);
				hp.setAttribute("specialities", specialities);
				hp.setAttribute("empno", empno);
				hp.setAttribute("about", about);

			} else {
				con.rollback();
				resp.sendRedirect("loginerror.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			out.print(e);
			try {
				con.rollback();
			} catch (Exception e2) {
				out.print(e2);
				e.printStackTrace();
			}
		}
		finally {
			try {
				con.close();
			} catch (Exception e2) {
				out.print(e2);
				e2.printStackTrace();
			}
		}
	}
}
