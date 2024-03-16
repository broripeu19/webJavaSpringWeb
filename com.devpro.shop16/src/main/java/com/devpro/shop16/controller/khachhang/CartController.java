package com.devpro.shop16.controller.khachhang;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.devpro.shop16.conf.Config;
import com.devpro.shop16.entities.*;
import com.devpro.shop16.services.OrderProductService;
//import com.google.gson.Gson;
//import com.google.gson.JsonObject;
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
	private OrderProductService orderProductService;
	
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
			saleOrder.setUser(userLogined); //khoa ngoai user_id
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
			saleOrderProducts.setUser(userService.loadUserByUsername(customerFullName));

			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}

		User user = userService.loadUserByUsername(customerFullName);
		saleOrder.setUser(user);
		saleOrderPd.setUser(user);
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
			cartItem.setPriceSale(productInDb.getPriceSale());
			cartItem.setProductAvatar(productInDb.getAvatar());
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
			total = total.add(ci.getPriceSale().multiply(BigDecimal.valueOf(ci.getQuanlity())));
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


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String vnp_Version = "2.1.0";
		String vnp_Command = "pay";
		String vnp_OrderInfo = req.getParameter("vnp_OrderInfo");
		String orderType = req.getParameter("ordertype");
		String vnp_TxnRef = Config.getRandomNumber(8); // Sử dụng hàm getRandomNumber() được định nghĩa dưới đây
		String vnp_IpAddr = Config.getIpAddress(req); // Sử dụng hàm getIpAddress() được định nghĩa dưới đây
		String vnp_TmnCode = "YOUR_VNP_TMN_CODE"; // Thay YOUR_VNP_TMN_CODE bằng mã TmnCode của bạn

		int amount = Integer.parseInt(req.getParameter("amount")) * 100;
		Map<String, String> vnp_Params = new HashMap<>();
		vnp_Params.put("vnp_Version", vnp_Version);
		vnp_Params.put("vnp_Command", vnp_Command);
		vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
		vnp_Params.put("vnp_Amount", String.valueOf(amount));
		vnp_Params.put("vnp_CurrCode", "VND");
		String bank_code = req.getParameter("bankcode");
		if (bank_code != null && !bank_code.isEmpty()) {
			vnp_Params.put("vnp_BankCode", bank_code);
		}
		vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
		vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
		vnp_Params.put("vnp_OrderType", orderType);

		String locate = req.getParameter("language");
		if (locate != null && !locate.isEmpty()) {
			vnp_Params.put("vnp_Locale", locate);
		} else {
			vnp_Params.put("vnp_Locale", "vn");
		}
		// Thay thế các giá trị cần thiết ở dưới đây bằng các giá trị cố định của bạn
		vnp_Params.put("vnp_ReturnUrl", "YOUR_RETURN_URL");
		vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
		Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));

		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String vnp_CreateDate = formatter.format(cld.getTime());

		vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
		cld.add(Calendar.MINUTE, 15);
		String vnp_ExpireDate = formatter.format(cld.getTime());
		//Add Params of 2.1.0 Version
		vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
		//Billing
		vnp_Params.put("vnp_Bill_Mobile", req.getParameter("txt_billing_mobile"));
		vnp_Params.put("vnp_Bill_Email", req.getParameter("txt_billing_email"));
		String fullName = (req.getParameter("txt_billing_fullname")).trim();
		if (fullName != null && !fullName.isEmpty()) {
			int idx = fullName.indexOf(' ');
			String firstName = fullName.substring(0, idx);
			String lastName = fullName.substring(fullName.lastIndexOf(' ') + 1);
			vnp_Params.put("vnp_Bill_FirstName", firstName);
			vnp_Params.put("vnp_Bill_LastName", lastName);

		}
		vnp_Params.put("vnp_Bill_Address", req.getParameter("txt_inv_addr1"));
		vnp_Params.put("vnp_Bill_City", req.getParameter("txt_bill_city"));
		vnp_Params.put("vnp_Bill_Country", req.getParameter("txt_bill_country"));
		if (req.getParameter("txt_bill_state") != null && !req.getParameter("txt_bill_state").isEmpty()) {
			vnp_Params.put("vnp_Bill_State", req.getParameter("txt_bill_state"));
		}
		// Invoice
		vnp_Params.put("vnp_Inv_Phone", req.getParameter("txt_inv_mobile"));
		vnp_Params.put("vnp_Inv_Email", req.getParameter("txt_inv_email"));
		vnp_Params.put("vnp_Inv_Customer", req.getParameter("txt_inv_customer"));
		vnp_Params.put("vnp_Inv_Address", req.getParameter("txt_inv_addr1"));
		vnp_Params.put("vnp_Inv_Company", req.getParameter("txt_inv_company"));
		vnp_Params.put("vnp_Inv_Taxcode", req.getParameter("txt_inv_taxcode"));
		vnp_Params.put("vnp_Inv_Type", req.getParameter("cbo_inv_type"));
		//Build data to hash and querystring
		List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
		Collections.sort(fieldNames);
		StringBuilder hashData = new StringBuilder();
		StringBuilder query = new StringBuilder();
		Iterator<String> itr = fieldNames.iterator();
		while (itr.hasNext()) {
			String fieldName = itr.next();
			String fieldValue = vnp_Params.get(fieldName);
			if ((fieldValue != null) && (!fieldValue.isEmpty())) {
				//Build hash data
				hashData.append(fieldName);
				hashData.append('=');
				hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
				//Build query
				query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
				query.append('=');
				query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
				if (itr.hasNext()) {
					query.append('&');
					hashData.append('&');
				}
			}
		}
		String queryUrl = query.toString();
		String vnp_SecureHash = hmacSHA512("YOUR_HASH_SECRET", hashData.toString()); // Thay YOUR_HASH_SECRET bằng chuỗi hash secret của bạn
		queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
		String paymentUrl = "YOUR_PAYMENT_URL" + "?" + queryUrl; // Thay YOUR_PAYMENT_URL bằng URL thanh toán của bạn
//		JsonObject job = new JsonObject();
//		job.addProperty("code", "00");
//		job.addProperty("message", "success");
//		job.addProperty("data", paymentUrl);
//		Gson gson = new Gson();
//		resp.getWriter().write(gson.toJson(job));
	}

	// Định nghĩa phương thức hmacSHA512
	private String hmacSHA512(String secretKey, String data) {
		try {
			Mac sha512_HMAC = Mac.getInstance("HmacSHA512");
			SecretKeySpec secret_key = new SecretKeySpec(secretKey.getBytes(), "HmacSHA512");
			sha512_HMAC.init(secret_key);
			byte[] bytes = sha512_HMAC.doFinal(data.getBytes());
			return Base64.getEncoder().encodeToString(bytes);
		} catch (NoSuchAlgorithmException | InvalidKeyException e) {
			e.printStackTrace();
			return null; // Xử lý lỗi nếu cần thiết
		}
	}

	//vui lòng tham khảo thêm tại code demo





}
