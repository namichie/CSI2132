package com.mit;


import java.util.Date;

public class IngredientBean {
	private String name, category;private Date threshold;
	private double price_per_item;
	private int ingredient_id, count;
	private boolean available;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getThreshold() {
		return threshold;
	}
	public void setThreshold(Date threshold) {
		this.threshold = threshold;
	}
	public double getPrice_per_item() {
		return price_per_item;
	}
	public void setPrice_per_item(double price_per_item) {
		this.price_per_item = price_per_item;
	}
	public int getIngredient_id() {
		return ingredient_id;
	}
	public void setIngredient_id(int ingredient_id) {
		this.ingredient_id = ingredient_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public boolean isAvailable() {
		return available;
	}
	public void setAvailable(boolean available) {
		this.available = available;
	}
	
	

}
