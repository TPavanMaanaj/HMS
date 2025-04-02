package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Destinations;
import dao.DestinationDAO;

@WebServlet("/DestinationServlet")
public class DestinationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the hotel name from request
        String hotelName = request.getParameter("hotelName");

        if (hotelName != null) {
            // Fetch details from the database using DAO
            DestinationDAO destinationDAO = new DestinationDAO();
            Destinations destination = destinationDAO.getDestinationByName(hotelName);

            // Store details in session
            HttpSession session = request.getSession();
            session.setAttribute("destination", destination);

            // Redirect to destination details page
            response.sendRedirect("destinationDetails.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}