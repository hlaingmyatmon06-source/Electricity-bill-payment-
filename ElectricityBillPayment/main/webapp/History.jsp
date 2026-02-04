<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>History</title>
</head>

<style>
	h1 {
		text-align: center;
	}

	.form {
		position: relative;
		display: flex;
		justify-content: center;
		margin-bottom: 2%;
	}
</style>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
	<%@page import="javax.servlet.*" %>
	<%@page import="javax.servlet.http.*" %>
<body onload="unit()">
<a href="Profile" style="float:top;"><img src="1991752.png" width="30px" height="31px" style="margin-left:50px;margin-top:50px"></a>
	<h1>Meter Bill History</h1>
	<div class="form">
		<form name="myForm" method="get">
			<table cellpadding="10px" align="center">
				<tr>
					<td>Enter your Meter Number:</td>
					<td><input type="text" name="meterNo" placeholder="Meter No"></td>
				</tr>
			</table>
			<input type="submit" value="Search">
		</form></div>
		<hr>
	</div>
	<div id="form1"></div>
	<script type="text/javascript">
		function unit(){
			var page=document.getElementById("form1");
			var myDiv=document.createElement("div");
			myDiv.style.border="1px solid black";
			myDiv.style.borderRadius="20px";
			myDiv.style.boxShadow="0 0 0 1px rgba(0, 0, 0, 0.1),0 5px 12px -2px rgba(0, 0, 0, 0.1),0 18px 36px -6px rgba(0, 0, 0, 0.1)";
			myDiv.style.width="50%";
			myDiv.style.height="28%";
			myDiv.style.marginLeft="auto";
			myDiv.style.marginRight="auto"
			myDiv.style.padding="3%";
			var h=document.createElement("h2");
			h.align="center";
			h.appendChild(document.createTextNode("Your Unit"));
			myDiv.appendChild(h);
		
			<%
			String meterNo = request.getParameter("meterNo");
			String month = request.getParameter("month");
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/electricity","root","");
				Statement st=conn.createStatement();
				String query="SELECT * FROM bill WHERE Bmeterno='"+meterNo+"';";
				ResultSet rs=st.executeQuery(query);
				while(rs.next()) {
			%>
			
			document.myForm.meterNo.value=<%=rs.getString("Bmeterno") %>;
			
			var ta=document.createElement("table");
			ta.border="1";
			ta.width="70%";
			ta.align="center"
			var tb=document.createElement("tbody");

			tb.insertRow(0);
			tb.rows[0].insertCell(0);
			tb.rows[0].cells[0].appendChild(document.createTextNode("Unit"));

			tb.rows[0].insertCell(1);
			tb.rows[0].cells[1].appendChild(document.createTextNode("Bill"));
			
			tb.rows[0].insertCell(2);
			tb.rows[0].cells[2].appendChild(document.createTextNode("Month"));
			
			tb.rows[0].insertCell(3);
			tb.rows[0].cells[3].appendChild(document.createTextNode("Bstatus"));

			tb.insertRow(1);
			tb.rows[1].insertCell(0);
			tb.rows[1].cells[0].appendChild(document.createTextNode(<%=rs.getString("Bunit") %>));

			tb.rows[1].insertCell(1);
			tb.rows[1].cells[1].appendChild(document.createTextNode(<%=rs.getString("Btotal_bill") %>));
			
			tb.rows[1].insertCell(2);
			tb.rows[1].cells[2].appendChild(document.createTextNode("<%=rs.getString("Bmonth") %>"));
			
			tb.rows[1].insertCell(3);
			tb.rows[1].cells[3].appendChild(document.createTextNode("<%=rs.getString("BStatus") %>"));
			
			ta.appendChild(tb);
			myDiv.appendChild(ta);
			myDiv.appendChild(document.createElement("br"));
			page.appendChild(myDiv);
			

			<%
			}
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>

		}

	</script>
</body>
</html>
