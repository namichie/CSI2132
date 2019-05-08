package beans;

import java.util.ArrayList;
import java.util.List;

public class Meal {

	private int id;
	private String name;
	private String description;
	private String cuisine;
	private boolean available;
	private List<Integer> ingredientIds = new ArrayList<Integer>();
	private List<String> ingredientNames = new ArrayList<String>();

	public Meal() {
		super();
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCuisine() {
		return cuisine;
	}

	public void setCuisine(String cuisine) {
		this.cuisine = cuisine;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

	public List<Integer> getIngredientIds() {
		return ingredientIds;
	}

	public String getIngredientNames() {
		String s = "";
		for (String name : ingredientNames) {
			if (s.length() > 0) {
				s += ',';
			}
			s += name;
		}
		return s;
	}

	public void addIngredient(int ingredientId, String ingredientName) {
		this.ingredientIds.add(ingredientId);
		addIngredientName(ingredientName);
	}

	public void addIngredientName(String ingredientName) {
		this.ingredientNames.add(ingredientName);
	}

	@Override
	public String toString() {
		return "Meal[id=" + id + ",name=" + name + "]";
	}

}
