<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Edit Product </title>
<link rel="stylesheet" href="../../style.css">
<style>
select{
		border:ridge 5px;
		width:170px;
		height: 30px;
		border-radius:7px;
		font-size: 10px;

		}
body{
background-color: #3973ac;
}
</style>
<script>
		function changeSPbyMRP()
		{
			var mrp=document.getElementsByName("pmrp")[0].value;
			document.getElementsByName("psprice")[0].value=mrp;
		}
		function changeDiscount()
		{
			var mrp=document.getElementsByName("pmrp")[0].value;
			var sp=document.getElementsByName("psprice")[0].value;
			document.getElementsByName("pdiscount")[0].value=(((mrp-sp)*100)/mrp).toFixed(2);
		}
		function changeSPbyDiscount()
		{
			var mrp=document.getElementsByName("pmrp")[0].value;
			var disc=document.getElementsByName("pdiscount")[0].value;
			document.getElementsByName("psprice")[0].value=mrp-((disc/100)*mrp);
		}
		</script>
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
			String code = request.getParameter("code");
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rsms","root","dbms");
			Statement st = con.createStatement();
			String Query1 ="select * from product where code='"+code+"'";
			ResultSet rs=st.executeQuery(Query1);
			rs.next();
			String a=rs.getString(3);
			%>
	
			<div class="block" style="min-height: 100%; ">
			<h2 align="center">Edit Product</h2>
			
			<form action="editproductdata.jsp" method="post">
				<div>
					<label class="label">
						Code : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</label>
					<input class="input" type="text" name="pcode" required="required" value="<%=rs.getString(1) %>"/>
				</div>
				<br/>
				<div class="clear">
					<label class="label">
						Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</label>
					<input class="input" type="text" name="pname" required="required" value="<%=rs.getString(2) %>"/>
				</div>
				<br/>
				<div class="clear">
					<label class="label">
						Category :
					</label>
					<select name="pcategory">
										<option <%if(a.equals("Comics")) out.print("selected");%> value="Comics">Comics</option>
										<option <%if(a.equals("Action Figures")) out.print("selected");%> value="Action Figures">Action Figures</option>
										<option <%if(a.equals("Merchandise")) out.print("selected");%> value="Merchandise">Merchandise</option>
										</select>
				</div>
				<br/>
				
				<div class="clear">
					<label class="label">
						MRP : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</label>
					<input class="input" type="text" name="pmrp" required="required" value="<%=rs.getString(5) %>" oninput="changeSPbyMRP();" />
				</div><br/>
				<div class="clear">
					<label class="label">
						Sale Price : 
					</label>
					<input class="input" type="text" name="psprice" required="required" value="<%=rs.getString(6) %>" oninput="changeDiscount();"/>
				</div><br/>
				<div class="clear">
					<label class="label">
						Discount : &nbsp;
					</label>
					<input class="input" type="text" name="pdiscount" required="required" value="<%=rs.getString(7) %>" oninput="changeSPbyDiscount();"/>
				</div><br/>
				<div class="clear" style="text-align: center;">
					<button class="button" type="submit">Save</button>
				</div>
			</form>
		</div>
		
</body>
</html>