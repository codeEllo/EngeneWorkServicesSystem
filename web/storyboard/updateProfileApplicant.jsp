<%-- 
    Document   : index
    Created on : Dec 10, 2021, 10:21:47 PM
    Author     : ellya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile</title>
    </head>
    
    <style>
        th {
  text-align: center;
}
        </style>
    <body>
        <center><h1>UPDATE YOUR PROFILE</h1></center>
        <br><br>
        <center>
            <form action="#" method="POST"> 
           <table border="0"  >
                   <tbody>
                       <tr >
                           <th style="text-align:center;"> Name </th>
                           <td> <input type="text" name="name"/></td>
                       </tr>
                       <tr>
                           <th> Date Of Birth</th>
                           <td> <input type="text" name="DOB"/></td>
                       </tr>
                       <tr>
                           <th> Phone Number </th>
                           <td> <input type="text" name="phnum"/> </td>
                       </tr>
                       <tr>
                           <th> Email </th>
                           <td> <input type="text" name="email"/></td>
                       </tr>
                       <tr>
                           <th> Password </th>
                           <td> <input type="text" name="password"/></td>
                       </tr>
                       <tr>
                           <th> Academic Background </th>
                           <td> <input type="text" name="AB"/> </td>
                       </tr>
                       <tr>
                           <th> Experience Background </th>
                           <td> <input type="text" name="EB"/> </td>
                       </tr
                       <tr>
                           <th></th>
                           <td> <input type="submit" value="UPDATE"/><input type="submit" value="BACK"/></td>
                       </tr>
                   </tbody>
             </table>

           </form>
        </center>
        
    </body>
</html>
