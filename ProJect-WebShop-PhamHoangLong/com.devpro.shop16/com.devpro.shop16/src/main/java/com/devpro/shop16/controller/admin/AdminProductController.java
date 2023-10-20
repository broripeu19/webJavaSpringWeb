package com.devpro.shop16.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.CartItem;
import com.devpro.shop16.dto.ProductAdmin;
import com.devpro.shop16.dto.ProductSearchModel;
import com.devpro.shop16.entities.Product;
import com.devpro.shop16.entities.ProductImages;
import com.devpro.shop16.entities.SubscribeEntities;
import com.devpro.shop16.services.ProductService;

@Controller
public class AdminProductController extends BaseController {

	@Autowired
	private ProductService productService;
		
	
	@RequestMapping(value = { "/admin/products-admin" }, method = RequestMethod.GET)
	public String adminProductList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		searchModel.categoryId = super.getInteger(request, "categoryId");
		
		model.addAttribute("productsWithPaging", productService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		return "quantrivien/products-admin";
	}
	
	
	
	
	@RequestMapping(value = { "/admin/add-product" }, method = RequestMethod.GET)
	public String adminProductAddOrUpdate(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		// đẩy danh sách categories xuống
		//model.addAttribute("categories", categoriesService.findAll());

		// add sản phẩm mới
		model.addAttribute("product", new Product());

		return "quantrivien/add-product";
	}
	
	@RequestMapping(value = { "/admin/add-product/{productId}" }, method = RequestMethod.GET)
	public String adminProductEdit(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("productId") int productId) throws IOException {
		// đẩy danh sách categories xuống
//		model.addAttribute("categories", categoriesService.findAll());

		// lấy sản phẩm trong db
		Product product = productService.getById(productId);

		// edit sản phẩm
		model.addAttribute("product", product);

		return "quantrivien/add-product";
	}
	
	
	@RequestMapping(value = { "/admin/add-product" }, method = RequestMethod.POST)
	public String adminProductAddOrUpdate(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("product") Product product, // spring-form biding với
																							// product model
			@RequestParam("productAvatar") MultipartFile productAvatar, // hứng file đẩy lên
			@RequestParam("productPictures") MultipartFile[] productPictures // hứng file đẩy lên
	) throws Exception {

		// cần kiểm tra xem id của product
		// = null || = 0 thì thêm mới
		// ngược lại là chỉnh sửa
		if (product.getId() == null || product.getId() <= 0) { // thêm mới
			productService.add(product, productAvatar, productPictures);
		} else { // chỉnh sửa
			productService.update(product, productAvatar, productPictures);
		}

	
		
		// đường dẫn tới View.
		return "redirect:/admin/products-admin";
	}
	
	@RequestMapping(value = { "/admin/products-admin/delete/{productId}" }, method = RequestMethod.GET)
	public String adminDeleteProduct(final Model model,  final HttpServletRequest request,
			final HttpServletResponse response,@PathVariable("productId") int productId ) 
			throws IOException {
		
		Product product = productService.getById(productId);
		
		productService.delete(product);
		
		model.addAttribute("product", new Product());
	
		
		
		return "redirect:/admin/products-admin";
	}
	
	
	
}
