package com.service;

import java.util.ArrayList;

import com.Dao.UserDao;
import com.bean.Item;
import com.bean.User;

public class UserService {

	UserDao userDao;

	public UserService() {
		userDao = new UserDao();
	}

	public int addUser(User user) {
		return userDao.addUser(user);
	}

	public boolean checkForLogin(User user) {
		return userDao.checkForLogin(user);
	}

	public int addItem(Item item) {
		return userDao.addItem(item);
	}

	public ArrayList<Item> getItems() {
		return userDao.getItems();
	}

	public boolean deleteItem(String itemName) {
		return userDao.deleteItem(itemName);
	}

	public int updateItemShop(ArrayList<Item> itemList) {
		return userDao.updateItemShop(itemList);
	}
}
