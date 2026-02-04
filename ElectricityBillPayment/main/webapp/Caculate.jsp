<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
	.myform{
	display: inline-block;
	margin:20px;
	}
</style>
</head>
<body>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%int result=0,x=0,w;
response.setContentType("text/html");
PrintWriter ot=response.getWriter();%>
<div style="display: flex;
    flex-direction: column;margin-top:5%;">
<center>
<h1>Total Bill for Your Unit</h1>
<table width="40%" border="1">
<tr>
<td>unit</td>
<td>perunit</td>
<td>price</td>
</tr>
<%String radio=(request.getParameter("meterType"));
int unit=Integer.parseInt(request.getParameter("totalUnits"));
int y=0;
if(radio.equals("home")){
while(x!=unit) 
{
	if(unit>30){
		y=30;
		w=y*35;
		result+=w;
		%>
		<tr><td>1-30</td><td>35</td><td><%=w%></td></tr>
<% }else if(unit>=1 || unit<=30){
		y=unit;
		x=unit;
		w=y*35;
		result+=w;
		%>
		<tr><td>1-30</td><td>35</td><td><%=w%></td></tr>
	<% }
	if(unit>50){
		y=20;
		w=y*50;
		result+=w;
		%>
		<tr><td>31-50</td><td>50</td><td><%=w%></td></tr>
<% }else if(unit>=31 || unit<=50){
		y=unit-30;
		x=unit;
		w=y*50;
		result+=w;%>
		<tr><td>31-50</td><td>50</td><td><%=w%></td></tr>
	<% }
	if(unit>75){
		y=25;
		w=y*70;
		result+=w;
		%>
		<tr><td>51-75</td><td>70</td><td><%=w%></td></tr>
<% }else if(unit>=51 || unit<=75){
		y=unit-50;
		x=unit;
		w=y*70;
		result+=w;%>
		<tr><td>51-75</td><td>70</td><td><%=w%></td></tr>
	<% }
	if(unit>100){
		y=25;
		w=y*90;
		result+=w;
		%>
		<tr><td>76-100</td><td>90</td><td><%=w%></td></tr>
<% }else if(unit>=76 || unit<=100){
		y=unit-75;
		x=unit;
		w=y*90;
		result+=w;%>
		<tr><td>76-100</td><td>90</td><td><%=w%></td></tr>
	<% }
	if(unit>150){
		y=50;
		w=y*110;
		result+=w;
		%>
		<tr><td>101-150</td><td>110</td><td><%=w%></td></tr>
<% }else if(unit>=101 || unit<=150){
		y=unit-100;
		x=unit;
		w=y*110;
		result+=w;%>
		<tr><td>101-150</td><td>110</td><td><%=w%></td></tr>
	<% }
	if(unit>200){
		y=50;
		w=y*120;
		result+=w;
		%>
		<tr><td>151-200</td><td>120</td><td><%=w%></td></tr>
<% }else if(unit>=151 || unit<=200){
		y=unit-150;
		x=unit;
		w=y*120;
		result+=w;%>
		<tr><td>151-200</td><td>120</td><td><%=w%></td></tr>
	<% }if(unit>=201){
		y=unit-200;
		x=unit;
		w=y*125;
		result+=w;
		%>
		<tr><td>>=201</td><td>125</td><td><%=w%></td></tr>
<% }
%>
		 <tr><td>Total</td><td colspan="2"><center><%=result %></center></td></tr>
		 </table></center></div>
<%}
}%>
<%if(radio.equals("other")){
	while(x!=unit) 
	{
		if(unit>500){
			y=500;
			w=y*125;
			result+=w;
			%>
			<tr><td>1-500</td><td>125</td><td><%=w%></td></tr>
	<% }else if(unit>=1 || unit<=500){
			y=unit;
			x=unit;
			w=y*125;
			result+=w;
			%>
			<tr><td>1-500</td><td>125</td><td><%=w%></td></tr>
		<% }
		if(unit>5000){
			y=4500;
			w=y*135;
			result+=w;
			%>
			<tr><td>501-5000</td><td>135</td><td><%=w%></td></tr>
	<% }else if(unit>=501 || unit<=5000){
			y=unit-500;
			x=unit;
			w=y*135;
			result+=w;%>
			<tr><td>501-5000</td><td>135</td><td><%=w%></td></tr>
		<% }
		if(unit>10000){
			y=5000;
			w=y*145;
			result+=w;
			%>
			<tr><td>5001-10000</td><td>145</td><td><%=w%></td></tr>
	<% }else if(unit>=5001 || unit<=10000){
			y=unit-5000;
			x=unit;
			w=y*145;
			result+=w;%>
			<tr><td>5001-10000</td><td>145</td><td><%=w%></td></tr>
		<% }
		if(unit>20000){
			y=10000;
			w=y*155;
			result+=w;
			%>
			<tr><td>10001-20000</td><td>155</td><td><%=w%></td></tr>
	<% }else if(unit>=10001 || unit<=20000){
			y=unit-10000;
			x=unit;
			w=y*155;
			result+=w;%>
			<tr><td>10001-20000</td><td>155</td><td><%=w%></td></tr>
		<% }
		if(unit>50000){
			y=30000;
			w=y*165;
			result+=w;
			%>
			<tr><td>20001-50000</td><td>165</td><td><%=w%></td></tr>
	<% }else if(unit>=20001 || unit<=50000){
			y=unit-20000;
			x=unit;
			w=y*165;
			result+=w;%>
			<tr><td>20001-50000</td><td>165</td><td><%=w%></td></tr>
		<% }
		if(unit>100000){
			y=50000;
			w=y*175;
			result+=w;
			%>
			<tr><td>50001-100000</td><td>175</td><td><%=w%></td></tr>
	<% }else if(unit>=50001 || unit<=100000){
			y=unit-50000;
			x=unit;
			w=y*175;
			result+=w;%>
			<tr><td>50001-100000</td><td>175</td><td><%=w%></td></tr>
		<% }if(unit>=100001){
			y=unit-100000;
			x=unit;
			w=y*180;
			result+=w;
			%>
			<tr><td>>=100001</td><td>175</td><td><%=w%></td></tr>
	<% }
	%>
			 <tr><td>Total</td><td colspan="2"><center><%=result %></center></td></tr>
			 </table></center></div>
	<%}
	}%>
<center>
<form action="Calculate.html" class="myform">
	<br>
		<input type="submit" value="Again" style="background-color: lightsalmon;width:100px;height:30px;">
	</form>
	<form action="main.html" class="myform">
	<br>
		<input type="submit" value="Ok" style="background-color: lightsalmon;width:100px;height:30px;">
	</form>
</center>
</body>
</html>