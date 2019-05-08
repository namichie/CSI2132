package com.mit;

public class OrderBean {
	int order_num;
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	int ingredient_id;
	int quantity;
	Boolean order_approved;
	
	//GETTERS AND SETTERS
	public int getIngredient_id() {
		return ingredient_id;
	}
	public void setIngredient_id(int ingredient_id) {
		this.ingredient_id = ingredient_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Boolean getOrder_approved() {
		return order_approved;
	}
	public void setOrder_approved(Boolean order_approved) {
		this.order_approved = order_approved;
	}
	
	
	
}
