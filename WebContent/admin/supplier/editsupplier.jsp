<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Edit Supplier </title>
<link rel="stylesheet" href="../../style.css">
<style>
body{
background-color: #3973ac;
}
</style>
</head>
<body>
	<div>
            <jsp:include page="../nav.jsp"></jsp:include>
    	</div>
		<%@page import="java.io.*" %>
		<%@page import="java.sql.*" %>
		<%@page import="javax.sql.*" %>
		<%@page import="java.sql.Connection" %>
		<%
			String name = request.getParameter("name");
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rsms","root","dbms");
			Statement st = con.createStatement();
			String Query1 ="select * from dealer where name='"+name+"'";
			ResultSet rs=st.executeQuery(Query1);
			rs.next();
			%>
	<div class="block" border-radius: 15px;>
			<h3 align="center">Edit Supplier</h3>
			<form action="editsupplierdata.jsp" method="post">
				<div class="block1">
					<label class="label">
						Name : &nbsp;&nbsp;
					</label>
					<input class="input" type="text" name="pname" value="<%=rs.getString(2)%>" required="required"/>
				</div>
				
					<div style="padding:15px 0;height: 80px;">
   				 	<label for='add'>Address : </label>
    				<textarea name='add'  style="font-family:sans-serif;height:80px;width:155px;vertical-align:middle;border-radius:7px;" rows="4" cols="30"><%=rs.getString(4)%></textarea>
				</div></br>
				<div class="clear" >
					<label class="label">
						Mobile : &nbsp;&nbsp;
					</label>
					<input class="input" type="text" name="mobile" value="<%=rs.getString(3) %>" required="required"/>
				</div></br>
				<div class="clear" style="text-align: center;">
					<button class="button" type="submit">Save</button>
				</div>
			</form>
		</div>
</body>
</html>