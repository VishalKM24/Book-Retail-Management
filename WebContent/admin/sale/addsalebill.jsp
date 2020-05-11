<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Add sale Bill </title>
<link rel="stylesheet" href="../../style.css">
	<%
		HttpSession log=request.getSession(false);  
		String n = (String)log.getAttribute("user");
		if(n == null){
			response.sendRedirect("../login.jsp");
		}
	%>
	<%@page import="java.io.*" %>
	<%@page import="java.sql.*" %>
	<%@page import="javax.sql.*" %>
	<%@page import="java.sql.Connection" %>
	<%
            Class.forName("com.mysql.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rsms","root","dbms");
    		Statement st = con.createStatement();
            %>
    <script type="text/javascript">
    	var j=0;
        function addField (argument) {
        	var myTable = document.getElementById("myTable");
            var currentIndex = myTable.rows.length;
            var currentRow = myTable.insertRow(-1);
            j=j+1;
            currentRow.setAttribute("id",j);
            var codeBox = document.createElement("select");
            codeBox.setAttribute("name","code");
            codeBox.setAttribute("id", "code "+j);
            codeBox.setAttribute("style", "min-width:120px;border:0px;");
            codeBox.setAttribute("onchange", "setname(this)");
            codeBox.setAttribute("required","required");
            var opt = document.createElement('option');
        	opt.appendChild( document.createTextNode("Select Code"));
    	    opt.value =""; 
	        codeBox.appendChild(opt);
            <%
            String Query ="select code from product order by code";
    		ResultSet rs= st.executeQuery(Query);
            while(rs.next())
    		{
            %>
            var opt = document.createElement('option');
        	opt.appendChild( document.createTextNode(<%=rs.getString(1)%>) );
    	    opt.value = <%=rs.getString(1)%>; 
	        codeBox.appendChild(opt);
	        <%
    		}%>
    		
    		var nameBox = document.createElement("select");
            nameBox.setAttribute("id", "name "+j);
            nameBox.setAttribute("style", "min-width:190px;border:0px;");
            nameBox.setAttribute("onchange", "setcode(this)");
            nameBox.setAttribute("required","required");
            var opt = document.createElement('option');
        	opt.appendChild( document.createTextNode("Select Name"));
    	    opt.value =""; 
	        nameBox.appendChild(opt);
            <%
            String Query4 ="select name from product order by name";
    		ResultSet rs4= st.executeQuery(Query4);
            while(rs4.next())
    		{
            %>
            var opt = document.createElement('option');
        	opt.appendChild( document.createTextNode("<%=rs4.getString(1)%>") );
    	    opt.value = "<%=rs4.getString(1)%>"; 
	        nameBox.appendChild(opt);
	        <%
    		}%>
    		
    		
    		
	        var quantityBox = document.createElement("input");
	        quantityBox.setAttribute("name","quantity");
	        quantityBox.setAttribute("id", "quantity "+j);
            quantityBox.setAttribute("type","number");
            quantityBox.setAttribute("class", "input");
            quantityBox.setAttribute("required","required");
            quantityBox.setAttribute("oninput", "setamount(this)");
            quantityBox.setAttribute("onchange", "setamount(this)");
            quantityBox.setAttribute("oninput", "settotalq(this)");

            var mrpBox = document.createElement("input");
	        mrpBox.setAttribute("name","mrp");
	        mrpBox.setAttribute("id", "mrp "+j);
            mrpBox.setAttribute("type","number");
            mrpBox.setAttribute("class", "input");
            mrpBox.setAttribute("required","required");
            mrpBox.setAttribute("readonly", "readonly");
            mrpBox.setAttribute("oninput", "changeSPbyMRP(this);");
            mrpBox.setAttribute("onchange", "changeSPbyMRP(this);");
            
            var discountBox = document.createElement("input");
	        discountBox.setAttribute("name","discount");
	        discountBox.setAttribute("id", "discount "+j);
            discountBox.setAttribute("class", "input");
            discountBox.setAttribute("required","required");
            discountBox.setAttribute("oninput", "changeSPbyDiscount(this);");
            discountBox.setAttribute("onchange", "changeSPbyDiscount(this);");
            
            var priceBox = document.createElement("input");
            priceBox.setAttribute("name","price");
            priceBox.setAttribute("id", "price "+j);
            priceBox.setAttribute("class", "input");
            priceBox.setAttribute("required","required");
            priceBox.setAttribute("oninput", "setamount(this),changeDiscount(this);");
            priceBox.setAttribute("onchange","setamount(this),changeDiscount(this);");
            
            var amountBox = document.createElement("input");
            amountBox.setAttribute("name", "amount");
            amountBox.setAttribute("id", "amount "+j);
            amountBox.setAttribute("class", "input");
            amountBox.setAttribute("required","required");
            amountBox.setAttribute("readonly","readonly");
            
            var currentCell = currentRow.insertCell(-1);
            currentCell.appendChild(codeBox);
            
            currentCell = currentRow.insertCell(-1);
            currentCell.appendChild(nameBox);
            
            currentCell = currentRow.insertCell(-1);
            currentCell.appendChild(quantityBox);

            currentCell = currentRow.insertCell(-1);
            currentCell.appendChild(mrpBox);
            
            currentCell = currentRow.insertCell(-1);
            currentCell.appendChild(discountBox);
            
            currentCell = currentRow.insertCell(-1);
            currentCell.appendChild(priceBox);
            
            currentCell = currentRow.insertCell(-1);
            currentCell.appendChild(amountBox);

            currentCell = currentRow.insertCell(-1);
            currentCell.setAttribute("id", "cell "+j);
            currentCell.setAttribute("onclick", "deleteField(this)");
            currentCell.setAttribute("onmouseover", "dark(this);");
            currentCell.setAttribute("onmouseout", "light(this);");
            currentCell.setAttribute("style", "background:#d3d3d3;");
            currentCell.innerHTML="Delete Row";
            
            currentCell = currentRow.insertCell(-1);
            currentCell.setAttribute("id", "cell "+j);
            currentCell.setAttribute("onclick", "addField()");
            currentCell.setAttribute("onmouseover", "dark(this);");
            currentCell.setAttribute("onmouseout", "light(this);");
            currentCell.setAttribute("style", "background:#d3d3d3;");
            currentCell.innerHTML="Add Row";
        }
		function dark(x) {
			  x.style.background = "#9e9e9e";
			}

		function light(x) {
			  x.style.background = "#d3d3d3";
			}
		function setname(x) {
			var a=x.id;
			var co=x.value;
			var n=a.split(" ");
			var na="name "+n[1];
			var element=document.getElementById(na);
			if(co.localeCompare("")==0)
			{
				element.value="";
			}
			else
			{
				<%
					String Query1 ="select * from product";
		    		ResultSet rs1= st.executeQuery(Query1);
		    		while(rs1.next())
		    		{
		    			int a=rs1.getInt("code");
		    			String b=rs1.getString("name");
		    			String c=rs1.getString("mrp");
		    			String d=rs1.getString("discount");
		    			String e=rs1.getString("sale_price"); 			
				%>
						var s="<%=a%>";
						if(co.localeCompare(s)==0)
						{
							var val="<%=b%>";
							for (var i = 0;i < element.length; i++) 
							    if (element[i].value == val) element[i].selected = true;
							
							document.getElementById("quantity "+n[1]).value=1;
							document.getElementById("mrp "+n[1]).value=<%=c%>;
							document.getElementById("discount "+n[1]).value=<%=d%>;
							document.getElementById("price "+n[1]).value=<%=e%>;
							
							settotalq(document.getElementById("quantity "+n[1]));
							setamount(document.getElementById("price "+n[1]));
						}
				<%
					}
				%>
			
			}
		}
		function setcode(x) {
			var a=x.id;
			var co=x.value;
			var n=a.split(" ");
			var na="code "+n[1];
			var element=document.getElementById(na);
			if(co.localeCompare("")==0)
			{
				element.value="";
			}
			else
			{
				<%
					String Query5 ="select * from product";
		    		ResultSet rs5= st.executeQuery(Query5);
		    		while(rs5.next())
		    		{
		    			int a=rs5.getInt("code");
		    			String b=rs5.getString("name");
		    			String c=rs5.getString("mrp");
		    			String d=rs5.getString("discount");
		    			String e=rs5.getString("sale_price");
				%>
						var s="<%=b%>";
						if(co.localeCompare(s)==0)
						{
							var val="<%=a%>";
							for (var i = 0;i < element.length; i++) 
							    if (element[i].value == val) element[i].selected = true;
						
							document.getElementById("quantity "+n[1]).value=1;
							document.getElementById("mrp "+n[1]).value=<%=c%>;
							document.getElementById("discount "+n[1]).value=<%=d%>;
							document.getElementById("price "+n[1]).value=<%=e%>;
							
							settotalq(document.getElementById("quantity "+n[1]));
							setamount(document.getElementById("price "+n[1]));
						}
				<%
					}
		    		
		    		
				%>
			}
		}
		function setamount(x) {
			var ab=x.id;
			var n=ab.split(" ");
			var na="amount "+n[1];
			var nq="quantity "+n[1];
			var np="price "+n[1];
			var q=document.getElementById(nq).value;
			var p=document.getElementById(np).value;
			if(q!= null && p!=null && q!=0 && p!=0)
				{
				document.getElementById(na).value=(p*q);
				settotal();
				}
		}
		function settotalq(x) {
			var sum=0;
			for(var i=1;i<=j;i++)
				{
				var b=document.getElementById("quantity "+i);
					if(typeof(b) != 'undefined' && b != null)
					{
						var c=document.getElementById("quantity "+i).value;
						var a=parseInt(c);
						if(!isNaN(a))
							sum=sum+a;
					}
				}
			document.getElementById("totalq").value=sum;
		}
		function settotal(x) {
			var sum=0.0;
			for(var i=1;i<=j;i++)
				{
					var b=document.getElementById("amount "+i);
					if(typeof(b) != 'undefined' && b != null)
					{
						var c=document.getElementById("amount "+i).value;
						var v=parseFloat(c);
						if(!isNaN(v))
							sum=sum+v;
					}
				}
			document.getElementById("totalp").value=sum;
			setnetbytotal();
		}
		function deleteField(x){
			if(document.getElementById("myTable").rows.length >2)
				{
					var ab=x.id;
					var n=ab.split(" ");
					document.getElementById(n[1]).remove();
					settotalq();
					settotal();
				}
		}
		function setCustomername()
		{
			var co=document.getElementById("Customerid").value;
			var element=document.getElementById("Customername");
			if(co.localeCompare("")==0)
			{
				element.value="";
			}
			else
			{
				<%
					String Query6 ="select * from Customer";
		    		ResultSet rs6= st.executeQuery(Query6);
		    		while(rs6.next())
		    		{
		    			int a=rs6.getInt("id");
		    			String b=rs6.getString("name");
				%>
						var s="<%=a%>";
						if(co.localeCompare(s)==0)
						{
							var val="<%=b%>";
							for (var i = 0;i < element.length; i++) 
							    if (element[i].value == val) element[i].selected = true;
						}
				<%
					}
				%>
			}
			setCustomercon();
		}
		function setCustomernamemob()
		{
			var co=document.getElementById("Customercon").value;
			var element=document.getElementById("Customername");
			if(co.localeCompare("")==0)
			{
				element.value="";
			}
			else
			{
				<%
					String Query12 ="select * from Customer";
		    		ResultSet rs12= st.executeQuery(Query6);
		    		while(rs12.next())
		    		{
		    			String a=rs12.getString("contact");
		    			String b=rs12.getString("name");
				%>
						var s="<%=a%>";
						if(co.localeCompare(s)==0)
						{
							var val="<%=b%>";
							for (var i = 0;i < element.length; i++) 
							    if (element[i].value == val) element[i].selected = true;
						}
				<%
					}
				%>
			}
			setCustomerid();
		}
		function setCustomercon()
		{
			var co=document.getElementById("Customername").value;
			var element=document.getElementById("Customercon");
			if(co.localeCompare("")==0)
			{
				element.value="";
			}
			else
			{
				<%
					String Query13 ="select * from Customer";
		    		ResultSet rs13= st.executeQuery(Query13);
		    		while(rs13.next())
		    		{
		    			String a=rs13.getString("contact");
		    			String b=rs13.getString("name");
				%>
						var s="<%=b%>";
						if(co.localeCompare(s)==0)
						{
							var val="<%=a%>";
							for (var i = 0;i < element.length; i++) 
							    if (element[i].value == val) element[i].selected = true;
						}
				<%
					}
				%>
			}
		}
		function setCustomerid()
		{
			var co=document.getElementById("Customername").value;
			var element=document.getElementById("Customerid");
			if(co.localeCompare("")==0)
			{
				element.value="";
			}
			else
			{
				<%
					String Query7 ="select * from Customer";
		    		ResultSet rs7= st.executeQuery(Query7);
		    		while(rs7.next())
		    		{
		    			int a=rs7.getInt("id");
		    			String b=rs7.getString("name");
				%>
						var s="<%=b%>";
						if(co.localeCompare(s)==0)
						{
							var val="<%=a%>";
							for (var i = 0;i < element.length; i++) 
							    if (element[i].value == val) element[i].selected = true;
						}
				<%
					}
				%>
			}
		}
		function changeSPbyMRP(x)
		{
			var ab=x.id;
			var n=ab.split(" ");
			document.getElementById("price "+n[1]).value=x.value;
		}
		function changeDiscount(x)
		{
			var ab=x.id;
			var n=ab.split(" ");
			var mrp=document.getElementById("mrp "+n[1]).value;
			var sp=document.getElementById("price "+n[1]).value;
			document.getElementById("discount "+n[1]).value=(((mrp-sp)*100)/mrp).toFixed(2);
		}
		function changeSPbyDiscount(x)
		{
			var ab=x.id;
			var n=ab.split(" ");
			var mrp=document.getElementById("mrp "+n[1]).value;
			var disc=document.getElementById("discount "+n[1]).value;
			document.getElementById("price "+n[1]).value=mrp-((disc/100)*mrp);
			setamount(x);
		}
		function setnetbytotal()
		{
			var a=document.getElementById("totalp").value;
			var dis=document.getElementById("discount").value;
			if(dis == 0 || dis=="null")
				{
					dis=0;
					document.getElementById("discount").value="0.0";
				}
				
			document.getElementById("net").value=(a-((dis/100)*a)).toFixed(0);
		}
		function setdiscountbynet()
		{
			var a=document.getElementById("totalp").value;
			var net=document.getElementById("net").value;				
			document.getElementById("discount").value=(((a-net)/a)*100).toFixed(2);
		}
    </script>
    <style type="text/css">
   body{
background-color: #3973ac;
}
    form {
    margin:30px 30px; padding:40px 20px 40px 20px;
    text-align:center;
    align:center;
    background: #E8DAD6;
}
    	select{
		width:135px;
		height: 35px;
		font-size: 18px;
		padding-left:5px; 
		background: #f9f9f9;
		font-family: 'raleway';
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
			padding:0px;
			text-align:center;
			border: 1px solid black;
			min-width:120px;
			min-height: 35px;
		}
		.input{
			border:0px;
			border-radius:0px;
			padding-left:10px;
			width:120px;
			height: 35px;
			font-size: 20px;
			background: #f9f9f9;
			font-family: 'raleway';
		}
		.button{
			border-radius:0px;
			border:none;
			background:#d3d3d3;
			color:black;
			font-size:18px;
			font-variant:small-caps;
			font-weight:bold;
			font-family: 'raleway',sans-serif;
			text-align: center;
			height:35px;
			width:100%;	
		}
		[type="date"]
		{
  			font-family: 'raleway';
  			font-size: 16.7px;
		}
		</style>
</head>
<body onload="changeHeader(),addField();">
	<div>
         <jsp:include page="../nav.jsp"></jsp:include>
    </div>
	<div>
			
			<br/><div align="center">
		<button class="button1" style="width:150px;  border-radius: 8px; font-size:20px;" align="center" disabled>Add Sale Bill</button>
		</div><br/>
			<form action="asalebilldata.jsp" method="post">
				<div style="width:1000px;margin: auto;text-align: center;">
					<label style="font-size: 20px;">Bill No.</label>&ensp;
					<%
					String Query14 ="select max(bill_no) from Sale";
		    		ResultSet rs14= st.executeQuery(Query14);
		            rs14.next();
		            int a=rs14.getInt(1);
		            a=a+1;
					%>
					<input id="billno" name="billno" type="text" style="font-family: 'raleway';font-size:18px;width: 180px;height: 20px;padding-left: 10px;" required="required" value="<%=a%>">
					&emsp;&emsp;&emsp;
					<label style="font-size: 20px;">Bill Date</label>&ensp;
					<input id="datepicker" name="billdate" type="date" style="font-family: 'raleway';font-size:16.7px;width: auto;height: 30px;padding-left: 10px;"  required="required">
					<br/><br/>
					<label style="font-size: 20px;">Customer Id</label>&ensp;
					<select onchange="setCustomername()" id="Customerid" name="Customerid" style="font-family: 'raleway';font-size:18px;width: auto;height: 30px;padding-left: 10px;background: white;" required="required">
						<option value="">Select Customer</option>
						<% 
						String Query2 ="select id from Customer";
			    		ResultSet rs2= st.executeQuery(Query2);
			            while(rs2.next())
			    		{
						%>
						<option value="<%=rs2.getString(1)%>"><%=rs2.getString(1)%></option>
						<%
			    		}
						%>
					</select>
					<br/><br/>				
					<label style="font-size: 20px;">Customer Mobile</label>&ensp;
					<select onchange="setCustomernamemob()" id="Customercon" name="Customercon" style="font-family: 'raleway';font-size:18px;width: auto;height: 30px;padding-left: 10px;background: white;" required="required">
						<option value="">Select Customer</option>
						<% 
						String Query11 ="select contact from Customer";
			    		ResultSet rs11= st.executeQuery(Query11);
			            while(rs11.next())
			    		{
						%>
						<option value="<%=rs11.getString(1)%>"><%=rs11.getString(1)%></option>
						<%
			    		}
						%>
					</select>
					&emsp;&emsp;&emsp;&emsp;&ensp;
					<label style="font-size: 20px;">Customer Name</label>&ensp;
					<select onchange="setCustomerid(),setCustomercon()" id="Customername" style="font-family: 'raleway';font-size:18px;width: auto;height: 30px;background: white;padding-left: 10px;" required="required">
						<option value="">Select Customer</option>
						<% 
						String Query8 ="select name from Customer";
			    		ResultSet rs8= st.executeQuery(Query8);
			            while(rs8.next())
			    		{
						%>
						<option value="<%=rs8.getString(1)%>"><%=rs8.getString(1)%></option>
						<%
			    		}
						%>
					</select>
				</div>
				<br/>
				<div>
				<table id="myTable" style="align-content: center;">
					<tr style="height: 35px;">
						<th style="min-width:120px; max-width:120px; ">Code</th>
						<th style="min-width:190px; ">Name</th>
						<th>Quantity</th>
						<th>MRP</th>
						<th>Discount</th>
						<th>Price</th>
						<th>Amount</th>
						<th onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;min-width:160px;" colspan="2"><a href="../Customer/addcustomer.jsp">Add New Customer</a></th>
					</tr>
				</table><br/>
				<table  style="align-content: center;">
					<tr>
						
						<th style="min-width:178px; ">Total Quantity</th>
						<td><input class="input" id="totalq" type="number" readonly="readonly"></td>
						<th style="min-width: 130px;">Total</th>
						<td><input class="input" id="totalp" readonly="readonly"></td>
					</tr>
					<tr>
						
						<th style="min-width:178px; "></th>
						<td></td>
						<th style="min-width: 130px;">Discount</th>
						<td><input class="input" id="discount" onchange="setnetbytotal();"></td>
						
					</tr>
					<tr>
						
						<th style="min-width:178px; "></th>
						<td></td>
						<th style="min-width: 130px;">Net</th>
						<td><input class="input" id="net" name="net" onchange="setdiscountbynet();"></td>
						
					</tr>
				</table><br/>
				
				
				<table>
				<tr>
					<th ><button onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;min-width:160px;height: 38px;" class="button" type="submit">Save Bill</button></th>
				</tr>
				</table>
				</div>
			</form>
		</div>
		
</body>
<%
rs.close();rs1.close();rs2.close();rs4.close();rs5.close();rs6.close();rs7.close();rs8.close();rs11.close();rs12.close();rs13.close();
st.close();
con.close();
%>
</html>