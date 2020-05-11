<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Edit User </title>
<link rel="stylesheet" href="../../style.css">
<style>
form {
    margin:30px 30px; padding:40px 20px 40px 20px;
    text-align:center;
    align:center;
    background: #E8DAD6;
}
select{
		border:ridge 5px;
		width:316px;
		height: 40px;
		border-radius:7px;
		font-size: 18px;
		}
		body{
background-color: #3973ac;
}
		</style>
</head>
<body onload="changeHeader();">
	
	<div>
            <jsp:include page="../nav.jsp"></jsp:include>
    	</div>
		<%@page import="java.io.*" %>
		<%@page import="java.sql.*" %>
		<%@page import="javax.sql.*" %>
		<%@page import="java.sql.Connection" %>
		<%
			String id = request.getParameter("id");
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rsms","root","dbms");
			Statement st = con.createStatement();
			String Query1 ="select * from login where login_id='"+id+"'";
			ResultSet rs=st.executeQuery(Query1);
			rs.next();
			String a=rs.getString(4);
			%>
	<div class="block">
			<h3 align="center">Edit User</h3>
			<form action="edituserdata.jsp?id=<%= id %>" method="post">
				<div class="clear">
					<label class="label">
						Username : &nbsp;&nbsp;
					</label>
					<input class="input" type="text" name="username" required="required" value="<%=rs.getString(2) %>"/>
				</div><br/>
				<div class="clear">
					<label class="label">
						Password : &nbsp;&nbsp;&nbsp;
					</label>
					<input class="input" type="password" name="pass" required="required" value="<%=rs.getString(3) %>"/>
				</div><br/>
				<div class="clear">
					<label class="label">
						Confirm Password :
					</label>
					<input class="input" type="password" name="cpass" required="required" value="<%=rs.getString(3) %>"/>
				</div><br/>
				<div class="clear">
					<label class="label">
						Role : &nbsp;&nbsp;&nbsp;&nbsp;
					</label>
					<select name="role" style="width:150px;">
						<option <%if(a.equals("user")) out.print("selected");%> value="user">User</option>
						<option <%if(a.equals("admin")) out.print("selected");%> value="admin">Admin</option>
					</select>
				</div><br/>
				<div class="clear" style="text-align: center;">
					<button class="button" type="submit">Save</button>
				</div>
			</form>
		</div>
		
</body>
</html>