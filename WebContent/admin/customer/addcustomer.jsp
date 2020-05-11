<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Add Customer </title>
<style>
body{
background-color: #3973ac;
}
</style>
<link rel="stylesheet" href="../../style.css">
</head>
<body  onload="changeHeader();">
	
	<div>
         <jsp:include page="../nav.jsp"></jsp:include>
    </div>
	<div class="block">
			<h3 align="center">Add Customer</h3>
			<form action="addcustomerdata.jsp" method="post">
				<div>
					<label class="label">
						Name : &nbsp;&nbsp;
					</label>
					<input class="input" type="text" name="name" required="required"/>
				</div><br/>
				<div class="clear" style="height: 108px;">
					<label class="label">
						Address : 
					</label>
					<textarea name="add" style="font-family:sans-serif;height:80px;width:155px;vertical-align:middle;border-radius:7px;" rows="4" cols="30"></textarea>
				</div><br/>
				<div class="clear">
					<label class="label">
						Mobile : &nbsp;
					</label>
					<input class="input" type="text" name="mobile" pattern="^[0]?[6789]\d{9}$" title="Enter valid mobile number." required="required"/>
				</div><br/>
				<div class="clear" style="text-align: center;">
					<button class="button" type="submit">Add</button>
				</div>
			</form>
		</div>
		
</body>
</html>