// Cập nhật số lượng sản phẩm vào trong giỏ hàng
function DeleteUser(baseUrl, username) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		username: username, // lay theo id

	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/DeleteUser/${username}", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			// tăng số lượng sản phẩm trong giỏ hàng trong icon
			alert(JSON.stringify(jsonResult));
			alert(jsonResult.message);
			
		},
		error: function(jqXhr, textStatus, errorMessage) {
		}
	});
}




// Cập nhật số lượng sản phẩm vào trong giỏ hàng
function UpdateQualityCart(baseUrl, productId) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // lay theo id

	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/updateQualityCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			// tăng số lượng sản phẩm trong giỏ hàng trong icon
			$( "#quality_" + productId ).html(jsonResult.currentProductQuality);
			
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}


// Cập nhật số lượng sản phẩm vào trong giỏ hàng
function RemoveQualityCart(baseUrl, productId) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // lay theo id

	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/RemoveQualityCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			// tăng số lượng sản phẩm trong giỏ hàng trong icon
			$( "#quality_" + productId ).html(jsonResult.currentProductQuality);
			
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}
// Cập nhật số lượng sản phẩm vào trong giỏ hàng
function RemoveProduct(baseUrl, id) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		id: id, // lay theo id

	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/RemoveProduct", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			// tăng số lượng sản phẩm trong giỏ hàng trong icon
			alert(jsonResult.message);
		},
		error: function(jqXhr, textStatus, errorMessage) {
			alert("Xóa thất bại!")
		}
	});
}


// Thêm sản phẩm vào trong giỏ hàng
function AddToCart(baseUrl, productId, quanlity) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // lay theo id
		quanlity: quanlity, // lay theo id
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/addToCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			// tăng số lượng sản phẩm trong giỏ hàng trong icon
			$( "#iconShowTotalItemsInCart" ).html(jsonResult.totalItems);
			$([document.documentElement, document.body]).animate({
			    scrollTop: $("#iconShowTotalItemsInCart").offset().top
			}, 2000);
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}




contact = function(baseUrl) {
	// tạo javascript object.  
	// data là dữ liệu cùng kiểu với RequestMapping
	let data = {
		name: jQuery("#name").val(), // lay theo id
		email: jQuery("#email").val(), // lay theo id
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/contact", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json vì controlelr action trả về kiểu Map
		success: function(jsonResult) {
			alert(JSON.stringify(jsonResult));
			alert(jsonResult.message);
			
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}
