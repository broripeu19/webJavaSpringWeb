<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng ký tài khoản - Mua sắm online | Shopee Việt Nam</title>
<link rel="stylesheet" href="../css/signup.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- import SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<style type="text/css">
.alert-signup-success{
font-size: 13px;
}

</style>

</head>
<body>
	<div class="main">
		<div class="header">
			<nav class="header-nav">
				<div class="header-nav-sub">

					<div>Đăng ký</div>
					<a href="https://help.shopee.vn/vn/s" target="_blank"
						rel="noopener noreferrer" class="_3pclFS">Cần trợ giúp?</a>
				</div>
			</nav>
		</div>
		<div class="container-center">
			<div class="content-center">
				<div class="background">
					
					<div>
						<sf:form method="post" action="${base }/signup" modelAttribute="signup"  name="myForm" onsubmit="return validateForm()"  >
							<sf:hidden path="id" />
							<div class="login-form">
								<div class="title-login">
									<c:if test="${not empty TB }">
										<div class="alert alert-primary alert-signup-success" role="alert">${TB }</div>
									</c:if>
									<div>Đăng ký</div>
								</div>
								<div class="login-account">
									<sf:input type="email" path="email" autocomplete="off" onfocusout="keyupEmail()" class="form-control" name="Email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Email" required="required"></sf:input>
									<span id="error-email" class="form-text"></span>
								</div>
								<div class="login-account">
									<sf:input type="text" path="username" autocomplete="off" onfocusout="keyupEmail()" class="form-control" name="userName" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Tài Khoản" required="required"></sf:input>
									<span id="error-email" class="form-text"></span>
								</div>
								<div class="login-password">
									<sf:input type="password" path="password" autocomplete="off" onfocusout="keyupPassword()" class="form-control" id="inputPassword6" name="password" aria-describedby="passwordHelpInline" placeholder="Mật khẩu phải dài từ 8-20 kí tự "></sf:input>
									<span id="passwordHelpInline" class="form-text"></span>
								</div>
								<div class="login-check-password">
									<input type="password" onfocusout="keyupCheckPassword()"
										id="check-inputPassword6" class="form-control"
										placeholder="Nhập lại mật khẩu" name="check-password"
										aria-describedby="passwordHelpInline"> <span
										id="checkpasswordHelpInline" class="form-text"></span>
								</div>
								<button type="submit" value="submit" class="btn btn-primary">Đăng ký</button>

								<div class="login-contact">
									<div class="login-or">
										<div class="login-or-1"></div>
										<span class="login-or-text">HOẶC</span>
										<div class="login-or-2"></div>
									</div>
									<div class="login-connect">
										<div class="connect-fb">
											<div>
												<svg xmlns="http://www.w3.org/2000/svg" width="16"
													height="16" fill="currentColor" class="bi bi-facebook"
													viewBox="0 0 16 16">
                                                    <path
														d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
                                                </svg>
											</div>
											<span>Facebook</span>
										</div>
										<div class="connect-gg">
											<div>
												<svg xmlns="http://www.w3.org/2000/svg" width="16"
													height="16" fill="currentColor" class="bi bi-google"
													viewBox="0 0 16 16">
                                                    <path
														d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                                                </svg>
											</div>
											<span>Google</span>
										</div>

									</div>
								</div>
								<div class="register">
									<div class="register-ask">
										Bạn đã có tài khoản Shopee? <a
											href="${base}/login">Đăng
											nhập</a>
									</div>
								</div>
							</div>	
						</sf:form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/script.js"></script>
</html>