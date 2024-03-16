<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!-- begin: header------------------------------------------------------------------------- -->
<div class="header container-fluid">
	<%--     <c:if test="${not empty TB }">
								<div class="alert alert-primary" role="alert">
									${TB }
								</div>
	</c:if> --%>
	<div class="container">
		<div class="row header-row">
			<nav class="nav font-size-nav shopee-header-top col">
				<a class="nav-link shopee-header-top-hover " href="#">Kênh người
					bán</a> <a class="nav-link shopee-header-top-hover" href="#">Trở
					thành Người bán Shopee</a> <a
					class="nav-link appliacation-qr shopee-header-top-hover" href="#">Tải
					ứng dụng
					<div class="qrcode-app">
						<img src="../imgs/QRcode-application-shopee.png"
							class="qrcode-app-img" alt="">
						<div class="d-flex">
							<img src="../imgs/ch_play.png" class="qrcode-app-sub-img" alt="">
							<img src="../imgs/apstore.png" class="qrcode-app-sub-img" alt="">
						</div>
					</div>
				</a> <a class="nav-link shopee-header-top-hover" href="#"> Kết nối <svg
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                            <path
							d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
                        </svg> <svg xmlns="http://www.w3.org/2000/svg"
						width="16" height="16" fill="currentColor" class="bi bi-instagram"
						viewBox="0 0 16 16">
                            <path
							d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z" />
                        </svg>
				</a>
			</nav>
			<nav
				class="nav font-size-nav shopee-header-top col justify-content-end">
				<a class="nav-link" href="#"> <svg
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
                            <path
							d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
                        </svg> Thông Báo
				</a> <a class="nav-link" href="${base}/contactus"> <svg
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-question-circle"
						viewBox="0 0 16 16">
                            <path
							d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                            <path
							d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
                        </svg> Liên Hệ
				</a>
				<c:if test="${isLogined }">
					<nav class="menu">
						<ul class="nav-link">
							<li>
								<a href="#">${userLogined.username }</a>

								<ul class="sub-menu">
									<li><a href="${base}/purchase-all">Đơn hàng</a></li>
									<li><a href="${base}/logout">Đăng xuất</a></li>
								</ul>
							</li>

						</ul>
					</nav>
				</c:if>
				<c:if test="${!isLogined }">
					<a class="nav-link" href="${base}/signup">Đăng Ký</a> 
					<a class="nav-link" href="${base}/login">Đăng Nhập</a>
				</c:if>
			</nav>
		</div>
		<div class="row">
			<div class="col col-2 shopee-header-logo">
				<a href="${base }/home"
					class="text-light text-decoration-none justify-content-center">
					<p>MATE 95<span class="ordinal">st</span></p>
				</a>
			</div>
			<div class="col col-8 shopee-header-content-search">
				<a href="${base }/home">
					<form class="d-flex form-search">
						<input class="form-control me-2" type="search" id="keyword" name="keyword" value="${searchModel.keyword }"
							   placeholder="Lấy thêm 5 mã freeship 0Đ "
							   aria-label="Lấy thêm 5 mã freeship 0Đ">
						<select
								class="form-control select-category" name="categoryId"
								id="categoryId" style="margin-right: 5px;border: 1px solid #86b7fe;box-shadow: 0px 3px 20px 0.25rem rgba(13, 110, 253, 0.25);">
							<option value="${searchModel.keyword }">Tất cả</option>
							<c:forEach items="${categories}" var="category">
								<c:if test="${category.status == true}">
									<option value="${category.id }">${category.name }</option>
								</c:if>
							</c:forEach>
						</select>
						<button class="btn btn-outline-success btn-design-hover"
							type="submit">

								<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
								fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
									<path
									d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
								</svg>

						</button>
					</form>
				</a>
				<ul class="nav shopee-nav-search">
					<li class="nav-item"><a class="nav-link text-light" href="#">Ba
							lô</a></li>
					<li class="nav-item"><a class="nav-link text-light" href="#">Váy</a>
					</li>
					<li class="nav-item"><a class="nav-link text-light" href="#">Áo
							khoác</a></li>
					<li class="nav-item"><a class="nav-link text-light" href="#">Quần</a>
					</li>
					<li class="nav-item"><a class="nav-link text-light" href="#">Áo
							phông</a></li>
					<li class="nav-item"><a class="nav-link text-light" href="#">Bông
							tẩy trang</a></li>
					<li class="nav-item"><a class="nav-link text-light" href="#">Áo
							croptop</a></li>
					<li class="nav-item"><a class="nav-link text-light" href="#">Nồi
							chiên không dầu</a></li>
				</ul>
			</div>
			<div class="col col-1 shopee-header-content-cart">
				<div>
					<a href="${base}/cart/view" class="cart-a-css"> <span
						id="iconShowTotalItemsInCart"
						class="badge cartItem-css ms-1 rounded-pill">
							${totalItems } </span> <svg xmlns="http://www.w3.org/2000/svg"
							width="30" fill="currentColor"
							class="bi bi-cart text-light shopee-header-cart"
							viewBox="0 0 16 16">
	                        <path
								d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
	                    </svg>
					</a>
				</div>

			</div>
			<div class="col col-1 shopee-header-compare-product">
				<div>
					<a href="${base}/compare/view" class="cart-a-css">
	               	<span id="iconShowTotalItemsInCompare" class="badge compare-css ms-1 rounded-pill">
						${totalItemsCompare}
					</span>
						<svg xmlns="http://www.w3.org/2000/svg" width="22" viewBox="0 0 512 512">
							<!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#ffffff" d="M320 488c0 9.5-5.6 18.1-14.2 21.9s-18.8 2.3-25.8-4.1l-80-72c-5.1-4.6-7.9-11-7.9-17.8s2.9-13.3 7.9-17.8l80-72c7-6.3 17.2-7.9 25.8-4.1s14.2 12.4 14.2 21.9v40h16c35.3 0 64-28.7 64-64V153.3C371.7 141 352 112.8 352 80c0-44.2 35.8-80 80-80s80 35.8 80 80c0 32.8-19.7 61-48 73.3V320c0 70.7-57.3 128-128 128H320v40zM456 80a24 24 0 1 0 -48 0 24 24 0 1 0 48 0zM192 24c0-9.5 5.6-18.1 14.2-21.9s18.8-2.3 25.8 4.1l80 72c5.1 4.6 7.9 11 7.9 17.8s-2.9 13.3-7.9 17.8l-80 72c-7 6.3-17.2 7.9-25.8 4.1s-14.2-12.4-14.2-21.9V128H176c-35.3 0-64 28.7-64 64V358.7c28.3 12.3 48 40.5 48 73.3c0 44.2-35.8 80-80 80s-80-35.8-80-80c0-32.8 19.7-61 48-73.3V192c0-70.7 57.3-128 128-128h16V24zM56 432a24 24 0 1 0 48 0 24 24 0 1 0 -48 0z"/></svg>
					</a>
				</div>
			</div>
			<div class="col col-1 header-button-phone">
				<a class="btn " data-bs-toggle="offcanvas" href="#offcanvasExample"
					role="button" aria-controls="offcanvasExample"> <svg
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-justify" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
							d="M2 12.5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z" />
                        </svg>
				</a>
				<div class="offcanvas offcanvas-start" tabindex="-1"
					id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
					<div class="offcanvas-header offcanvas-header-shopee-mobile">
						<h2 class="offcanvas-title" id="offcanvasExampleLabel">XMATE</h2>
						<button type="button" class="btn-close text-reset"
							data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>
					<div class="offcanvas-body header-offcanvas-body">

						<div>
							<button class="btn btn-secondary btn-secondary-mobile ">
								<a href="../layouts/login.html"
									class="text-decoration-none text-light"> Đăng nhập </a>
							</button>
						</div>

						<div>
							<button class="btn btn-secondary btn-secondary-mobile">
								<a href="../layouts/signup.html"
									class="text-decoration-none text-light"> Đăng ký </a>
							</button>
						</div>
						<div class="dropdown mt-3">
							<button
								class="btn btn-secondary btn-secondary-mobile dropdown-toggle"
								type="button" id="dropdownMenuButton" data-bs-toggle="dropdown">
								Danh Mục</button>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<li><a class="dropdown-item" href="#">Thời trang nam</a></li>
								<li><a class="dropdown-item" href="#">Thời trang nữ</a></li>
								<li><a class="dropdown-item" href="#">Thiết bị điện tử</a></li>
								<li><a class="dropdown-item" href="#">Nhà cửa đời sống</a></li>
								<li><a class="dropdown-item" href="#">Giày dép nam</a></li>
								<li><a class="dropdown-item" href="#">Giày dép nữ</a></li>
								<li><a class="dropdown-item" href="#">Đồng hồ</a></li>
								<li><a class="dropdown-item" href="#">Sức khỏe</a></li>
								<li><a class="dropdown-item" href="#">Thiết bị gia dụng</a></li>
								<li><a class="dropdown-item" href="#">Bách hóa online</a></li>
								<li><a class="dropdown-item" href="#">Ô tô, xe máy</a></li>
								<li><a class="dropdown-item" href="#">Nhà sách online</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end: header--------------------------------------------------------------------------- -->