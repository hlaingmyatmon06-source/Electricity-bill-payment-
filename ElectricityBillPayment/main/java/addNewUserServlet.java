

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

@WebServlet("/addNewUserServlet")
public class addNewUserServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String meterNO=request.getParameter("meterno");
		String name=request.getParameter("name");
		String meterType=request.getParameter("metertype");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/electricity","root","");
			Statement st=conn.createStatement();
			String query="INSERT INTO meterinfo VALUES ('"+meterNO+"','"+name+"','"+meterType+"','"+address+"','"+city+"')";
			st.executeUpdate(query);
			out.println("<h1 align=\'center\'>Adding New Meter is Successful!</h1>");
			out.println("<form action=\'adduser.html\' method=\'post\' align=\'center\'>"
						+ "<input type=\'submit\' value=\'Ok\' style=\'width: 70px;height: 30px; background: #adc4ce;\'></form>");
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
