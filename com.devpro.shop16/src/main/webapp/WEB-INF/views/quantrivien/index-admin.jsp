<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Product Admin - Dashboard</title>

<jsp:include page="/WEB-INF/views/quantrivien/layout/css.jsp"></jsp:include>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- import SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
</head>

<body id="reportsPage">
	<div class="" id="home">
		<jsp:include page="/WEB-INF/views/quantrivien/layout/header.jsp"></jsp:include>
		<div class="container">
			<div class="row">
				<div class="col">
					<p class="text-white mt-5 mb-5">
						Welcome back, <b>Admin</b>
					</p>
				</div>
			</div>
			<!-- row -->
			<div class="row tm-content-row">
				<div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
					<div class="tm-bg-primary-dark tm-block">
						<h2 class="tm-block-title">Latest Hits</h2>
						<canvas id="lineChart"></canvas>
					</div>
				</div>
				<div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
					<div class="tm-bg-primary-dark tm-block">
						<h2 class="tm-block-title">Performance</h2>
						<canvas id="barChart"></canvas>
					</div>
				</div>
				<div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
					<div class="tm-bg-primary-dark tm-block tm-block-taller">
						<h2 class="tm-block-title">Storage Information</h2>
						<div id="pieChartContainer">
							<canvas id="pieChart" class="chartjs-render-monitor" width="200"
								height="200"></canvas>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
					<div
						class="tm-bg-primary-dark tm-block tm-block-taller tm-block-overflow">
						<h2 class="tm-block-title">Notification List</h2>
						<div class="tm-notification-items">
							<div class="media tm-notification-item">
								<div class="tm-gray-circle">
									<img src="../imgs/notification-01.jpg" alt="Avatar Image"
										class="rounded-circle">
								</div>
								<div class="media-body">
									<p class="mb-2">
										<b>Jessica</b> and <b>6 others</b> sent you new <a href="#"
											class="tm-notification-link">product updates</a>. Check new
										orders.
									</p>
									<span class="tm-small tm-text-color-secondary">6h ago.</span>
								</div>
							</div>
							<div class="media tm-notification-item">
								<div class="tm-gray-circle">
									<img src="../imgs/notification-02.jpg" alt="Avatar Image"
										class="rounded-circle">
								</div>
								<div class="media-body">
									<p class="mb-2">
										<b>Oliver Too</b> and <b>6 others</b> sent you existing <a
											href="#" class="tm-notification-link">product updates</a>.
										Read more reports.
									</p>
									<span class="tm-small tm-text-color-secondary">6h ago.</span>
								</div>
							</div>
							<div class="media tm-notification-item">
								<div class="tm-gray-circle">
									<img src="../imgs/notification-03.jpg" alt="Avatar Image"
										class="rounded-circle">
								</div>
								<div class="media-body">
									<p class="mb-2">
										<b>Victoria</b> and <b>6 others</b> sent you <a href="#"
											class="tm-notification-link">order updates</a>. Read order
										information.
									</p>
									<span class="tm-small tm-text-color-secondary">6h ago.</span>
								</div>
							</div>
							<div class="media tm-notification-item">
								<div class="tm-gray-circle">
									<img src="imgs/notification-01.jpg" alt="Avatar Image"
										class="rounded-circle">
								</div>
								<div class="media-body">
									<p class="mb-2">
										<b>Laura Cute</b> and <b>6 others</b> sent you <a href="#"
											class="tm-notification-link">product records</a>.
									</p>
									<span class="tm-small tm-text-color-secondary">6h ago.</span>
								</div>
							</div>
							<div class="media tm-notification-item">
								<div class="tm-gray-circle">
									<img src="../imgs/notification-02.jpg" alt="Avatar Image"
										class="rounded-circle">
								</div>
								<div class="media-body">
									<p class="mb-2">
										<b>Samantha</b> and <b>6 others</b> sent you <a href="#"
											class="tm-notification-link">order stuffs</a>.
									</p>
									<span class="tm-small tm-text-color-secondary">6h ago.</span>
								</div>
							</div>
							<div class="media tm-notification-item">
								<div class="tm-gray-circle">
									<img src="../imgs/notification-03.jpg" alt="Avatar Image"
										class="rounded-circle">
								</div>
								<div class="media-body">
									<p class="mb-2">
										<b>Sophie</b> and <b>6 others</b> sent you <a href="#"
											class="tm-notification-link">product updates</a>.
									</p>
									<span class="tm-small tm-text-color-secondary">6h ago.</span>
								</div>
							</div>
							<div class="media tm-notification-item">
								<div class="tm-gray-circle">
									<img src="../imgs/notification-01.jpg" alt="Avatar Image"
										class="rounded-circle">
								</div>
								<div class="media-body">
									<p class="mb-2">
										<b>Lily A</b> and <b>6 others</b> sent you <a href="#"
											class="tm-notification-link">product updates</a>.
									</p>
									<span class="tm-small tm-text-color-secondary">6h ago.</span>
								</div>
							</div>
							<div class="media tm-notification-item">
								<div class="tm-gray-circle">
									<img src="../imgs/notification-02.jpg" alt="Avatar Image"
										class="rounded-circle">
								</div>
								<div class="media-body">
									<p class="mb-2">
										<b>Amara</b> and <b>6 others</b> sent you <a href="#"
											class="tm-notification-link">product updates</a>.
									</p>
									<span class="tm-small tm-text-color-secondary">6h ago.</span>
								</div>
							</div>
							<div class="media tm-notification-item">
								<div class="tm-gray-circle">
									<img src="../imgs/notification-03.jpg" alt="Avatar Image"
										class="rounded-circle">
								</div>
								<div class="media-body">
									<p class="mb-2">
										<b>Cinthela</b> and <b>6 others</b> sent you <a href="#"
											class="tm-notification-link">product updates</a>.
									</p>
									<span class="tm-small tm-text-color-secondary">6h ago.</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 tm-block-col">
					<div
						class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
						<h2 class="tm-block-title">Orders List</h2>
						<!-- Dang 2: Spring Form  -->
						<form class="form-inline" action="${base }/admin/saleorders-admin" method="get">
							<table class="table table-striped">
								<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Mã đơn hàng</th>
									<th scope="col">Hình ảnh</th>
									<th scope="col">Tên sản phẩm</th>
									<th scope="col">Người đặt</th>
									<th scope="col">Địa chỉ</th>
									<th scope="col">Trạng thái</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${orderProductWithPaging.data }" var="saleOrderProduct"
										   varStatus="loop">
									<tr>
										<th scope="row">${loop.index + 1}</th>
										<td>${saleOrderProduct.saleOrder.code }</td>
										<td><img src="${base }/upload/${saleOrderProduct.product.avatar}"
												 alt="" width="70" class="img-fluid rounded shadow-sm"></td>
										<td>${saleOrderProduct.product.title }</td>
										<td>${saleOrderProduct.saleOrder.customerName }</td>
										<td>${saleOrderProduct.saleOrder.customerAddress }</td>
										<c:if test="${!saleOrderProduct.saleOrder.status}">
											<td>Đã Xác Nhận</td>
										</c:if>
										<c:if test="${saleOrderProduct.saleOrder.status}">
											<td>Chờ xác nhận</td>
										</c:if>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</form>
					</div>
				</div>
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
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="../js/jquery-3.3.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script src="../js/moment.min.js"></script>
	<!-- https://momentjs.com/ -->
	<script src="../js/Chart.min.js"></script>
	<!-- http://www.chartjs.org/docs/latest/ -->
	<script src="../js/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->
	<script src="../js/tooplate-scripts.js"></script>
	<script>
		Chart.defaults.global.defaultFontColor = 'white';
		let ctxLine, ctxBar, ctxPie, optionsLine, optionsBar, optionsPie, configLine, configBar, configPie, lineChart;
		barChart, pieChart;
		// DOM is ready
		$(function() {
			drawLineChart(); // Line Chart
			drawBarChart(); // Bar Chart
			drawPieChart(); // Pie Chart

			$(window).resize(function() {
				updateLineChart();
				updateBarChart();
			});
		})
	</script>
</body>

</html>