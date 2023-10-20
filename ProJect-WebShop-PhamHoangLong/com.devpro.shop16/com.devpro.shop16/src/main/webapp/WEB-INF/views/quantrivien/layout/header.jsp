<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

	<nav class="navbar navbar-expand-xl">

		<div class="container h-100">
			<a class="navbar-brand" href="${base }/admin/index">
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
					<li class="nav-item"><a class="nav-link" href="${base }/admin/index">
							<i class="fas fa-tachometer-alt"></i> Dashboard <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">
							<i class="far fa-file-alt"></i> <span>
									Other List <i class="fas fa-angle-down"></i>
							</span>
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="${base }/admin/categories-admin">Category</a>
							<a class="dropdown-item" href="${base }/admin/contacts-admin">Contact</a>
							<a class="dropdown-item" href="${base }/admin/subscribes-admin">Subscribe</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">
							<i class="far fa-file-alt"></i> <span>
									Products <i class="fas fa-angle-down"></i>
							</span>
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="${base }/admin/products-admin">Products</a> 
							<a class="dropdown-item" href="${base}/admin/saleorders-admin">Sale Order</a>
						</div>
						
					</li>

					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">
							<i class="far fa-file-alt"></i> <span>
									Accounts <i class="fas fa-angle-down"></i>
							</span>
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="nav-link" href="${base }/admin/accounts">Accounts</a>
							<a class="nav-link" href="${base}/admin/users-admin">User</a> 
						</div>
					
						
					</li>
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
						href="${base }/login"> Admin, <b>${userLogined.username }</b>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>