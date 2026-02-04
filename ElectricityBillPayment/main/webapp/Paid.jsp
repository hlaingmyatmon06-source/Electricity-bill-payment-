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
<%
String month=request.getParameter("months");
String condi=request.getParameter("con");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
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
%>
<br>
<br>
<h1 align="center">Monthly Abstract</h1>
<center><table border="1" bordercolor="lightsalmon">
<tr>
<td>Meter No</td>
<td>Month</td>
<td>Year</td>
<td>Unit</td>
<td>Total_cost</td>
<td>status</td>
<td>Date</td>
<td>Last Date</td>
</tr>
<%
try{
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/electricity","root","");
Statement st=conn.createStatement();
String sql ="select * from bill where Bmonth='"+month+"'and Bstatus='"+condi+"'";
ResultSet rs= st.executeQuery(sql);
while(rs.next()){
%>
<tr>
<td><%=rs.getString("Bmeterno") %></td>
<td><%=rs.getString("Bmonth") %></td>
<td><%=rs.getString("Byear") %></td>
<td><%=rs.getString("Bunit") %></td>
<td><%=rs.getString("Btotal_bill") %></td>
<td><%=rs.getString("Bstatus") %></td>
<td><%=rs.getString("Bdate") %></td>
<td><%=rs.getString("Blastdate") %></td>
<%
	total+=rs.getInt("Btotal_bill");
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<p>Total is:<%=total %></p>
<form action="NewCash.jsp">
<input type="submit" value="Ok" style="width: 70px;height: 30px; background: #adc4ce;">
</form>
</center>
</body>
</html>