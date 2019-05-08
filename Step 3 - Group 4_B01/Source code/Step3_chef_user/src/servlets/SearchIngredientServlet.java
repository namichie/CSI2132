package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryTypeDataAccess;

/**
 * Servlet implementation class searchIngredient
 */
@WebServlet(urlPatterns = {"/searchIngredient"})
public class SearchIngredientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public SearchIngredientServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<String> categoryTypes = null;
        String errorString = null;
        try {
        	categoryTypes = CategoryTypeDataAccess.getInstance().getCategoryTypes();
        } catch (Exception e) {
        	e.printStackTrace();
            errorString = e.getMessage();
        }
        
        // Store info in request attribute, before forwarding to views
        request.setAttribute("errorString", errorString);
        request.setAttribute("categoryTypes", categoryTypes);
        
		// Forward to view
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/jsp/User/searchIngredient.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
