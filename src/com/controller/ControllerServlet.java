package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Item;
import com.bean.User;
import com.service.UserService;

/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet("/ControllerServlet")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String action = request.getParameter("action");
		UserService userService = new UserService();
		HttpSession session = request.getSession();

		if (action.equalsIgnoreCase("register")) {

			String username = request.getParameter("usrname");
			String password = request.getParameter("pwd");

			User user = new User(username, password);
			int result = userService.addUser(user);

			if (result > 0)
				response.sendRedirect("Login.jsp");
			else {
				session.setAttribute("mess", "register");
				response.sendRedirect("error.jsp");
			}
		}

		else if (action.equalsIgnoreCase("login")) {

			String username = request.getParameter("usrname");
			String password = request.getParameter("pwd");

			User user = new User(username, password);
			if (userService.checkForLogin(user)) {
				session.setAttribute("username", username);
				ArrayList<Item> itemList = userService.getItems();
				session.setAttribute("itemList", itemList);
				response.sendRedirect("shoppingPage.jsp");
			} else {
				session.setAttribute("mess", "login");
				response.sendRedirect("error.jsp");
			}
		}

		else if (action.equalsIgnoreCase("update")) {
			String itemName = request.getParameter("itname");
			int quant = Integer.parseInt(request.getParameter("quant"));
			int price = Integer.parseInt(request.getParameter("price"));

			Item item = new Item(itemName, quant, price);
			int result = userService.addItem(item);
			session.setAttribute("mess", "update");
			if (result > 0)
				response.sendRedirect("update.jsp");
			else
				response.sendRedirect("error.jsp");
		}

		else if (action.equalsIgnoreCase("delete")) {
			String itemName = request.getParameter("itname");
			session.setAttribute("mess", "delete");
			if (userService.deleteItem(itemName))
				response.sendRedirect("delete.jsp");
			else
				response.sendRedirect("error.jsp");
		}

		else if (action.equalsIgnoreCase("guest")) {
			ArrayList<Item> itemList = userService.getItems();
			session.setAttribute("itemList", itemList);
			response.sendRedirect("shoppingPage.jsp");
		}

		else if (action.equalsIgnoreCase("shop")) {
			int idcount = 0;
			String chk[] = request.getParameterValues("chk");
			ArrayList<Item> itemList = new ArrayList<Item>();
			for (String s : chk) {
				if (s.equalsIgnoreCase("on")) {
					String itemName = (String) session.getAttribute("itemName"
							+ idcount);
					int quant = Integer.parseInt(request.getParameter("quant"
							+ idcount));
					// response.getWriter().print("");
					Item item = new Item(itemName, quant);
					itemList.add(item);
				}idcount++;
			}
			int result = userService.updateItemShop(itemList);
			if (result > 0) {
				response.sendRedirect("payment.jsp");
			}else{
				session.setAttribute("mess", "pay");
				response.sendRedirect("error.jsp");
			}
		}
	}
}
