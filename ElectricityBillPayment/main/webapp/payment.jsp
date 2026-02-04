<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Payment</title>
<style type="text/css">
		body{
        	width: 100%;
        	height: 100vh;
        	color: lightsalmon;
        	background-size: 100% 100%;
        	background-position: center;
    	}
    	.formPos{
        	width: 48%;
        	height: 95%;
        	float: right;
        	position: relative;
    	}
    	.formPos .td{
    		width: 70%;
    		height: 50%;
    		margin: auto;
    		margin-top: 80px;
    	}
    	.td .head table{
    		margin-left: auto;
    		margin-right: auto;
    	}
    	.td .content{
    		margin-top: 10px;
    	}
    	.content h1{
    		text-align: center;
    	}
    	.content ul li{
    		list-style: none;
    	}
    	.td .btn{
    		text-align: center;
    		margin-top: 10px;
    	}
    	.btn input{
    		width: 100%;
    		background: lightsalmon;
    		border: none;
    	}
    	.wp{
        	width: 48%;
        	height: 95%;
        	background-repeat: no-repeat;
        	background-position: center;
        	background-size: 100% 100%;
    	}
	</style>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
	<%@page import="javax.servlet.*" %>
	<%@page import="javax.servlet.http.*" %>
</head>
<%
	HttpSession s=request.getSession(false);
	if(s==null) {
		request.getRequestDispatcher("login.html").forward(request, response);
	}
%>
<body onload="unit()">
<a href="main.html" style="float:top;"><img src="1991752.png" width="30px" height="31px" style="margin-left:50px;margin-top:50px"></a>
	<div class="formPos" id="form1">
		<div class="td">
		<div class="head">
			<form name="myForm" method="get">
				<table>
					<tr>
						<td><img src="meterNo.png" width="20" height="20"></td>
						<td><input type="text" name="meterNo" placeholder="မီတာနံပါတ်" style="width: 200px;"></td>
					</tr>
					<tr>
						<td><img src="date.png" width="20" height="20"></td>
						<td><center><select style="width: 200px;" name="month">
							<option>Jun</option>
							<option>July</option>
							<option>August</option>
						</select></td></center>
					</tr>
				</table>
				<hr>
		</div>
		<div class="content">
			<h1>လျှပ်စစ်မီတာဘေလ်ပေးဆောင်ပုံ</h1>
				<ul>
				<li>အဆင့် ၁။  မီတာနံပါတ် ရိုက်ထည့်ပါ။</li>
				<li>အဆင့် ၂။  ရက်စွဲကိုရွေးချယ်ပါ။</li>
				<li>အဆင့် ၃။  ဆက်လက်လုပ်ဆောင်မည် ကိုနှိပ်ပါ။</li>
			</ul>
			<hr>
		</div>
		<div class="btn">
			<input type="submit" value="ဆက်လက်လုပ်ဆောင်မည်">
		</div>
			</form>
	</div>

	</div>
	<div class="wp">
		<img src="paymentWp.jpg" width="100%" height="100%">
	</div>
	<script type="text/javascript">
		function unit(){
			var page=document.getElementById("form1");
			var myDiv=document.createElement("div");
			myDiv.style.border="1px solid black";
			myDiv.style.borderRadius="20px";
			myDiv.style.boxShadow="0 0 0 1px rgba(0, 0, 0, 0.1),0 5px 12px -2px rgba(0, 0, 0, 0.1),0 18px 36px -6px rgba(0, 0, 0, 0.1)";
			myDiv.style.width="50%";
			myDiv.style.height="28%";
			myDiv.style.margin="auto"
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
				String query="SELECT * FROM bill WHERE Bmeterno='"+meterNo+"' and Bmonth='"+month+"';";
				ResultSet rs=st.executeQuery(query);
				if(rs.next()) {
			%>
			
			document.myForm.meterNo.value=<%=rs.getString("Bmeterno") %>;
			
			var ta=document.createElement("table");
			ta.border="1";
			ta.width="70%";
			ta.align="center"
			var tb=document.createElement("tbody");
			ta.appendChild(tb);

			tb.insertRow(0);
			tb.rows[0].insertCell(0);
			tb.rows[0].cells[0].appendChild(document.createTextNode("Unit"));

			tb.rows[0].insertCell(1);
			tb.rows[0].cells[1].appendChild(document.createTextNode("Bill"));
			
			tb.rows[0].insertCell(2);
			tb.rows[0].cells[2].appendChild(document.createTextNode("Status"));

			tb.insertRow(1);
			tb.rows[1].insertCell(0);
			tb.rows[1].cells[0].appendChild(document.createTextNode(<%=rs.getString("Bunit") %>));

			tb.rows[1].insertCell(1);
			tb.rows[1].cells[1].appendChild(document.createTextNode(<%=rs.getString("Btotal_bill") %>));
			
			tb.rows[1].insertCell(2);
			tb.rows[1].cells[2].appendChild(document.createTextNode("<%=rs.getString("Bstatus") %>"));
			myDiv.appendChild(ta);
			
			var cen=document.createElement("center");
			var f=document.createElement("form");
			f.action="detailTable.jsp";
			f.method="post";
			
			var input1=document.createElement("input");
			input1.type="text";
			input1.name="BMeterNo";
			input1.value=<%=rs.getString("Bmeterno") %>;
			input1.style.display="none";
			
			var input2=document.createElement("input");
			input2.type="text";
			input2.name="Bmonth";
			input2.value="<%=rs.getString("Bmonth") %>";
			input2.style.display="none";
			
			f.appendChild(input1);
			f.appendChild(input2);
			var input=document.createElement("input");
			input.type="submit";
			input.value="အသေးစိတ်ကြည်ရှုမည်။";
			input.style.background="lightsalmon";
			input.style.marginTop="5px";
			input.style.width="70%";
			f.appendChild(input);
			cen.appendChild(f);
			myDiv.appendChild(cen);
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