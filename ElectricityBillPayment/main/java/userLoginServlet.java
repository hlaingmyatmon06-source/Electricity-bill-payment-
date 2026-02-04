

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;


@WebServlet("/userLoginServlet")
public class userLoginServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("n1");
		String password=request.getParameter("p1");
		String userId="";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/electricity","root","");
			Statement st=conn.createStatement();
			String query="SELECT * FROM user WHERE userName='"+name+"' AND password='"+password+"'";
			ResultSet rs=st.executeQuery(query);
			if(rs.next()) {
				userId=rs.getString(1);
				
			}
			else {
				out.println("<h1>Error! loginFail!</h1>");
				request.getRequestDispatcher("login.html").include(request, response);
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
		
		HttpSession session=request.getSession();
		session.setAttribute("user",userId);
		
		
		  out.println("<form action=\"main.html\" align=\"center\" style=\"border: 1px solid black;border-radius: 10px;width: 30%;padding: 10px;margin: auto; margin-top: 10%; box-shadow: 0 0 10px 1px;\">" +
		  "		<h2>Welcome, user "+name+"</h2>" +
		  "		<h3>You are successfully login!</h3>" +
		  "		<input type=\"submit\" value=\"Ok\">" + "	</form>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
