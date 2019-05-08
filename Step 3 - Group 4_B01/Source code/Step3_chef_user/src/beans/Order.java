package beans;

public class Order {
	private int order_num, ingredient_id, quantity;
	private boolean order_approved;
	
	public Order() {
		super();
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

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

	public boolean isApproved() {
		return order_approved;
	}

	public void setApproval(boolean order_approved) {
		this.order_approved = order_approved;
	}

	@Override
	public String toString() {
		return "Order [order_num=" + order_num + ", ingredient_id=" + ingredient_id + ", quantity=" + quantity
				+ ", status=" + order_approved + "]";
	}
	
}
