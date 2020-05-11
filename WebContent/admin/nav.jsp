<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body onload="changeHeader();">
<%
		HttpSession log=request.getSession(false);  
		String n = (String)log.getAttribute("user");
		String userType = (String)log.getAttribute("userType");
		if(n == null){
			response.sendRedirect("login.jsp");
		}%>
		<script type="text/javascript">
		function changeHeader() {
			var type="<%=userType%>";
			if(type== "user")
				{
					document.getElementById('admin1').style.display = 'none';
					document.getElementById('admin2').style.display = 'none';
				}
		}
	</script>
	<div class="navbar">
				<a href="../home.jsp">Home</a>
				<a href="../product/products.jsp">Product</a><!-- Add product,for each product delete product -->
				<div class="dropdown">
				    <button id="admin1" class="dropbtn">Purchase
				      <i class="dropopt"></i>
				    </button>
				    <div class="dropdown-content">
				      <a href="../purchase/purchasebill.jsp">Purchase Bills</a><!-- Add purchase bill -->
				      <a href="../supplier/suppliers.jsp">Suppliers</a><!-- Add Supplier -->
				    </div>
				</div>
				<div class="dropdown">
				    <button class="dropbtn">Sale
				      <i class="dropopt"></i>
				    </button>
				    <div class="dropdown-content">
				      <a href="../sale/salebills.jsp">Sale Bills</a><!-- Add sale bill -->
				      
				      <a href="../customer/customers.jsp">Customers</a><!-- Add Customer -->
				    </div>
				</div>
				<a id="admin2" href="../setup/setup.jsp">Setup</a>
				<a href="../logout.jsp">Logout</a>
				
		</div>
</body>
</html>