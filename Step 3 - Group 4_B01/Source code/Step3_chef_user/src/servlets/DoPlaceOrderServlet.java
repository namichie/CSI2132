package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Ingredient;
import beans.Order;
import dao.IngredientDataAccess;
import dao.OrderDataAccess;

/**
 * Servlet implementation class DoPlaceOrderServlet
 */
@WebServlet(urlPatterns = { "/doPlaceOrder" })
public class DoPlaceOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DoPlaceOrderServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("chef_options");
		String errorString = null;
		String location = null;

		if (action.equals("Place Order")) {
			location = "/WEB-INF/jsp/Chef/orderConfirmation.jsp";

			Order order = new Order();
			int i_id = Integer.valueOf(request.getParameter("id"));
			int qty = Integer.valueOf(request.getParameter("qty"));

			order.setIngredient_id(i_id);
			order.setQuantity(qty);

			try {
				new OrderDataAccess().add(order);
				request.setAttribute("order", order);
			} catch (Exception e) {
				e.printStackTrace();
				errorString = e.getMessage();
			}

		} else {

			location = "/WEB-INF/jsp//Chef/placeOrder.jsp";
			List<Ingredient> ingredients = null;
			try {
				ingredients = IngredientDataAccess.listIngredientInfoForOrder();
			} catch (Exception e) {
				e.printStackTrace();
				errorString = e.getMessage();
			}

			// Store info in request attribute, before forward to views
			request.setAttribute("errorString", errorString);
			request.setAttribute("ingredientList", ingredients);

		}

		// Forward to view
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher(location);
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
