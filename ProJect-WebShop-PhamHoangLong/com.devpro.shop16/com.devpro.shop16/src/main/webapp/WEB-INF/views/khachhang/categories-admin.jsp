<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Product Page - Admin</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet" href="../css/templatemo-style.css">
<link rel="stylesheet" href="../css/simplePagination.css" />
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
<style type="text/css">
.select-category {
	height: 60px;
}


.keyword-search-product {
	height: 60px;
}

.simplePagination-page {
	margin: auto;
	margin-top: 46px;
}

.dark-theme a, .dark-theme span {
	line-height: 36px;
	padding: 0px 12px;
}

.tm-block-products-css {
	min-height: 800px;
}
</style>
<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- import SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
</head>

<body id="reportsPage">
	<nav class="navbar navbar-expand-xl">

		<div class="container h-100">
			<a class="navbar-brand" href="index-admin">
				<h1 class="tm-site-title mb-0">Shopee Admin</h1>
			</a>
			<button class="navbar-toggler ml-auto mr-0" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars tm-nav-icon"></i>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto h-100">
					<li class="nav-item"><a class="nav-link" href="index-admin">
							<i class="fas fa-tachometer-alt"></i> Dashboard <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="far fa-file-alt"></i> <span>
								Reports <i class="fas fa-angle-down"></i>
						</span>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Daily Report</a> <a
								class="dropdown-item" href="#">Weekly Report</a> <a
								class="dropdown-item" href="#">Yearly Report</a>
						</div></li>
					<li class="nav-item"><a class="nav-link active"
						href="products-admin"> <i class="fas fa-shopping-cart"></i>
							Products
					</a></li>

					<li class="nav-item"><a class="nav-link" href="accounts">
							<i class="far fa-user"></i> Accounts
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-cog"></i> <span>
								Settings <i class="fas fa-angle-down"></i>
						</span>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Profile</a> <a
								class="dropdown-item" href="#">Billing</a> <a
								class="dropdown-item" href="#">Customize</a>
						</div></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link d-block"
						href="login-admin"> Admin, <b>Logout</b>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container mt-5">

		<div class="row tm-content-row">
			<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
				<div
					class="tm-bg-primary-dark tm-block tm-block-products tm-block-products-css">

				
					<!-- Dang 2: Spring Form  -->
					<form class="form-inline" action="${base }/products-admin" method="get">
						<div class="d-flex flex-row justify-content-between mt-4">
							<div class="d-flex flex-row">
								<input type="hidden" id="page" name="page" class="form-control">
								<input type="text" id="keyword" name="keyword"
									class="form-control keyword-search-product"
									placeholder="Search" value="${searchModel.keyword }"
									style="margin-right: 5px;"> <select
									class="form-control select-category" name="categoryId"
									id="categoryId" style="margin-right: 5px;">
									<c:forEach items="${categories}" var="category">
										<option value="${category.id }">${category.name }</option>
									</c:forEach>
								</select>
								<button type="submit" id="btnSearch" name="btnSearch"
									value="Search" class="btn btn-primary">Seach</button>
							</div>
							<div class="add-new-product">
								<a class="btn btn-outline-primary mb-1"
									href="${base }/add-product/" role="button">Add Products</a>
							</div>
							<div class="category-css">
								<a class="btn btn-outline-primary mb-1"
									href="${base }/add-categories/" role="button">Add Categories</a>
							</div>
						</div>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Title</th>
									<th scope="col">Price</th>
									<th scope="col">Category</th>
									<th scope="col">Status</th>
									<th scope="col">Avatar</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${productsWithPaging.data}" var="product"
									varStatus="loop">
									<tr>
										<th scope="row">${loop.index + 1}</th>
										<td>${product.title }</td>
										<td>
											<fmt:setLocale value="vi_VN" scope="session" /> 
											<fmt:formatNumber value="${product.price }" type="currency" />
										</td>
										<td>${product.categories.name }</td>
									
										<td>
											<span id="_product_status_${product.id} }"> 
												<c:choose>
													<c:when test="${product.status }">
														<input type="checkbox" 
															readonly="readonly" checked />
													</c:when>
													<c:otherwise>
														<input type="checkbox" readonly="readonly">
													</c:otherwise>
												</c:choose>
											</span>
										</td>
										<td><img src="${base }/upload/${product.avatar}"
											width="100" height="100"></td>
										<td><a class="btn btn-primary"
											href="${base }/add-product/${product.id}" role="button">Edit</a>
											<button class="btn btn-danger" role="button"
												onclick="DeleteProduct(${product.id})">Delete</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- Paging -->
						<div class="row simplePagination-page">
							<div class="col-12 d-flex justify-content-center">
								<div id="paging"></div>
							</div>
						</div>
					</form>
				</div>

			</div>

			<!-- <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
				<div class="tm-bg-primary-dark tm-block tm-block-product-categories">
					<h2 class="tm-block-title">Product Categories</h2>
					<div class="tm-product-table-container">
						<table class="table tm-table-small tm-product-table">
							<tbody>
								<tr>
									<td class="tm-product-name">Product Category 1</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 2</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 3</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 4</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 5</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 6</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 7</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 8</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 9</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 10</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 11</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					table container
					<button class="btn btn-primary btn-block text-uppercase mb-3">
						Add new category</button>
				</div>
			</div> -->
		</div>
	</div>
	<footer class="tm-footer row tm-mt-small">
		<div class="col-12 font-weight-light">
			<p class="text-center text-white mb-0 px-4 small">
				Copyright &copy; <b>2018</b> All rights reserved. Design: <a
					rel="nofollow noopener" href="https://templatemo.com"
					class="tm-footer-link">Template Mo</a>
			</p>
		</div>
	</footer>

	<script src="../js/jquery-3.3.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.simplePagination.js"></script>
	<!-- https://getbootstrap.com/ -->
	<script>
      $(function() {
        $(".tm-product-name").on("click", function() {
          window.location.href = "edit-product";
        });
      });
      
      function DeleteProduct(productId) {
			
		}
	
		$( document).ready(function() {
			$("#categoryId").val(${searchModel.categoryId});
			$("#paging").pagination({
				currentPage: ${productsWithPaging.currentPage},
		        items: ${productsWithPaging.totalItems},
		        itemsOnPage: 4,
		        cssStyle: 'dark-theme',
		        onPageClick: function(pageNumber, event) {
		        	$('#page').val(pageNumber);
		        	$('#btnSearch').trigger('click');
				},
		    });
		});
    </script>
</body>
</html>