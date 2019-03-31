<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Drive</title>
<meta name="viewport" content="width=device-width, intial-scale=1.0" />
		<link rel="stylesheet" type="text/css" href="master.css" />
</head>
<body class="bg">
	 <header class="title-flex">
		  <img class="logo" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs4xRCDWSoxupVgrGbRyjlOAZXGWQGlQRbn_ePVZCBGHv47wkjWg" alt="Online Shopping Logo" />
		  <h1 class="heading">Online Shopping</h1>
		</header>
		<br><br><br><br><br><br><br><br>
		<main class="site-content">

	<nav> <a href="Login.jsp" class="btn">Login</a> <br>
	<a href="Register.jsp" class="btn">Register</a> <br>
	<form action="ControllerServlet" method="post">
		<input type="hidden" name="action" value="guest">
		<input type="submit" value="guest user" class="btn">
	</form>
	</nav>
	<br>
	<br>
	<br>

	<footer class="site-footer">Copyrights Protected. All rights reserved</footer>
</body>
</html>