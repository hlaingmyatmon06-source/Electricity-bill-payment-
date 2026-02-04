

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/adminLoginServlet")
public class adminLoginServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("adminName");
		String password=request.getParameter("password");
		String adminId="";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/electricity","root","");
			Statement st=conn.createStatement();
			String query="SELECT * FROM admin WHERE adminName='"+name+"' AND password='"+password+"'";
			ResultSet rs=st.executeQuery(query);
			if(rs.next()) {
				adminId=rs.getString(1);
				request.getRequestDispatcher("admindishboard.jsp").forward(request, response);
			}
			else {
				out.println("<h1>Error! loginFail!</h1>");
				request.getRequestDispatcher("adminLogin.html").include(request, response);
			}
			conn.close();
		}
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
