<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update items</title>
<meta name="viewport" content="width=device-width, intial-scale=1.0" />
		<link rel="stylesheet" type="text/css" href="master.css" />
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
	<form action="ControllerServlet" method="post">
		<input type="hidden" name="action" value="guest"> <input
			type="submit" value="shopping page" class="btn">
	</form>
	<br>
	<br>
	<br>

	<%
		String mess = (String) session.getAttribute("mess");
		if (mess == null)
			out.print("<h3>update a item</h3>");
		else if (mess.equalsIgnoreCase("update"))
			out.print("<h3>One item updated and ready to updated another</h3>");
	%>
	<%
		String username = (String) session.getAttribute("username");
		if (username == null) {
			out.print("Not a authorized user");
		} else if (username.equals("admin")) {
	%>
	<form action="ControllerServlet" method="post">
		<input type="hidden" name="action" value="update">
		<table border=2 align="center">
			<tr>
				<td>Item name</td>
				<td><input type="text" name="itname" id="itname" class="txt" required></td>
			</tr>
			<tr>
				<td>Quantity</td>
				<td><input type="text" name="quant" id="quant" class="txt" required></td>
			</tr>
			<tr>
				<td>Price</td>
				<td><input type="text" name="price" id="price" class="txt" required></td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type="submit"
					value="update" align="middle" class="btn"></td>
			</tr>
		</table>
	</form>


	<%
		}
	%>
	<br>
	<br>
	<br>
	<a href="logout.jsp">logout</a>
	<br>
	<br>
	<br>
	
	</main>
</body>
<footer class="site-footer">Copyrights Protected. All rights reserved</footer>
</html>