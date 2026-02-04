<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ပေးဆောင်နိုင်သောနည်းလမ်းများ</title>
	<style type="text/css">
		*{
            box-sizing: border-box;
        }
        body{
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 90vh;
        }
        .container{
            width: 400px;
            border-radius: 8px;
            padding: 40px;
            box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.1),
                        0 5px 12px -2px rgba(0, 0, 0, 0.1),
                        0 18px 36px -6px rgba(0, 0, 0, 0.1);
            background-color:#FCF7F8;
        }
	</style>
</head>
<body>

<%
	String meterNo = request.getParameter("meterNo");
	String month = request.getParameter("month");
%>
	<div class="container">
        <form action="table.jsp">
        	<input type="text" name="meterNo" value="<%= meterNo%>" style="display:none;">
        	<input type="text" name="month" value="<%= month%>" style="display:none;">
			<center> <div class="title">
           		 <h4>Select a <span style="color: lightsalmon">Payment</span> method</h4>
    </div>
        <table>
        	<tr><td>VISA</td></tr>
        	<tr><td><div id="f"><button onClick="vis()"><img src="visa.jpg" width="240px" height="90px"></button></div></td></tr>
       
            <tr><td>လူကိုယ်တိုင်လာရောက်ငွေပေးဆောင်ရန်</td></tr>
        	<tr><td> <div id="p"><button onClick="oo()"><img src="o.jpg" width="240px" height="90px"></button></div></td></tr>
       
        	  <tr><td>KBZ Pay</td></tr>
        	<tr><td><div id="kpay"><button onClick="kpay()"><img src="KPay.png" width="240px" height="90px"></button></div></td></tr>

        	 <tr><td>Wave Pay</td></tr>
        	<tr><td><div id="wavepay"><button onClick="wpay()"><img src="Wave.jpg" width="240px" height="90px"></button></div></td></tr>
</table></center>
        	   
        </form>
    </div>
    <script type="text/javascript">
		function vis(){
    		var t=document.getElementById("f");
			t.innerHTML="<center><form>Card Details<br>Enter your card number<input type='text'  placeholder='0000 1234 1234 0000'>"+"<br>CVV<br><input type='text' placeholder='123' required><br><input type='submit' value='Confirm'></form></center>";
			t.style.border="thin solid #468189";
			t.style.color="lightsalmon";
    	};

    	function oo(){
    		var d=document.getElementById("p");
			d.innerHTML="<center>488 မြောက်စောင်းတန်းလမ်း, ပြည် <br>"+"R6FC+27 ပြည်<br>"+"<a href='https://www.google.com/maps/place/Epc/@18.8225908,95.2180885,17z/data=!4m14!1m7!3m6!1s0x30c78336802f48b7:0xb22fb1ad375f65c!2sEpc!8m2!3d18.8225908!4d95.2206634!16s%2Fg%2F11r_fpx85g!3m5!1s0x30c78336802f48b7:0xb22fb1ad375f65c!8m2!3d18.8225908!4d95.2206634!16s%2Fg%2F11r_fpx85g?entry=ttu' style='text-decoration:none'>Location on google map</a></center>";
			d.style.border="thin solid #468189";
			d.style.color="lightsalmon";
		};
    	function kpay(){
    		var k=document.getElementById("kpay");
			k.innerHTML="<center>QR Code<br><img src='kbzpay-qr-code.jpg' width='50px' height='50px'><br><form>Payment<br>Enter your phone number<input type='text'  placeholder='09-'>"+"<br>Amount:<br><input type='text' placeholder='00000' required>"+"<br>Password:<br><input type='text' placeholder='123' required><br><input type='submit' value='Confirm'></form></center>";
			k.style.border="thin solid #468189";
			k.style.color="lightsalmon";
		};
     	function wpay(){
    		var w=document.getElementById("wavepay");
			w.innerHTML="<center>QR Code<br><img src='kbzpay-qr-code.jpg' width='50px' height='50px'><br><form>Payment<br>Enter your phone number<input type='text'  placeholder='09-'>"+"<br>Amount:<br><input type='text' placeholder='00000' required>"+"<br>Password:<br><input type='text' placeholder='123' required><br><input type='submit' value='Confirm'></form></center>";
			w.style.border="thin solid #468189";
			w.style.color="lightsalmon";
		};
    </script>
</body>
</html>