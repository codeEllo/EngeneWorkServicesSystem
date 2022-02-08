<%-- 
    Document   : jobListUpdate
    Created on : Feb 1, 2022, 11:41:16 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style> 
         input[type=text],[type=number] {
         width: 200%;
         padding: 12px 20px;
         margin: 8px 0;
         box-sizing: border-box;
         background-color: whitesmoke;
         
        }
        form{
            border-style:dotted;
            padding: 50px;
            background-color:lightgrey;
        }
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
    </head>
    <body>
        <h1><center>UPDATE INFORMATION</center></h1>
        <h3>Choose what you want to change</h3>
        <div>
            
        
        <form action="editJob" method="POST">
            
            <c:set var="JOB_ID" value="${param.JOB_ID}"/>      
            <c:set var="JOB_NAME" value="${param.JOB_NAME}"/>   
            <c:set var="JOB_DESC" value="${param.JOB_DESC}"/>  
            <c:set var="JOB_PRICING" value="${param.JOB_PRICING}"/> 
            
            
            <table border="0" cellspacing="2" cellpadding="4" align="center">
           <tbody>  
                <tr>
                    <td>Job Name:</td>
                    <td><input type="text" name="JOB_NAME" value='${param.JOB_NAME}'/></td>
                </tr>  
                <tr>
                    <td>Job Description:</td>
                    <td><input type="text" name="JOB_DESC" value='${param.JOB_DESC}'/></td>
                </tr>                
                <tr>
                    <td>Job Pricing:</td>
                    <td><input type="number" name="JOB_PRICING" value='${param.JOB_PRICING}'/></td>
                </tr>
                <tr>
                     <td><input type="hidden" name="JOB_ID" value='${param.JOB_ID}' /></td>
                </tr>
                 <tr>
                     
                    <td><!--<input type="number" name="id" value="" />-->
                         <input type="submit" value="UPDATE" />
                   </td>
                </tr>
            </tbody>
        </table>
              
        
        </form>
        </div>
        
    </body>
</html>


