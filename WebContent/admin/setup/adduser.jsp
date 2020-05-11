<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Add User </title>
<link rel="stylesheet" href="../../style.css">
<style>
body{
background-color: #3973ac;
}
select{
		border:ridge 5px;
		width:316px;
		height: 40px;
		border-radius:7px;
		font-size: 18px;
		}
	form {
    margin:30px 30px; padding:40px 20px 40px 20px;
    text-align:center;
    align:center;
    background: #E8DAD6;
}
		</style>
</head>
<body onload="changeHeader();">
	
	<div>
         <jsp:include page="../nav.jsp"></jsp:include>
    </div>
	<div class="block">
			<h3 align="center">Add User</h3>
			
			<form action="adduserdata.jsp" method="post">
				<div class="clear">
					<label class="label">
						Username : &nbsp;&nbsp;&nbsp;
					</label>
					<input class="input" type="text" name="username" required="required"/>
				</div><br/>
				<div class="clear">
					<label class="label">
						Password : &nbsp;&nbsp;&nbsp;
					</label>
					<input class="input" type="password" name="pass" required="required"/>
				</div><br/>
				<div class="clear">
					<label class="label">
						Confirm Password : &nbsp;
					</label>
					<input class="input" type="password" name="cpass" required="required"/>
				</div><br/>
				<div class="clear">
					<label class="label">
						Role :  &nbsp;&nbsp;
					</label>
					<select name="role" style="width:150px;">
										<option selected="selected" value="user">User</option>
										<option value="admin">Admin</option>
					</select>
				</div><br/>
				<div class="clear" style="text-align: center;">
					<button class="button" type="submit">Add</button>
				</div>
			</form>
		</div>
		
</body>
</html>