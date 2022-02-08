<%-- 
    Document   : IndexJobList
    Created on : Feb 6, 2022, 10:36:23 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
          p.round3 {
             border: 2px solid red;
             border-radius: 12px;
             padding: 30px;
             text-align:center;
           }  
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Job List Page</title>
    </head>
    <body>
         <h1><center> WELCOME TO JOB LIST PAGE</center></h1>
         <h4><center>Choose what you want to do with this list</center></h4>
         
         <p class="round3">
             <a href="InsertJobList.jsp">INSERT NEW INFORMATION</a><br><br>
         </p><br>
         <p class="round3">
             <a href="jobList.jsp">UPDATE INFORMATION</a><br><br>
         </p>
         <p class="round3"><br>
             <a href="DeleteJobList.jsp">DELETE INFORMATION</a><br><br>
         </p>
        
        <a href="index.html">BACK</a>
    </body>
</html>
