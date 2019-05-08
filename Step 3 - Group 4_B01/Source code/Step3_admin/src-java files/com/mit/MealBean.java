package com.mit;

public class MealBean {
	public String getMeal_name() {
		return meal_name;
	}
	public void setMeal_name(String meal_name) {
		this.meal_name = meal_name;
	}
	public String getMeal_description() {
		return meal_description;
	}
	public void setMeal_description(String meal_description) {
		this.meal_description = meal_description;
	}
	public String getMeal_cuisine() {
		return meal_cuisine;
	}
	public void setMeal_cuisine(String meal_cuisine) {
		this.meal_cuisine = meal_cuisine;
	}
	public Boolean getMeal_availability() {
		return meal_availability;
	}
	public void setMeal_availability(Boolean meal_availability) {
		this.meal_availability = meal_availability;
	}
	String meal_id;
	
	public String getMeal_id() {
		return meal_id;
	}
	public void setMeal_id(String meal_id) {
		this.meal_id = meal_id;
	}
	String meal_name;
	String meal_description;
	String meal_cuisine;
	Boolean meal_availability;
}
