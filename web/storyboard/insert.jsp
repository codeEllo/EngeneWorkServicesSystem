<%-- 
    Document   : Insert
    Created on : Dec 10, 2021, 12:29:07 PM
    Author     : ellya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<sql:setDataSource var="myDatasource" 
driver="org.apache.derby.jdbc.ClientDriver" 
url="jdbc:derby://localhost:1527/engene" user="eng" 
password="eng"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INSERT admin (test)</title>
    </head>
    <style>
        </style>
    <body>
        
        <h1>INSERT STUDENT INFORMATION</h1>
        <c:set var="ad_name" value="${param.ad_name}"/> 
        <c:set var="ad_email" value="${param.ad_email}"/> 
        <c:set var="ad_pass" value="${param.ad_pass}"/> 

        
            <sql:update var="result" dataSource="${myDatasource}">
                INSERT INTO ADMIN (AD_NAME,AD_EMAIL,AD_PASS) VALUES (?,?,?)
               
                <sql:param value="${ad_name}"/> 
                <sql:param value="${ad_email}"/> 
                <sql:param value="${ad_pass}"/>
            </sql:update>
    <center>
        <form action="insert.jsp" method="POST"> 
            <table border="0" id="keywords">
                <tbody>
                    <tr>
                        <td>name: </td>
                        <td><input type="text" name="ad_name"/></td>
                    </tr>
                    <tr>
                        <td>email: </td>
                        <td><input type="email" name="ad_email"/></td>
                    </tr>
                    <tr>
                        <td>password: </td>
                        <td><input type="text" name="ad_password"/></td>
                    </tr>
                    <tr>
                        <td><a href="index.jsp"><input type="button"  value="BACK"/></a></td>
                        <td><input type="submit" value="SUBMIT"/></td>
                    </tr>
                </tbody>
            </table>
        </form></center>
    
                <sql:query var="result" dataSource="${myDatasource}">
                SELECT * FROM ADMIN
    </sql:query>
    
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
            </tr>
        </c:forEach>
    </table>
    </body>
</html>


