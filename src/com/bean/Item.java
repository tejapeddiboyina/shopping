package com.bean;

public class Item {
	private String itemName;
	private int quant;
	private int price;

	public Item(String itemName, int quant, int price) {
		super();
		this.itemName = itemName;
		this.quant = quant;
		this.price = price;
	}

	public Item(String itemName, int quant) {
		super();
		this.itemName = itemName;
		this.quant = quant;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getQuant() {
		return quant;
	}

	public void setQuant(int quant) {
		this.quant = quant;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
