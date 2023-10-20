<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="refresh" content="number">
<title>SẢN PHẨM</title>
<jsp:include
	page="/WEB-INF/views/khachhang/layoutproducts/cssproducts.jsp"></jsp:include>


<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- import SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>


</head>
<body>
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
	<!-- begin: header------------------------------------------------------------------------- -->
	<jsp:include
		page="/WEB-INF/views/khachhang/layoutproducts/headerproducts.jsp"></jsp:include>
	<!-- end: header--------------------------------------------------------------------------- -->
	<%-- <!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." />
				</div>
				<div class="col-md-6">
					<div class="small mb-1">SKU: BST-498</div>
					<h1 class="display-5 fw-bolder">${product.title }</h1>
					<div class="fs-5 mb-5">
						<span class="text-decoration-line-through">$45.00</span> <span>$40.00</span>
					</div>
					<p class="lead">Lorem ipsum dolor sit amet consectetur
						adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi
						consequatur obcaecati excepturi alias magni, accusamus eius
						blanditiis delectus ipsam minima ea iste laborum vero?</p>
					<div class="d-flex">
						<input class="form-control text-center me-3" id="inputQuantity"
							type="num" value="1" style="max-width: 3rem" />
						<button class="btn btn-outline-dark flex-shrink-0" type="button">
							<i class="bi-cart-fill me-1"></i> Add to cart
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Related items section-->
	<section class="py-5 bg-light">
		<div class="container px-4 px-lg-5 mt-5">
			<h2 class="fw-bolder mb-4">Related products</h2>
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">Fancy Product</h5>
								<!-- Product price-->
								$40.00 - $80.00
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View
									options</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">Special Item</h5>
								<!-- Product reviews-->
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">$20.00</span>
								$18.00
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">Sale Item</h5>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">$50.00</span>
								$25.00
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">Popular Item</h5>
								<!-- Product reviews-->
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								$40.00
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section> --%>

	<!-- begin: main-content-banner------------------------------------------------------------------------- -->
	<div class="main-content-banner">
		<div class="product-portfolio">
			<div class="container portfolio-pd">
				<nav style="-bs-breadcrumb-divider: '&gt;';" aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="../layouts/index.html">Shopee</a></li>
						<li class="breadcrumb-item active" aria-current="page">Thực
							phẩm và đồ uống</li>
						<li class="breadcrumb-item active" aria-current="page">Các
							loại bánh</li>
						<li class="breadcrumb-item active" aria-current="page">Khác</li>
						<li class="breadcrumb-item active" aria-current="page">${product.title }</li>
					</ol>
				</nav>
			</div>
		</div>
		<div class="product-briefing container">
			<div class="img-product d-flex">
				<div class="image">
					<img src="${base }/upload/${product.avatar}" class="img-briefing"
						id="img" alt="">
					<button class="shopee-icon-button shopee-icon-button-first "
						onclick="changeImageLeft()">
						<svg enable-background="new 0 0 13 20" viewBox="0 0 13 20" x="0"
							y="0" class="shopee-svg-icon icon-arrow-left-bold">
							<polygon
								points="4.2 10 12.1 2.1 10 -.1 1 8.9 -.1 10 1 11 10 20 12.1 17.9"></polygon></svg>
					</button>
					<button class="shopee-icon-button shopee-icon-button-last"
						onclick="changeImageRight()">
						<svg enable-background="new 0 0 13 21" viewBox="0 0 13 21" x="0"
							y="0" class="shopee-svg-icon icon-arrow-right-bold">
							<polygon
								points="11.1 9.9 2.1 .9 -.1 3.1 7.9 11 -.1 18.9 2.1 21 11.1 12 12.1 11"></polygon></svg>
					</button>
					<div class=" items-center" style="margin-top: 15px;">
						<div class=" items-center ">
							<div class="_39mrb_">Chia sẻ:</div>
							<button class="sprite-product-sharing "
								aria-label="Share on Messenger">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-messenger" viewBox="0 0 16 16">
                                    <path
										d="M0 7.76C0 3.301 3.493 0 8 0s8 3.301 8 7.76-3.493 7.76-8 7.76c-.81 0-1.586-.107-2.316-.307a.639.639 0 0 0-.427.03l-1.588.702a.64.64 0 0 1-.898-.566l-.044-1.423a.639.639 0 0 0-.215-.456C.956 12.108 0 10.092 0 7.76zm5.546-1.459-2.35 3.728c-.225.358.214.761.551.506l2.525-1.916a.48.48 0 0 1 .578-.002l1.869 1.402a1.2 1.2 0 0 0 1.735-.32l2.35-3.728c.226-.358-.214-.761-.551-.506L9.728 7.381a.48.48 0 0 1-.578.002L7.281 5.98a1.2 1.2 0 0 0-1.735.32z" />
                                </svg>
							</button>
							<button class="sprite-product-sharing "
								aria-label="Share on Facebook">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                                    <path
										d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
                                </svg>
							</button>
							<button class="sprite-product-sharing "
								aria-label="Share on Google">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
                                    <path
										d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                                </svg>
							</button>
						</div>
						<div class=" items-center items-center-connect ">
							<svg width="24" height="20" class="ELoIiZ">
                            	<path
									d="M19.469 1.262c-5.284-1.53-7.47 4.142-7.47 4.142S9.815-.269 4.532 1.262C-1.937 3.138.44 13.832 12 19.333c11.559-5.501 13.938-16.195 7.469-18.07z"
									stroke="#FF424F" stroke-width="1.5" fill="none"
									fill-rule="evenodd" stroke-linejoin="round"></path>
                            </svg>
							<div class="_39mrb_">Đã thích (884)</div>
						</div>
					</div>
				</div>
				<div class="product-details">
					<div class="product-details-title">
						<h1 class="text-product-details-title">${product.title }</h1>
					</div>
					<div class="product-details-rate">
						<div class="product-details-rating-start">
							<div class="count-rating">4.9</div>
							<div class="shopee-rating-stars">
								<div class="shopee-rating-stars__stars">
									<div class="shopee-rating-stars__star-wrapper">
										<div class="shopee-rating-stars__lit">
											<svg enable-background="new 0 0 15 15" viewBox="0 0 15 15"
												x="0" y="0"
												class="shopee-svg-icon shopee-rating-stars__primary-star icon-rating-solid">
												<polygon
													points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
													stroke-linecap="round" stroke-linejoin="round"
													stroke-miterlimit="10"></polygon>
                                            </svg>
										</div>
									</div>
									<div class="shopee-rating-stars__star-wrapper">
										<div class="shopee-rating-stars__lit">
											<svg enable-background="new 0 0 15 15" viewBox="0 0 15 15"
												x="0" y="0"
												class="shopee-svg-icon shopee-rating-stars__primary-star icon-rating-solid">
												<polygon
													points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
													stroke-linecap="round" stroke-linejoin="round"
													stroke-miterlimit="10"></polygon>
                                            </svg>
										</div>
									</div>
									<div class="shopee-rating-stars__star-wrapper">
										<div class="shopee-rating-stars__lit">
											<svg enable-background="new 0 0 15 15" viewBox="0 0 15 15"
												x="0" y="0"
												class="shopee-svg-icon shopee-rating-stars__primary-star icon-rating-solid">
												<polygon
													points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
													stroke-linecap="round" stroke-linejoin="round"
													stroke-miterlimit="10"></polygon>
                                            </svg>
										</div>
									</div>
									<div class="shopee-rating-stars__star-wrapper">
										<div class="shopee-rating-stars__lit">
											<svg enable-background="new 0 0 15 15" viewBox="0 0 15 15"
												x="0" y="0"
												class="shopee-svg-icon shopee-rating-stars__primary-star icon-rating-solid">
												<polygon
													points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
													stroke-linecap="round" stroke-linejoin="round"
													stroke-miterlimit="10"></polygon>
                                            </svg>
										</div>
									</div>
									<div class="shopee-rating-stars__star-wrapper">
										<div class="shopee-rating-stars__lit">
											<svg enable-background="new 0 0 15 15" viewBox="0 0 15 15"
												x="0" y="0"
												class="shopee-svg-icon shopee-rating-stars__primary-star icon-rating-solid">
												<polygon
													points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
													stroke-linecap="round" stroke-linejoin="round"
													stroke-miterlimit="10"></polygon>
                                            </svg>
										</div>
									</div>

								</div>
							</div>
						</div>
						<div class="product-details-rating-evaluate evaluate-1">
							<div class="count-evaluate-rating">103</div>
							<div class="count-evaluate-rating-text">Đánh Giá</div>
						</div>
						<div class="product-details-rating-evaluate  ">
							<div class="count-evaluate-rating">334</div>
							<div class="count-evaluate-rating-text">Đã Bán</div>
						</div>
					</div>
					<div class="product-details-price">
						<div class="product-details-price-text">
							<fmt:setLocale value="vi_VN"  scope="session" />
							<fmt:formatNumber value="${product.price}" type="currency" />
							-
							<del>
								<fmt:setLocale value="vi_VN"  scope="session" />
								<fmt:formatNumber value="${product.priceSale}" type="currency" />
							</del>
						</div>
					</div>
					<div class="product-details-shipping">
						<div class="product-shipping">
							<div class="product-shipping-title">
								<label class="product-shipping-title-text">Vận chuyển</label>
								<div class="product-shipping-sp">
									<div>
										<div class="product-shipping-sp-text">
											<img src="../imgs/free-shopping.png"
												class="product-shipping-sp-img" alt=""> Miễn Phí Vận
											Chuyển
										</div>
										<div class="gRuynh">Miễn Phí Vận Chuyển khi đơn đạt giá
											trị tối thiểu</div>
									</div>
									<div class="product-transport-to">
										<div class="product-transport-sp-text">
											<svg enable-background="new 0 0 15 15" viewBox="0 0 15 15"
												x="0" y="0" class="shopee-svg-icon icon-free-shipping-line">
												<g>
												<line fill="none" stroke-linejoin="round"
													stroke-miterlimit="10" x1="8.6" x2="4.2" y1="9.8" y2="9.8"></line>
												<circle cx="3" cy="11.2" fill="none" r="2"
													stroke-miterlimit="10"></circle>
												<circle cx="10" cy="11.2" fill="none" r="2"
													stroke-miterlimit="10"></circle>
												<line fill="none" stroke-miterlimit="10" x1="10.5" x2="14.4"
													y1="7.3" y2="7.3"></line>
												<polyline fill="none"
													points="1.5 9.8 .5 9.8 .5 1.8 10 1.8 10 9.1"
													stroke-linejoin="round" stroke-miterlimit="10"></polyline>
												<polyline fill="none"
													points="9.9 3.8 14 3.8 14.5 10.2 11.9 10.2"
													stroke-linejoin="round" stroke-miterlimit="10"></polyline></g>
                                            </svg>
										</div>
										<div class="product-transport-sp-text-1">
											<div class="_2KvfoN">Vận chuyển tới</div>
											<select name="cars" id="cars">
												<option value="Ba Vì">Ba Vì</option>
												<option value="Hải Dương">Hải Dương</option>
												<option value="Hà Nội">Hà Nội</option>
												<option value="Hải Phòng">Hải Phòng</option>
											</select>
										</div>
									</div>
								</div>

							</div>
							<div class="product-shipping-title">
								<label class="product-shipping-title-text">Màu sắc</label>
								<div class="product-shipping-sp">
									<button class="product-variation">21 - Gà Quay Jambon</button>
									<button class="product-variation">31-Thập Cẩm Jambon</button>
									<button class="product-variation">41-Thập Cẩm Lạp
										Xườn</button>
									<button class="product-variation">A1 - Nấm Đông Cô
										Sốt</button>
									<button class="product-variation">40-ThậpCẩm 0Trứng</button>
									<button class="product-variation">51 - Hạt Sen</button>
									<button class="product-variation">61 - Đậu Xanh</button>
									<button class="product-variation">71 - Sữa Dừa</button>
									<button class="product-variation">T1 - HạtSenTràXanh</button>
									<button class="product-variation product-variation--disabled">SR1-
										Sầu Riêng</button>
								</div>

							</div>
							<div class="product-shipping-title">
								<label class="product-shipping-title-text">Kích Cỡ</label>
								<div class="product-shipping-sp">
									<button class="product-variation">150g</button>
								</div>

							</div>
							<div class="product-shipping-title">
								<label class="product-shipping-title-text">Số Lượng</label>
								<div class="product-shipping-sp-sub">
									<div style="margin-right: 15px;">
										<div class="num  shopee-input-quantity">
											<button class="shopee-input-quantity-button btn-add"
												data-type="minus">
												<svg enable-background="new 0 0 10 10" viewBox="0 0 10 10"
													x="0" y="0" class="shopee-svg-icon ">
													<polygon
														points="4.5 4.5 3.5 4.5 0 4.5 0 5.5 3.5 5.5 4.5 5.5 10 5.5 10 4.5"></polygon>
                                                </svg>
											</button>
											<input class="shopee-input-quantity-button-input"
												name="number_prd" type="text" role="spinbutton"
												aria-valuenow="1" value="1">
											<button class="shopee-input-quantity-button btn-add"
												data-type="add">
												<svg enable-background="new 0 0 10 10" viewBox="0 0 10 10"
													x="0" y="0" class="shopee-svg-icon icon-plus-sign">
													<polygon
														points="10 4.5 5.5 4.5 5.5 0 4.5 0 4.5 4.5 0 4.5 0 5.5 4.5 5.5 4.5 10 5.5 10 5.5 5.5 10 5.5"></polygon>
                                                </svg>
											</button>
										</div>
										<!-- 
                                             $('.btn-add').on('click', function(){
                                            var currentNumber = $(this).closest('.num').find('input[name="number_prd"]').val();
                                            var type = $(this).attr('data-type');
                                            if(type == 'add'){
                                                $(this).closest('.num').find('input[name="number_prd"]').val((parseInt(currentNumber) + 1));
                                            }else{
                                                if(currentNumber >= 1){
                                                    $(this).closest('.num').find('input[name="number_prd"]').val((parseInt(currentNumber) - 1));
                                                }
                                            }
                                            
                                            });
                                         -->
									</div>
									<div>16924 sản phẩm có sẵn</div>
								</div>
							</div>

							<div class="product-shipping-title">
								<div class="product-shipping-add">
									<div class="product-shipping-add-button">
										<button path="cart" name="cart" id="cart" type="button"
											class=" btn-tinted  table-hover" aria-disabled="false">
											<svg enable-background="new 0 0 15 15" viewBox="0 0 15 15"
												x="0" y="0" class="shopee-svg-icon _2FCuXA icon-add-to-cart">
						<g>
						<g>
						<polyline fill="none"
													points=".5 .5 2.7 .5 5.2 11 12.4 11 14.5 3.5 3.7 3.5"
													stroke-linecap="round" stroke-linejoin="round"
													stroke-miterlimit="10"></polyline>
						<circle cx="6" cy="13.5" r="1" stroke="none"></circle>
						<circle cx="11.5" cy="13.5" r="1" stroke="none"></circle></g>
						<line fill="none" stroke-linecap="round" stroke-miterlimit="10"
													x1="7.5" x2="10.5" y1="7" y2="7"></line>
						<line fill="none" stroke-linecap="round" stroke-miterlimit="10"
													x1="9" x2="9" y1="8.5" y2="5.5"></line></g>
	                                            </svg>
											<span>thêm vào giỏ hàng</span>
										</button>
										<c:if test="${isLogined }">
											<button
												onclick="javascript:AddToCart('${base }', ${product.id}, 1);"
												path="order" name="order" id="order" type="button"
												class=" btn-solid-primary btn-design-hover"
												aria-disabled="false">Mua ngay</button>
										</c:if>
										<c:if test="${!isLogined }">
											<a href="${base}/login">
												<button path="order" name="order" id="order" type="button"
													class=" btn-solid-primary btn-design-hover"
													aria-disabled="false">Mua ngay</button>
											</a>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>
	<!-- end: main-content-banner--------------------------------------------------------------------------- -->
	<!-- begin: main-shop-owner------------------------------------------------------------------------- -->
	<div class="main-shop-owner">
		<div class="page-product__shop container">
			<div class="page-product__shop-sub">
				<a class="_267Jf9"
					href="/enjoylife01?categoryId=100629&amp;itemId=2544777631">
					<div class="shopee-avatar _36C3a5">
						<div class="shopee-avatar__placeholder">
							<svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0"
								y="0" class="shopee-svg-icon icon-headshot">
								<g>
								<circle cx="7.5" cy="4.5" fill="none" r="3.8"
									stroke-miterlimit="10"></circle>
								<path d="m1.5 14.2c0-3.3 2.7-6 6-6s6 2.7 6 6" fill="none"
									stroke-linecap="round" stroke-miterlimit="10"></path></g>
                            </svg>
						</div>
						<img class="shopee-avatar__img"
							src="https://cf.shopee.vn/file/85211e01aa97c39d734957e03e626909_tn">
					</div>
				</a>
				<div class="_2V1E4_">
					<div class="_3uf2ae">HoangLong</div>
					<div class="_2eVntT">Online 2 giờ trước</div>
					<div class="_3efaer">
						<button type="button" class=" btn-tinted js-buy-tickets ">
							<svg viewBox="0 0 16 16" class="shopee-svg-icon _8j52Y0 ">
								<g fill-rule="evenodd">
								<path
									d="M15 4a1 1 0 01.993.883L16 5v9.932a.5.5 0 01-.82.385l-2.061-1.718-8.199.001a1 1 0 01-.98-.8l-.016-.117-.108-1.284 8.058.001a2 2 0 001.976-1.692l.018-.155L14.293 4H15zm-2.48-4a1 1 0 011 1l-.003.077-.646 8.4a1 1 0 01-.997.923l-8.994-.001-2.06 1.718a.5.5 0 01-.233.108l-.087.007a.5.5 0 01-.492-.41L0 11.732V1a1 1 0 011-1h11.52zM3.646 4.246a.5.5 0 000 .708c.305.304.694.526 1.146.682A4.936 4.936 0 006.4 5.9c.464 0 1.02-.062 1.608-.264.452-.156.841-.378 1.146-.682a.5.5 0 10-.708-.708c-.185.186-.445.335-.764.444a4.004 4.004 0 01-2.564 0c-.319-.11-.579-.258-.764-.444a.5.5 0 00-.708 0z"></path></g>
                            </svg>
							Đăng ký
						</button>
						<a class="btn-light  table-hover"
							href="/enjoylife01?categoryId=100629&amp;itemId=2544777631">
							<svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0"
								y="0" stroke-width="0" class="shopee-svg-icon _16LcGE ">
								<path
									d="m13 1.9c-.2-.5-.8-1-1.4-1h-8.4c-.6.1-1.2.5-1.4 1l-1.4 4.3c0 .8.3 1.6.9 2.1v4.8c0 .6.5 1 1.1 1h10.2c.6 0 1.1-.5 1.1-1v-4.6c.6-.4.9-1.2.9-2.3zm-11.4 3.4 1-3c .1-.2.4-.4.6-.4h8.3c.3 0 .5.2.6.4l1 3zm .6 3.5h.4c.7 0 1.4-.3 1.8-.8.4.5.9.8 1.5.8.7 0 1.3-.5 1.5-.8.2.3.8.8 1.5.8.6 0 1.1-.3 1.5-.8.4.5 1.1.8 1.7.8h.4v3.9c0 .1 0 .2-.1.3s-.2.1-.3.1h-9.5c-.1 0-.2 0-.3-.1s-.1-.2-.1-.3zm8.8-1.7h-1v .1s0 .3-.2.6c-.2.1-.5.2-.9.2-.3 0-.6-.1-.8-.3-.2-.3-.2-.6-.2-.6v-.1h-1v .1s0 .3-.2.5c-.2.3-.5.4-.8.4-1 0-1-.8-1-.8h-1c0 .8-.7.8-1.3.8s-1.1-1-1.2-1.7h12.1c0 .2-.1.9-.5 1.4-.2.2-.5.3-.8.3-1.2 0-1.2-.8-1.2-.9z"></path>
                            </svg> xem shop
						</a>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div class="product-detail page-product__detail container">
				<div id="test-detail">${product.details}</div>
			</div>
		</div>
	</div>
	<!-- end: main-shop-owner--------------------------------------------------------------------------- -->
	<form class="mb-5" method="post" action="${base }/products/${product.seo}" id="productsForm" name="productsForm">
		<div class="modal js-modal">
			<div class="modal-container js-modal-container">
				<div class="modal-close js-modal-close">
					<i class="ti-close"></i>
				</div>
				<header class="modal-header">
					<i class="modal-heading-icon ti-bag"></i> SUBSCRIBE
				</header>
				<div class="modal-body">
					<label for="quanlity" class="modal-label"> <i
						class="ti-shopping-cart"></i> Bạn sẽ nhận được tin nhắn kể từ bây
						giờ?
					</label>
						<input  type="email"
						class="form-control modal-input" name="email" id="email"
						placeholder="Your email" />

					<a href="${base }/products/${product.seo}" type="submit" value="Send Message"
						onclick="customersubscribe('${base}')" id="buy-tickets"
						class="btn btn-primary rounded-0 py-2 px-4">Send Message</a>
				</div>
				<footer class="modal-footer">
					<p class="modal-help">
						Need <a href="">help?</a>
					</p>
				</footer>

			</div>
		</div>
	</form>

</body>
<jsp:include
	page="/WEB-INF/views/khachhang/layoutproducts/jsproducts.jsp"></jsp:include>
	<script>
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

<script src="../js/customersubcribe_scripts.js"></script>
<script src="${base}/js/customer_scripts.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</html>