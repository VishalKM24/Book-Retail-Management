<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../loginpage.css">
<!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
	<!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
     

<title>Insert title here</title>
</head>
<body>
<a href = "mailto: vkmandal2608@gmail.com" class="btn pink waves-effect waves-light">
	<span>Email</span>
	<i class="material-icons rigth">email</i>
</a>

<div class="block" style="min-height: 100%;">
      <form action="logindata.jsp" method="post">
        <div>
           <label for="login">
           	<a href="#" class ="btn"><span>Username</span>
           	<i class="material-icons left">person</i></a>
            </label>
                <input type="text" name="username"  required="required"/>
        </div>
        <br/>
        <div class="clear">
          <label for="password"></label>
          	<a href="#" class ="btn"><span>Password</span>
           	<i class="material-icons left">enhanced_encryption</i></a>
                <input type="password" name="password"   required="required"/>
        </div>
        <br/>
        <div class="clear" style="text-align: center;">
          <button class="btn waves-effect waves-light blue indigo" type="submit">Login</button>
        </div>
      </form>
    </div>
    
<div>
         	<jsp:include page="footer.jsp"></jsp:include>
    	</div>


<script>

</script>
</body>
</html>