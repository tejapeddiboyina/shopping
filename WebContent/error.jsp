<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error</title>
<meta name="viewport" content="width=device-width, intial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="master.css" />
</head>
<body class="bg">
	<header class="title-flex"> <img class="logo"
		src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs4xRCDWSoxupVgrGbRyjlOAZXGWQGlQRbn_ePVZCBGHv47wkjWg"
		alt="Online Shopping Logo" />
	<h1 class="heading">Online Shopping</h1>
	</header>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<main class="site-content"> <br>
	<br>
	<a href="HomePage.jsp" class="btn">home page</a> <br>
	<br>
	<br>
	<%
		String mess = (String) session.getAttribute("mess");
		if (mess.equals("register"))
			out.print("Already exists");
		else if (mess.equals("login")) {
			out.print("Register first");
	%> <a href="Register.jsp" class="btn">Register</a> <%
 	} else if (mess.equals("update"))
 		out.print("not added");
 	else if (mess.equals("delete"))
 		out.print("not deleted");
 	else if (mess.equals("pay"))
 		out.print("error");
 %> <br>
	<br>
	<br>

	</main>
</body>
<footer class="site-footer">Copyrights Protected. All rights
reserved</footer>
</html>