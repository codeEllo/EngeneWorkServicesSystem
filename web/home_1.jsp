<%-- 
    Document   : homeAdmin
    Created on : Feb 1, 2022, 5:05:02 PM
    Author     : za
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <h1>Home Page</h1>
        <p>Welcome <%=session.getAttribute("name")%></p>
        <p><a href="LogoutServlet">Logout</a></p>
    </body>
</html>
