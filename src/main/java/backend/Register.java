package backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import connection.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/reg")
public class Register extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		PrintWriter out=resp.getWriter();

		String name2=req.getParameter("name1");
		String email2=req.getParameter("email1");
		String pass2=req.getParameter("pass1");
		String gender2=req.getParameter("gender1");
		String arr[]=req.getParameterValues("field1");
		String city2=req.getParameter("city1");

		String field2="";
		for(int i=0;i<arr.length;i++) {
			field2=field2+","+arr[i];
		}

		Connection con=null;
		PreparedStatement ptst=null;
		try {

			con=DBConnect.getConnect();
			con.setAutoCommit(false);

			ptst=con.prepareStatement("insert into register(name,email,pass,gender,field,city) values(?,?,?,?,?,?)");
			ptst.setString(1, name2);
			ptst.setString(2, email2);
			ptst.setString(3, pass2);
			ptst.setString(4, gender2);
			ptst.setObject(5, field2);
			ptst.setString(6, city2);
			int a1= ptst.executeUpdate();

			PreparedStatement ps2=con.prepareStatement("insert into about_user(email,title,skills) values(?,?,?)");
			ps2.setString(1, email2);
			ps2.setString(2, "");
			ps2.setString(3, "");
			int a2=ps2.executeUpdate();

			if (a1>0 && a2>0) {
				con.commit();
				HttpSession hp=req.getSession();

				resp.sendRedirect("login.jsp");
				hp.setAttribute("sname", name2);
				hp.setAttribute("semail", email2);
				hp.setAttribute("spass", pass2);
				hp.setAttribute("sgender", gender2);
				hp.setAttribute("sfield", field2);
				hp.setAttribute("scity", city2);
				hp.setAttribute("stitle", "");
				hp.setAttribute("sskills", "");

			} else {
				con.rollback();
				resp.sendRedirect("registererror.jsp");
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
