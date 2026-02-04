<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<head>
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
<body style="background-color:#cadddc;">
<center><div class="card" style="width: 30rem;
	padding: 20px;
	margin-top: 6%;
    border: 2px solid;
    border-radius:20px;
    margin-left: 10px;
    height: 20rem;
    background-color: white;
   ">
  <div class="card-body">
   <div><a href="main.html"><i class="fa-solid fa-arrow-left" style="font-size: 2em;"></i></a></div>
            <img src="adminPhoto.jpg" width=100px;>
    <h5 class="card-title">Admin</h5>
    <h6 class="card-subtitle mb-2 text-muted"></h6>
    <p class="card-text">Tools for system</p><br>
    <a href="NewCash.jsp" class="card-link">Bill Table</a>&nbsp;
    <a href="Meter_info.jsp" class="card-link">Meter_info</a>&nbsp;
    <a href="adduser.html" class="card-link">Add Meter</a>&nbsp;
    <a href="LogoutServlet" class="card-link">Logout</a>&nbsp;
  </div>
</div></center>
</body>
</html>