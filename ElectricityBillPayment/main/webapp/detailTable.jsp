<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style type="text/css">
		body{ 
			line-height:20px ;
		}
        h1{
        	font-size: 5;
         	font-family: verdana;
     	}
         h5{ 
         	line-height:1px ;
         	padding-top: 0;
         }
 		table{
 			width: 800px;
 			height: 400px;
 			border-style: solid;
 			border-width: 1px;
 			border-spacing: 0px;
 			margin: auto;
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
<a href="payment.jsp" style="float:top;"><img src="1991752.png" width="30px" height="31px" style="margin-left:50px;margin-top:50px"></a>
	<h1 align="center">လျှပ်စစ်နှင့်စွမ်းအင်ဝန်ကြီးဌာန<h1>
	<h2 align="center">လျှပ်စစ်ဓာတ်အားဖြန့်ဖြူးရေးလုပ်ငန်း</h2>
	<h3 align="center">ဓာတ်အားတောင်းခံလွှာ</h3>
	<%
			String meterNo = request.getParameter("BMeterNo");
			String month = request.getParameter("Bmonth");
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/electricity","root","");
				Statement st=conn.createStatement();
				String query="SELECT * FROM bill,meterinfo WHERE bill.Bmeterno='"+meterNo+"' and bill.Bmonth='"+month+"' and meterinfo.meterNo='"+meterNo+"';";
				ResultSet rs=st.executeQuery(query);
				if(rs.next()) {
			%>
	<table border="1" style="border:1px solid black;border-radius:10px;box-shadow:0 0 10px black">
	<%
		int total=Integer.parseInt(rs.getString("Btotal_bill"));
		total+=500;
		int num=0,num1=0,num2=0,num3=0,num4=0,num5=0,num6=0;
		int unit=Integer.parseInt(rs.getString("Bunit"));
		int y=unit;
		int x=0;
		while(y!=1) 
		{if(y>=201) {
			x=y-200;
			y=200;
			num6=x*125;
		}else if(y>=151 && y<201) {
			x=y-150;
			y=150;
			num5=x*120;
		}else if(y>=101 && y<151) {
			x=y-100;
			y=100;
			num4=x*110;
		}else if(y>=76 && y<101) {
			x=y-75;
			y=75;
			num3=x*90;
		}else if(y>=51 && y<76) {
			x=y-50;
			y=50;
			num2=x*70;
		}else if(y>=31 && y<51) {
			x=y-30;
			y=30;
			num1=x*50;
		}
		else if (y<31) {
			num=y*35;
			y=1;
		}
		}%>

		<tr>
			<td>လျှပ်စစ်ပုံစံ</td>
			<td>အိမ်သုံး</td>
			<td>ယူနစ်အလွှာ</td>
			<td>နှုန်းထား</td>
			<td>သင့်ငွေ(ကျပ်)</td>
		</tr>
		<tr>
			<td>အမည့်</td>
			<td><%=rs.getString("ownerName") %></td>
			<td>(၁ မှ ၃၀)ယူနစ်အထိ</td>
			<td>(၃၅) ကျပ်</td>
			<td><%=num %></td>
		</tr>
		<tr>
			<td>နေရပ်လိပ်စာအမည်</td>
			<td><%=rs.getString("address") %></td>
			<td>(၃၁ မှ ၅၀)ယူနစ်အထိ</td>
			<td>(၅၀) ကျပ်</td>
			<td><%=num1 %></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td>(၅၁ မှ ၇၅)ယူနစ်အထိ</td>
			<td>(၇၀) ကျပ်</td>
			<td><%=num2 %></td>
		</tr>
		<tr>
			<td>ငွေစာရင်းအမှတ်</td>
			<td>05/46/25</td>
			<td>(၇၆ မှ ၁၀၀)ယူနစ်အထိ</td>
			<td>(၉၀) ကျပ်</td>
			<td><%=num3 %></td>
		</tr>
		<tr>
			<td>ငွေစာရင်းခေါင်းစဥ်</td>
			<td>2110</td>
			<td>(၁၀၁ မှ ၁၅၀)ယူနစ်အထိ</td>
			<td>(၁၁၀) ကျပ်</td>
			<td><%=num4 %></td>
		</tr>
		<tr>
			<td>မီတာဖတ်သည့်နေ့</td>
			<td><%=rs.getString("Bdate") %></td>
			<td>(၁၅၁ မှ ၂၀၀)ယူနစ်အထိ</td>
			<td>(၁၂၀) ကျပ်</td>
			<td><%=num5 %></td>
		</tr>
		<tr>
			<td>သုံးစွဲယူနစ်</td>
			<td><%=rs.getString("Bunit") %></td>
			<td>(၂၀၁)နှင့်အထက်</td>
			<td>(၁၂၅) ကျပ်</td>
			<td><%=num6 %></td>
		</tr>
		<tr>
			<td>တောင်းခံလွှာအမှတ်</td>
			<td>B7K9029496</td>
			<td colspan="2">ဓာတ်အားစုစုပေါင်း</td>
			<td><%=rs.getString("Btotal_bill") %></td>
		</tr>
		<tr>
			<td>မီတာအမှတ်</td>
			<td><%=rs.getString("Bmeterno") %></td>
			<td colspan="2">မီတာဝန်ဆောင်ခ</td>
			<td>500</td>
		</tr>
		<tr>
			<td>ပေးဆောင်မည့် လအမည့်</td>
			<td><%=rs.getString("Bmonth") %></td>
			<td colspan="2">ကျသင့်ငွေစုစုပေါင်း</td>
			<td><%=total%></td>
		</tr>
	</table>
	<br>
	<%
		if(rs.getString("Bstatus").equals("Unpaid")){
	%>
	<form action="paymentApp.jsp">
		<input type="text" name="meterNo" value="<%=rs.getString("Bmeterno") %>" style="display:none">
		<input type="text" name="month" value="<%=rs.getString("Bmonth") %>" style="display:none">
	<center>
		<input type="submit" onclick="Check_data()" value="ပေးသွင်း" style="width: 70px;height: 30px;" >
	</center>
	</form>
	<%
	}
		else{
	%>
	<h3 align="center" style="color:red;">ယခုလအတွက်မီတာဘေလ်ပေးဆောင်ပြီးပါပြီ</h3>
	<% 
		}
	
		}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>