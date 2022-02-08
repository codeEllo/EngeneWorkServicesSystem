package admin.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
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


public class EditDetailApplication extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, SQLException, ClassNotFoundException {
    response.setContentType("text/html;charset=UTF-8");
   
    int APP_ID = Integer.parseInt(request.getParameter("APP_ID"));
    String STATUS = request.getParameter("APP_STATUS");  
    
    Connection con = null;
    Statement statement = null;
    List errorMsgs = new LinkedList();
    try{
        con = DBConnection.createConnection();
        statement = con.createStatement();
        String sql = "UPDATE APPLICATION SET APP_STATUS=? WHERE APP_ID=?";
        PreparedStatement st = con.prepareStatement(sql);
            
            st.setString(1,STATUS);
            st.setInt(2,APP_ID);
            st.execute();
                response.sendRedirect("Admin/applicationList.jsp");
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
            Logger.getLogger(EditDetailApplication.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
           Logger.getLogger(EditDetailApplication.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}