<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>
<meta name="viewport" content="width=device-width, intial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="master.css" />
<script type="text/javascript" src="validate.js"></script>
</head>
<body>
<body class="bg1">
	<header class="title-flex"> <img class="logo"
		src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs4xRCDWSoxupVgrGbRyjlOAZXGWQGlQRbn_ePVZCBGHv47wkjWg"
		alt="Online Shopping Logo" />
	<h1 class="heading">Online Shopping</h1>
	</header>
	<br>
	<br>
	<br>
	<a href="HomePage.jsp" class="btn">Homepage</a>
	<br>
	<br>
	<%
		HttpSession sess = request.getSession(false);
		String user = (String) sess.getAttribute("username");
		if (user == null) {
			out.print("u have no access");
		} else {
	%>
	<main class="site-content"> <br>
	<br>
	<br>
	<button id="paybtn" onclick="showPay()">history</button>
	<p id="message"></p>
	<br>
	<br>
	<br>

	<a href="logout.jsp" class="btn">Logout</a> <br>
	<br>
	<br>
	</main>
	<%
		}
	%>
</body>
<footer class="site-footer">Copyrights Protected. All rights
reserved</footer>
</html>