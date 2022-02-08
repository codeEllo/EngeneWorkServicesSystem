<%-- 
    Document   : DeleteJobList
    Created on : Feb 5, 2022, 9:12:16 PM
    Author     : user
--%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/engene" user="eng" password="eng"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
             div.round3 {
             border: 2px solid green;
             border-radius: 20px;
              padding: 20px;
             text-align:center}
        </style>
       

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE PAGE</title>
    </head>
    <body>
        <h1><center>DELETE THE JOB LIST INFORMATION USING JOB ID</center> </h1>
        
        <c:set var="JOB_ID" value="${param.JOB_ID}"/> 
        <c:set var="JOB_ID" value="${param.JOB_ID}"/> 
        <c:if test="${(JOB_ID != null) && (JOB_ID != 'select') }"> 
               
        <sql:update var="result" dataSource="${myDatasource}"> 
           DELETE FROM JOB WHERE JOB_ID = ?      
        <sql:param value="${JOB_ID}"/> 
        </sql:update> 
        
        </c:if><br>
           
        <h3><center>Please choose the Job ID that you want to delete</center></h3>
        <div class="round3">
             <form action="DeleteJobList.jsp" method="POST">
               
               <table align="center">
                   <thead>
                       <tr>
                       </tr>
                   </thead>
                   <tbody>
                       <tr>
                           <td>JOB ID:</td><br>
                           <td>
                               <select name="JOB_ID">
                                   <sql:query var="result" dataSource="${myDatasource}"> 
                                        SELECT JOB_ID FROM JOB
                                   </sql:query> 
                
                                  <c:forEach var="row" items="${result.rowsByIndex}"> 
                                  <c:forEach var="column" items="${row}">
                                  <option> <c:out value="${column}"/></option> 
                                  </c:forEach> 
                                 </c:forEach> 
                               </select>
                           </td>
                           
                         </tr>
                      
                   </tbody>
               
               </table>
               <br>
               <center>
                    <input type="submit" value="DELETE" /><br><br>
                    <a href="jobList.jsp">REFRESH</a>
               </center>
              
              
           </form
        </div>
          
    </body>
</html>
