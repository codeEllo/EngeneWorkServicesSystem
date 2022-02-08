<%-- 
    Document   : jobList
    Created on : Feb 1, 2022, 11:37:26 AM
    Author     : user
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
            #info {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#info td, #info th {
  border: 1px solid #ddd;
  padding: 8px;
}

#info tr:nth-child(even){background-color: #f2f2f2;}

#info tr:hover {background-color: #ddd;}

#info th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JOB LIST </title>
    </head>
    <body>
        <h1><center>JOB LIST</center></h1>
        <h3><center>Update Job List</center></h3>
        
        <sql:query var="result" dataSource="${myDatasource}">
            SELECT * FROM JOB
        </sql:query>
            
       <form action="jobListUpdate.jsp" method="POST">
           
        <table id="info">
            <!-- column headers -->
            <tr>
                <c:forEach var="columnName" items="${result.columnNames}">
                    <th><c:out value="${columnName}"/></th>
                    </c:forEach>
            </tr>
            <!-- column data -->
            <c:forEach var="row" items="${result.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}">
                        <td><c:out value="${column}"/></td>
                    </c:forEach>
                        <form action="jobListUpdate.jsp" method="POST">
                        <td>                             
                                <input type ="hidden" name="JOB_ID" value="${row[0]}"/> 
                                <input type ="hidden" name="JOB_NAME" value="${row[1]}"/>  
                                <input type ="hidden" name="JOB_DESC" value="${row[2]}"/>  
                                <input type ="hidden" name="JOB_PRICING" value="${row[3]}"/>  
                                <input type="submit" value="UPDATE"/>                        
                        </td>
                        </form>  

                </tr>
            </c:forEach>
        </table>
           <br>
             <a href="IndexJobList.jsp">BACK</a>
                </form>
    </body>
</html>

