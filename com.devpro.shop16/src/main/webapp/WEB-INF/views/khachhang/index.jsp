<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>XMATE 95 | DATN by Pham Hoang Long</title>
<link rel="stylesheet" href="${base}/css/bootstrap.css">
<link rel="stylesheet" href="${base}/css/style.css">
<link rel="stylesheet" href="${base}/css/reponsive.css">
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<link rel="icon"
	href="${base}/imgs/kisspng-shopee-online-shopping-1.jpg"
	type="image/jpg" sizes="20x20">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${base}/css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet" href="../css/simplePagination.css" />

<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

</head>
<body >
	<!-- begin: header------------------------------------------------------------------------- -->
	<jsp:include page="/WEB-INF/views/khachhang/layout/header.jsp"></jsp:include>
	<!-- end: header--------------------------------------------------------------------------- -->
	<!--Begin: Content-Banner------------------------------------------------------------------ -->
	<div class="main-content-banner ">
		<div class="content content-banner">
			<div class="container banner">
				<form class="form-inline" action="${base }/index" method="get" >
					<div class="row banner-sale">
						<div id="carouselExampleIndicators" class="carousel slide col-8" data-bs-ride="carousel">
							<div class="carousel-indicators">
								<c:forEach begin="0" end="4" var="index">
									<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${index}" class="${index == 0 ? 'active' : ''}" aria-current="${index == 0}" aria-label="Slide ${index + 1}"></button>
								</c:forEach>
							</div>
							<div class="carousel-inner">
								<c:forEach items="${bannerWithPaging.data}" var="banner" varStatus="loop">
									<div class="carousel-item${loop.index == 0 ? ' active' : ''}">
										<img src="${base}/upload/${banner.path}" class="d-block w-100" alt="...">
									</div>
								</c:forEach>
							</div>
							<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
						<div class="col-4">
							<div class="banner-sub-img">
								<c:forEach items="${bannerWithPaging.data}" var="banner">
									<c:if test="${banner.id == 6}">
										<img src="${base}/upload/${banner.path}" alt="">
									</c:if>
								</c:forEach>
								<c:forEach items="${bannerWithPaging.data}" var="banner">
									<c:if test="${banner.id == 7}">
										<img src="${base}/upload/${banner.path}" alt="">
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
	<!-- End: Content-Banner------------------------------------------------------------------- -->
	<!-- Begin: section-category-list---------------------------------------------------------- -->
	<div class="content container section-category-list">
		<div class="home-category-list">
			<div class="shopee-header-section shopee-header-section--simple">
				<div class="shopee-header-section__header">
					<div class="shopee-header-section__header__title">Danh Mục</div>
				</div>
				<div class="shopee-header-section__content">
					<div class="image-carousel">
						<div class="image-carousel__item-list-wrapper">
							<!--  -->
							<ul class="image-carousel__item-list row">
								<li
									class="image-carousel__item col col-xl-2 col-lg-2 col-md-4 col-sm-4 col-4">
									<div class="home-category-list__group">
										<a class="home-category-list__category-grid" href="">
											<div class="home-category-list__category-grid-sub">
												<div class="home-category-list__category-grid-title">
													<div class="home-category-list__category-grid-sub-title">
														<img
															src="../imgs/home-category-list__category-grid-sub-title-1.png"
															alt="">
													</div>
												</div>
												<div class="home-category-list__category-grid-text">
													<div class="home-category-list__category-grid-sub-text">Thời
														Trang Nam</div>
												</div>
											</div>
										</a> <a class="home-category-list__category-grid" href="">
											<div class="home-category-list__category-grid-sub">
												<div class="home-category-list__category-grid-title">
													<div class="home-category-list__category-grid-sub-title">
														<img
															src="../imgs/home-category-list__category-grid-sub-title-2.png"
															alt="">
													</div>
												</div>
												<div class="home-category-list__category-grid-text">
													<div class="home-category-list__category-grid-sub-text">Thời
														Trang Nữ</div>
												</div>
											</div>
										</a>
									</div>
								</li>
								<li
									class="image-carousel__item col col-xl-2 col-lg-2 col-md-4 col-sm-4 col-4">
									<div class="home-category-list__group">
										<a class="home-category-list__category-grid" href="">
											<div class="home-category-list__category-grid-sub">
												<div class="home-category-list__category-grid-title">
													<div class="home-category-list__category-grid-sub-title">
														<img
															src="../imgs/phukien-trangsuc-nu.png"
															alt="">
													</div>
												</div>
												<div class="home-category-list__category-grid-text">
													<div class="home-category-list__category-grid-sub-text">Phụ kiện trang sức</div>
												</div>
											</div>
										</a> <a class="home-category-list__category-grid" href="">
											<div class="home-category-list__category-grid-sub">
												<div class="home-category-list__category-grid-title">
													<div class="home-category-list__category-grid-sub-title">
														<img
															src="../imgs/Tuivinu.png"
															alt="">
													</div>
												</div>
												<div class="home-category-list__category-grid-text">
													<div class="home-category-list__category-grid-sub-text">Túi ví nữ</div>
												</div>
											</div>
										</a>
									</div>
								</li>
								<li
									class="image-carousel__item col col-xl-2 col-lg-2 col-md-4 col-sm-4 col-4">
									<div class="home-category-list__group">
										<a class="home-category-list__category-grid" href="">
											<div class="home-category-list__category-grid-sub">
												<div class="home-category-list__category-grid-title">
													<div class="home-category-list__category-grid-sub-title">
														<img
															src="../imgs/home-category-list__category-grid-sub-title-5.png"
															alt="">
													</div>
												</div>
												<div class="home-category-list__category-grid-text">
													<div class="home-category-list__category-grid-sub-text">Giày
														Dép Nam</div>
												</div>
											</div>
										</a> <a class="home-category-list__category-grid" href="">
											<div class="home-category-list__category-grid-sub">
												<div class="home-category-list__category-grid-title">
													<div class="home-category-list__category-grid-sub-title">
														<img
															src="../imgs/home-category-list__category-grid-sub-title-6.png"
															alt="">
													</div>
												</div>
												<div class="home-category-list__category-grid-text">
													<div class="home-category-list__category-grid-sub-text">Giày
														Dép Nữ</div>
												</div>
											</div>
										</a>
									</div>
								</li>
								<li
									class="image-carousel__item col col-xl-2 col-lg-2 col-md-4 col-sm-4 col-4">
									<div class="home-category-list__group">
										<a class="home-category-list__category-grid" href="">
											<div class="home-category-list__category-grid-sub">
												<div class="home-category-list__category-grid-title">
													<div class="home-category-list__category-grid-sub-title">
														<img
															src="../imgs/home-category-list__category-grid-sub-title-7.png"
															alt="">
													</div>
												</div>
												<div class="home-category-list__category-grid-text">
													<div class="home-category-list__category-grid-sub-text">Đồng
														Hồ</div>
												</div>
											</div>
										</a> <a class="home-category-list__category-grid" href="">
											<div class="home-category-list__category-grid-sub">
												<div class="home-category-list__category-grid-title">
													<div class="home-category-list__category-grid-sub-title">
														<img
															src="../imgs/Sacdep.png"
															alt="">
													</div>
												</div>
												<div class="home-category-list__category-grid-text">
													<div class="home-category-list__category-grid-sub-text">Sắc đẹp</div>
												</div>
											</div>
										</a>
									</div>
								</li>
								<li
									class="image-carousel__item col col-xl-2 col-lg-2 col-md-4 col-sm-4 col-4">
									<div class="home-category-list__group">
										<a class="home-category-list__category-grid" href="">
											<div class="home-category-list__category-grid-sub">
												<div class="home-category-list__category-grid-title">
													<div class="home-category-list__category-grid-sub-title">
														<img
															src="../imgs/balo-tuivinam.png"
															alt="">
													</div>
												</div>
												<div class="home-category-list__category-grid-text">
													<div class="home-category-list__category-grid-sub-text">Ba lô túi & ví nam</div>
												</div>
											</div>
										</a> <a class="home-category-list__category-grid" href="">
											<div class="home-category-list__category-grid-sub">
												<div class="home-category-list__category-grid-title">
													<div class="home-category-list__category-grid-sub-title">
														<img
															src="../imgs/thoitrang-kid.png"
															alt="">
													</div>
												</div>
												<div class="home-category-list__category-grid-text">
													<div class="home-category-list__category-grid-sub-text">Thời trang trẻ em</div>
												</div>
											</div>
										</a>
									</div>
								</li>
								<li
									class="image-carousel__item col col-xl-2 col-lg-2 col-md-4 col-sm-4 col-4">
									<div class="home-category-list__group">
										<a class="home-category-list__category-grid" href="">
											<div class="home-category-list__category-grid-sub">
												<div class="home-category-list__category-grid-title">
													<div class="home-category-list__category-grid-sub-title">
														<img
															src="../imgs/voucher.png"
															alt="">
													</div>
												</div>
												<div class="home-category-list__category-grid-text">
													<div class="home-category-list__category-grid-sub-text">Voucher & Dịch vụ</div>
												</div>
											</div>
										</a> <a class="home-category-list__category-grid" href="">
											<div class="home-category-list__category-grid-sub">
												<div class="home-category-list__category-grid-title">
													<div class="home-category-list__category-grid-sub-title">
														<img
															src="../imgs/home-category-list__category-grid-sub-title-12.png"
															alt="">
													</div>
												</div>
												<div class="home-category-list__category-grid-text">
													<div class="home-category-list__category-grid-sub-text">Kiến thức - Kinh nghiệm...</div>
												</div>
											</div>
										</a>
									</div>
								</li> 
							</ul>
							<!--  -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End: section-category-list------------------------------------------------------------ -->
	<div class="content container section-recommend-products-wrapper">
		<div class="section-recommend-products-wrappe-title">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
										aria-current="page" style="color: rgb(10, 104, 255);" href="#">Gợi
						Ý Hôm Nay</a></li>
			</ul>
		</div>


		<div class="section-recommend-products-wrappe-content" >
			<form class="form-inline" action="${base }/index" method="get" >

				<div class="row row-cols-1 row-cols-md-3 g-4">
					<c:forEach items="${productsWithPaging.data }" var="product"
						varStatus="loop">
						<div class="col col-xl-2 col-lg-3 col-md-6 col-sm-6 col-6  ">
							<a href="${base }/products/${product.seo}"
								class="card h-100 section-recommend-products-wrappe-content-a">
									<img src="${base }/upload/${product.avatar}"
										 class="div-product-contain-sale-img card-img-top " alt="...">
									<div class="section-recommend-products-wrappe-content-title">
										<div class="section-recommend-products-wrappe-content">
												<div class="product-contain-title">
													<div class="card-text">
														<span >${product.title }</span>
													</div>
												</div>
											<div class="product-contain-section">
												<div>
												<fmt:setLocale value="vi_VN" scope="session" />
												<fmt:formatNumber value="${product.priceSale }" type="currency" />

												</div>
												<div>
													<del>
														<fmt:setLocale value="vi_VN" scope="session" />
														<fmt:formatNumber value="${product.price}"
															type="currency" />
													</del>
												</div>
											</div>
											<div class="shopee-item-card__hover-footer">
												<span onclick="javascript:AddToCompare('${base }', ${product.id}, 1);">So sánh sản phẩm</span>
											</div>
										</div>
									</div>
								<div class="section-hot-sale-product-sale">
									<div class="section-shopee-badge">
										<div class="section-shopee-badge-sub">
											<span class="section-shopee-badge-sub-percent">Giảm</span>
											<span>
												<c:set var="percentValue" value="${(product.priceSale / product.price) * 100}" />
												${percentValue} %
											</span>
										</div>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</form>

		</div>
		<div class="_1AKybG">
			<a class="btn btn-light btn--m btn--inline btn-light--link _1J-Y2w"
				href="/daily_discover?pageNumber=2">Xem thêm</a>
		</div>
	</div>
	<!-- Footer -->
	<form class="mb-5" method="post" action="${base }/index" id="productsForm" name="productsForm">
		<div class="modal js-modal">
			<div class="modal-container js-modal-container">
				<div class="modal-close js-modal-close">
					<i class="ti-close"></i>
				</div>
				<header class="modal-header">
					<i class="modal-heading-icon ti-bag"></i> Đăng ký nhận thông báo
				</header>
				<div class="modal-body">
					<label for="quality" class="modal-label"> <i
						class="ti-shopping-cart"></i> Bạn sẽ nhận được tin nhắn kể từ bây
						giờ khi chúng tôi có sản phẩm mới ra mắt? Bạn có đồng ý? 
					</label>
						<input  type="email"
						class="form-control modal-input" name="email" id="email"
						placeholder="Your email" />

					<input type="submit" value="Send Message"
						onclick="customersubscribe('${base}')" id="buy-tickets"
						class="btn btn-primary rounded-0 py-2 px-4">
				</div>
				<footer class="modal-footer">
					<p class="modal-help">
						Need <a href="">help?</a>
					</p>
				</footer>

			</div>
		</div>
	</form>


	<jsp:include page="/WEB-INF/views/khachhang/layout/footer.jsp"></jsp:include>
	<!-- Footer -->
	<script type="text/javascript">

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
		document.addEventListener('DOMContentLoaded', function() {
			var myCarousel = document.getElementById('carouselExampleIndicators');
			var carousel = new bootstrap.Carousel(myCarousel);

			myCarousel.addEventListener('slide.bs.carousel', function (e) {
				var slides = myCarousel.querySelectorAll('.carousel-item');
				var activeSlideIndex = Array.from(slides).findIndex(slide => slide.classList.contains('active'));

				if (e.direction === 'next' && activeSlideIndex === slides.length - 1) {
					carousel.to(0); // Chuyển đến slide đầu tiên nếu đang ở slide cuối cùng
				}
			});
		});



		const buyBtns = document.querySelectorAll('.js-buy-tickets')
        const modal = document.querySelector('.js-modal')
        const modalContainer = document.querySelector('.js-modal-container')
        const modalClose = document.querySelector('.js-modal-close')

        function showBuyTickets(){
            modal.classList.add('modal-open')
        }
        function hideBuyTickets(){
            modal.classList.remove('modal-open')  
        }

        for(const buyBtn of buyBtns){
            buyBtn.addEventListener('click',showBuyTickets)
        }
        modalClose.addEventListener('click',hideBuyTickets)
        modal.addEventListener('click',hideBuyTickets)
        modalContainer.addEventListener('click', function(event){
            event.stopPropagation()
        })
	</script>
</body>


<script src="${base}/js/popper.min.js"></script>
<script src="${base}/js/bootstrap.js"></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script src="${base}/js/script.js"></script>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Paging -->
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/jquery.simplePagination.js"></script>
<script src="${base}/js/customer_scripts.js"></script>
<script src="../js/customersubcribe_scripts.js"></script>
<script>
  AOS.init({
            offset: 300,
            duration: 1000,
            debounceDelay: 50,
            throttleDelay: 99,
            animatedClassName: 'aos-animate',
            easing: 'ease',
            mirror: false,
            anchorPlacement: 'top-bottom'
        });
</script>
<style type="text/css">
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
		margin-top: 23px;
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