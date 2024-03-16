<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Start Bootstrap Template</title>

<!-- COMMON -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<!-- CSS -->
<jsp:include
	page="/WEB-INF/views/khachhang/layoutproducts/cssproducts.jsp"></jsp:include>
</head>

<body>

	<!-- Navigation-->
	<jsp:include page="/WEB-INF/views/khachhang/layout/header.jsp"></jsp:include>

	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">

			<!-- Shopping cart table -->
			<div class="table-responsive bg-light shoping-cart-table">
				<table class="table">
					<thead>
						<tr>
							<th scope="col" class="border-0 bg-white">
								<div class="p-2 px-3 text-uppercase">Sản Phẩm</div>
							</th>
							<th scope="col" class="border-0 bg-white">
								<div class="py-2 text-uppercase">Giá</div>
							</th>
							<th scope="col" class="border-0 bg-white">
								<div class="py-2 text-uppercase">Số Lượng</div>
							</th>
							<th scope="col" class="border-0 bg-white">
								<div class="py-2 text-uppercase">Xóa</div>
							</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${cart.cartItems }" var="ci">
							<tr>
								<th scope="row" class="border-0">
									<div class="p-2">
										<img src="${base}/upload/${ci.productAvatar}" alt="" width="70" class="img-fluid rounded shadow-sm">

										<div class="ml-3 d-inline-block align-middle">
											<h5 class="mb-0">
												<a href="#" class="text-des-none text-dark d-inline-block align-middle">
													${ci.productName }
												</a>
											</h5>

										</div>
									</div>
								</th>
								<td class="border-0 align-middle">
									<strong>${ci.priceUnit }</strong>
								</td>
								<td class="border-0 align-middle">
									<button onclick="RemoveQualityCart('${base }',${ci.productId })" class="button-price" value="-">-</button>
									<strong><span id="quality_${ci.productId }">${ci.quanlity }</span></strong>
									<button onclick="UpdateQualityCart('${base }',${ci.productId })" class="button-price" value="+">+</button>
								</td>
								<td class="border-0 align-middle">
								
									<form action="${base }/cart" method="post">
										<a href="${base }/cart/remove/${ci.productId }" onclick="XACNHAN(${ci.productId})"  class="text-dark"><i class="fa fa-trash"></i></a>
									</form>
									
								</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</div>
			<!-- End -->

			<form action="${base }/cart/checkout" method="post">
			
				<div class="row py-5 p-4 bg-white rounded shadow-sm">
					<div class="col-lg-6">
						<div
							class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Mã Giảm Giá</div>
						<div class="p-4">
							<p class="font-italic mb-4">Nếu bạn có mã phiếu giảm giá, vui lòng nhập nó vào ô dưới đây
							<div class="input-group mb-4 border rounded-pill p-2">
								<input type="text" placeholder="Apply coupon"
									aria-describedby="button-addon3" class="form-control border-0">
								<div class="input-group-append border-0">
									<button id="button-addon3" type="button"
										class="btn btn-dark bg-orange px-4 rounded-pill">
										<i class="fa fa-gift mr-2"></i> Voucher
									</button>
								</div>
							</div>
						</div>
						<div
							class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thông Tin Giao Hàng</div>
						<div class="p-4">
							<div class="form-group">
								<label for="customerPhone">Tên đầy đủ của bạn</label>
								<input type="tel" class="form-control" id="customerFullName" name="customerFullName" placeholder="Họ và tên" value="${userLogined.username }">
							</div>
							<div class="form-group">
								<label for="customerEmail">Địa chỉ Email</label>
								<input type="email" class="form-control" id="customerEmail" name="customerEmail" placeholder="Email" value="${userLogined.email }">
								<small id="emailHelp" class="form-text text-muted">Chúng tôi sẽ không bao giờ chia sẻ email với bất kỳ ai khác.</small>
							</div>
							<div class="form-group">
								<label for="customerPhone">Số điện thoại</label>
								<input type="tel" class="form-control" id="customerPhone" name="customerPhone" placeholder="Số điện thoại">
							</div>
							<div class="form-group">
								<label for="customerAddress">Địa chỉ nhận hàng</label>
								<input type="text" class="form-control" id="customerAddress" name="customerAddress" placeholder="Địa chỉ ">
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div
							class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Tóm Tắt Theo Thứ Tự</div>
						<div class="p-4">
							<p class="font-italic mb-4">Chi phí vận chuyển và chi phí bổ sung được tính dựa trên các giá trị bạn đã nhập.</p>
							<ul class="list-unstyled mb-4">
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">Tổng tiền sản phẩm </strong><strong>${cart.totalPrice }</strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">Vận chuyển và xử lý</strong><strong>10000.00 đ</strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">Thuế</strong><strong>0.00 đ</strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">Tổng Chi Phí</strong>
									<h5 class="font-weight-bold">${cart.totalPrice +10000 } đ</h5></li>
							</ul>
							<button type="submit" onclick="XACNHANTHANHTOAN()" class="btn btn-dark bg-orange rounded-pill py-2 btn-block ">Thanh toán</button>
							<a class="btn btn-dark bg-orange rounded-pill py-2 btn-block " href="https://sandbox.vnpayment.vn/tryitnow/Home/CreateOrder"> Thanh toán Online</a>
						</div>
					</div>
				</div>

			</form>

		</div>

	</section>

	<!-- Footer-->
	 <jsp:include page="/WEB-INF/views/khachhang/layout/footer.jsp"></jsp:include>

	<!-- JS -->
<jsp:include
	page="/WEB-INF/views/khachhang/layoutproducts/jsproducts.jsp"></jsp:include>
	
</body>
<style>
	.shoping-cart-table > table > tbody{
		box-shadow: 0px 1px 5px #ccc;
	}
	.clearfix:after {
		display:block;
		clear:both;
	}
	.wrapper {
		width:100%;
		box-shadow:0px 1px 3px rgba(0,0,0,0.2);
		background:#0a68ff;
	}

	/*----- Phần menu -----*/
	/* .menu {
        width:1000px;
        margin:0px auto;
        background:#bf5c71;
        height: 50px;
        margin-top: 150px;
    } */
	.menu li {
		margin:0px;
		list-style:none;
		font-family:'Ek Mukta';
	}
	.menu a {
		transition:all linear 0.15s;
		color:#919191;
		text-decoration:none;
	}
	.menu li:hover > a, .menu .current-item > a {
		text-decoration: none;
		color: #444343;
	}
	.menu .arrow {
		font-size:11px;
		line-height:0%;
	}
	/*----- css cho phần menu cha -----*/
	.menu > ul > li {
		float: left;
		display: inline-block;
		position: relative;
		font-size: 14px;
		font-family: revert;
		text-transform: capitalize;
	}
	.menu > ul > li > a {
		display:inline-block;
		color:white;
	}
	/* .menu > ul > li:hover > a, .menu > ul > .current-item > a {
        background:#2e2728;
    } */
	/*----css cho menu con----*/
	.menu li:hover .sub-menu {
		z-index: 1;
		opacity: 1;
		background: #fff;
		border-radius: 6px;
		box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
	}
	.sub-menu {
		width:170%;
		padding:5px 0px;
		position:absolute;
		top:100%;
		left:0px;
		z-index:-1;
		opacity:0;

	}
	.sub-menu li {
		display: block;
		font-size: 16px;
		border: #CFE;
	}
	.sub-menu li:hover{
		background-color: #0a68ff;
	}
	.sub-menu li a:hover{
		color: #ffffff;
	}
	.sub-menu li a {
		color: #000000;
		padding:10px 30px;
		display:block;
	}



	.shopee-header-content-cart {
		margin-left: 50px;
	}

	.search-for-categories {
		margin-bottom: 16px;
	}
	._1AKybG {
		width: 100%;
		margin-top: 1.25rem;
		text-align: center;
		margin-bottom: 1.25rem;
	}
	._1J-Y2w {
		min-width: 24.375rem;
		height: 2.5rem;
	}
	.btn-light--link {
		color: #0a68ff;
	}
	.btn-light {
		background: #fff;
		color: #555;
		border: 1px solid rgba(0,0,0,.09);
		box-shadow: 0 1px 1px 0 rgb(0 0 0 / 3%);
	}

	element.style {
	}
	._1J-Y2w {
		min-width: 24.375rem;
		height: 2.5rem;
	}
	.btn-light--link {
		color: #555;
	}
	.btn-light {
		background: #fff;
		color: #555;
		border: 1px solid rgba(0,0,0,.09);
		box-shadow: 0 1px 1px 0 rgb(0 0 0 / 3%);
	}
	.btn--m {
		height: 40px;
		padding: 0 60px;
		min-width: 70px;
		max-width: 220px;
		padding-top: 6px;
	}
	.btn--inline {
		display: inline-flex;
	}
	.btn-light:active, .btn-light:hover {

	}
</style>

</html>
