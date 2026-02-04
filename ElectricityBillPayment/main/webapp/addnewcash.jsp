<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.card-link {
    margin-top: 30px;
    font-size: 15px;
    font-weight: bold;
    padding: 10px;
    background-color: blue;
    color: white;
    text-decoration: none;
    background-color: #adc4ce;
    color: black;
}</style>
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
String month=request.getParameter("month");
String year=request.getParameter("year");
String unit=request.getParameter("unit");
String totalbill=request.getParameter("totalbill");
String status=request.getParameter("status");
String date=request.getParameter("date");
String lastdate=request.getParameter("lastdate");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "electricity";
String userid = "root";
String password = "";
int total=0;
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
String sql="INSERT INTO bill VALUES ('"+meterno+"','"+month+"','"+year+"','"+unit+"','"+totalbill+"','"+status+"','"+date+"','"+lastdate+"')";
st.executeUpdate(sql);
ot.println("You have completely inserted Data!");
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
<a href="NewCash.jsp" class="card-link">OK</a>
</table>
</center>
</body>
</html>