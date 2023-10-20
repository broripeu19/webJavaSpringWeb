package com.devpro.shop16.controller.khachhang;

import java.io.IOException;
import java.math.BigDecimal;
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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.Cart;
import com.devpro.shop16.dto.CartItem;
import com.devpro.shop16.entities.Product;
import com.devpro.shop16.entities.SaleOrder;
import com.devpro.shop16.entities.SaleOrderProducts;
import com.devpro.shop16.entities.User;
import com.devpro.shop16.services.ProductService;
import com.devpro.shop16.services.SaleOrderService;
import com.devpro.shop16.services.UserService; 
@Controller
public class CartController extends BaseController {

	@Autowired
	private ProductService productService;
	@Autowired
	private SaleOrderService saleOrderService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.POST)
	public String cartFinish(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {

		
		String customerFullName = request.getParameter("customerFullName");
		String customerAddress = request.getParameter("customerAddress");
		String customerEmail = request.getParameter("customerEmail");
		String customerPhone = request.getParameter("customerPhone");
		
	
		SaleOrder saleOrder = new SaleOrder();
		SaleOrderProducts saleOrderPd = new SaleOrderProducts();

		if(super.isLogined()) {
			User userLogined = super.getUserLogined();
			saleOrder.setUser(userLogined); //khÃ³a ngoáº¡i user_id
			saleOrder.setCustomerName(userLogined.getUsername());
			saleOrder.setCustomerEmail(userLogined.getEmail());
			saleOrder.setCustomerAddress("Bac Tu Liem - Ha Noi");
			saleOrder.setCustomerPhone("0356716116");
			
		} else {
			saleOrder.setCustomerName(customerFullName);
			saleOrder.setCustomerEmail(customerEmail);
			saleOrder.setCustomerAddress(customerAddress);
			saleOrder.setCustomerPhone(customerPhone);	
		}		

		
		saleOrder.setCode(String.valueOf(System.currentTimeMillis()));
//		if(getUserLogined() != null) {
//			
//		}

		
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		for (CartItem cartItem : cart.getCartItems()) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuality(cartItem.getQuanlity());
			
			
			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}

		User userId =  userService.loadUserByUsername(customerFullName);
		saleOrder.setUser(userId);
		saleOrderPd.setUser(userId);
		saleOrderService.saveOrUpdate(saleOrder);
		
		//throw new BadRequestException("Trạng thái đơn hàng không hợp lệ");
		
		
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", "0");

		return "redirect:/";
	}
	
	
	@RequestMapping(value = { "/cart/view" }, method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "khachhang/cart"; //
	}
	
	@RequestMapping(value = { "/ajax/updateQualityCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_UpdateQualityCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		int currentProductQuality = 0;
		/* int reductionCurrentProductQuality = currentProductQuality; */
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				currentProductQuality = item.getQuanlity() +1;
				item.setQuanlity(currentProductQuality);
				/*
				 * reductionCurrentProductQuality = item.getQuanlity() -1;
				 * item.setQuanlity(reductionCurrentProductQuality);
				 */
			}
		}
		/*
		 * for (CartItem item : cartItems) { if (item.getProductId() ==
		 * cartItem.getProductId()) { reductionCurrentProductQuality =
		 * item.getQuanlity() -1; item.setQuanlity(reductionCurrentProductQuality); } }
		 */


		
		// tính tổng tiền
		this.calculateTotalPrice(request);
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("currentProductQuality", currentProductQuality);
		/*
		 * jsonResult.put("reductionCurrentProductQuality",
		 * reductionCurrentProductQuality);
		 */
		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = { "/ajax/RemoveQualityCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_RemoveQualityCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì giảm số lượng
		int currentProductQuality = 0;
		/* int reductionCurrentProductQuality = currentProductQuality; */
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId() || item.getQuanlity() >= 2  ) {
				
					currentProductQuality = item.getQuanlity() - 1;
					if(currentProductQuality > 0) {
						item.setQuanlity(currentProductQuality);
					}
					
					else if (currentProductQuality <= 0) {
						currentProductQuality = 0;
						item.setQuanlity(currentProductQuality);
					}
					
				
				
			}
		}
		// tính tổng tiền
		this.calculateTotalPrice(request);
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("currentProductQuality", currentProductQuality);
		
		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/ajax/addToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		
		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
				item.setQuanlity(item.getQuanlity() + cartItem.getQuanlity());
			}
		}
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId() || item.getQuanlity() >= 2) {
				isExists = true;
				item.setQuanlity(item.getQuanlity() - cartItem.getQuanlity());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng
		if (!isExists) {
			Product productInDb = productService.getById(cartItem.getProductId());

			cartItem.setProductName(productInDb.getTitle());
			cartItem.setPriceUnit(productInDb.getPrice());

			cart.getCartItems().add(cartItem);
		}

		// tính tổng tiền
		this.calculateTotalPrice(request);
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));

		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}
	
	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		SaleOrder saleOrder = new SaleOrder();
		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuanlity();
		}
		return total;
	}
	
	private void calculateTotalPrice(final HttpServletRequest request) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();
		SaleOrder saleOrder = new SaleOrder();
		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		BigDecimal total = BigDecimal.ZERO;
		
		for(CartItem ci : cartItems) {
			total = total.add(ci.getPriceUnit().multiply(BigDecimal.valueOf(ci.getQuanlity())));
		}
		saleOrder.setTotal(total);
		cart.setTotalPrice(total);
	
	}
	
	@GetMapping("/cart/remove/{productId}")
	public String removeProduct(final HttpServletRequest request,@PathVariable("productId") int productId) {
		HttpSession session = request.getSession();
		
		Cart cart = null;
		cart = (Cart) session.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();
		
		Product product= productService.getById(productId);
		var index = 0;
		for(int i=0;i<cartItems.size();i++) {
			if(cartItems.get(i).getProductId() == productId) {
				index = i;
				break;
			}
		}
		cartItems.remove(index);
		this.calculateTotalPrice(request);
		
		
		return "redirect:/cart/view";
	}
}
