<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<%
		HttpSession log=request.getSession(false);  
		String n = (String)log.getAttribute("user");
		String userType = (String)log.getAttribute("userType");
		if(n == null){
			response.sendRedirect("../login.jsp");
		}%>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="../../style.css">
		<style>
		body {
		  background-color: #73858f;
		  background-repeat: no-repeat;
		  background-attachment: fixed; 
		  background-size: 115% 100%;
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
			min-width:100px;
			text-align:center;
			border: 1px solid black;
  			padding: 5px;
		}
		
		</style>
		<title> Products </title>
		<script type="text/javascript">
		function dark(x) {
			  x.style.background = "#9e9e9e";
			}

		function light(x) {
			  x.style.background = "#d3d3d3";
			}
			function changeTable() {
			var type="<%=userType%>";
			if(type== "user")
				{
					var n = document.getElementById("myTable").rows.length;
					var w=document.getElementsByClassName('admin1');
					w[0].style.display = 'none';
					var x=document.getElementsByClassName('admin2');
					var y=document.getElementsByClassName('admin3');
					for(i=0;i<=n;i++)
					{
						x[i].style.display = 'none';
						y[i].style.display = 'none';
					}
				}
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
		String Query ="select * from product";
			ResultSet rs= st.executeQuery(Query);
			 
		%>
		<div>
            <jsp:include page="../nav.jsp"></jsp:include>
    	</div>
		<br/><div align="center">
		<button class="button1" style="width:150px;  border-radius: 8px; font-size:20px;" align="center" disabled>Products</button>
		</div><br/>
		<table id="myTable">
				<tr>
					<th>S No.</th>
					<th>Code</th>
					<th>Name</th>
					<th>Category</th>
					<th>Quantity</th>
					<th>MRP</th>
					<th>Discount</th>
					<th>Sale Price</th>
					<th class="admin1" colspan="2" onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;"><a href="addproduct.jsp">Add New Product</a></th>
				</tr>
			<tbody>
				<%
					int i=1;
					while(rs.next())
					{
				%>
				<tr>
					<td><%=i%></td>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td>Rs. <%=rs.getString(5) %></td>
					<td><%=rs.getString(7) %>%</td>
					<td>Rs. <%=rs.getString(6) %></td>
					<td class="admin2" onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;"><a href="delproduct.jsp?code=<%=rs.getString(1)%>">Delete</a></td>
					<td class="admin3" onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;"><a href="editproduct.jsp?code=<%=rs.getString(1)%>">Edit</a></td>
				</tr>
				<% i++;}%>
			</tbody>
		</table>	
		</div>
		<script>
				changeTable();
		</script>
		
		<%
		rs.close();
		st.close();
		con.close();
		%>
	</body>
</html>