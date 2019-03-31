package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bean.Item;
import com.bean.User;
import com.util.DBUtil;

public class UserDao {

	DBUtil dbUtil = DBUtil.getInstance();
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = "";
	int count = 0;

	public int addUser(User user) {

		con = dbUtil.getConnection();
		try {

			ps = con.prepareStatement("select * from User_1427616 where username=?");
			ps.setString(1, user.getUsername());
			rs = ps.executeQuery();
			while (rs.next())
				count = -1;
			if (count == 0) {
				ps = con.prepareStatement("insert into User_1427616 values(?,?)");
				ps.setString(1, user.getUsername());
				ps.setString(2, user.getPassword());
				count = ps.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return count;
	}

	public boolean checkForLogin(User user) {
		boolean result = false;

		con = dbUtil.getConnection();
		try {
			ps = con.prepareStatement("select * from User_1427616 where username=?");
			ps.setString(1, user.getUsername());
			rs = ps.executeQuery();
			while (rs.next()) {
				if (rs.getString(2).equals(user.getPassword()))
					result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int addItem(Item item) {

		con = dbUtil.getConnection();
		try {
			ps = con.prepareStatement("select * from Item_1427616 where itemName=?");
			ps.setString(1, item.getItemName());
			rs = ps.executeQuery();
			while (rs.next()) {
				ps = con.prepareStatement("update Item_1427616 set quant=?,price=? where itemName=?");
				ps.setInt(1, item.getQuant());
				ps.setInt(2, item.getPrice());
				ps.setString(3, item.getItemName());
				count = ps.executeUpdate();
			}
			if (count == 0) {
				ps = con.prepareStatement("insert into Item_1427616 values(?,?,?)");
				ps.setString(1, item.getItemName());
				ps.setInt(2, item.getQuant());
				ps.setInt(3, item.getPrice());
				count = ps.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return count;
	}

	public ArrayList<Item> getItems() {

		ArrayList<Item> itemList = new ArrayList<Item>();
		con = dbUtil.getConnection();
		try {
			ps = con.prepareStatement("select * from Item_1427616");
			rs = ps.executeQuery();
			while (rs.next()) {
				itemList.add(new Item(rs.getString(1), rs.getInt(2), rs
						.getInt(3)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return itemList;
	}

	public boolean deleteItem(String itemName) {
		boolean result = false;

		con = dbUtil.getConnection();
		try {
			ps = con.prepareStatement("delete from Item_1427616 where itemName=?");
			ps.setString(1, itemName);
			count = ps.executeUpdate();
			if (count > 0)
				result = true;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public int updateItemShop(ArrayList<Item> itemList) {

		con = dbUtil.getConnection();
		try {
			for (Item item : itemList) {

				ps = con.prepareStatement("select quant from Item_1427616 where itemName=?");
				ps.setString(1, item.getItemName());
				rs = ps.executeQuery();
				while (rs.next()) {
					ps = con.prepareStatement("update Item_1427616 set quant=? where itemName=?");
					ps.setInt(1, rs.getInt(1) - item.getQuant());
					ps.setString(2, item.getItemName());
					int res = ps.executeUpdate();
					if (res > 0)
						count++;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
}
