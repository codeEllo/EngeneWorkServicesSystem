<%-- 
    Document   : Insert
    Created on : Dec 10, 2021, 12:29:07 PM
    Author     : ellya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/engene" user="eng" password="eng"/>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INSERT PAGE (JSP)</title>
    </head>
    <body>
        
            <c:set var="AP_NAME" value="${param.AP_NAME}"/>   
            <c:set var="AP_DOB" value="${param.AP_DOB}"/>  
            <c:set var="AP_PHNUM" value="${param.AP_PHNUM}"/> 
            <c:set var="AP_EMAIL" value="${param.AP_EMAIL}"/>   
            <c:set var="AP_PASS" value="${param.AP_PASS}"/>
            <c:set var="AP_AB" value="${param.AP_AB}"/>
            <c:set var="AP_EB" value="${param.AP_EB}"/> 
            <c:set var="AP_ID" value="${param.AP_ID}"/>      

                
            
            <c:if test="${(AP_ID!=null)&&(AP_NAME!=null)&&(AP_DOB!=null)&&(AP_PHNUM!=null)&&(AP_EMAIL!=null)&&(AP_PASS!=null)&&(AP_AB!=null)&&(AP_EB!=null)}" var="result">
           <sql:update var="res" dataSource="${myDatasource}"> 
                UPDATE APPLICANT SET AP_NAME =?, AP_DOB =?, AP_PHNUM =?, AP_EMAIL =?, AP_PASS =?, AP_AB =?, AP_EB =? WHERE AP_ID =?              
                <sql:param value="${AP_NAME}"/> 
                <sql:param value="${AP_DOB}"/> 
                <sql:param value="${AP_PHNUM}"/> 
                <sql:param value="${AP_EMAIL}"/> 
                <sql:param value="${AP_PASS}"/> 
                <sql:param value="${AP_AB}"/> 
                <sql:param value="${AP_EB}"/>
                 <sql:param value="${AP_ID}"/> 
            </sql:update> 
        </c:if>
        
        
    <center>
        <form action="myAccount.jsp" method="POST"> 
            <table border="0" id="keywords">
                <tbody>
                    <tr>
                        <td></td>
                        <td><input type="text" name="AP_NAME" value='${param.AP_NAME}' /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="text" name="AP_DOB" value='${param.AP_DOB}' /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="text" name="AP_PHNUM" value='${param.AP_PHNUM}' /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="email" name="AP_EMAIL" value='${param.AP_EMAIL}' /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="password" name="AP_PASS" value='${param.AP_PASS}' /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="text" name="AP_AB" value='${param.AP_AB}' /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="text" name="AP_EB" value='${param.AP_EB}' /></td>
                    </tr>
                    <tr>
                        <td><input type="hidden" name="AP_ID" value="1" /></td>
                        <td><input type="submit" value="Update" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
    
    <!--SHOW LIST OF DATA-->
                <sql:query var="result" dataSource="${myDatasource}">
                    SELECT * FROM APPLICANT 
                </sql:query>
     <div id="wrapper">
                <table id="keywords" border="0" >
                    <!-- column headers -->
                    <thead>
                    <tr>
                        <c:forEach var="columnName" items="${result.columnNames}">
                            <th><span><c:out value="${columnName}"/></span></th>
                            </c:forEach>
                    </tr>
                    </thead>
                    <!-- column data -->
                    <tbody>
                    <c:forEach var="row" items="${result.rowsByIndex}">
                        <tr>
                            <c:forEach var="column" items="${row}">
                                <td class="lalign"><c:out value="${column}"/></td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                        </tbody>
                </table>
               </div>
    </body>
</html>
