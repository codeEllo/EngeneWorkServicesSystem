package applicant.controller;

import admin.controller.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException; 
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;


public class EditAccountApplication extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, SQLException, ClassNotFoundException {
    response.setContentType("text/html;charset=UTF-8");
   
    int AP_ID = Integer.parseInt(request.getParameter("AP_ID"));
    String AP_NAME = request.getParameter("AP_NAME");  
    String AP_DOB = request.getParameter("AP_DOB");
    String AP_PHNUM = request.getParameter("AP_PHNUM");
    String AP_EMAIL = request.getParameter("AP_EMAIL");
    String AP_PASS = request.getParameter("AP_PASS");
    String AP_AB = request.getParameter("AP_AB");
    String AP_EB = request.getParameter("AP_EB");
    Connection con = null;
    Statement statement = null;
    List errorMsgs = new LinkedList();
    try{
        con = DBConnection.createConnection();
        statement = con.createStatement();
        String sql = "UPDATE APPLICANT SET AP_NAME =?,AP_DOB =?, AP_PHNUM =?, AP_EMAIL =?, AP_PASS =?, AP_AB =?, AP_EB =? WHERE AP_ID =?";
        PreparedStatement st = con.prepareStatement(sql);
            
            st.setString(1,AP_NAME);
            st.setString(2,AP_DOB);
            st.setString(3,AP_PHNUM);
            st.setString(4,AP_EMAIL);
            st.setString(5,AP_PASS);
            st.setString(6,AP_AB);
            st.setString(7,AP_EB);
            st.setInt(8,AP_ID);
            st.execute();
            response.sendRedirect("Techie/index.jsp");
    }
   catch(RuntimeException e){
                request.setAttribute("Error",errorMsgs);
               RequestDispatcher view = request.getRequestDispatcher("error.jsp");
               view.forward(request, response);
    
    }
}
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(EditAccountApplication.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
           Logger.getLogger(EditAccountApplication.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}