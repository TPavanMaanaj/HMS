package servlets;

import model.Employee;
import dao.EmployeeDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String ename = request.getParameter("username");
        String password = request.getParameter("password");

        Employee emp = EmployeeDAO.validateEmployee(ename, password);

        if (emp != null) {
            HttpSession session = request.getSession();
            session.setAttribute("ename", emp.getEname());
            session.setAttribute("role", emp.getRole());

            // Redirect based on role
            switch (emp.getRole()) {
                case "Manager":
                    response.sendRedirect("manager_dashboard.jsp");
                    break;
                case "Receptionist":
                    response.sendRedirect("receptionist_dashboard.jsp");
                    break;
                case "Housekeeping":
                    response.sendRedirect("housekeeping_dashboard.jsp");
                    break;
                case "Chef":
                    response.sendRedirect("chef_dashboard.jsp");
                    break;
                case "Security":
                    response.sendRedirect("security_dashboard.jsp");
                    break;
                default:
                    response.sendRedirect("emplogin.jsp?error=Invalid Role Assigned");
            }
        } else {
            response.sendRedirect("emplogin.jsp?error=Invalid Username or Password");
        }
    }
}