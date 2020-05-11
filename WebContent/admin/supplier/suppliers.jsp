<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		
		<title> Suppliers </title>
		<link rel="stylesheet" href="../../style.css">
		<style>
	body {
  background-color: #73858f;
  background-repeat: no-repeat;
  background-attachment: fixed; 
  background-size: 100% 100%;
	}
	a{
		text-decoration: none;
		color: black;
		}
</style>
<script>
function dark(x) {
	  x.style.background = "#9e9e9e";
	}

function light(x) {
	  x.style.background = "#d3d3d3";
	}
</script>
		
		
	</head>
	<body>
		<%@page import="java.io.*" %>
		<%@page import="java.sql.*" %>
		<%@page import="javax.sql.*" %>
		<%@page import="java.sql.Connection" %>
		<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rsms","root","dbms");
		Statement st = con.createStatement();
		String Query ="select * from dealer";
			ResultSet rs= st.executeQuery(Query);
			 
		%>
		<div>
            <jsp:include page="../nav.jsp"></jsp:include>
    	</div><br/>
		<div align="center">
		<button class="button1" style="width:150px;  border-radius: 8px; font-size:20px;" align="center" disabled>Suppliers</button>
		</div><br/>
		<div>
		<table align="center">
				<tr>
					<th>S No.</th>
					<th>Name</th>
					<th>Contact</th>
					<th>Address</th>
					<th class="admin1" colspan="2" onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;" ><a style="text-decoration:none" href="addsupplier.jsp">Add Supplier</a></th>
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
					<td class="admin1" onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;"><a style="text-decoration:none" href="delsupplier.jsp?name=<%=rs.getString(2)%>">Delete</a></td>
					<td class="admin1"  onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;"><a style="text-decoration:none" href="editsupplier.jsp?name=<%=rs.getString(2)%>">Edit</a></td>
				</tr>
				<%i++;} %>
			</tbody>
		</table>	
		</div>
	</body>
</html>