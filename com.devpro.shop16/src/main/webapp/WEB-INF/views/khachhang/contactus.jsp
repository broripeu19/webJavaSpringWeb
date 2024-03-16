<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 <!-- import JSTL -->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	

	<!-- import SPRING-FORM -->
	<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700,900&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="../css/contacus.css">

    <title>Contact USS</title>
    
   
  </head>
  <body>
  

  <div class="content">
   	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <div class="container">
    	<c:if test="${not empty TB }">
			<div class="alert alert-primary" role="alert">
				${TB }
			</div>
		</c:if>
		<c:if test="${not empty ERROR }">
				        	<div class="alert alert-danger" role="alert">
								${ERROR }
							</div>
		</c:if>
      <div class="row align-items-stretch no-gutters contact-wrap">
        <div class="col-md-12">
          <div class="form h-100">
            <h3>Contact US</h3>
            <!-- Dạng 1 -->
         	<%--   
         	 <form class="mb-5" method="post" action="${base }/contactus" id="contactForm" name="contactForm">
              <div class="row">
                <div class="col-md-6 form-group mb-3">
                  <label for="" class="col-form-label">Name *</label>
                  <input type="text" class="form-control" name="name" id="name" placeholder="Your name">
                </div>
                <div class="col-md-6 form-group mb-3">
                  <label for="" class="col-form-label">Email *</label>
                  <input type="email" class="form-control" name="email" id="email"  placeholder="Your email">
                </div>
              </div>

              <div class="row">
                <div class="col-md-12 form-group mb-3">
                  <label for="message" class="col-form-label">Message *</label>
                  <textarea class="form-control" name="message" id="message" cols="30" rows="4"  placeholder="Write your message"></textarea>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <input type="submit" value="Send Message" class="btn btn-primary rounded-0 py-2 px-4">
                  <span class="submitting"></span>
                </div>
              </div>
            </form>
             --%>
            
            <!-- Dạng 2 -->
              <sf:form modelAttribute="contactus" class="mb-5" method="post" action="${base }/contactus"  enctype="multipart/form-data">
	              <div class="row">
	                <div class="col-md-6 form-group mb-3">
	                  <label for="" class="col-form-label">Name *</label>
	                  <sf:input path="name" type="text" class="form-control" name="name" id="name" placeholder="Your name"/>
	                </div>
	                <div class="col-md-6 form-group mb-3">
	                  <label for="" class="col-form-label">Email *</label>
	                  <sf:input path="email" type="email" class="form-control" name="email" id="email"  placeholder="Your email"/>
	                </div>
	              </div>
				  <div class="row">
	                <div class="col-md-12 form-group mb-3">
	                  <label for="" class="col-form-label">Upload *</label>
	                  <input type="file" class="form-control" name="attach" id="attach" cols="30" rows="4"> 
	                </div>
	              </div>
	              <div class="row">
	                <div class="col-md-12 form-group mb-3">
	                  <label for="message" class="col-form-label">Message *</label>
	                  <sf:textarea path="message" class="form-control" name="message" id="message" cols="30" rows="4"  placeholder="Write your message"></sf:textarea>
	                </div>
	              </div>
	              <div class="row">
	                <div class="col-md-12 form-group">
	                  <input type="submit" value="Send Message" class="btn btn-primary rounded-0 py-2 px-4">
	                  <span class="submitting"></span>
	                  <a href="${base}/index"><input value="Return" class="btn btn-primary rounded-0 py-2 px-4"></a>
	                  
	                </div>
	                
	              </div>
            </sf:form> 
            <!-- -------Dạng 3 : AJAX---------- -->
            
             <%-- <form class="mb-5" method="post" action="${base }/contactus" id="contactForm" name="contactForm">
              <div class="row">
                <div class="col-md-6 form-group mb-3">
                  <label for="" class="col-form-label">Name *</label>
                  <input type="text" class="form-control" name="name" id="name" placeholder="Your name">
                </div>
                <div class="col-md-6 form-group mb-3">
                  <label for="" class="col-form-label">Email *</label>
                  <input type="email" class="form-control" name="email" id="email"  placeholder="Your email">
                </div>
              </div>

              <div class="row">
                <div class="col-md-12 form-group mb-3">
                  <label for="message" class="col-form-label">Message *</label>
                  <textarea class="form-control" name="message" id="message" cols="30" rows="4"  placeholder="Write your message"></textarea>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <input type="button" onclick="contact('${base}')" value="Send Message" class="btn btn-primary rounded-0 py-2 px-4">
                  <span class="submitting"></span>
                </div>
              </div>
            </form> --%>
			
            <div id="form-message-warning mt-4"></div> 
            <div id="form-message-success">
              Your message was sent, thank you!
            </div>

          </div>
        </div>
      </div>
    </div>

  </div>

  </body>
  <script src="../js/customer_scripts.js">
  
  </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</html>