<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Product Page - Admin</title>
<jsp:include page="/WEB-INF/views/quantrivien/layout/css.jsp"></jsp:include>

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
	<jsp:include page="/WEB-INF/views/quantrivien/layout/header.jsp"></jsp:include>
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
									href="${base }/add-categories/" role="button">Add
									Categories</a>
							</div>
						</div>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Title</th>
									<th scope="col">Price</th>
									<th scope="col">Category</th>
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
										<td><fmt:setLocale value="vi_VN" scope="session" /> <fmt:formatNumber
												value="${product.price }" type="currency" /></td>
										<td>${product.categories.name }</td>
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
		</div>
	</div>
	<footer class="tm-footer row tm-mt-small">
		<div class="col-12 font-weight-light">
			<p class="text-center text-white mb-0 px-4 small">
				Copyright &copy; <b>2021</b> JavaWeb 16. Design: <a
					rel="nofollow noopener" href="https://templatemo.com"
					class="tm-footer-link">Pham Hoang Long</a>
			</p>
		</div>
	</footer>

	<jsp:include page="/WEB-INF/views/quantrivien/layout/js.jsp"></jsp:include>
	<script>
      
      function DeleteProduct(productId) {
			
		}
	
      $(document).ready(function() {
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