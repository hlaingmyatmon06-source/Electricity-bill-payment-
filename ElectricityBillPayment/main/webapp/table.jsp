<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
	.output{
		border: 1px solid black;
		width: 30%;
		margin: 4% auto;
		padding: 15px;
		box-shadow: 0 0 10px black;
	}
</style>
</head>
<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
	<%@page import="javax.servlet.*" %>
	<%@page import="javax.servlet.http.*" %>
<body>
<%
	String meterNo = request.getParameter("meterNo");
	String month = request.getParameter("month");
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/electricity","root","");
		Statement st1=conn.createStatement();
		String query1="UPDATE bill SET BStatus='Paid' WHERE Bmeterno='"+meterNo+"' and Bmonth='"+month+"';";
		st1.executeUpdate(query1);
		Statement st=conn.createStatement();
		String query="SELECT * FROM bill,meterinfo WHERE bill.Bmeterno='"+meterNo+"' and bill.Bmonth='"+month+"' and meterinfo.meterNo='"+meterNo+"';";
		ResultSet rs=st.executeQuery(query);
		if(rs.next()) {
			int total=Integer.parseInt(rs.getString("Btotal_bill"));
			total+=500;
			%>
	<div class="output">
	<h2 align="center">မီတာဘေ ငွေပြေစာ</h2>
	<h3 align="center">မီတာဘေးအား Ebillဖြင့် ပေးဆောင်ပီးပါကြောင်း</h3>
	<table align="center" cellspacing="10px">
		<tr>
			<td>မီတာဘေငွေပမာဏ</td>
			<td><%=total %></td>
		</tr>
		<tr>
			<td>‌ပေးဆောင်သူအမည်</td>
			<td><%=rs.getString("ownerName") %></td>
		</tr>
		<tr>
			<td>‌ပေးဆောင်မည် လအမည့်</td>
			<td><%=rs.getString("Bmonth") %></td>
		</tr>
		<tr>
			<td>မီတာအမှတ်</td>
			<td><%=rs.getString("Bmeterno") %></td>
		</tr>
	</table>
	<form action="main.html">
		<center>
			<input type="submit" value="Ok" style="background-color: lightsalmon;width:100px;height:30px;">
		</center>
	</form>
	</div>
	<%
		}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>