<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="refresh" content="number">
<title>Đơn Hàng</title>
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
	<jsp:include page="/WEB-INF/views/khachhang/layout/header.jsp"></jsp:include>
	<!-- end: header--------------------------------------------------------------------------- -->


	<!-- begin: main-content-banner------------------------------------------------------------------------- -->
	<div class="main-content-banner">
		<div class="container">
			<div class="container _1QwuCJ">
				<div class="_36cLcR">
					<div class="_1_68zU">
						<a class="_2BuJEf" href="/user/account/profile">
						<div class="shopee-avatar">
								<div class="shopee-avatar__placeholder">
									<svg enable-background="new 0 0 15 15" viewBox="0 0 15 15"
										x="0" y="0" class="shopee-svg-icon icon-headshot">
					                    <g>
					                      <circle cx="7.5" cy="4.5" fill="none" r="3.8" stroke-miterlimit="10"></circle>
					                      <path d="m1.5 14.2c0-3.3 2.7-6 6-6s6 2.7 6 6" fill="none" stroke-linecap="round" stroke-miterlimit="10"></path>
					                    </g>
					                </svg>
								</div>
								<img class="shopee-avatar__img"
									src="https://cf.shopee.vn/file/934cfd46a5e02efb8dcd61abb2804235_tn" />
							</div></a>
						<div class="_2uLDqN">
							<div class="_2lG70n">${userLogined.username }</div>
							<div>
								<a class="_27BCO5" href="/user/account/profile">
									<svg
										width="12" height="12" viewBox="0 0 12 12"
										xmlns="http://www.w3.org/2000/svg" style="margin-right: 4px">
                   						 <path
											d="M8.54 0L6.987 1.56l3.46 3.48L12 3.48M0 8.52l.073 3.428L3.46 12l6.21-6.18-3.46-3.48"
											fill="#0a68ff" fill-rule="evenodd"></path>
									</svg>Sửa hồ sơ</a>
							</div>
						</div>
					</div>
					<div class="_1ZnP-m">
						<div class="stardust-dropdown">
							<div class="stardust-dropdown__item-header">
								<a class="_3aAm2h" href="/user/voucher-wallet">
									<div class="_21F-bS">
										<img class="img-_21F-bS" src="https://cf.shopee.vn/file/12bc9caf9344342250a67bc34cde32c3" />
									</div>
									<div class="_2i7380">
										<span class="_3CHLlN">Tết Sale</span><span class="_3W8r9U"><svg
												width="32" height="18" viewBox="0 0 32 18" fill="none">
				                        <path d="M1 9C1 4.58172 4.58172 1 9 1H23C27.4183 1 31 4.58172 31 9C31 13.4183 27.4183 17 23 17H1V9Z" fill="#EE4D2D"></path>
				                        <path d="M12.4111 12H11.1758L8.00684 6.95605V12H6.77148V4.89062H8.00684L11.1855 9.9541V4.89062H12.4111V12ZM16.083 12.0977C15.3311 12.0977 14.7207 11.8617 14.252 11.3896C13.7865 10.9144 13.5537 10.2829 13.5537 9.49512V9.34863C13.5537 8.82129 13.6546 8.35091 13.8564 7.9375C14.0615 7.52083 14.348 7.19694 14.7158 6.96582C15.0837 6.7347 15.4938 6.61914 15.9463 6.61914C16.6657 6.61914 17.2207 6.84863 17.6113 7.30762C18.0052 7.7666 18.2021 8.41602 18.2021 9.25586V9.73438H14.75C14.7858 10.1706 14.9307 10.5156 15.1846 10.7695C15.4417 11.0234 15.764 11.1504 16.1514 11.1504C16.695 11.1504 17.1377 10.9307 17.4795 10.4912L18.1191 11.1016C17.9076 11.4173 17.6243 11.6631 17.2695 11.8389C16.918 12.0114 16.5225 12.0977 16.083 12.0977ZM15.9414 7.57129C15.6159 7.57129 15.3522 7.68522 15.1504 7.91309C14.9518 8.14095 14.8249 8.45833 14.7695 8.86523H17.0303V8.77734C17.0042 8.38021 16.8984 8.08073 16.7129 7.87891C16.5273 7.67383 16.2702 7.57129 15.9414 7.57129ZM23.7686 10.3643L24.6084 6.7168H25.7656L24.3252 12H23.3486L22.2158 8.37207L21.1025 12H20.126L18.6807 6.7168H19.8379L20.6924 10.3252L21.7764 6.7168H22.6699L23.7686 10.3643Z"
																	fill="white"></path>
				                        <path d="M1 17H0V18H1V17ZM9 2H23V0H9V2ZM23 16H1V18H23V16ZM2 17V9H0V17H2ZM30 9C30 12.866 26.866 16 23 16V18C27.9706 18 32 13.9706 32 9H30ZM23 2C26.866 2 30 5.13401 30 9H32C32 4.02944 27.9706 0 23 0V2ZM9 0C4.02944 0 0 4.02944 0 9H2C2 5.13401 5.13401 2 9 2V0Z"
													fill="white"></path></svg></span>
									</div>
								</a>
							</div>
							<div class="stardust-dropdown__item-body">
								<div class="_3aiYwk">
									<a class="_3SsG4j" href="/user/voucher-wallet"><span
										class="_2PrdXX">Kho voucher của bạn</span></a><a class="_3SsG4j"
										href="/tet-sieu-sale "><span
										class="_2PrdXX">Mua 1 tặng 1</span></a><a class="_3SsG4j"
										href="/m/khung-gio-san-sale"><span
										class="_2PrdXX">Khung giờ săn sale</span></a><a class="_3SsG4j"
										href="/m/shopeesogiday"><span
										class="_2PrdXX">Trúng xe hơi</span></a><a class="_3SsG4j"
										href="/m/ma-giam-gia "><span
										class="_2PrdXX">Mã giảm giá</span></a>
								</div>
							</div>
						</div>
						<div class="stardust-dropdown">
							<div class="stardust-dropdown__item-header">
								<a class="_3aAm2h" href="/user/account/profile">
								<div class="_21F-bS">
										<img class="img-_21F-bS"
											src="https://cf.shopee.vn/file/ba61750a46794d8847c3f463c5e71cc4" />
								</div>
								<div class="_2i7380">
									<span class="_3CHLlN">Tài khoản của tôi</span>
								</div></a>
							</div>
							<div class="stardust-dropdown__item-body">
								<div class="_3aiYwk">
									<a class="_3SsG4j" href="/user/account/profile"><span
										class="_2PrdXX">Hồ sơ</span></a><a class="_3SsG4j"
										href="/user/account/payment"><span
										class="_2PrdXX">Ngân hàng</span></a><a class="_3SsG4j"
										href="/user/account/address"><span
										class="_2PrdXX">Địa chỉ</span></a><a class="_3SsG4j"
										href="/user/account/password"><span
										class="_2PrdXX">Đổi mật khẩu</span></a>
								</div>
							</div>
						</div>
						<div class="stardust-dropdown stardust-dropdown--open">
							<div class="stardust-dropdown__item-header">
								<a class="_3aAm2h _3RsaDw" href="/user/purchase"><div
										class="_21F-bS">
										<img class="img-_21F-bS"
											src="https://cf.shopee.vn/file/f0049e9df4e536bc3e7f140d071e9078" />
									</div>
									<div class="_2i7380">
										<span class="_3CHLlN">Đơn Mua</span>
									</div></a>
							</div>
							<div
								class="stardust-dropdown__item-body stardust-dropdown__item-body--open">
								<div class="_3aiYwk"></div>
							</div>
						</div>
						<div class="stardust-dropdown">
							<div class="stardust-dropdown__item-header">
								<a class="_3aAm2h" href="/user/notifications/order"><div
										class="_21F-bS">
										<img class="img-_21F-bS"
											src="https://cf.shopee.vn/file/e10a43b53ec8605f4829da5618e0717c" />
									</div>
									<div class="_2i7380">
										<span class="_3CHLlN">Thông báo</span>
									</div></a>
							</div>
							<div class="stardust-dropdown__item-body">
								<div class="_3aiYwk">
									<a class="_3SsG4j" href="/user/notifications/order"><span
										class="_2PrdXX">Cập nhật đơn hàng</span></a><a class="_3SsG4j"
										href="/user/notifications/promotion"><span
										class="_2PrdXX">Khuyến mãi</span></a><a class="_3SsG4j"
										href="/user/notifications/wallet"><span
										class="_2PrdXX">Cập nhật Ví</span></a><a class="_3SsG4j"
										href="/user/notifications/activity"><span
										class="_2PrdXX">Hoạt động</span></a><a class="_3SsG4j"
										href="/user/notifications/rating"><span
										class="_2PrdXX">Cập nhật đánh giá</span></a> <a class="_3SsG4j"
										href="/user/notifications/shopee"> <span class="_2PrdXX">Cập
											nhật Shopee</span></a>
								</div>
							</div>
						</div>
						<div class="stardust-dropdown">
							<div class="stardust-dropdown__item-header">
								<a class="_3aAm2h" href="/user/voucher-wallet"><div
										class="_21F-bS">
										<img class="img-_21F-bS"
											src="https://cf.shopee.vn/file/84feaa363ce325071c0a66d3c9a88748" />
									</div>
									<div class="_2i7380">
										<span class="_3CHLlN">Kho Voucher</span>
									</div></a>
							</div>
							<div class="stardust-dropdown__item-body">
								<div class="_3aiYwk"></div>
							</div>
						</div>
						<div class="stardust-dropdown">
							<div class="stardust-dropdown__item-header">
								<a class="_3aAm2h" href="/user/coin"><div
										class="_21F-bS">
										<img class="img-_21F-bS"
											src="https://cf.shopee.vn/file/a0ef4bd8e16e481b4253bd0eb563f784" />
									</div>
									<div class="_2i7380">
										<span class="_3CHLlN">Shopee Xu</span>
									</div></a>
							</div>
							<div class="stardust-dropdown__item-body">
								<div class="_3aiYwk"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="_3D9BVC">
					<div class="_2mSi0S">
						<div></div>
						<div class="ZS1kj6">
							<a class="_2sowby _23VQQX" href="${base}/purchase-all">
								<span class="_2pSH8O">Tất cả</span>
							</a>
							<a class="_2sowby _2sowby-bd" href="${base}/purchase-history">
								<span class="_2pSH8O">Chờ xác nhận</span></a>
							<a class="_2sowby" href="${base}/purchase-history2">
								<span class="_2pSH8O">Đã xác nhận</span></a>
							<a class="_2sowby" href="/user/purchase/?type=4">
								<span class="_2pSH8O">Đã Hủy</span>
							</a>
						</div>
						<div></div>
						<div class="_1MmTVs">
							<svg width="19px" height="19px" viewBox="0 0 19 19">
				                <g id="Search-New" stroke-width="1" fill="none"
													fill-rule="evenodd">
				                  <g id="my-purchase-copy-27"
													transform="translate(-399.000000, -221.000000)"
													stroke-width="2">
				                    <g id="Group-32"
													transform="translate(400.000000, 222.000000)">
				                      <circle id="Oval-27" cx="7" cy="7" r="7"></circle>
				                      <path d="M12,12 L16.9799555,16.919354"
													id="Path-184" stroke-linecap="round" stroke-linejoin="round"></path>
				                    </g>
				                  </g>
				                </g>
				            </svg>
							<input autocomplete="off"
								placeholder="Tìm kiếm theo Tên Shop, ID đơn hàng hoặc Tên Sản phẩm"
								value="" />
						</div>
						<div>
					<c:if test="${isLogined }"> 
						<c:forEach items="${saleorderProductWithPaging.data}" var="saleorderpd" varStatus="loop">
							<div class="_2n4gHk">
								<div>
									<div class="GuWdvd">
										<div class="WqnWb-">
											<div class="_1DPpu5">
												<div class="_2zTpu5">
													<svg xmlns="http://www.w3.org/2000/svg" width="62" height="16" fill="none">
                            							<path fill="#EE4D2D" fill-rule="evenodd" d="M0 2C0 .9.9 0 2 0h58a2 2 0 012 2v12a2 2 0 01-2 2H2a2 2 0 01-2-2V2z" clip-rule="evenodd"></path>
									                            <g clip-path="url(#clip0)">
									                              <path fill="#fff" d="M8.7 13H7V8.7L5.6 6.3A828.9 828.9 0 004 4h2l2 3.3a1197.3 1197.3 0 002-3.3h1.6L8.7 8.7V13zm7.9-1.7h1.7c0 .3-.2.6-.5 1-.2.3-.5.5-1 .7l-.6.2h-.8c-.5 0-1 0-1.5-.2l-1-.8a4 4 0 01-.9-2.4c0-1 .3-1.9 1-2.6a3 3 0 012.4-1l.8.1a2.8 2.8 0 011.3.7l.4.6.3.8V10h-4.6l.2 1 .4.7.6.5.7.1c.4 0 .7 0 .9-.2l.2-.6v-.1zm0-2.3l-.1-1-.3-.3c0-.2-.1-.2-.2-.3l-.8-.2c-.3 0-.6.2-.9.5l-.3.5a4 4 0 00-.3.8h3zm-1.4-4.2l-.7.7h-1.4l1.5-2h1.1l1.5 2h-1.4l-.6-.7zm8.1 1.6H25V13h-1.7v-.5.1H23l-.7.5-.9.1-1-.1-.7-.4c-.3-.2-.4-.5-.6-.8l-.2-1.3V6.4h1.7v3.7c0 1 0 1.6.3 1.7.2.2.5.3.7.3h.4l.4-.2.3-.3.3-.5.2-1.4V6.4zM34.7 13a11.2 11.2 0 01-1.5.2 3.4 3.4 0 01-1.3-.2 2 2 0 01-.5-.3l-.3-.5-.2-.6V7.4h-1.2v-1h1.1V5h1.7v1.5h1.9v1h-2v3l.2 1.2.1.3.2.2h.3l.2.1c.2 0 .6 0 1.3-.3v1zm2.4 0h-1.7V3.5h1.7v3.4a3.7 3.7 0 01.2-.1 2.8 2.8 0 013.4 0l.4.4.2.7V13h-1.6V9.3 8.1l-.4-.6-.6-.2a1 1 0 00-.4.1 2 2 0 00-.4.2l-.3.3a3 3 0 00-.3.5l-.1.5-.1.9V13zm5.4-6.6H44V13h-1.6V6.4zm-.8-.9l1.8-2h1.8l-2.1 2h-1.5zm7.7 5.8H51v.5l-.4.5a2 2 0 01-.4.4l-.6.3-1.4.2c-.5 0-1 0-1.4-.2l-1-.7c-.3-.3-.5-.7-.6-1.2-.2-.4-.3-.9-.3-1.4 0-.5.1-1 .3-1.4a2.6 2.6 0 011.6-1.8c.4-.2.9-.3 1.4-.3.6 0 1 .1 1.5.3.4.1.7.4 1 .6l.2.5.1.5h-1.6c0-.3-.1-.5-.3-.6-.2-.2-.4-.3-.8-.3s-.8.2-1.2.6c-.3.4-.4 1-.4 2 0 .9.1 1.5.4 1.8.4.4.8.6 1.2.6h.5l.3-.2.2-.3v-.4zm4 1.7h-1.6V3.5h1.7v3.4a3.7 3.7 0 01.2-.1 2.8 2.8 0 013.4 0l.3.4.3.7V13h-1.6V9.3L56 8.1c-.1-.3-.2-.5-.4-.6l-.6-.2a1 1 0 00-.3.1 2 2 0 00-.4.2l-.3.3a3 3 0 00-.3.5l-.2.5V13z"></path>
									                            </g>
									                        <defs>
								                              <clipPath id="clip0">
								                                <path fill="#fff" d="M0 0h55v16H0z"
																							transform="translate(4)"></path>
								                              </clipPath>
								                            </defs>
                          							</svg>
												</div>
												<div class="_1CIbL0"></div>
											</div>
											<div class="_1lE6Rh">
												<div class="_2hRxNA">
													<a class="_3nBhmP"
														href="${base }/products/${product.seo}"><svg
															enable-background="new 0 0 15 15" viewBox="0 0 15 15"
															x="0" y="0"
															class="shopee-svg-icon icon-free-shipping-line">
								                              <g>
								                                <line fill="none" stroke-linejoin="round" stroke-miterlimit="10" x1="8.6" x2="4.2" y1="9.8" y2="9.8"></line>
								                                	<circle cx="3" cy="11.2" fill="none" r="2" stroke-miterlimit="10"></circle>
								                                	<circle cx="10" cy="11.2" fill="none r="2" stroke-miterlimit="10"></circle>
								                                <line fill="none" stroke-miterlimit="10" x1="10.5" x2="14.4" y1="7.3" y2="7.3"></line>
								                                <polyline fill="none" points="1.5 9.8 .5 9.8 .5 1.8 10 1.8 10 9.1" stroke-linejoin="round" stroke-miterlimit="10"></polyline>
								                                <polyline fill="none" points="9.9 3.8 14 3.8 14.5 10.2 11.9 10.2" stroke-linejoin="round" stroke-miterlimit="10"></polyline>
								                              </g>
								                              </svg>
								                              <span class="_36mfQM"> Chờ giao hàng</span>
								                    </a>
													<div class="shopee-drawer" id="pc-drawer-id-14" tabindex="0">
														<svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0" y="0" class="shopee-svg-icon icon-help">
								                              <g> <circle cx="7.5" cy="7.5" fill="none" r="6.5" stroke-miterlimit="10"></circle>
								                                <path d="m5.3 5.3c.1-.3.3-.6.5-.8s.4-.4.7-.5.6-.2 1-.2c.3 0 .6 0 .9.1s.5.2.7.4.4.4.5.7.2.6.2.9c0 .2 0 .4-.1.6s-.1.3-.2.5c-.1.1-.2.2-.3.3-.1.2-.2.3-.4.4-.1.1-.2.2-.3.3s-.2.2-.3.4c-.1.1-.1.2-.2.4s-.1.3-.1.5v.4h-.9v-.5c0-.3.1-.6.2-.8s.2-.4.3-.5c.2-.2.3-.3.5-.5.1-.1.3-.3.4-.4.1-.2.2-.3.3-.5s.1-.4.1-.7c0-.4-.2-.7-.4-.9s-.5-.3-.9-.3c-.3 0-.5 0-.7.1-.1.1-.3.2-.4.4-.1.1-.2.3-.3.5 0 .2-.1.5-.1.7h-.9c0-.3.1-.7.2-1zm2.8 5.1v1.2h-1.2v-1.2z"
																	stroke="none">
																</path>
								                              </g>
								                        </svg>
													</div>
												</div>
												<div class="clakWe">Chờ xác nhận</div>
											</div>
										</div>
										<div class="_39XDzv"></div>
										<a href="#">
										<div class="_2lVoQ1">
												<div class="_1limL3">
													<div>
														<span class="_1BJEKe"><div></div>
															<div class="_3huAcN">
																<div class="_3btL3m">
																	<div class="shopee-image__wrapper">
																		<div class="shopee-image__place-holder">
																			<svg enable-background="new 0 0 15 15"
																				viewBox="0 0 15 15" x="0" y="0"
																				class="shopee-svg-icon icon-loading-image">
										                                        <g>
										                                          <rect fill="none" height="8" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" width="10" x="1" y="4.5"></rect>
										                                          <line fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" x1="1" x2="11" y1="6.5" y2="6.5"></line>
										                                          <rect fill="none" height="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" width="3" x="11" y="6.5"></rect>
										                                          <line fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" x1="1" x2="11" y1="14.5" y2="14.5"></line>
										                                          <line fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" x1="6" x2="6" y1=".5" y2="3"></line>
										                                          <line fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" x1="3.5" x2="3.5" y1="1" y2="3"></line>
										                                          <line fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" x1="8.5" x2="8.5" y1="1" y2="3"></line>
										                                        </g>
                                      										</svg>
																		</div>
																		<div class="shopee-image__content"
																			style="background-image: url('https://cf.shopee.vn/file/412f4c96edab7574aae963d3a9dfc3f4_tn');">
																			<div class="shopee-image__content--blur"></div>
																		</div>
																	</div>
																</div>
																<div class="_1cxKtp">
																	<a href="${base }/products/${saleorderpd.product.seo}">
																		<div>
																			<div class="_1xHDVY">
																				<img src="${base }/upload/${saleorderpd.product.avatar}" class="img-title-product-order" id="img" alt="">
																				<span class="_30COVM">${saleorderpd.product.title} x  ${saleorderpd.quality}</span>
																			</div>
																		</div>
																	</a>
																
																	<div class="price-quality">
																		<div class="y8ewrc"></div>
																		<div class="_2H6lAy">Giá : ${saleorderpd.product.priceSale} ₫</div>
																	</div>
																</div>
															</div>
															<div class="_1kvNGb">
																<div>
																	<span class="_34DOjq"></span>
																	<span
																		class="mBERmM _2mEJ4q"></span>
																</div>
															</div></span>
													</div>
													<div class="_3tEHtP"></div>
												</div>
											</div></a>
										<div class="h_Pf2y"></div>
									</div>
								</div>
								<div class="_1J7vLy">
									<div class="DI-rNr tyOBoQ"></div>
									<div class="DI-rNr _25igL4"></div>
								</div>
								<div class="_37UAJO">
									<div class="_1CH8fe">
										<span class="zO5iWv">
											<div class="_-8oSuS">
												<svg width="16" height="17" fill="none"
													xmlns="http://www.w3.org/2000/svg">
							                          <path fill-rule="evenodd" clip-rule="evenodd"
																					d="M15.94 1.664s.492 5.81-1.35 9.548c0 0-.786 1.42-1.948 2.322 0 0-1.644 1.256-4.642 2.561V0s2.892 1.813 7.94 1.664zm-15.88 0C5.107 1.813 8 0 8 0v16.095c-2.998-1.305-4.642-2.56-4.642-2.56-1.162-.903-1.947-2.323-1.947-2.323C-.432 7.474.059 1.664.059 1.664z"
																					fill="url(#paint0_linear)"></path>
							                          <path fill-rule="evenodd" clip-rule="evenodd"
																					d="M8.073 6.905s-1.09-.414-.735-1.293c0 0 .255-.633 1.06-.348l4.84 2.55c.374-2.013.286-4.009.286-4.009-3.514.093-5.527-1.21-5.527-1.21s-2.01 1.306-5.521 1.213c0 0-.06 1.352.127 2.955l5.023 2.59s1.09.42.693 1.213c0 0-.285.572-1.09.28L2.928 8.593c.126.502.285.99.488 1.43 0 0 .456.922 1.233 1.56 0 0 1.264 1.126 3.348 1.941 2.087-.813 3.352-1.963 3.352-1.963.785-.66 1.235-1.556 1.235-1.556a6.99 6.99 0 00.252-.632L8.073 6.905z"
																					fill="#FEFEFE"></path>
							                          <defs>
							                            <linearGradient id="paint0_linear" x1="8"
																					y1="0" x2="8" y2="16.095" gradientUnits="userSpaceOnUse">
						                              <stop stop-color="#F53D2D"></stop>
						                              <stop offset="1" stop-color="#F63"></stop>
						                            </linearGradient>
						                          </defs>
						                        </svg>
											</div>
										</span>
										<div class="_1mmoh8">Tổng số tiền:</div>
										<div class="_1MS3t2">₫ ${saleorderpd.product.priceSale * saleorderpd.quality}</div>
									</div>
								</div>
								<div class="_1Qn42s">
									<div class="_1lM63-">
										<span>Không nhận được đánh giá</span>
									</div>
									<div class="_23TzMz">
										<div class="_2BTXui">
											<button
												class="stardust-button stardust-button--primary _2x5SvJ">
												Mua lại</button>
										</div>
										<div class="_3YxeCv">
											<button
												class="stardust-button stardust-button--secondary _2x5SvJ">
												Liên hệ Người bán</button>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if> 
						</div>
						<div>
							<div class="spinner-container">
								<div class="stardust-spinner">
									<div
										class="stardust-spinner__background stardust-spinner__background--no-overlay">
										<div class="stardust-spinner__main" role="img">
											<svg width="34" height="12" viewBox="-1 0 33 12">
						                        <circle class="stardust-spinner__spinner" cx="4"
																			cy="6" r="4" fill="#EE4D2D"></circle>
						                        <circle class="stardust-spinner__spinner"
																			cx="16" cy="6" r="4" fill="#EE4D2D"></circle>
						                        <circle class="stardust-spinner__spinner"
																			cx="28" cy="6" r="4" fill="#EE4D2D"></circle>
						                    </svg>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

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
<style type="text/css">
	.img-title-product-order {
		width: 55px;
		border-radius: 50%;
		border: 1px solid #0a68ff;
	}
	._2H6lAy{
		position: absolute;
		margin-top: -22px;
		margin-left: 77px;
		color: #0a68ff;
	}
	span._30COVM {
		color: #0a68ff;
		position: absolute;
		font-size: 18px;
		margin-left: 22px;
	}
	._1QwuCJ {
		display: flex;
		padding: 1.25rem 0 3.125rem;
	}
	body {
		background: #f7f7ff;
		margin-top: 0px;
	}
	.container {
		margin-right: auto;
		margin-left: auto;
		width: 1200px;
	}
	._36cLcR {
		display: block;
		width: 180px;
		flex-shrink: 0;
	}
	._1_68zU {
		display: flex;
		padding: 15px 0;
		border-bottom: 1px solid #efefef;
	}
	._1ZnP-m {
		list-style: none;
		padding: 0;
		margin: 27px 0 0;
		cursor: pointer;
	}
	.stardust-dropdown {
		position: relative;
	}
	._3aAm2h {
		text-decoration: none;
		color: rgba(0,0,0,.87);
		display: flex;
		align-items: center;
		margin-bottom: .9375rem;
	}

	._2PrdXX, ._3aAm2h {
		text-transform: capitalize;
		transition: color .1s cubic-bezier(.4,0,.2,1);
	}
	._21F-bS {
		display: flex;
		align-items: center;
		justify-content: center;
		width: 1.25rem;
		height: 1.25rem;
		line-height: 1.25rem;
		text-align: center;
		border-radius: 50%;
		color: #fff;
		flex-shrink: 0;
		margin-right: .625rem;
	}
	.img-_21F-bS{
		width: 22px;
	}
	._2i7380 {
		line-height: 1rem;
	}
	._3CHLlN {
		font-weight: 400;
		margin-right: .3125rem;
		font-size: smaller;
		margin-left: 15px;
	}
	._3W8r9U {
		vertical-align: middle;
		position: absolute;
	}
	.stardust-dropdown__item-body--open {
		height: auto;
		opacity: 1;
	}

	.stardust-dropdown__item-body {
		transition: height .4s cubic-bezier(.4,0,.2,1),opacity .4s cubic-bezier(.4,0,.2,1);
		height: 0;
		opacity: 0;
		overflow: hidden;
	}
	.stardust-dropdown__item-body--open {
		height: auto;
		opacity: 1;
	}
	.stardust-dropdown__item-body {
		transition: height .4s cubic-bezier(.4,0,.2,1),opacity .4s cubic-bezier(.4,0,.2,1);
		height: 0;
		opacity: 0;
		overflow: hidden;
	}
	._3aiYwk {
		display: block;
		padding: 0 0 .1875rem 2.125rem;
	}
	._2BuJEf, .shopee-avatar {
		width: 50px;
		height: 50px;
	}
	._2uLDqN {
		flex: 1;
		display: flex;
		flex-direction: column;
		justify-content: center;
		overflow: hidden;
	}
	._2lG70n {
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		min-height: 1rem;
		font-weight: 600;
		margin-bottom: 5px;
		color: #333;
	}
	._27BCO5 {
		color: #888;
		text-transform: capitalize;
		text-decoration: none;
		font-size: 12px;
	}
	._23VQQX {
		border-color: #0a68ff;
	}
	._2BuJEf, .shopee-avatar {
		width: 50px;
		height: 50px;
	}

	.shopee-avatar {
		display: inline-block;
		width: 1.875rem;
		height: 1.875rem;
		position: relative;
		border-radius: 50%;
		border: .0625rem solid rgba(0,0,0,.09);
		-moz-box-sizing: border-box;
		box-sizing: border-box;
	}
	.shopee-avatar__placeholder {
		width: 100%;
		position: relative;
		background-color: #f5f5f5;
		border-radius: 50%;
		overflow: hidden;
	}
	.shopee-avatar__img {
		border-radius: 50%;
	}

	.shopee-avatar__img, .shopee-avatar__img-wrapper {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		display: block;
	}

	._3D9BVC {
		position: relative;
		flex-grow: 1;
		width: 980px;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		margin-left: 1.6875rem;
		min-width: 0;
		background: #fff;
		box-shadow: 0 1px 2px 0 rgb(0 0 0 / 13%);
		border-radius: .125rem;
	}
	._2mSi0S {
		min-height: 740px;
		background: #f5f5f5;
		box-shadow: 0 0 0 2px #f5f5f5;
	}
	.ZS1kj6 {
		width: 100%;
		margin-bottom: 12px;
		display: flex;
		overflow: hidden;
		position: -webkit-sticky;
		position: sticky;
		top: 0;
		z-index: 10;
		background: #fff;
		border-top-left-radius: 2px;
		border-top-right-radius: 2px;
	}
	._23VQQX {
		border-color: #0a68ff;
	}

	._2sowby:hover, ._23VQQX {
		color: #0a68ff;
	}
	._2sowby {
		cursor: pointer;
		-webkit-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
		user-select: none;
		padding: 16px 0;
		font-size: 16px;
		line-height: 19px;
		text-align: center;
		color: rgba(0,0,0,.8);
		background: #fff;
		border-bottom: 2px solid rgba(0,0,0,.09);
		display: flex;
		flex: 1;
		overflow: hidden;
		align-items: center;
		justify-content: center;
		transition: color .2s;

	}
	._2sowby-bd{
		border-bottom-color: #0a68ff;
	}

	a {
		text-decoration: none;
	}
	a {
		background-color: transparent;
	}
	._2pSH8O {
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	._1MmTVs {
		padding: 12px 0;
		margin: 12px 0;
		display: flex;
		align-items: center;
		box-shadow: 0 1px 1px 0 rgb(0 0 0 / 5%);
		color: #212121;
		background: #eaeaea;
		border-radius: 2px;
	}
	._1MmTVs>svg {
		margin: 0 15px;
		stroke: #bbb;
	}

	svg:not(:root) {
		overflow: hidden;
	}
	._1MmTVs>input {
		flex: 1;
		font-size: 14px;
		line-height: 16px;
		border: 0;
		outline: none;
		background-color: inherit;
	}

	input, input:active, input:focus {
		outline: none;
	}
	input {
		flex: 1;
		padding: 0;
		border: 0;
		word-break: break-all;
	}
	input {
		line-height: normal;
	}
	button, input, optgroup, select, textarea {
		color: inherit;
		font: inherit;
		margin: 0;
	}
	._2n4gHk {
		margin: 12px 0;
		box-shadow: 0 1px 1px 0 rgb(0 0 0 / 5%);
		border-radius: .125rem;
	}
	.GuWdvd:first-child {
		padding-top: 24px;
	}

	.GuWdvd {
		padding: 12px 24px;
		background: #fff;
	}
	._1DPpu5, .WqnWb- {
		display: flex;
		align-items: center;
	}

	.WqnWb- {
		padding: 0 0 12px;
		justify-content: space-between;
	}
	._1DPpu5 {
		white-space: nowrap;
	}

	._1DPpu5, .WqnWb- {
		display: flex;
		align-items: center;
	}
	._2zTpu5 {
		display: flex;
		align-items: center;
	}
	._1CIbL0 {
		max-width: 200px;
		margin-left: 8px;
		font-size: 14px;
		font-weight: 600;
		overflow: hidden;
		text-overflow: ellipsis;
	}

	._1CIbL0, ._1q53YG, ._2L5VLu {
		margin: 0 0 0 8px;
	}
	._2hRxNA {
		margin: 0 10px 0 0;
		padding: 0 5px 0 0;
		text-align: right;
		border-right: 1px solid rgba(0,0,0,.12);
	}
	._3nBhmP {
		margin: 0 5px 0 0;
	}

	._2hRxNA .icon-help, ._3nBhmP {
		vertical-align: middle;
	}
	a {
		text-decoration: none;
	}
	a {
		background-color: transparent;
	}
	._2hRxNA .icon-free-shipping-line {
		margin: 0 4px 0 0;
		vertical-align: middle;
		font-size: 1rem;
		color: #00bfa5;
		stroke: #26aa99;
	}
	svg:not(:root) {
		overflow: hidden;
	}
	.shopee-svg-icon {
		display: inline-block;
		width: 1em;
		height: 1em;
		fill: currentColor;
		position: relative;
	}
	._36mfQM {
		text-decoration: none;
		color: rgba(0,0,0,.87);
		color: #26aa99;
		vertical-align: middle;
	}
	._2hRxNA .shopee-drawer {
		margin: 0 0 0 6px;
		display: inline-flex;
		vertical-align: middle;
	}

	.shopee-drawer {
		display: flex;
		position: relative;
		overflow: visible;
		outline: 0;
	}
	.clakWe {
		line-height: 24px;
		color: #0a68ff;
		text-align: right;
		text-transform: uppercase;
		white-space: nowrap;
	}
	.GuWdvd:last-child .h_Pf2y {
		display: none;
	}

	.h_Pf2y {
		height: 10px;
	}
	._39XDzv, .h_Pf2y {
		border-bottom: 1px solid rgba(0,0,0,.09);
	}
	._1J7vLy {
		width: 100%;
		height: 0;
		border-bottom: 1px dotted rgba(0,0,0,.09);
		position: relative;
	}
	.tyOBoQ {
		left: 0;
		-webkit-transform: translate(-50%,-50%);
		transform: translate(-50%,-50%);
	}

	.DI-rNr {
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		background: #f5f5f5;
		width: .4375rem;
		height: .4375rem;
		border-radius: 50%;
		z-index: 1;
		position: absolute;
		top: 0;
	}
	._25igL4 {
		right: 0;
		-webkit-transform: translate(50%,-50%);
		transform: translate(50%,-50%);
	}

	.DI-rNr {
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		background: #f5f5f5;
		width: .4375rem;
		height: .4375rem;
		border-radius: 50%;
		z-index: 1;
		position: absolute;
		top: 0;
	}
	._37UAJO {
		padding: 24px 24px 12px;
		background: #fffefb;
	}
	._1CH8fe {
		display: flex;
		justify-content: flex-end;
		align-items: center;
	}
	.zO5iWv {
		cursor: pointer;
	}
	._-8oSuS {
		cursor: pointer;
		-webkit-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
		user-select: none;
		margin: 0 5px 0 0;
		line-height: 0;
	}
	._1mmoh8 {
		margin: 0 10px 0 0;
		font-size: 14px;
		line-height: 20px;
		color: rgba(0,0,0,.8);
	}
	._1MS3t2 {
		color: #0a68ff;
		font-size: 24px;
		line-height: 30px;
	}
	._1Qn42s {
		padding: 12px 24px 24px;
		display: flex;
		flex-wrap: nowrap;
		justify-content: space-between;
		align-content: center;
		background: #fffefb;
	}
	._1lM63- {
		display: flex;
		flex-direction: column;
		justify-content: center;
		min-width: 300px;
		max-width: 400px;
		flex-grow: 1;
		word-wrap: break-word;
		text-align: left;
		font-size: 12px;
		line-height: 16px;
		color: rgba(0,0,0,.54);
	}
	._2BTXui, ._3YxeCv, ._23TzMz {
		display: flex;
		overflow: hidden;
	}
	._2BTXui, ._3YxeCv {
		margin: 0 0 0 10px;
		align-items: center;
		text-overflow: ellipsis;
	}
	._2x5SvJ, ._2x5SvJ:hover {
		border: 1px solid transparent;
	}

	._2x5SvJ {
		min-width: 150px;
		min-height: 40px;
		padding: 8px 20px;
		outline: none;
		overflow: hidden;
		text-overflow: ellipsis;
		text-transform: capitalize;
		border-radius: 2px;
		outline: 0;
	}
	.stardust-button--primary {
		background-color: #0a68ff;
		border-color: #0a68ff;
		color: #fff;
	}
	.stardust-button {
		font-family: -apple-system,Helvetica Neue,Helvetica,Roboto,Droid Sans,Arial,sans-serif;
		font-weight: 400;
		font-size: 14px;
		border-radius: 4px;
		border: 1px solid rgba(0,0,0,.26);
		background-color: #fff;
		color: rgba(0,0,0,.87);
		padding: 8px 10px;
	}
	.stardust-button {
		font-family: inherit!important;
	}
	.stardust-button--primary {
		background-color: #0a68ff;
		border-color: #0a68ff;
		color: #fff;
	}
	.stardust-button {
		font-family: -apple-system,Helvetica Neue,Helvetica,Roboto,Droid Sans,Arial,sans-serif;
		font-weight: 400;
		font-size: 14px;
		border-radius: 4px;
		border: 1px solid rgba(0,0,0,.26);
		background-color: #fff;
		color: rgba(0,0,0,.87);
		padding: 8px 10px;
	}
	button, html input[type=button], input[type=reset], input[type=submit] {
		-webkit-appearance: button;
		cursor: pointer;
	}
	button, select {
		text-transform: none;
	}
	button {
		overflow: visible;
	}
	button, input, optgroup, select, textarea {
		color: inherit;
		font: inherit;
		margin: 0;
	}

	._1lE6Rh, ._1umrlw {
		display: flex;
		align-items: center;
	}

	._1lE6Rh {
		padding: 0 0 0 10px;
	}
	.stardust-button--primary {
		background-color: #0a68ff;
		border-color: #0a68ff;
		color: rgb(255, 255, 255);
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