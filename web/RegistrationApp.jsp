<%-- 
    Document   : RegistrationApp
    Created on : Feb 5, 2022, 8:55:15 PM
    Author     : za
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up | EngeneWork</title>
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
    <center>
        <h1>Register Applicant Form </h1>
        <div>
        <form  class="form" action="RegisterAppServlet" method="POST">
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
                        <td>Date Of Birthday</td>
                        <td><input type="text" name="dob" value="" /></td>
                    </tr>
                    <tr>
                        <td>Phone Number</td>
                        <td><input type="text" name="phone" value="" /></td>
                    </tr>                    
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>Academic Background</td>
                        <td><input type="text" name="ab" value="" /></td>
                    </tr>
                    <tr>
                        <td>Experience Background</td>
                        <td><input type="text" name="eb" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="text" name="password" value="" /></td>
                    </tr>
                <!--    <tr>
                        <td>Confirm Password</td>
                        <td><input type="text" name="confirmpassword" value="" /></td><br>
                        <td><span style="color:red"><%= (request.getAttribute("errMessage") == null)? "" : request.getAttribute("errMessage")%></span></td>
                    </tr>-->
                    
                    <tr>
                        <td><input type="submit" value="Confirm Registration" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
        </div>
    </body>
    </center>
</html>
