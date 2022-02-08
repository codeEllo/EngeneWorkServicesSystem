<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="admin.controller.DBConnection"%>
<!DOCTYPE html>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/engene" user="eng" password="eng"/>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>EngeneWork - Job Finding Community Services</title>
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
        </style>
<body>
        <%@include file="header.jsp"%>

        
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
               
    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Edit Profile</h2>
          <!--<p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
       --> </div>
        <div class="row">
          <div class="col-lg-6">
            <div class="info-box mb-4">
              <i class="bx bx-envelope"></i>
              <h3><a href="#applicationStatus.jsp">Application Status</a></h3>
          <sql:query var="result" dataSource="${myDatasource}">
            SELECT APPLICATION.APP_STATUS,APPLICANT.AP_NAME
            FROM  APPLICATION
            JOIN APPLICANT
            ON  APPLICANT.AP_ID= APPLICATION.AP_ID
            WHERE APPLICANT.AP_NAME = '<%=session.getAttribute("name")%>'
        </sql:query>  
          <c:forEach var="row" items="${result.rowsByIndex}">                                          
              <p> ${row[0]}</p>
             </c:forEach>
            </div>
          </div>

               <sql:query var="result" dataSource="${myDatasource}">
                    SELECT APPLICATION.APP_STATUS,APPLICANT.AP_ID,APPLICANT.AP_NAME,APPLICANT.AP_DOB,APPLICANT.AP_PHNUM, APPLICANT.AP_EMAIL,
                    APPLICANT.AP_PASS,APPLICANT.AP_AB,APPLICANT.AP_EB 
                    FROM  APPLICATION
                    JOIN APPLICANT
                    ON  APPLICANT.AP_ID= APPLICATION.AP_ID
                    WHERE APPLICANT.AP_NAME = '<%=session.getAttribute("name")%>'
                </sql:query>  
          <c:forEach var="row" items="${result.rowsByIndex}"> 
          <div class="col-lg-3 col-md-6">
            <div class="info-box  mb-4">
              <i class="bx bx-map"></i>
              <h3>Name</h3>
              <p>${row[2]}</p>
            </div>
          </div>

          <div class="col-lg-3 col-md-6">
            <div class="info-box  mb-4">
              <i class="bx bx-phone-call"></i>
              <h3>Email</h3>
              <p>${row[5]}</p>
            </div>
          </div>
        </div>
            
       <div class="row">
   
           <form action="myAccount.jsp" method="POST" role="form"> 
               <div class="php-email-form" >
         <center> <div class="col-lg-6" >
                <div class="form-group mt-3">
                <input type="text" class="form-control" name="AP_NAME" value='${row[2]}' >
             <br></div> 
                
                <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="AP_DOB" class="form-control" value= '${row[3]}'>
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="text" class="form-control" name="AP_PHNUM" value= '${row[4]}'>
                </div>
              </div>
                <br>
                <div class="row">
                <div class="col-md-6 form-group">
                  <input type="email" name="AP_EMAIL" class="form-control" value= '${row[5]}'>
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="password" class="form-control" name="AP_PASS" value='${row[6]}'>
                </div>
              </div>
              <div class="form-group mt-3">
                <textarea class="form-control" type="text" name="AP_AB" rows="5">${row[7]}</textarea>
              </div>
                
              <div class="form-group mt-3">
                <textarea class="form-control" name="AP_EB" rows="5">${row[8]}</textarea>
                <input type="hidden" name="AP_ID" value='${row[1]}' />
              </div>
              <br>
              
              <div class="text-center"><button type="submit" onclick="demo()">Update</button></div>
             </div></center></div>
             </form>
      </div>
              </c:forEach>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->
<%@include file="footer.jsp"%>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <div id="preloader"></div>

  <script>
function demo() {
alert("Are you sure want to update? \n\
\n\
All the detail in your application will be changed.");
}
</script>
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

</body>

</html>