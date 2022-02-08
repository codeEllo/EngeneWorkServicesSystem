<%-- 
    Document   : registrationAdmin
    Created on : Feb 1, 2022, 5:43:56 PM
    Author     : za
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Admin Form</title>
    </head>
        <style>
    input[type=text],input[type=password]{
        padding : 12px 20px;
        margin-left: 8px;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    
    div{
        border-radius: 5px;
        background-color: #f2f2f2;
        padding: 20px;
        width: 50%
 
    }
    </style>
    <body>
        <h1>Registration Admin Form</h1>
        <div>
        <form action="RegisterAdminServlet" method="POST">
            <table border="0" width="2" cellspacing="2" cellpadding="4">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="text" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td>Confirm Password</td>
                        <td><input type="text" name="confirmpassword" value="" /></td>
                        <td><span style="color:red"><%= (request.getAttribute("errMessage") == null)? "" : request.getAttribute("errMessage")%></span></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Confirm Registration" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                </tbody>
            </table>
          </form>
                    <a href="homepage.jsp"><button>BACK</button></a>
        </div>
    </body>
</html>

