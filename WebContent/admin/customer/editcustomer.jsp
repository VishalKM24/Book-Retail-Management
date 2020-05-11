<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Edit Customer </title>
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
		<%@page import="java.io.*" %>
		<%@page import="java.sql.*" %>
		<%@page import="javax.sql.*" %>
		<%@page import="java.sql.Connection" %>
		<%
			String id = request.getParameter("id");
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rsms","root","dbms");
			Statement st = con.createStatement();
			String Query1 ="select * from customer where id='"+id+"'";
			ResultSet rs=st.executeQuery(Query1);
			rs.next();
			%>
	<div class="block">
			<h3 align="center">Edit Customer</h3>
			<form action="ecustomerdata.jsp" method="post">
				<div>
					<label class="label">
						Name : &nbsp;&nbsp;
					</label>
					<input class="input" type="text" name="name" value="<%=rs.getString(2) %>" required="required"/>
				</div><br/>
				<div class="clear" style="height: 108px;">
					<label class="label">
						Address : 
					</label>
					<textarea name="add" style="font-family:sans-serif;height:80px;width:155px;vertical-align:middle;border-radius:7px;" rows="4" cols="30"><%=rs.getString(4)%></textarea>
				</div><br/>
				<div class="clear">
					<label class="label">
						Mobile : &nbsp;&nbsp;
					</label>
					<input class="input" type="text" name="mobile" value="<%=rs.getString(3) %>" required="required"/>
				</div><br/>
				<div class="clear" style="text-align: center;">
					<button class="button" type="submit">Save</button>
				</div><br/>
			</form>
		</div>
		
</body>
</html>