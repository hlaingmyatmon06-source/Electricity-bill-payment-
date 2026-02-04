<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%
	response.setContentType("text/html");
	PrintWriter ot=response.getWriter();
String meterno=request.getParameter("meterno");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
try{
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/electricity","root","");
	Statement st=conn.createStatement();
	String sql ="delete from meterinfo where meterNo='"+meterno+"'";
	st.executeUpdate(sql);
	conn.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<center>
<h1>You have completely deleted!</h1>
<form action="Delete.html">
	<input type="submit" value="Ok" style="background-color: #adc4ce;width:100px;height:30px;">
</form>
</center>
</body>
</html>