<%-- 
    Document   : detailApplication
    Created on : Feb 2, 2022, 8:49:28 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/engene" user="eng" password="eng"/>
<!DOCTYPE html>
<html>
    <head>
        <style> 
input {
  width: 100%;
}
form{
border-style:dashed;
padding:50px;
color:black
}
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Detail Application</title>
    </head>
    <body>
        <h1><center>Edit Detail Application</center></h1>
        <h3>Edit Status of Application</h3>
        <form action ="EditDetailApplication" method ="POST">               
            <c:set var="APP_ID" value="${param.APP_ID}"/>      
            <c:set var="AP_EMAIL" value="${param.AP_EMAIL}"/>   
            <c:set var="AP_NAME" value="${param.AP_NAME}"/>  
            <c:set var="AD_NAME" value="${param.AD_NAME}"/> 
            <c:set var="JOB_NAME" value="${param.JOB_NAME}"/>   
            <c:set var="APP_STATUS" value="${param.APP_STATUS}"/>
            
            <table border="0" cellspacing="2" cellpadding="4" align="center">
           <tbody>  
               <tr>
                    <td>Admin Name:</td>
                    <td><input type="text" name="AD_NAME" value='${param.AD_NAME}'/></td>
                </tr> 
                <tr>
                    <td>Applicant Name:</td>
                    <td><input type="text" name="AP_NAME" value='${param.AP_EMAIL}'/></td>
                </tr>  
                <tr>
                    <td>Applicant Email:</td>
                    <td><input type="email" name="AP_EMAIL" value='${param.AP_EMAIL}'/></td>
                </tr>                
                <tr>
                    <td>Job Name :</td>
                    <td><input type="text" name="JOB_NAME" value='${param.AP_NAME}'/></td>
                </tr>
                <tr>
                    <td> STATUS</td>
                    <td>
                        <select name="APP_STATUS">
                            <option>${param.APP_STATUS}</option>
                            <option>ACCEPTED</option>
                            <option>PENDING</option>
                            <option>REJECTED</option>
                            
                        </select>
                    </td>
                </tr>
                 <tr>
                     <td><input type="hidden" name="APP_ID" value='${param.APP_ID}' /></td>
                    <td><!--<input type="number" name="id" value="" />-->
                         <input type="submit" value="UPDATE" />
                   </td>
                </tr>
            </tbody>
        </table>
    </form>
    </body>
</html>
