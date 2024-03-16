// Cập nhật số lượng sản phẩm vào trong giỏ hàng
function RemoveProduct(id) {
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
			
		}
	});
}


customersubscribe = function(baseUrl) {
	// tạo javascript object.  
	// data là dữ liệu cùng kiểu với RequestMapping
	let data = {
		email: jQuery("#email").val(), // lay theo id
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/customer_subscribe/", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json vì controlelr action trả về kiểu Map
		success: function(jsonResult) {
			//alert(JSON.stringify(jsonResult));
			alert(jsonResult.message);
			
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}
