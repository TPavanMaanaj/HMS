package servlets;

import dao.BookingDAO;
import model.Booking;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("emplogin.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");
        String destination = request.getParameter("destination");
        String dateStr = request.getParameter("date");
        int guests = Integer.parseInt(request.getParameter("guests"));
        String offer = request.getParameter("offer");

        double price = 10000; // Default price for standard package
        if (offer.equals("Deluxe Package")) {
            price = 15000;
        } else if (offer.equals("Premium Package")) {
            price = 20000;
        }

        try {
            Date bookingDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);

            Booking booking = new Booking();
            booking.setUsername(username);
            booking.setDestination(destination);
            booking.setBookingDate(bookingDate);
            booking.setGuests(guests);
            booking.setOffer(offer);
            booking.setPrice(price);

            boolean isBooked = BookingDAO.insertBooking(booking);
            if (isBooked) {
                response.sendRedirect("mybookings.jsp?status=success");
            } else {
                response.sendRedirect("destinationDetails.jsp?error=Booking Failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("destinationDetails.jsp?error=Invalid Date");
        }
    }
}
