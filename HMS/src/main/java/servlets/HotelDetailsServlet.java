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

@WebServlet("/HotelDetailsServlet")
public class HotelDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String hotelName = request.getParameter("hotelName");
        System.out.println("Received hotelName: " + hotelName); // Debugging

        if (hotelName != null && !hotelName.trim().isEmpty()) {
            DestinationDAO dao = new DestinationDAO();
            Destinations destination = dao.getDestinationByName(hotelName);
            System.out.println("Fetched destination: " + (destination != null ? destination.getName() : "NULL")); // Debugging

            if (destination != null) {
                HttpSession session = request.getSession();
                session.setAttribute("destination", destination);
                response.sendRedirect("hotelDetails.jsp");
            } else {
                response.sendRedirect("error.jsp?message=Hotel Not Found");
            }
        } else {
            response.sendRedirect("error.jsp?message=Invalid Hotel Name");
        }
    }

    }
