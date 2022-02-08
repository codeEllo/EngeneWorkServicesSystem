<%-- 
    Document   : jobListUpdate
    Created on : Jan 21, 2022, 1:18:38 AM
    Author     : ellya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form action ="../EditJob" method ="POST">               
            <c:set var="JOB_ID" value="${param.JOB_ID}"/>      
            <c:set var="JOB_NAME" value="${param.JOB_NAME}"/>   
            <c:set var="JOB_DESC" value="${param.JOB_DESC}"/>  
            <c:set var="JOB_PRICING" value="${param.JOB_PRICING}"/> 
            
            
            <table border="0" cellspacing="2" cellpadding="4">
           <tbody>  
                <tr>
                    <td>Applicant Name:</td>
                    <td><input type="text" name="JOB_NAME" value='${param.JOB_NAME}'/></td>
                </tr>  
                <tr>
                    <td>Applicant Email:</td>
                    <td><input type="text" name="JOB_DESC" value='${param.JOB_DESC}'/></td>
                </tr>                
                <tr>
                    <td>Job Name :</td>
                    <td><input type="number" name="JOB_PRICING" value='${param.JOB_PRICING}'/></td>
                </tr>
                 <tr>
                     <td><input type="hidden" name="JOB_ID" value='${param.JOB_ID}' /></td>
                    <td><!--<input type="number" name="id" value="" />-->
                         <input type="submit" value="UPDATE" />
                   </td>
                </tr>
            </tbody>
        </table>
    </form>
        
    </body>
</html>
