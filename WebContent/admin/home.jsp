<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title> Home</title>
		<link rel="stylesheet" href="../style.css">
		<style type="text/css">
		body{
background-color: #73858f;
}
			p{
			width: 75%;
			margin: auto;
			text-align: center;
			font-size: 25px;
			}
		</style>
		<%
		HttpSession log=request.getSession(false);  
		String n = (String)log.getAttribute("user");
		String userType = (String)log.getAttribute("userType");
		if(n == null){
			response.sendRedirect("login.jsp");
		}
	%>
	<script type="text/javascript">
	function changePara() {
		var type="<%=userType%>";
		if(type== "user")
			{
				document.getElementById("admin").style.display="none";
			}
		else
			{
				document.getElementById("user").style.display="none";
			}
	}
	function changeHeader() {
		var type="<%=userType%>";
		if(type== "user")
			{
				document.getElementById('admin1').style.display = 'none';
				document.getElementById('admin2').style.display = 'none';
			}
	}
	</script>
	</head>
	<body onload="changeHeader(),changePara();">
		<div class="navbar">
				<a href="#">Home</a>
				<a href="product/products.jsp">Product</a><!-- Add product,for each product delete product -->
				<div id="admin1" class="dropdown">
				    <button class="dropbtn">Purchase
				      <i class="dropopt"></i>
				    </button>
				    <div class="dropdown-content">
				      <a href="purchase/purchasebill.jsp">Purchase Bills</a><!-- Add purchase bill -->
				      <a href="supplier/suppliers.jsp">Suppliers</a><!-- Add Supplier -->
				    </div>
				</div>
				<div class="dropdown">
				    <button class="dropbtn">Sale
				      <i class="dropopt"></i>
				    </button>
				    <div class="dropdown-content">
				      <a href="sale/salebills.jsp">Sale Bills</a><!-- Add sale bill -->
				      <a href="customer/customers.jsp">Customers</a><!-- Add Customer -->
				    </div>
				</div>
				<a id="admin2" href="setup/setup.jsp">Setup</a>
				<a href="logout.jsp">Logout</a>
		</div>
    	<br/><br/><br/><br/><br/><br/><br/><br/>
    	<br/><br/><br/><br/>
    	<p id="admin">
    	You are logged in as Administrator.<br/>
    	You can add new products, suppliers and customers as well as make changes in them.<br/>
    	You can setup new users and admin of this Retail Store Management System.<br/>
    	You can add purchase bill, purchase return, sale bill, sale return as well as make changes in them.
    	</p>
    	<p id="user">
    	You are logged in as User.<br/>
    	You can view product stock.<br/>
    	You can add customers, sale bills and sale returns.<br/>
    	</p>
    	
	</body>
</html>