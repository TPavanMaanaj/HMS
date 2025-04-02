package servlets;

import dao.RoomDAO;
import model.Room;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RoomServlet")
public class RoomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String guestName = request.getParameter("guestName");
        String roomType = request.getParameter("roomType");
        String checkInStr = request.getParameter("checkInDate");
        String checkOutStr = request.getParameter("checkOutDate");
        int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
        String status = "Vacant";

        try {
            Date checkInDate = new SimpleDateFormat("yyyy-MM-dd").parse(checkInStr);
            Date checkOutDate = new SimpleDateFormat("yyyy-MM-dd").parse(checkOutStr);

            Room room = new Room();
            room.setGuestName(guestName);
            room.setRoomType(roomType);
            room.setCheckInDate(checkInDate);
            room.setCheckOutDate(checkOutDate);
            room.setRoomNumber(roomNumber);
            room.setStatus(status);

            boolean success = RoomDAO.assignRoom(room);
            if (success) {
                response.sendRedirect("receptionist_dashboard.jsp?status=success");
            } else {
                response.sendRedirect("receptionist_dashboard.jsp?error=Failed to assign room");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("receptionist_dashboard.jsp?error=Invalid Data");
        }
    }
}
