<%-- 
    Document   : InsertJobList
    Created on : Feb 6, 2022, 9:12:53 AM
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
        <title>Insert Page</title>
    </head>
    <body>
        <h1><center>INSERT NEW INFORMATION</center></h1>
        
        <!--sql query-->
       
        <c:set var="JOB_ID" value="${param.JOB_ID}"/>
        <c:set var="JOB_NAME" value="${param.JOB_NAME}"/>
        <c:set var="JOB_DESC" value="${param.JOB_DESC}"/>
        <c:set var="JOB_PRICING" value="${param.JOB_PRICING}"/>
        <c:if test="${(JOB_ID!= null)&&(JOB_NAME!= null)&&(JOB_DESC!= null) && (JOB_PRICING!= null)}" var="result">
            <sql:update var="result" dataSource="${myDatasource}" >
            INSERT INTO JOB VALUES(?,?,?,?)
            
           <sql:param value="${JOB_ID}"/>
            <sql:param value="${JOB_NAME}"/>
            <sql:param value="${JOB_DESC}"/>
            <sql:param value="${JOB_PRICING}"/>
            
        </sql:update> 
        
    </c:if>
            
            <form action="InsertJobList.jsp" method="POST">
              
                     <table border="0" cellspacing="2" cellpadding="2">
                    <tbody>
                        <tr>
                            <td> JOB_ID </td>
                            <td><input type="text" name="JOB_ID" value="" /></td>
                        </tr>
                        <tr>
                            <td> JOB_NAME </td>
                            <td> <input type="text" name="JOB_NAME" value="" /></td>
                        </tr>
                        <tr>
                            <td> JOB_DESC</td>
                            <td> <input type="text" name="JOB_DESC" value="" /></td>
                        </tr>
                        <tr>
                            <td>JOB_PRICING</td>
                            <td><input type="text" name="JOB_PRICING" value="" /></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="INSERT" /></td>
                        </tr>
                    </tbody>
                </table>

            </form>
            <br>
            <h3>Display all information about Job List with new Job List data</h3><br>
            <sql:query var="result" dataSource="${myDatasource}">
                    SELECT * FROM JOB
                </sql:query>
                    
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
                        </tr>
                    </c:forEach>
                </table>  
                    <br>
                    <a href="IndexJobList.jsp">BACK</a>
            
            
            
       
            
            
    </body>
</html>
