<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="../../style.css">
		<title>	Purchase Bills </title>
		<style type="text/css">
		body{
background-color: #73858f;
}
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
	<body>
		<%@page import="java.io.*" %>
		<%@page import="java.sql.*" %>
		<%@page import="javax.sql.*" %>
		<%@page import="java.sql.Connection" %>
		<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rsms","root","dbms");
		Statement st = con.createStatement();
		String Query ="select * from purchase";
			ResultSet rs= st.executeQuery(Query);
		%>
		<div>
            <jsp:include page="../nav.jsp"></jsp:include>
    	</div>
		
		<br/><div align="center">
		<button class="button1" style="width:200px;  border-radius: 8px; font-size:20px;" align="center" disabled>Purchase Bill</button>
		</div><br/>
		<div>
		<table>
				<tr>
					<th>Bill No.</th>
					<th>Dealer ID</th>
					<th>Dealer Name</th>
					<th>Total</th>
					<th>Date</th>
					<th colspan="3" onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;"><a href="addpurchasebill.jsp">Add Purchase Bill</a></th>
				</tr>
			<tbody>
				<%
					while(rs.next())
					{
						Statement st1 = con.createStatement();
                        String Query1 ="select name from dealer where id="+rs.getString(2);
                        ResultSet rs1= st1.executeQuery(Query1);
                        rs1.next();
                        String dname=rs1.getString(1);
               
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2) %></td>
					<td><%=dname %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;"><a href="viewpurchasebill.jsp?billno=<%=rs.getString(1)%>">View</a></td>
					<td onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;"><a href="deletepurchasebilldata.jsp?billno=<%=rs.getString(1)%>">Delete</a></td>
					<td onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;"><a href="editpurchasebill.jsp?billno=<%=rs.getString(1)%>">Edit</a></td>
				</tr>
				<%} %>
			</tbody>
		</table>	
		</div>
	</body>
</html>