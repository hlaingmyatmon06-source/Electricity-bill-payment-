

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession(false);
		if(session!=null) {
			session.invalidate();
		}
		out.println("<form action=\"main.html\" align=\"center\" style=\"border: 1px solid black;border-radius: 10px;width: 30%;padding: 10px;margin: auto; margin-top: 10%; box-shadow: 0 0 10px 1px;\">" +
				  "		<h3>You are successfully logout!</h3>" +
				  "		<input type=\"submit\" value=\"Ok\">" + "	</form>");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
