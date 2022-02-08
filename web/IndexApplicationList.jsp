<%-- 
    Document   : IndexApplicationList
    Created on : Feb 6, 2022, 10:40:24 AM
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
        <title>Application Page</title>
    </head>
    <body>
        <h1><center>WELCOME TO APPLICATION PAGE</center></h1>
        <h4>Choose what you want to do with this list</h4>
        <p class="round3">
        <a href="applicationList.jsp">UPDATE APPLICATION INFORMATION</a><br>
        </p><br>
        <p class="round3">
            <a href="DeleteApplicationList.jsp">DELETE APPLICATION INFORMATION</a><br><br>
        </p>
          
          <a href="index1.html">BACK</a>
    </body>
</html>
