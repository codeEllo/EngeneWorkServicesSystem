/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ellya
 */
public class EditJob extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, SQLException, ClassNotFoundException {
    response.setContentType("text/html;charset=UTF-8");
   
    int JOB_ID = Integer.parseInt(request.getParameter("JOB_ID"));
    String JOB_NAME = request.getParameter("JOB_NAME");  
    String JOB_DESC = request.getParameter("JOB_DESC"); 
    Double JOB_PRICING = Double.parseDouble(request.getParameter("JOB_PRICING")); 

    //Staff pst = new Staff(id,name,salary,designation);            
    
    List errorMsgs = new LinkedList();
    try{
          Class.forName("org.apache.derby.jdbc.ClientDriver");
         Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/engene;create=true;user=eng;password=eng");
            String sql = "UPDATE JOB SET JOB_NAME=?,JOB_DESC=?,JOB_PRICING=? WHERE JOB_ID=?";
            PreparedStatement st = con.prepareStatement(sql);
            
            st.setString(1,JOB_NAME);
            st.setString(2,JOB_DESC);
             st.setDouble(3,JOB_PRICING);
              st.setInt(4,JOB_ID);
            st.execute();
                response.sendRedirect("Admin/jobList.jsp");
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
