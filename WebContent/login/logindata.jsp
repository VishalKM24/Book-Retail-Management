
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Connection status</h1>
 
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="javax.sql.*" %> 
<%@ page import="java.sql.Connection.*" %> 
<% 
    
    
    String user = request.getParameter("username");
	String pass = request.getParameter("password");		
	
	
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/rsms", "root","dbms");
	Statement st = connection.createStatement();
	String Query1 ="select * from login where login_username='"+user+"' and login_password='"+pass+"' and login_role='admin'";
	ResultSet rs= st.executeQuery(Query1);
	
	if(rs.next())
	{
		String username = rs.getString(2);
		String password = rs.getString(3);
		if(user.equals(username) && pass.equals(password))
		{
			out.println("<script type=\"text/javascript\">");
		   	out.println("alert('Signed In Successfully!!!');");
		   	out.println("location='home.jsp';");
		   	out.println("</script>");
		}
		else
		{
			out.println("<script type=\"text/javascript\">");
		   	out.println("alert('Username or password incorrect, Please Try Again!!!');");
		   	out.println("location='adminlogin.jsp';");
		   	out.println("</script>");
		}
		
	}
	else
	{
		out.println("<script type=\"text/javascript\">");
	   	out.println("alert('Sorry, some error has occurred, Plz Try Again!!!');");
	   	out.println("location='adminlogin.jsp';");
	   	out.println("</script>");
	}
	rs.close();
	st.close();
	connection.close();
%>

%>
</body>
</html>