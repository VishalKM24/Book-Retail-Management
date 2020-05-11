<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="../../style.css">
		<title>	Setup </title>
		<style type="text/css">
		a{
		text-decoration: none;
		color: black;
		}
		body{
		background-color: #73858f;
		}
		table{
  			border: 1px solid black;
  			width:auto;
  			margin: auto;
   		}
		th, td {
			text-align:center;
			border: 1px solid black;
  			padding: 5px;
		}
		</style>
		<script type="text/javascript">
		function dark(x) {
			  x.style.background = "#9e9e9e";
			}

		function light(x) {
			  x.style.background = "#d3d3d3";
			}
		</script>
	</head>
	<body onload="changeHeader();">
		
		<%@page import="java.io.*" %>
		<%@page import="java.sql.*" %>
		<%@page import="javax.sql.*" %>
		<%@page import="java.sql.Connection" %>
		<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rsms","root","dbms");
		Statement st = con.createStatement();
		String Query ="select * from login";
		ResultSet rs= st.executeQuery(Query);
		%>
		<div>
            <jsp:include page="../nav.jsp"></jsp:include>
    	</div>
		<br/><div align="center">
		<button class="button1" style="width:250px;  border-radius: 8px; font-size:20px;" align="center" disabled>Users and Administrators</button>
		</div><br/>
		
		<div>
		<table>
				<tr>
					<th style="min-width: 50px;">S No.</th>
					<th style="min-width: 100px;">Name</th>
					<th style="min-width: 100px;">Password</th>
					<th style="min-width: 100px;">Role</th>
					<th colspan="2" onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;min-width: 150px;"><a href="adduser.jsp">Add User/Admin</a></th>
				</tr>
			<tbody>
				<%
					int i=1;
					while(rs.next())
					{
				%>
				<tr>
					<td><%=i%></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td onclick="confirmation();" onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;"><a href="deluserdata.jsp?id=<%=rs.getString(1)%>">Delete</a></td>
					<td onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;"><a href="edituser.jsp?id=<%=rs.getString(1)%>">Edit</a></td>
				</tr>
				<%i++;} %>
			</tbody>
		</table>	
		</div>
		
	</body>
</html>