package com.devpro.shop16.controller.admin;


import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AdminController {


	@RequestMapping(value = { "/admin/index" }, method = RequestMethod.GET)

	public String indexadmin(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "quantrivien/index-admin";

	}

	@RequestMapping(value = { "/admin/accounts" }, method = RequestMethod.GET)

	public String accounts(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		return "quantrivien/accounts";

	}

	@RequestMapping(value = { "/edit-product" }, method = RequestMethod.GET)

	public String editproduct(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "quantrivien/edit-product";

	}

	@RequestMapping(value = { "/login-admin" }, method = RequestMethod.GET)

	public String loginadmin(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "quantrivien/login-admin";

	}

	/*
	 * @RequestMapping(value = { "/products-admin" }, method = RequestMethod.GET)
	 * 
	 * public String productsadmin(final Model model, final HttpServletRequest
	 * request, final HttpServletResponse response) throws IOException { return
	 * "quantrivien/products-admin";
	 * 
	 * }
	 */

	/*
	 * @RequestMapping(value = { "/admin/product/management" }, method =
	 * RequestMethod.GET)
	 * 
	 * public String addproduct(final Model model, final HttpServletRequest request,
	 * final HttpServletResponse response) throws IOException {
	 * 
	 * // tạo 1 đối tượng product ProductAdmin product = new ProductAdmin();
	 * 
	 * // đẩy product xuống tầng View từ Controller model.addAttribute("addproduct",
	 * product);
	 * 
	 * return "quantrivien/add-product";
	 * 
	 * }
	 */

	// định nghĩa action phải sử dụng "@RequestMapping"
	/**
	 * @param model:    sử dụng để đẩy dữ liệu từ Controller -> View
	 * @param request:  Sử dụng để lấy ReuqestParam
	 * @param response:
	 * @throws IOException
	 */
	/*
	 * @RequestMapping(value = { "/add-product" }, method = RequestMethod.POST)
	 * public String post_spring_form(final Model model, final HttpServletRequest
	 * request, final HttpServletResponse response,
	 * final @ModelAttribute("addproduct") ProductAdmin product,
	 * final @RequestParam("productfile") MultipartFile productfile) throws
	 * IllegalStateException, IOException { model.addAttribute("TB", "Cảm ơn " +
	 * product.getName() +
	 * ", chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất!");
	 * 
	 * // lưu ảnh lên server productfile.transferTo(new File("C:/upload/" +
	 * productfile.getOriginalFilename())); // lưu đường dẫn ảnh vào contact
	 * product.setAddfile("C:/upload/" + productfile.getOriginalFilename());
	 * 
	 * // trả về đường dẫn tới view return "khachhang/add-product"; }
	 */
	
	/**
	 * Sử dụng ajax
	 * @param model
	 * @param request
	 * @param response
	 * @param contactModel
	 * @return
	 */
	/*
	 * @RequestMapping(value = { "/ajax/add_product" }, method = RequestMethod.POST)
	 * public ResponseEntity<Map<String, Object>> ajax_contact(final Model model ,
	 * final HttpServletRequest request, final HttpServletResponse response,
	 * final @RequestBody ProductAdmin product) { Map<String, Object> jsonResult =
	 * new HashMap<String, Object>(); jsonResult.put("code", 200);
	 * jsonResult.put("message", "Sản phẩm " + product.getName() +
	 * ", đã được đưa lên kệ!"); return ResponseEntity.ok(jsonResult); }
	 */
	

	
	 
	 

}
