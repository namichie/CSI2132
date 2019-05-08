package beans;

import java.math.BigDecimal;
import java.sql.Date;

public class Ingredient {
	private String name, category;
	private Date threshold;
	private BigDecimal price_per_item;
	private int ingredient_id, count;
	private boolean available;


	public Ingredient() {
	}

	public int getIngredient_id() {
		return ingredient_id;
	}

	public void setIngredient_id(int ingredient_id) {
		this.ingredient_id = ingredient_id;
	}

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

	public BigDecimal getPrice_per_item() {
		return price_per_item;
	}

	public void setPrice_per_item(BigDecimal price_per_item) {
		this.price_per_item = price_per_item;
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

	@Override
	public String toString() {
		return "Ingredient[ingredient_id=" + ingredient_id + " name=" + name+"]";
	}

}
