<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
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
		<br><br><br><br><br>
		<main class="site-content">
	<br>
	<br>
	<br>
		<br>
	<br>
	<br>
	<%
		HttpSession sess = request.getSession(false);
		String user = (String) sess.getAttribute("username");
		if (user == null) {
	%>
	<form action="ControllerServlet" method="post"
		onsubmit="return validate()">
		<input type="hidden" name="action" id="act" value="login">
		<table align="center">
			<tr>
				<label>Username:</label>
				<input type="text" name="usrname" id="usrname" placeholder="Email" class="txt" 
					required>
			</tr>
			<tr>
				<label>Password:</label>
				<input type="password" name="pwd" id="pwd" placeholder="Password" class="txt"
					required>
			</tr>
			<tr></tr>
			<button type="submit" value="login" class="btn">Login</button>
		</table>
	</form>
	<%
		} else
			response.sendRedirect("shoppingPage.jsp");
	%>


	<br>
	<br>
	<br>

		</main>
</body>
<footer class="site-footer">Copyrights Protected. All rights reserved</footer>
</html>