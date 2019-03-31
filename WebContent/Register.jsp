<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration page</title>
<meta name="viewport" content="width=device-width, intial-scale=1.0" />
		<link rel="stylesheet" type="text/css" href="master.css" />
<script type="text/javascript" src="validate.js"></script>
</head>
<body class="bg">
	<header class="title-flex">
		  <img class="logo" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs4xRCDWSoxupVgrGbRyjlOAZXGWQGlQRbn_ePVZCBGHv47wkjWg" alt="Online Shopping Logo" />
		  <h1 class="heading">Online Shopping</h1>
		</header>
		<br><br><br>
		<a href="HomePage.jsp" class="btn">Homepage</a>
		<br><br><br><br><br><br><br><br>
		<main class="site-content">
	<br>
	<br>
	
	<br>
	<br>
	<br>

	<form action="ControllerServlet" method="post"
		onsubmit="return validate()">
		<input type="hidden" name="action" id="act" value="register">
		<table align="center">

			<label>Username :</label>
			<input type="text" name="usrname" id="usrname" placeholder="Email" class="txt" required>

			<br>

			<label>Password:</label>
			<input type="password" name="pwd" id="pwd" placeholder="password" class="txt" required>
			<br>

			<label>Confirm password:</label>
			<input type="password" name="pwd1" id="pwd1" placeholder="password" class="txt" required>
			<br>
			
			<button type="submit" value="register" class="btn">Register</button>
		</table>
	</form>


	<br>
	<br>
	<br>

	<footer class="site-footer">Copyrights Protected. All rights reserved</footer>
</body>
</html>