<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/engene" user="eng" password="eng"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LIST APPLICATION</title>
    </head>
    <body>
        <h1>LIST APPLICATION</h1>
        
        <sql:query var="result" dataSource="${myDatasource}">
            SELECT APPLICATION.APP_ID,ADMIN.AD_NAME,APPLICANT.AP_NAME,APPLICANT.AP_EMAIL,JOB.JOB_NAME,APPLICATION.APP_STATUS
            FROM APPLICATION
            JOIN ADMIN
            ON APPLICATION.AD_ID = ADMIN.AD_ID
            JOIN APPLICANT
            ON APPLICANT.AP_ID = APPLICATION.AP_ID
            JOIN JOB
            ON JOB.JOB_ID = APPLICATION.JOB_ID
        </sql:query>
            
       <form action="detailApplication.jsp" method="POST">
           
        <table border="1">
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
                        <form action="detailApplication.jsp" method="POST">
                        <td>                             
                                <input type ="hidden" name="APP_ID" value="${row[0]}"/> 
                                <input type ="hidden" name="AD_NAME" value="${row[1]}"/>  
                                <input type ="hidden" name="AP_NAME" value="${row[2]}"/>  
                                <input type ="hidden" name="AP_EMAIL" value="${row[3]}"/>  
                                <input type ="hidden" name="JOB_NAME" value="${row[4]}"/> 
                                <input type ="hidden" name="APP_STATUS" value="${row[5]}"/> 
                                <input type="submit" value="UPDATE"/>                        
                        </td>
                        </form> 
                </tr>
            </c:forEach>
        </table>
                </form>
    </body>
</html>
