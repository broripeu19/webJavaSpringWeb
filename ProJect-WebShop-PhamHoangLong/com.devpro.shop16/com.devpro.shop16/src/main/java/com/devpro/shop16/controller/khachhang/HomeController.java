package com.devpro.shop16.controller.khachhang;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.hibernate.sql.Select;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.ProductSearchModel;
import com.devpro.shop16.dto.SaleOrderSearchModel;
import com.devpro.shop16.entities.Product;
import com.devpro.shop16.entities.Role;
import com.devpro.shop16.entities.SaleOrder;
import com.devpro.shop16.entities.SaleOrderProducts;
import com.devpro.shop16.entities.User;
import com.devpro.shop16.services.OrderProductService;
import com.devpro.shop16.services.PagerData;
import com.devpro.shop16.services.ProductService;
import com.devpro.shop16.services.RoleService;
import com.devpro.shop16.services.SaleOrderService;
import com.devpro.shop16.services.UserDetailsServiceImpl;
import com.devpro.shop16.services.UserService;

@Controller
public class HomeController extends BaseController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private SaleOrderService saleOrderService;
	
	@Autowired
	private OrderProductService orderProductService;
	
	
	@RequestMapping(value = { "/", "/home", "/index" }, method = RequestMethod.GET)

	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		searchModel.categoryId = super.getInteger(request, "categoryId");
		
		model.addAttribute("productsWithPaging", productService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		return "khachhang/index";

	}

	



	/*
	 * @RequestMapping(value = { "/list-product" }, method = RequestMethod.GET)
	 * 
	 * public String listProduct(final Model model, final HttpServletRequest
	 * request, final HttpServletResponse response) throws IOException {
	 * 
	 * return "khachhang/list-product";
	 * 
	 * }
	 */
	

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)

	public String login(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
	
		return "login";

	}
	
	@RequestMapping(value = { "/purchase-history" }, method = RequestMethod.GET)

	public String purchaseHistory(final Model model, final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		
		SaleOrderSearchModel searchModel = new SaleOrderSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		//PagerData<>
		
		model.addAttribute("saleorderProductWithPaging", orderProductService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		return "khachhang/purchase-history";

	}
	
	
	@RequestMapping(value = { "/purchase-history2" }, method = RequestMethod.GET)

	public String purchaseHistory2(final Model model, final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		
		SaleOrderSearchModel searchModel = new SaleOrderSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		
		model.addAttribute("saleorderProductWithPaging", orderProductService.searchstatus(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		return "khachhang/purchase-history2";

	}
	
	@RequestMapping(value = { "/purchase-all" }, method = RequestMethod.GET)

	public String purchaseAll(final Model model, final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		
		SaleOrderSearchModel searchModel = new SaleOrderSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		
		model.addAttribute("saleorderProductWithPaging", orderProductService.searchAll(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		return "khachhang/purchase-all";

	}
	
	@RequestMapping(value = { "/products/{productSeo}" }, method = RequestMethod.GET)
	public String productDetails(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("productSeo") String productSeo) throws IOException {
		
		ProductSearchModel searchModel = new ProductSearchModel();

		searchModel.seo = productSeo;
		PagerData<Product> products = productService.search(searchModel);

		Product product = products.getData().get(0);
		// add sản phẩm mới
		model.addAttribute("product", product);
		return "khachhang/products";
	}



	@RequestMapping(value = { "/signup" }, method = RequestMethod.GET)

	public String signup(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		model.addAttribute("signup", new User());
		
		
		return "khachhang/signup";
	}
	
	
	
	
	@RequestMapping(value = { "/signup" }, method = RequestMethod.POST)
	public String adminProductAddOrUpdate(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("signup") User signup 
			// spring-form biding 
			// product model
			
	) throws Exception {
		if (signup.getId() == null || signup.getId() <= 0) { // thêm mới
			Role roleUser = roleService.loadRoleByRoleName("GUEST");
			
			signup.addRoles(roleUser);
			userService.saveOrUpdate(signup);	
			
			model.addAttribute("TB", "Tài khoản " + signup.getUsername() + " đã được đăng kí!");
		}
		
		else { // chỉnh sửa
			model.addAttribute("TB", "Có vẻ như tài khoản " + signup.getUsername() + " đã được đăng kí trước đó, vui lòng đăng kí lại !");
		}
		model.addAttribute("signup", new User());
		// đường dẫn tới View.
		return "khachhang/signup";
	}

}
