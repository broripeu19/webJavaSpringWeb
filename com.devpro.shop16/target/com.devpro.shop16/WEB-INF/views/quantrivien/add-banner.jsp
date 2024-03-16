<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Add Product - Dashboard</title>
<jsp:include page="/WEB-INF/views/quantrivien/layout/css.jsp"></jsp:include>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">

<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- import SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>


<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
</head>

<body>
	<jsp:include page="/WEB-INF/views/quantrivien/layout/header.jsp"></jsp:include>
	<div class="container tm-mt-big tm-mb-big">
		<%-- <c:if test="${not empty TB }">
			<div class="alert alert-primary" role="alert">${TB }</div>
		</c:if> --%>
		<div class="row">
			<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
				<div class="tm-bg-primary-dark tm-block tm-block-h-auto">

					<div class="row">
						<div class="col-12">
							<h2 class="tm-block-title d-inline-block">Add Banner</h2>
						</div>
					</div>
					<div class="row tm-edit-product-row">
						<c:if test="${not empty TB }">
							<div class="alert alert-primary" role="alert">${TB }</div>
						</c:if>
						<div class="col-xl-12 col-lg-12 col-md-12">
							<!-- Dang 2: Spring Form  -->
							<sf:form method="post" action="${base }/admin/add-banner"
								modelAttribute="banner" enctype="multipart/form-data">
								<sf:hidden path="id" />
								<div class="form-group mb-2">
									<label for="banner">Banner (required)</label>

									<sf:input type="text" path="name" class="form-control "
										placeholder="banner" id="name" rows="3" />
								</div>

								<div class="form-group mb-2">
									<label for="filebannerPicture">Image</label>
									<input
										id="filebannerPicture" name="bannerPicture" type="file"
										class="form-control">
								</div>

								<a href="/admin/banners-admin" class="btn btn-secondary active"
									role="button" aria-pressed="true">Back to list</a>

								<input type="submit" value="Save Banner"
									class="btn btn-primary">
							</sf:form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer class="tm-footer row tm-mt-small">
			<div class="col-12 font-weight-light">
				<p class="text-center text-white mb-0 px-4 small">
					Copyright &copy; <b>2024</b> All rights reserved. Design: <a
						rel="nofollow noopener" href="https://github.com/broripeu19/webJavaSpringWeb"
						class="tm-footer-link">Template Mo</a>
				</p>
			</div>
		</footer>
	</div>
	<jsp:include page="/WEB-INF/views/quantrivien/layout/js.jsp"></jsp:include>
	<script>
		$(function() {
			$("#expire_date").datepicker();

		});
		$(document).ready(function() {
			$('#short_description').summernote();
		});
	</script>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

</html>
