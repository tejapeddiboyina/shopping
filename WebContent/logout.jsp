<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout page</title>
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

	<%
		HttpSession sess = request.getSession(false);
		if (sess != null) {
			sess.setAttribute("username", "");
			sess.invalidate();
			response.sendRedirect("HomePage.jsp");
		}
	%>
	</main>
</body>
<footer class="site-footer">Copyrights Protected. All rights reserved</footer>
</html>