<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="../../style.css">
		<title>	Customers </title>
		<link rel="icon" href="../../Images/customer.png"  type = "image/x-icon">
		<style type="text/css">
		body{
		background-color : #73858f;}
		
		a{
		text-decoration: none;
		color: black;
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
		String Query ="select * from customer";
			ResultSet rs= st.executeQuery(Query);
		%>
		<div>
            <jsp:include page="../nav.jsp"></jsp:include>
    	</div>
		
		<br/><div align="center">
		<button class="button1" style="width:150px;  border-radius: 8px; font-size:20px;" align="center" disabled>Customers</button>
		</div><br/>
		<div align="center">
		<table>
				<tr>
					<th>S No.</th>
					<th>Name</th>
					<th>Contact</th>
					<th>Address</th>
					<th colspan="2" onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;"><a style="text-decoration:none" href="addcustomer.jsp">Add Customer</a></th>
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
					<td onclick="confirmation();" onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;"><a style="text-decoration:none" href="delcustomerdata.jsp?id=<%=rs.getString(1)%>">Delete</a></td>
					<td onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;"><a style="text-decoration:none" href="editcustomer.jsp?id=<%=rs.getString(1)%>">Edit</a></td>
				</tr>
				<%i++;} %>
			</tbody>
		</table>	
		</div>
		
	</body>
</html>