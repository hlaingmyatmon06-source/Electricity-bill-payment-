

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

/**
 * Servlet implementation class Profile
 */
@WebServlet("/Profile")
public class Profile extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String user="";
		HttpSession session=request.getSession(false);
		if(session!=null) {
				user=(String)session.getAttribute("user");
		}
		else {
			request.getRequestDispatcher("login.html").forward(request, response);
		}
			String userId="";
			String userName="";
			String email="";
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
					email=rs.getString(4);
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
			out.print("<!DOCTYPE html>"
					+ "<html lang=\"en\">"
					+ "<head>"
					+ "    <meta charset=\"UTF-8\">"
					+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
					+ "    <title>Profile</title>"
					+ "    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css\" integrity=\"sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\"\r\n"
					+ "    />\r\n"
					+ "    \r\n"
					+ "    <style>\r\n"
					+ "    	.main {\r\n"
					+ "    margin-top: 100px;\r\n"
					+ "    display: flex;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ "\r\n"
					+ "/* card one section */\r\n"
					+ "\r\n"
					+ ".card1 {"
					+ "    padding: 10px;"
					+ "    margin-left: 100px;"
					+ "    width: 500px;"
					+ "    border: 2px solid;"
					+ "    box-shadow: 3px 5px 3px;"
					+ "    background-color: CED3DC;"
					+ "}\r\n"
					+ "\r\n"
					+ "img {\r\n"
					+ "    width: 150px;\r\n"
					+ "    margin-top: 50px;\r\n"
					+ "    margin-left: 170px;\r\n"
					+ "    border-radius: 50%;\r\n"
					+ "    border: 2px solid;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ ".name {\r\n"
					+ "    margin-left: 170px;\r\n"
					+ "    margin-top: 30px;\r\n"
					+ "    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ "\r\n"
					+ "\r\n"
					+ "/* card tow section */\r\n"
					+ "\r\n"
					+ ".card2 {\r\n"
					+ "    padding: 20px;\r\n"
					+ "    border: 2px solid;\r\n"
					+ "    margin-left: 10px;\r\n"
					+ "    width: 700px;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ ".detail {\r\n"
					+ "    margin-left: 10px;\r\n"
					+ "    margin-bottom: 30px;\r\n"
					+ "    text-align: center;\r\n"
					+ "    text-decoration: underline;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ ".information {\r\n"
					+ "    columns: 2;\r\n"
					+ "    font-size: 20px;\r\n"
					+ "    font-weight: bold;\r\n"
					+ "    margin-bottom: 30px;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ ".about {\r\n"
					+ "    padding-left: 100px;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ ".info {\r\n"
					+ "    padding-left: 100px;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ ".btn{\r\n"
					+ "	margin-top:50px;\r\n"
					+ "	margin-left:150px;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ ".hisBtn{\r\n"
					+ "	color : white;\r\n"
					+ "	font-size : 25px;\r\n"
					+ "	background-color:green;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ ".uptBtn{\r\n"
					+ "	margin-left : 50px;\r\n"
					+ "	color : white;\r\n"
					+ "	font-size : 25px;\r\n"
					+ "	background-color:blue;\r\n"
					+ "}\r\n"
					+ ".outBtn{\r\n"
					+ "	margin-left : 50px;\r\n"
					+ "	color : white;\r\n"
					+ "	font-size : 25px;\r\n"
					+ "	background-color: darkred;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ "    </style>\r\n"
					+ "</head>\r\n"
					+ "\r\n"
					+ "<body>\r\n"
					+ "    <div class=\"main\">\r\n"
					+ "        <div class=\"card1\">\r\n"
					+ "            <div><a href=\"main.html\"><i class=\"fa-solid fa-arrow-left\" style=\"font-size: 2em;\"></i></a></div>\r\n"
					+ "            <img src=\"profile.jpg\" alt=\"\">\r\n"
					+ "            <h2 class=\"name\">"+userName+"</h2>\r\n"
					+ "        </div>\r\n"
					+ "        <div class=\"card2\">\r\n"
					+ "            <h2 class=\"detail\">Profile Details</h2>\r\n"
					+ "            <div class=\"information\">\r\n"
					+ "                <div class=\"about\"><i class=\"fa-solid fa-user\"></i> Your ID</div>\r\n"
					+ "                <div class=\"info\">"+userId+"</div>\r\n"
					+ "            </div>\r\n"
					+ "\r\n"
					+ "            <div class=\"information\">\r\n"
					+ "                <div class=\"about\"><i class=\"fa-solid fa-phone\"></i> Phone No</div>\r\n"
					+ "                <div class=\"info\">"+PhNo+"</div>\r\n"
					+ "            </div>\r\n"
					+ "\r\n"
					+ "            <div class=\"information\">\r\n"
					+ "                <div class=\"about\"><i class=\"fa-solid fa-envelope\"></i> Email</div>\r\n"
					+ "                <div class=\"info\">"+email+"</div>\r\n"
					+ "            </div>\r\n"
					+ "\r\n"
					+ "            <div class=\"information\">\r\n"
					+ "                <div class=\"about\"><i class=\"fa-solid fa-location-dot\"></i> Address</div>\r\n"
					+ "                <div class=\"info\">"+address+"</div>\r\n"
					+ "            </div>\r\n"
					+ "            \r\n"
					+ "            <div class=\"btn\">\r\n"
					+ "            	<a href=\"History.jsp\"><button class=\"hisBtn\"><i class=\"fa-solid fa-clock-rotate-left\"></i> History</button></a>\r\n"
					+ "            	<a href=\"update\"><button class=\"uptBtn\"><i class=\"fa-solid fa-wrench\"></i> Update</button></a>\r\n"
					+ "            	<a href=\"LogoutServlet\"><button class=\"outBtn\"><i class=\"fa-solid fa-right-from-bracket\"></i>Logout</button></a>\r\n"
					+ "            </div>\r\n"
					+ "        </div>\r\n"
					+ "    </div>\r\n"
					+ "</body>\r\n"
					+ "\r\n"
					+ "</html>");
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
