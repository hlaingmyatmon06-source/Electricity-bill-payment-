<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
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
    margin-left: 10px;
}</style>
</head>
<body  style="background-color:#cadddc;">
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%String meterno=request.getParameter("meterno");
String name=request.getParameter("name");
String type=request.getParameter("type");
String location=request.getParameter("location");
String city=request.getParameter("city");
String driver = "com.mysql.jdbc.Driver";

int total=0;
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<a href="admindishboard.jsp"><img src="1991752.png" width="30px" height="31px" style="margin-left:50px;margin-top:50px"></a>
<h2 align="center" style="margin-top:4%;"><i>Meter Information</i></h2>
<center><table border="1"  style="background-color:  white;">
<tr>
<td>Meter No</td>
<td>Name</td>
<td>Type</td>
<td>Location</td>
<td>City</td>
</tr>
<%
try{
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/electricity","root","");
Statement st=conn.createStatement();
String sql ="select * from meterinfo";
ResultSet rs= st.executeQuery(sql);
while(rs.next()){
%>
<tr>
<td><%=rs.getString("meterNo") %></td>
<td><%=rs.getString("ownerName") %></td>
<td><%=rs.getString("meterType") %></td>
<td><%=rs.getString("address") %></td>
<td><%=rs.getString("city") %></td>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</center>
<br><br>
<center>
<a href="Delete.html" class="card-link">Delete User</a>
</center>
</body>
</html>