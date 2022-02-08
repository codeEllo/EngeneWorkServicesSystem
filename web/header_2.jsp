<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="admin.controller.DBConnection"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/engene" user="eng" password="eng"/>
   <sql:query var="result" dataSource="${myDatasource}">
          SELECT AP_NAME FROM APPLICANT WHERE AP_NAME = '<%=session.getAttribute("name")%>'
        </sql:query>  
         


  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center justify-content-between">
      <h1 class="logo"><a href="homepage.jsp">EngeneWork</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="homepage.jsp">Home</a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#Jobs.jsp">Jobs</a></li>
          <li><a href="forum_2.jsp">Forum</a></li>
          <!--<li><a href="myAccount.jsp">My Account</a></li>         
          <li> <a class="nav-link scrollto active"></a></li>
          <li><a class="getstarted scrollto" href="LogoutServlet">Sign Out</a></li>-->
          <li><a class="getstarted scrollto" href="RegistrationApp.jsp">Sign Up</a></li>
          <li><a class="getstarted scrollto" href="LoginApp.jsp">Login</a></li>
          
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
  
