package com.devpro.shop16.controller.khachhang;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.ContactSearchModel;
import com.devpro.shop16.dto.ProductSearchModel;
import com.devpro.shop16.entities.Product;
import com.devpro.shop16.entities.SubscribeEntities;
import com.devpro.shop16.services.PagerData;
import com.devpro.shop16.services.ProductService;
import com.devpro.shop16.services.SubscribeService;




@Controller
public class SubscribeController extends BaseController {
	
	@Autowired
	private SubscribeService subscribeService;
	
	@Autowired
	private ProductService productService;
	
	
	

	
	/**
	 * Sử dụng ajax
	 * @param model
	 * @param request
	 * @param response
	 * @param contactModel
	 * @return
	 */
	@RequestMapping(value = { "/ajax/customer_subscribe" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_contact(final Model model , 
						final HttpServletRequest request, 
						final HttpServletResponse response, 
						final @RequestBody SubscribeEntities products
						
						) {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Cảm ơn bạn " + products.getEmail() + ", Chúng tôi sẽ liên hệ với bạn sớm nhất!");
		
		return ResponseEntity.ok(jsonResult);
	}
	
	

	@RequestMapping(value = { "/admin/subscribes-admin" }, method = RequestMethod.GET)
	public String adminSubscribeList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		ContactSearchModel searchModel = new ContactSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		
		model.addAttribute("subscribeWithPaging", subscribeService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		return "quantrivien/subscribes-admin";
	}
	
	
	
}
