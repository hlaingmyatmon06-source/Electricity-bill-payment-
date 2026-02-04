

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

@WebServlet("/update")
public class update extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String user="";
		HttpSession session=request.getSession(false);
		if(session!=null) {
				user=(String)session.getAttribute("user");
		}
			String userId="";
			String userName="";
			String password="";
			String PhNo="";
			String address="";
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/electricity","root","");
				Statement st=conn.createStatement();
				String query="SELECT * FROM user WHERE userId='"+user+"'";
				ResultSet rs=st.executeQuery(query);
				if(rs.next()) {
					userId=rs.getString(1);
					userName=rs.getString(2);
					password=rs.getString(3);
					PhNo=rs.getString(5);
					address=rs.getString(6);
					
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
			out.println("<!DOCTYPE html>\r\n"
					+ "<html lang=\"en\">\r\n"
					+ "\r\n"
					+ "<head>\r\n"
					+ "    <meta charset=\"UTF-8\">\r\n"
					+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
					+ "    <title>update</title>\r\n"
					+ "    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\">\r\n"
					+ "</head>\r\n"
					+ "\r\n"
					+ "<body>\r\n"
					+ "<a href=\"Profile\" style=\"float:top;\"><img src=\"1991752.png\" width=\"30px\" height=\"31px\" style=\"margin-left:50px;margin-top:50px\"></a>"
					+ "    <div class=\"card col-5 offset-3 mt-5\">\r\n"
					+ "        <div class=\"card-header fw-bold fs-3\">\r\n"
					+ "            Update Page\r\n"
					+ "        </div>\r\n"
					+ "        <div class=\"card-body p-5\">\r\n"
					+ "            <form action=\"updateServelet\" method=\"post\">\r\n"
					+ "           		<input type=\"text\" name=\"userId\" value=\""+userId+"\" id=\"userid\" style=\"display:none;\">\r\n"
					+ "            	<div class=\"mb-3\">\r\n"
					+ "                <label for=\"\" class=\" fw-bold mb-2\">Name:</label>\r\n"
					+ "                <input type=\"text\" name=\"userName\" value=\""+userName+"\"  id=\"name\" class=\" form-control\" required>\r\n"
					+ "            	</div>\r\n"
					+ "\r\n"
					+ "            <div class=\"mb-3\">\r\n"
					+ "                <label for=\"\" class=\" fw-bold mb-2\">Phone:</label>\r\n"
					+ "                <input type=\"text\" name=\"phNo\" value=\""+PhNo+"\"  id=\"ph\" class=\" form-control\" required>\r\n"
					+ "            </div>\r\n"
					+ "\r\n"
					+ "            <div class=\"mb-3\">\r\n"
					+ "                <label for=\"\" class=\" fw-bold mb-2\">Address:</label>\r\n"
					+ "                <input type=\"text\" name=\"address\" value=\""+address+"\"  id=\"address\" class=\" form-control\" required>\r\n"
					+ "            </div>\r\n"
					+ "            \r\n"
					+ "            <div class=\"mb-3\">\r\n"
					+ "                <label for=\"\" class=\" fw-bold mb-2\">Old Password:</label>\r\n"
					+ "                <input type=\"password\" name=\"oldpwd\" value=\""+password+"\"  id=\"oldpwd\" class=\" form-control\" required>\r\n"
					+ "            </div>\r\n"
					+ "            \r\n"
					+ "            <div class=\"mb-3\">\r\n"
					+ "                <label for=\"\" class=\" fw-bold mb-2\">New Password:</label>\r\n"
					+ "                <input type=\"password\" name=\"newPwd\" id=\"newpwd\" class=\" form-control\" required>\r\n"
					+ "            </div>\r\n"
					+ "            	<a href=\"#\"><button class=\"btn btn-primary\" type=\"submit\">Update</button></a>\r\n"
					+ "           </form>\r\n"
					+ "        </div>\r\n"
					+ "            \r\n"
					+ "    </div>\r\n"
					+ "</body>\r\n"
					+ "\r\n"
					+ "</html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
