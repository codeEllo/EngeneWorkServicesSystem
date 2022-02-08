<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="admin.controller.DBConnection"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/engene" user="eng" password="eng"/>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>EngeneWork - The Best Job Community Services</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">


</head>
 <style>
        <%@include file="assets/css/style.css"%>
                <%@include file="assets/css/forum_style.css"%>

        </style>
<body>
        <%@include file="header.jsp"%>
        <br>
        <c:set var="FORUM_ID" value="${param.FORUM_ID}"/> 

        <c:set var="FORUM_MESSAGE" value="${param.FORUM_MESSAGE}"/> 
        <c:set var="AP_ID" value="${param.AP_ID}"/> 
        
        <c:if test="${(FORUM_ID!=null)&&(FORUM_MESSAGE!=null)&&(AP_ID!=null)}" var="result">
            <sql:update var="result" dataSource="${myDatasource}">
                INSERT INTO FORUM VALUES (?,?,?)
                <sql:param value="${FORUM_ID}"/> 
                <sql:param value="${FORUM_MESSAGE}"/> 
                <sql:param value="${AP_ID}"/>
            </sql:update>
        </c:if>
  <main id="main">

      <br>
    <div class="comments-app" ng-app="commentsApp" ng-controller="CommentsController as cmntCtrl">
  <h3>Welcome to Job Community Forum</h3>
  
  <!-- From -->
  <div class="comment-form">
    <!-- Comment Avatar -->
    <div class="comment-avatar">
      <img src="https://i1.wp.com/wilcity.com/wp-content/uploads/2020/06/115-1150152_default-profile-picture-avatar-png-green.jpg?fit=820%2C860&ssl=1">
    </div>

    <form action="forum.jsp" method="POST" class="form" name="form" ng-submit="form.$valid && cmntCtrl.addComment()" novalidate>
    <sql:query var="result" dataSource="${myDatasource}">
          SELECT (max(FORUM_ID)+1) FROM FORUM
      </sql:query>
      <c:set var="id" value="${param.FORUM_ID}"/>
      
      
      <c:forEach var="row" items="${result.rowsByIndex}">
        <c:forEach var="column" items="${row}">
            <input type="hidden" name="FORUM_ID" value="<c:out value="${column}"/>"/>
        </c:forEach>     
    </c:forEach>
        <div class="form-row">
       <textarea name="FORUM_MESSAGE"
                  class="input"
                  ng-model="cmntCtrl.comment.text"
                  placeholder="Add comment..."
                  required></textarea>
       
      
     <!--<input type="text" name="FORUM_MESSAGE" value="TESTS"/>-->
     
     <sql:query var="result" dataSource="${myDatasource}">
          SELECT AP_ID FROM APPLICANT WHERE AP_NAME = '<%=session.getAttribute("name")%>'
        </sql:query>  
          <c:forEach var="row" items="${result.rowsByIndex}">                                          
               <input type="hidden" name="AP_ID" value="${row[0]}" />
             </c:forEach>
     
      </div>
        <div class="form-row">
        <input type="submit" value="Post">
      </div>
    </form>
  </div>

            
            <sql:query var="result" dataSource="${myDatasource}">
            SELECT FORUM.FORUM_MESSAGE, APPLICANT.AP_ID, APPLICANT.AP_NAME, APPLICANT.AP_EMAIL FROM FORUM JOIN APPLICANT ON APPLICANT.AP_ID = FORUM.AP_ID ORDER BY FORUM.FORUM_ID DESC
        </sql:query>  
          <c:forEach var="row" items="${result.rowsByIndex}">
           
    <!-- Comment - Dummy -->
    <div class="comment">
      <!-- Comment Avatar -->
      <div class="comment-avatar">
        <img src="https://moonvillageassociation.org/wp-content/uploads/2018/06/default-profile-picture1-744x744.jpg">
      </div>

    
      <!-- Comment Box -->
      <div class="comment-box">
        <div class="comment-text">${row[0]}</div>
        <div class="comment-footer">
          <div class="comment-info">
            <span class="comment-author">
              <a href="mailto:${row[3]}">${row[2]}</a>
            </span>
            <span class="comment-date">Posted  <script> document.write(new Date().toLocaleDateString()); </script></span>
            
          </div>

          <div class="comment-actions">
            <a href="#">Reply</a>
          </div>
        </div>
      </div>
    </div>  </c:forEach>
    <!-- Comment - Dummy 
    <div class="comment">
      <!-- Comment Avatar 
      <div class="comment-avatar">
        <img src="http://lorempixel.com/200/200/people">
      </div>

      <!-- Comment Box 
      <div class="comment-box">
        <div class="comment-text">Eligendi voluptatum ducimus architecto tempore, quaerat explicabo veniam fuga corporis totam reprehenderit quasi sapiente modi tempora at perspiciatis mollitia, dolores voluptate. Cumque, corrupti?</div>
        <div class="comment-footer">
          <div class="comment-info">
            <span class="comment-author">
              <a href="mailto:ximme13@somedomain.io">Ximme</a>
            </span>
            <span class="comment-date">Jan 31, 1986 11:32:04 PM</span>
          </div>

          <div class="comment-actions">
            <a href="#">Reply</a>
          </div>
        </div>
      </div>-->
      
      
      
    </div>
    </div>
    
    
    

  </main><!-- End #main -->
<%@include file="footer.jsp"%>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  <script src="assets/js/forum.js"></script>
 
  <script>
       n =  new Date();
y = n.getFullYear();
m = n.getMonth() + 1;
d = n.getDate();
document.getElementById("date").innerHTML = m + "/" + d + "/" + y;
      
      
  </script>

</body>

</html>