
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
<script>
function afterApply(){
alert ( "This position will require you to fulfill the duties and obligations outlined in the attached job description, and you will be required to work until the deadline of the project. \n\
\n\
I certify that all the personal information contained in this account is accurate.\n\
\n\
Go to your account to check the application status and more." );
return true;
}
</script>
</head>
 <style>
        <%@include file="assets/css/style.css"%>
        </style>
<body>
    
      

 <%@include file="header.jsp"%>
 
    <!-- ======= Pricing Section ======= -->
    <section id="pricing" class="pricing section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
        </div>
          
        <c:set var="APP_ID" value="${param.APP_ID}"/> 
        <c:set var="AD_ID" value="${param.AD_ID}"/> 
        <c:set var="AP_ID" value="${param.AP_ID}"/>
        <c:set var="JOB_ID" value="${param.JOB_ID}"/>        
        <c:set var="APP_STATUS" value="${param.APP_STATUS}"/>
        
        <c:if test="${(APP_ID!=null)&&(AD_ID!=null)&&(AP_ID!=null)&&(JOB_ID!=null)&&(APP_STATUS!=null)}" var="result">
            <sql:update var="result" dataSource="${myDatasource}">
                INSERT INTO APPLICATION (APP_ID,AD_ID,AP_ID,JOB_ID,APP_STATUS) VALUES (?,?,?,?,?)
               
                <sql:param value="${APP_ID}"/> 
                <sql:param value="${AD_ID}"/> 
                <sql:param value="${AP_ID}"/>
                <sql:param value="${JOB_ID}"/>               
               <sql:param value="${APP_STATUS}"/>

            </sql:update>
        </c:if>
         <form action="Jobs.jsp" method="POST" onsubmit="return afterApply();">
            <c:set var="APP_ID" value="${param.APP_ID}"/>      
            <c:set var="AD_ID" value="${param.AD_ID}"/>   
            <c:set var="AP_ID" value="${param.AP_ID}"/>  
            <c:set var="JOB_ID" value="${param.AD_NAME}"/> 
            <c:set var="APP_STATUS" value="${param.APP_STATUS}"/>
            
   <div class="row">           
             <%
                Connection con = null;
                Statement st = null;
             
                con = DBConnection.createConnection();
                st = con.createStatement();
           
                String sql = "SELECT * FROM JOB";
                ResultSet rs = st.executeQuery(sql);
                while(rs.next()){
            %>  
          <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="100">
            
        <sql:query var="result" dataSource="${myDatasource}">
          SELECT (max(APP_ID)+1) FROM APPLICATION
        </sql:query>  
          <c:forEach var="row" items="${result.rowsByIndex}">                                          
               <input type ="hidden" name="APP_ID" value="${row[0]}"/> 
            </c:forEach>
               
             <sql:query var="result" dataSource="${myDatasource}">
          SELECT AP_ID FROM APPLICANT WHERE AP_NAME = '<%=session.getAttribute("name")%>'
        </sql:query>  
          <c:forEach var="row" items="${result.rowsByIndex}">                                          
               <input type="hidden" name="AP_ID" value="${row[0]}" />
             </c:forEach>
               
               
              <input type="hidden" name="AD_ID" value="5" />
              <input type="hidden" name="JOB_ID" value="<%= rs.getInt("JOB_ID")%>" />
             <input type="hidden" name="APP_STATUS" value="PENDING" />

              <div class="box">
                  
                   <c:forEach var="column" items="${row}">
             <input type="text" name="APP_ID" value="<c:out value="${column}"/>"/>
            </c:forEach> 
              <h3><%= rs.getString("JOB_NAME")%></h3>
              <h4><sup>RM</sup><%= rs.getString("JOB_PRICING")%><span> / project</span></h4>
              <ul>
                <li><%= rs.getString("JOB_DESC")%></li>
              </ul>
              <div class="btn-wrap">
                  <input class="btn-buy" type="submit" value="APPLY" />
              </div>
            </div>
          </div>
           <%  } 

%>


        </div>
   </form>
                     
           

      </div>
    </section><!-- End Pricing Section -->
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
 
    
</body>

</html>