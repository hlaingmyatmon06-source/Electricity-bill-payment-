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
    margin-left: 10px;
}</style>
</head>
<body style="background-color:#cadddc;">
<a href="admindishboard.jsp" style="float:top;"><img src="1991752.png" width="30px" height="31px" style="margin-left:50px;margin-top:50px"></a>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%String meterno=request.getParameter("meterno");
String month=request.getParameter("month");
String year=request.getParameter("year");
String unit=request.getParameter("unit");
String totalbill=request.getParameter("totalbill");
String status=request.getParameter("status");
String date=request.getParameter("date");
String lastdate=request.getParameter("lastdate");
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
<h2 align="center"><i>Bill Table</i></h2>
<center><table border="1"  style="background-color:  white;">
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
String sql ="SELECT * FROM bill ORDER BY FIELD(Bmonth, 'January', 'February', 'March', 'April', 'May', 'Jun', 'July', 'August', 'September', 'October', 'November', 'December');";
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
<%	total+=rs.getInt("Btotal_bill");
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<br><br>
<a href="montlycustomer.html" class="card-link">New cash</a>
<a href="paidh.html" class="card-link">Monthly(Paid/Unpaid)</a>
</center>
</body>
</html>
