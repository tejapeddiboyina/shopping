<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Page</title>
<meta name="viewport" content="width=device-width, intial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="master.css" />
<script type="text/javascript" src="validate.js"></script>
</head>
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
	<main class="site-content"> <br>
	<br>
	<br>
	<%
		HttpSession sess = request.getSession(false);
		String user = (String) sess.getAttribute("username");
		if (user == null || user.equalsIgnoreCase("")) {
			out.print("guest user");
		} else if (user.equals("admin")) {
	%><a href="update.jsp" class="btn">Update</a> <br>
	<a href="delete.jsp" class="btn">Delete</a> <br>
	<br>
	<%
		}
	%> <%@ page import="java.util.ArrayList,com.bean.Item"%>
	<%
		ArrayList<Item> itemList = new ArrayList<Item>();
		itemList = (ArrayList<Item>) session.getAttribute("itemList");
	%>
	<form action="ControllerServlet" method="post"
		onsubmit="return checkLogin();">
		<input type="hidden" name="action" value="shop">
		<table border=2 class="shopping-table">
			<tr>
				<th><b>Select</b></th>
				<th><b>Item name</b></th>
				<th><b>Quantity left</b></th>
				<th><b>Price per peice</b></th>
				<th><b>Quantity Required</b></th>
				<th><b>Total price of item</b></th>
			</tr>

			<%
				int idcount = 0;
				for (Item item : itemList) {
					session.setAttribute("itemName" + idcount, item.getItemName());
			%>

			<tr>
				<td><input type="checkbox" name="chk"
					onclick="javascript:show();"></td>
				<td><span id="n<%=idcount%>" name="n<%=idcount%>"
					value="<%=item.getItemName()%>"><%=item.getItemName()%></span></td>
				<td><span id="q<%=idcount%>"><%=item.getQuant()%></span></td>
				<td><span id="p<%=idcount%>"><%=item.getPrice()%></span></td>
				<td><input type="text" name="quant<%=idcount%>" placeholder="0"
					id="num<%=idcount%>" style="visibility: hidden"
					onblur="givePrice()"></td>
				<td><span id="<%=idcount++%>" style="visibility: hidden">0</span></td>
			</tr>

			<%
				}
			%>
			<tr>
				<td colspan=4>Get Total</td>
				<td><span id="totItem" name="totItem"
					style="visibility: hidden">0</span></td>
				<td><span id="getTot" name="getTot" style="visibility: hidden">0</span></td>
			</tr>
			<tr>
				<td colspan=6><input type="submit" class="btn" value="PAY"></td>
			</tr>
		</table>
		<%
			if (user == null) {
		%>
		<a href="Login.jsp" style="visibility: hidden" id="user" value="true">login</a>
		<%
			}
		%>
	</form>
	<br>
	<br>
	<br>
	<%
		if (user != null) {
	%> <a href="logout.jsp" class="btn">Logout</a> <%
 	}
 %> <br>
	<br>
	<br>

	</main>
</body>
<footer class="site-footer">Copyrights Protected. All rights
reserved</footer>
</html>