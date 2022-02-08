<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/engene" user="eng" password="eng"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Job List</title>
    </head>
    <body>
        <h1>Job List</h1>
        <sql:query var="result" dataSource="${myDatasource}">
            SELECT * FROM JOB
        </sql:query>
    
        <table border="1">
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
                       
                   <form action="apply" method="POST">
                      <td>                             
                            <input type ="hidden" value="${row[0]}"/> 
                            <input type ="text" value="${row[1]}"/> 
                            <input type="submit" value="APPLY"/>                        
                     </td>
                   </form>  
                        
                        
                </tr>
            </c:forEach>
        </table>
        
    </body>
</html>
