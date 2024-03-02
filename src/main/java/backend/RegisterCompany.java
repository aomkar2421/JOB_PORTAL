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

@WebServlet("/regorg")
public class RegisterCompany extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter out=resp.getWriter();
		System.out.println("ENTER COMPANY REGISTER");
		String oname2=req.getParameter("oname1");
		String oemail2=req.getParameter("oemail1");
		String opass2=req.getParameter("opass1");
		String ocity2=req.getParameter("ocity1");

		Connection con=null;
		PreparedStatement ptst=null;
		try {

			con=DBConnect.getConnect();
			con.setAutoCommit(false);

			ptst=con.prepareStatement("insert into company(oname,oemail,opass,ocity) values(?,?,?,?)");
			ptst.setString(1, oname2);
			ptst.setString(2, oemail2);
			ptst.setString(3, opass2);
			ptst.setString(4, ocity2);
			int a1= ptst.executeUpdate();
			System.out.println("ENTER DATA");

//			PreparedStatement ps2=con.prepareStatement("insert into about_user(email,title,skills) values(?,?,?)");
//			ps2.setString(1, oemail2);
//			ps2.setString(2, "");
//			ps2.setString(3, "");
//			int a2=ps2.executeUpdate();

			if (a1>0) {         //if (a1>0 && a2>0) {
				con.commit();
				HttpSession ohp=req.getSession();
				ohp.setAttribute("oname", oname2);
				ohp.setAttribute("oemail", oemail2);
				ohp.setAttribute("opass", opass2);
				ohp.setAttribute("ocity", ocity2);
				ohp.setAttribute("profile", "c");
				
				resp.sendRedirect("logincompany.jsp");

				
			} else {
				con.rollback();
				resp.sendRedirect("registererror.jsp");
				out.print("ERROR OCCURED");
			}

		} catch (Exception e) {
			try {
				con.rollback();
			} catch (Exception e2) {
				out.print(e);
				e.printStackTrace();
			}
			e.printStackTrace();
		}
		finally {
			try {
				ptst.close();
				con.close();
			} catch (Exception e2) {
				out.print(e2);
				e2.printStackTrace();
			}
		}
		
	}
}
