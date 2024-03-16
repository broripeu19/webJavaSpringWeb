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
	<section >
		<div class="container px-4 px-lg-5 mt-5 container-compare">
			<ul class="listproduct pro-compare pro-compare_main">
				<li>
					<p class="title-cp">So sánh sản phẩm</p>
					<div class="product-cp">
						<c:forEach items="${compare.compareItems }" var="ci">
							<p class="productname-cp" data-id="${ci.productId}">${ci.productName }</p>
						</c:forEach>
					</div>
				</li>
				<c:forEach items="${compare.compareItems }" var="ci">
					<li data-id="304867" data-issetup="0" data-maingroup="22" data-subgroup="42" data-type="1" data-vehicle="1" data-productcode="0220042002211" class="productitem-cp productid-304867 cate-44" data-url="/laptop/asus-tuf-gaming-f15-fx506hf-i5-hn014w">
						<a href="${base }/products/${product.seo}" data-s="Nomal" data-site="1" data-pro="3" data-cache="True" data-sv="webtgdd-26-122" data-name="Laptop Asus TUF Gaming F15 FX506HF i5 11400H/8GB/512GB/4GB RTX2050/144Hz/Win11 (HN014W)" data-id="304867" data-price="15990000.0" data-brand="Asus" data-cate="Laptop" data-box="BoxCate" class="main-contain " data-pos="0">
							<div class="item-img item-img_44">
								<img class="thumb ls-is-cached lazyloaded" data-src="${base}/upload/${ci.productAvatar}" alt="${ci.productName }" src="${base}/upload/${ci.productAvatar}">
							</div>
							<h3>
								${ci.productName }
							</h3>
							<div class="box-p">

								<p class="price-old black">
									<fmt:setLocale value="vi_VN"  scope="session" />
									<fmt:formatNumber value="${ci.priceUnit}" type="currency" />
									₫</p>
								<span class="percent">
									<c:set var="percentValue" value="${(ci.priceSale / ci.priceUnit) * 100}" />
									${percentValue} %
								</span>
							</div>
							<strong class="price">
								<fmt:setLocale value="vi_VN"  scope="session" />
								<fmt:formatNumber value="${ci.priceSale }" type="currency" />
								₫</strong>
							<div class="item-rating">
							</div>
							<div class="item-detail">${ci.shortDes }</div>
						</a>
						<div class="item-bottom">
							<a href="#" class="shiping"></a>
						</div>
						<a onclick="confirmDelete(${ci.productId})" class="deleteProduct"><i class="icon-deletess"></i></a>

					</li>
				</c:forEach>
				<li class="productid-0" style="">
					<a href="${base}/index">
						<div class="addsp-cp" onclick="OpenPopup(this)">
							<div class="plus">
								<i></i>
								<i></i>
							</div>
							<span>Thêm sản phẩm</span>
						</div>
					</a>
				</li>
			</ul>
		</div>
	</section>

	<!-- Footer-->
	 <jsp:include page="/WEB-INF/views/khachhang/layout/footer.jsp"></jsp:include>

	<!-- JS -->
<jsp:include
	page="/WEB-INF/views/khachhang/layoutproducts/jsproducts.jsp"></jsp:include>
	
</body>
<script type="text/javascript">
	function confirmDelete(productId) {
		console.log(productId)
		if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này không?")) {
			// Nếu người dùng chọn "OK", chuyển đến trang xóa sản phẩm
			window.location.href = `${base}/compare/remove/` + productId;
		} else {
		}
	}

</script>
<style>

	.item-detail{
		padding: 5px;
	}
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

	@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap');
	body{
		background: #F5F1EE;
		font-family: 'Roboto', sans-serif;
	}
	.card{
		width: 250px;
		border-radius: 10px;
	}

	.card-img-top{
		border-top-right-radius: 10px;
		border-top-left-radius: 10px;
	}
	span.text-muted{
		font-size: 12px;
	}
	small.text-muted{
		font-size: 8px;
	}
	h5.mb-0{
		font-size: 1rem;
	}
	small.ghj{
		font-size: 9px;
	}
	.mid{
		background: #ECEDF1;
	}
	h6.ml-1{
		font-size: 13px;
	}
	small.key{
		text-decoration: underline;
		font-size: 9px;
		cursor: pointer;
	}
	.btn-danger{
		color: #FFCBD2;
	}
	.btn-danger:focus{
		box-shadow: none;
	}
	small.justify-content-center{
		font-size: 9px;
		cursor: pointer;
		text-decoration: underline;
	}

	@media screen and (max-width:600px){
		.col-sm-4{
			margin-bottom: 50px;
		}
	}

	/* add---css-for compare-product */
	.pro-compare {
		display: flex;
		margin-top: 30px;
		box-shadow: 0 15px 10px -15px rgba(102,102,102,.3);
		border-right: 1px solid #e6e6e6;
	}
	ul, ol {
		list-style: none;
	}
	.pro-compare li:first-child {
		border: none;
	}

	.pro-compare li {
		float: left;
		position: relative;
		width: 33.33%;
		border-left: 1px solid #e6e6e6;
		border-top: 1px solid #e6e6e6;
	}
	.pro-compare li .title-cp {
		font-size: 16px;
		line-height: 150%;
		color: #666;
	}
	.box-detailcp {
		margin-top: 30px;
	}

	.pro-compare li a {
		display: block;
		color: #333;
	}
	.pro-compare li .item-bottom {
		display: block;
		overflow: hidden;
		font-size: 12px;
		padding: 5px 0 10px 15px;
	}
	.pro-compare li a.deleteProduct {
		position: absolute;
		top: 3px;
		right: 6px;
	}
	.icon-deletess {
		background-position: -165px -125px;
		height: 16px;
		width: 16px;
	}
	.pro-compare li.productid-0 {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.pro-compare li .addsp-cp {
		display: block;
		overflow: hidden;
		text-align: center;
		cursor: pointer;
	}
	.pro-compare li .addsp-cp .plus {
		border: 1px dashed #2f80ed;
		border-radius: 3px;
		position: relative;
		width: 60px;
		height: 60px;
		margin: auto;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.pro-compare li .addsp-cp .plus i {
		width: 20px;
		height: 1px;
		background: #2f80ed;
		position: absolute;
		left: 0;
		right: 0;
		margin: auto;
	}
	.pro-compare li .addsp-cp .plus i:nth-child(2) {
		transform: rotate(90deg);
	}
	.pro-compare li .addsp-cp span {
		display: block;
		overflow: hidden;
		font-size: 14px;
		margin-top: 15px;
		line-height: 137%;
		color: #666;
	}
	section {
		width: 100%;
		max-width: 1200px;
		margin: auto;
	}
	.pro-compare li .item-img img {
		display: block;
		width: 92%;
		margin: 35px auto 10px;
		position: relative;
		max-width: 275px;
	}
	.pro-compare li .item-img img.lbliconimg.lbliconimg_44 {
		left: 130px;
		bottom: 0;
		top: -19px;
	}

	.pro-compare li .item-img img.lbliconimg {
		width: 36px;
		margin: unset;
		max-width: unset;
		left: 10px;
		bottom: 0;
		position: absolute;
	}
	.pro-compare li .item-img img {
		display: block;
		width: 92%;
		margin: 35px auto 10px;
		position: relative;
		max-width: 275px;
	}
	.owl-carousel .owl-item img.lbliconimg.tgdd, .lbliconimg.tgdd {
		height: 45px !important;
	}
	.owl-carousel .owl-item img.lbliconimg.lbliconimg_44, .lbliconimg.lbliconimg_44 {
		left: unset;
		bottom: unset;
		right: 0;
		top: 0;
	}
	.owl-carousel .owl-item img.lbliconimg, .lbliconimg {
		width: auto !important;
		height: 40px;
		position: absolute;
		left: 245px;
		bottom: -30px;
		z-index: 2;
	}
	.owl-carousel .owl-item img.lbliconimg, .lbliconimg {
		width: auto !important;
		height: 40px;
		position: absolute;
		left: 0;
		bottom: 0;
	}
	.pro-compare li h3 {
		overflow: hidden;
		font-size: 14px;
		padding: 0 0 1px 15px;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
		text-overflow: ellipsis;
	}
	.pro-compare li .box-p {
		display: flex;
		justify-content: left;
		align-items: center;
		padding: 0 0 3px 15px;
	}

	.pro-compare li strong.price {
		font-size: 14px;
		display: block;
		overflow: hidden;
		padding: 0 0 3px 15px;
		color: #0a68ff;
	}
	.pro-compare li .item-gift {
		font-size: 12px;
		display: block;
		width: 100%;
		padding: 0 10px 3px 15px;
	}
	.pro-compare li .item-rating {
		display: flex;
		justify-content: left;
		align-items: center;
	}
	.pro-compare li .item-rating p:last-child {
		flex: 1;
		padding: 0 0 0 5px;
	}
	.pro-compare li .item-rating p {
		margin-right: 2px;
		font-size: 14px;
		padding: 0 0 3px 15px;
		line-height: 18px;
	}

	.pro-compare li .productname-cp {
		font-size: 16px;
		line-height: 150%;
		color: #222;
		font-weight: bold;
		text-transform: uppercase;
		margin-top: 10px;
	}
	.pro-compare li .productname-cp:not(:last-child):after {
		color: #666;
		content: '&';
		display: block;
		font-weight: normal;
		margin-top: 10px;
	}
	.container-compare{
		background: #fff;
		padding: 10px;
		border-radius: 7px;
		margin-bottom: 50px;
		box-shadow: 1px 1px 2px #ccc;
	}
	.pro-compare li .box-p {
		display: flex;
		justify-content: left;
		align-items: center;
		padding: 0 0 3px 15px;
	}
	.pro-compare li .box-p p.price-old {
		text-decoration: line-through;
		color: #999;
	}

	.pro-compare li .box-p p, .pro-compare li .box-p span {
		display: block;
		overflow: hidden;
		font-size: 12px;
		margin-right: 5px;
	}
	.pro-compare li .box-p p, .pro-compare li .box-p span {
		display: block;
		overflow: hidden;
		font-size: 12px;
		margin-right: 5px;
	}

	.icon-deletess {
		background-position: -165px -125px;
		height: 16px;
		width: 16px;
	}
	[class^="icon-"], [class*="icon-"] {
		background-image: url(//cdn.tgdd.vn/mwgcart/mwgcore/ContentMwg/images/homev2/desk/icon_common@2x.webp);
		background-repeat: no-repeat;
		display: inline-block;
		height: 30px;
		width: 30px;
		line-height: 30px;
		vertical-align: middle;
		background-size: 312px 200px;
	}
	.percent{
		position: absolute;
		margin-left: 71px;
		margin-top: -25px;
		background: #ccc;
		padding: 0px 10px;
	}
</style>

</html>
