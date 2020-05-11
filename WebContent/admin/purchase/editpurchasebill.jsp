<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Edit Purchase Bill </title>
<link rel="stylesheet" href="../../style.css">
	
	<%@page import="java.io.*" %>
	<%@page import="java.sql.*" %>
	<%@page import="javax.sql.*" %>
	<%@page import="java.sql.Connection" %>
	<%
            Class.forName("com.mysql.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rsms","root","dbms");
    		Statement st = con.createStatement();
    		String billno=request.getParameter("billno");
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
            codeBox.setAttribute("style", "border:0px;");
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

            var priceBox = document.createElement("input");
            priceBox.setAttribute("name","price");
            priceBox.setAttribute("id", "price "+j);
            priceBox.setAttribute("type","number");
            priceBox.setAttribute("class", "input");
            priceBox.setAttribute("required","required");
            priceBox.setAttribute("oninput", "setamount(this)");
            
           
            
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
            currentCell.setAttribute("onclick", "addField();");
            currentCell.setAttribute("onmouseover", "dark(this);");
            currentCell.setAttribute("onmouseout", "light(this);");
            currentCell.setAttribute("style", "background:#d3d3d3;");
            currentCell.innerHTML="Add Row";
            
        }
        function originalvalues(){
        	<%
        	Statement st2 = con.createStatement();
    		String Query9 ="select * from purchase where Bill_no="+billno;
    		ResultSet rs9= st2.executeQuery(Query9);
    	  	rs9.next();
    		%>
    		document.getElementById("billno").value="<%=rs9.getString(1)%>";
    		document.getElementById("datepicker").value="<%=rs9.getString(4)%>";
    		var val="<%=rs9.getString(2)%>";
			var element=document.getElementById("dealerid");
        	for (var i = 0;i < element.length; i++) 
			    if (element[i].value == val) element[i].selected = true;
    			setdealername();
    	
    		<%
           	Statement st1 = con.createStatement();
    		String Query3 ="select * from purchase_details where bill_no="+billno;
    		ResultSet rs3= st1.executeQuery(Query3);
            while(rs3.next())
    		{
            %>
            	addField();
            	var code="code "+j;
            	var val="<%=rs3.getString(2)%>";
				var element=document.getElementById(code);
            	for (var i = 0;i < element.length; i++) 
				    if (element[i].value == val) element[i].selected = true;
            	setname(element);
            	var quantity="quantity "+j;
            	document.getElementById(quantity).value="<%=rs3.getString(3)%>";
            	var price="price "+j;
            	document.getElementById(price).value="<%=rs3.getString(4)%>";
            	var amount="amount "+j;
            	document.getElementById(amount).value="<%=rs3.getString(5)%>";
	        <%
    		}%>
    		settotalq();
    		settotal();
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
			var sum=0;
			for(var i=1;i<=j;i++)
				{
					var b=document.getElementById("amount "+i);
					if(typeof(b) != 'undefined' && b != null)
					{
						var c=document.getElementById("amount "+i).value;
						var a=parseInt(c);
						if(!isNaN(a))
							sum=sum+a;
					}
				}
			document.getElementById("totalp").value=sum;
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
		function setdealername()
		{
			var co=document.getElementById("dealerid").value;
			var element=document.getElementById("dealername");
			if(co.localeCompare("")==0)
			{
				element.value="";
			}
			else
			{
				<%
					String Query6 ="select * from dealer";
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
		}
		function setdealerid()
		{
			var co=document.getElementById("dealername").value;
			var element=document.getElementById("dealerid");
			if(co.localeCompare("")==0)
			{
				element.value="";
			}
			else
			{
				<%
					String Query7 ="select * from dealer";
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
    </script>
    <style type="text/css">
   body{
background-color: #3973ac;
}
    	select{
		width:165px;
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
			min-width:160px;
			min-height: 35px;
		}
		.input{
			border:0px;
			border-radius:0px;
			padding-left:10px;
			width:160px;
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
<body onload="changeHeader(),originalvalues();">
	<div>
         <jsp:include page="../nav.jsp"></jsp:include>
    </div>
	<div>
			<br/><div align="center">
		<button class="button1" style="width:250px;  border-radius: 8px; font-size:20px;" align="center" disabled>Edit Purchase Bill</button>
		</div><br/>
			<form action="epurchasebilldata.jsp" method="post">
				<div style="width:1000px;margin: auto;text-align: center;">
					<label style="font-size: 20px;">Bill No.</label>&ensp;
					<input id="billno" name="billno" type="text" style="font-family: 'raleway';font-size:18px;width: 180px;height: 20px;padding-left: 10px;" required="required">
					&emsp;&emsp;&emsp;
					<label style="font-size: 20px;">Bill Date</label>&ensp;
					<input id="datepicker" name="billdate" type="date" style="font-family: 'raleway';font-size:16.7px;width: 160px;height: 30px;padding-left: 10px;"  required="required">
					<br/><br/>
					
					<label style="font-size: 20px;">Dealer Id</label>&ensp;
					<select onchange="setdealername()" id="dealerid" name="dealerid" style="font-family: 'raleway';font-size:18px;width: 150px;height: 30px;padding-left: 10px;background: white;" required="required">
						<option value="">Select Dealer</option>
						<% 
						String Query2 ="select id from dealer";
			    		ResultSet rs2= st.executeQuery(Query2);
			            while(rs2.next())
			    		{
						%>
						<option value="<%=rs2.getString(1)%>"><%=rs2.getString(1)%></option>
						<%
			    		}
						%>
					</select>
					&emsp;&emsp;&emsp;&emsp;&ensp;
					<label style="font-size: 20px;">Dealer Name</label>&ensp;
					<select onchange="setdealerid()" id="dealername" style="font-family: 'raleway';font-size:18px;width: auto;height: 30px;background: white;padding-left: 10px;" required="required">
						<option value="">Select Dealer</option>
						<% 
						String Query8 ="select name from dealer";
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
						<th style="min-width:165px; ">Code</th>
						<th style="min-width:190px; ">Name</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Amount</th>
						<th onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;min-width:160px;" colspan="2"><a href="../product/addproduct.jsp">Add New Product</a></th>
					</tr>
				</table>
				<br/>
				<table  style="align-content: center;">
					<tr>
						
						<th style="min-width:190px; ">Total Quantity</th>
						<td><input class="input" id="totalq" type="number" readonly="readonly"></td>
						
						<th style="min-width: 170px;">Total</th>
						<td><input class="input" id="totalp" name="totalp" type="number" readonly="readonly"></td>
						
					</tr>
					</table>
					<br/>
					<table style="align-content: center;">
					<tr>
						<th align="center"><button onmouseover="dark(this)" onmouseout="light(this)" style="background:#d3d3d3;min-width:160px;height: 38px;" class="button" type="submit">Save Bill</button></th>
					</tr>
					</table>
					
				</div>
			</form>
		</div>
		
</body>
<%
rs.close();
st.close();
con.close();
%>
</html>