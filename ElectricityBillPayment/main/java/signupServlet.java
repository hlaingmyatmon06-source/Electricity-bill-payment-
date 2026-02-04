

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

/**
 * Servlet implementation class signupServlet
 */
@WebServlet("/signupServlet")
public class signupServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String userId="";
		int i=1;
		String name=request.getParameter("n1");
		String password=request.getParameter("p1");
		String email=request.getParameter("e1");
		String pno=request.getParameter("ph1");
		String address=request.getParameter("a1");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/electricity","root","");
			Statement st=conn.createStatement();
			String qy="SELECT userId FROM user";
			ResultSet rst=st.executeQuery(qy);
			while(rst.next()){
				userId=rst.getString(1);
				i++;
			}
			userId="s"+i;
			String query="SELECT * FROM user WHERE email='"+email+"'";
			ResultSet rs=st.executeQuery(query);
			if(rs.next()) {
				out.println("<h1>This gmail is already register!</h1>");
				out.println("<h2>Please Try Again, another gmail account.</h2>");
			}
			else {
				String query2="INSERT INTO user VALUES ('"+userId+"','"+name+"','"+password+"','"+email+"','"+pno+"','"+address+"')";
				st.executeUpdate(query2);
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
		out.println("<form action=\"main.html\" align=\"center\" style=\"border: 1px solid black;border-radius: 10px;width: 30%;padding: 10px;margin: auto; margin-top: 10%; box-shadow: 0 0 10px 1px;\">"
				+ "		<h3>You are successfully sign up!</h3>"
				+ "		<h2>Go back to home page</h2>"
				+ "		<input type=\"submit\" value=\"Ok\">"
				+ "	</form>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
