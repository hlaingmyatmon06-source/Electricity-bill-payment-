

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateServelet
 */
@WebServlet("/updateServelet")
public class updateServelet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String phNo = request.getParameter("phNo");
		String address = request.getParameter("address");
		String newPwd = request.getParameter("newPwd");		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/electricity","root","");
			Statement st=conn.createStatement();
			String query="UPDATE user SET userName='"+userName+"',password='"+newPwd+"',phoneNo='"+phNo+"',address='"+address+"' WHERE userId='"+userId+"'";
			st.executeUpdate(query);
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
		out.println("<form action=\"Profile\" align=\"center\" style=\"border: 1px solid black;border-radius: 10px;width: 30%;padding: 10px;margin: auto; margin-top: 10%; box-shadow: 0 0 10px 1px;\">"
				+ "		<h3>Update Successfully!</h3>"
				+ "		<input type=\"submit\" value=\"Ok\">"
				+ "	</form>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
