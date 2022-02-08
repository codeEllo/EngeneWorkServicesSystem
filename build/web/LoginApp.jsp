<%-- 
    Document   : LoginApp
    Created on : Feb 5, 2022, 8:39:13 PM
    Author     : za
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN | EngeneWork </title>
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
    <center>
     <h1>Login Applicant</h1>
     
     <div>
        <form action="LoginAppServlet" method="POST">
            <table border="0" width="2" cellpadding="2">
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
                        <td><input type="password" name="password" value=""/></td>
                    </tr>
                    <tr>
                        <td><span style="color:red"><%= (request.getAttribute("errMessage") == null)? "" : request.getAttribute("errMessage")%></span></td>
                        
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Login" /><input type="reset" value="Reset"/> </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>Don't have any account?</td>
        
                    </tr>
                </tbody>
            </table>

        </form>
                        <a href="RegistrationApp.jsp"><button>Sign Up</button></a>
     </div>
                        </center>
</html>
