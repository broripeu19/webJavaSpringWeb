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

<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- import SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- include summernote css/js -->

<!-- summernote -->
<link href="${base}/css/summernote-bs4.min.css" rel="stylesheet" />
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">


<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
</head>

<body>
	<jsp:include page="/WEB-INF/views/quantrivien/layout/header.jsp"></jsp:include>
	<div class="container tm-mt-big tm-mb-big">
		<c:if test="${not empty TB }">
			<div class="alert alert-primary" role="alert">${TB }</div>
		</c:if>
		<div class="row">
			<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
				<div class="tm-bg-primary-dark tm-block tm-block-h-auto">

					<div class="row">
						<div class="col-12">
							<h2 class="tm-block-title d-inline-block">Add Product</h2>
						</div>
					</div>
					<div class="row tm-edit-product-row">
						<c:if test="${not empty TB }">
							<div class="alert alert-primary" role="alert">${TB }</div>
						</c:if>
						<div class="col-xl-12 col-lg-12 col-md-12">
							<!-- Dang 2: Spring Form  -->
							<sf:form method="post" action="${base }/admin/add-product"
								modelAttribute="product" enctype="multipart/form-data">
								<sf:hidden path="id" />

								<div class="form-group mb-2">
									<label for="category">Category (required)</label>
									<sf:select path="categories.id"
										class="form-control category-css" id="category">
										<sf:options items="${categories }" itemValue="id"
											itemLabel="name" />
									</sf:select>
								</div>

								<div class="form-group mb-2">
									<label for="title">Title (required)</label>
									<sf:input path="title" autocomplete="off" type="text"
										class="form-control" id="title" placeholder="Title"
										required="required"></sf:input>
								</div>

								<div class="form-group mb-2">
									<label for="price">Price (required)</label>
									<sf:input type="number" autocomplete="off" path="price"
										class="form-control" id="price" placeholder="Price"
										required="required"></sf:input>
								</div>

								<div class="form-group mb-2">
									<label for="priceSale">Price Sale (required)</label>
									<sf:input type="number" autocomplete="off" path="priceSale"
										class="form-control" id="priceSale" placeholder="Price sale"
										required="required"></sf:input>
								</div>

								<div class="form-group mb-2">

									<label for="short_description">Description (required)</label>
									<sf:textarea autocomplete="off" path="shortDes"
										class="form-control " placeholder="Short Description"
										id="short_description" rows="3" required="required"></sf:textarea>
								</div>

								<div class="form-group mb-2">
									<label for="detail_description">Details (required)</label>
									<sf:textarea autocomplete="off" path="details"
										class="form-control " id="detail_description" rows="3"
										required="required"></sf:textarea>
								</div>

								<div class="form-group form-check mb-2">
									<sf:checkbox path="isHot" class="form-check-input" id="isHot" />
									<label class="form-check-label" for="isHot">Is Hot
										Product?</label>
								</div>

								<div class="form-group mb-2">
									<label for="fileProductAvatar">Avatar</label> <input
										id="fileProductAvatar" name="productAvatar" type="file"
										class="form-control">
								</div>


								<div class="form-group mb-2">
									<label for="fileProductPictures">Picture(Multiple)</label> <input
										id="fileProductPictures" name="productPictures" type="file"
										class="form-control" multiple="multiple">
								</div>

								<a href="/admin/products-admin" class="btn btn-secondary active"
									role="button" aria-pressed="true">Back to list</a>
								<button type="submit" class="btn btn-primary">Save
									Product</button>
							</sf:form>

						</div>
					</div>
				</div>
			</div>
		</div>
		<footer class="tm-footer row tm-mt-small">
			<div class="col-12 font-weight-light">
				<p class="text-center text-white mb-0 px-4 small">
					Copyright &copy; <b></b> JAVAWEB 16. Design: <a
						rel="nofollow noopener" href="https://templatemo.com"
						class="tm-footer-link">Phạm Hoàng Long</a>
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
			$('#detail_description').summernote();
		});
	</script>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

</html>
