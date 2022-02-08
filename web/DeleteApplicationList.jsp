<%-- 
    Document   : DeleteApplicationList
    Created on : Feb 5, 2022, 10:58:21 PM
    Author     : Syadiba
--%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/engene" user="eng" password="eng"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
table, th, td {
  border: 1px solid blue;
}

table {
  width: 50%;
  padding:50px;
}
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
    </head>
    <body>
        <h1><center>DELETE LIST OF APPLICATION USING ID</center></h1>
        
        <c:set var="APP_ID" value="${param.APP_ID}"/> 
        <c:set var="APP_ID" value="${param.APP_ID}"/> 
        <c:if test="${(APP_ID != null) && (APP_ID != 'select') }"> 
            
        <sql:update var="res" dataSource="${myDatasource}"> 
           DELETE FROM APPLICATION WHERE APP_ID = ?      
        <sql:param value="${APP_ID}"/> 
        </sql:update> 
        </c:if><br>
        
        <h3><center>Choose the ID to delete the information about application</center></h3>
        <form action="DeleteApplicationList.jsp" method="POST">
            <table align="center">
                <thead>
                    <tr>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Application ID:</td>
                        <td>
                            <select name="APP_ID">
                                <sql:query var="result" dataSource="${myDatasource}">
                                    SELECT APP_ID FROM APPLICATION
                                </sql:query>
                                <c:forEach var="row" items="${result.rowsByIndex}">
                                    <c:forEach var="column" items="${row}">
                                        <option>
                                            <c:out value="${column}"/>
                                        </option>
                                    </c:forEach>
                                        
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                  

                </tbody>
            </table>
             <br>
             <center>
                 <input type="submit" value="DELETE" /><br><br>
                  <a href="applicationList.jsp">REFRESH</a>
             </center>
            
        </form>
           
    </body>
</html>
