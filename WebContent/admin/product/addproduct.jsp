<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Add Product </title>
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
</style>
	<%@page import="java.io.*" %>
	<%@page import="java.sql.*" %>
	<%@page import="javax.sql.*" %>
	<%@page import="java.sql.Connection" %>
	<%
		String name = request.getParameter("name");
		String mob = request.getParameter("mobile");
		String add = request.getParameter("add");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rsms","root","dbms");
		Statement st = con.createStatement();
		String Query ="select max(code) from product;";
		ResultSet rs= st.executeQuery(Query);
		rs.next();
		int a=rs.getInt(1);
		a=a+1;
		rs.close();
		st.close();
		con.close();
		%>
	<div>
         <jsp:include page="../nav.jsp"></jsp:include>
    </div>
	<div class="block">
			<h3 align="center">Add Product</h3>
			<form action="addproductdata.jsp" method="post">
				<div>
					<label class="label">
						Code : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</label>
					<input class="input" type="text" name="pcode" required="required" value="<%=a%>"/>
				</div><br/>
				<div class="clear">
					<label class="label">
						Name : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</label>
					<input class="input" type="text" name="pname" required="required"/>
				</div><br/>
				<div class="clear">
					<label class="label">
						Category : &nbsp;&nbsp;
					</label>
					<select name="pcategory">
										<option selected="selected" value="Comics">Comics</option>
										<option value="Action Figures">Action Figures</option>
										<option value="Merchandise">Merchandise</option>
										</select>
				</div><br/>
				<div class="clear">
					<label class="label">
						MRP : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</label>
					<input class="input" type="text" name="pmrp" required="required" oninput="changeSPbyMRP();" />
				</div><br/>
				<div class="clear">
					<label class="label">
						Sale Price : &nbsp;&nbsp;
					</label>
					<input class="input" type="text" name="psprice" required="required" oninput="changeDiscount();"/>
				</div><br/>
				<div class="clear">
					<label class="label">
						Discount : &nbsp;&nbsp;&nbsp;&nbsp;
					</label>
					<input class="input" type="text" name="pdiscount" required="required" value="0" oninput="changeSPbyDiscount();" />
				</div><br/>
				<div class="clear" style="text-align: center;">
					<button class="button" type="submit">Add</button>
					
				</div>
			</form>
		</div>
		
</body>
</html>