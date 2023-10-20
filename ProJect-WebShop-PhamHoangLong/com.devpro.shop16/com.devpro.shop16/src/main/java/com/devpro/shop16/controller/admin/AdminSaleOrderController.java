package com.devpro.shop16.controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.SaleOrderSearchModel;
import com.devpro.shop16.entities.Product;
import com.devpro.shop16.entities.SaleOrder;
import com.devpro.shop16.entities.SaleOrderProducts;
import com.devpro.shop16.services.SaleOrderService;

@Controller
public class AdminSaleOrderController extends BaseController {

	@Autowired
	private SaleOrderService saleOrderService;
	
	
	
	@RequestMapping(value = { "/admin/saleorders-admin" }, method = RequestMethod.GET)
	public String adminProductList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		SaleOrderSearchModel searchModel = new SaleOrderSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		searchModel.code = super.getInteger(request, "code");
		
		model.addAttribute("saleordersWithPaging", saleOrderService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		return "quantrivien/saleorders-admin";
	}
	@RequestMapping(value = { "/admin/saleorders-admin-status1" }, method = RequestMethod.GET)
	public String adminSaleOrderStatus1(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		SaleOrderSearchModel searchModel = new SaleOrderSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		searchModel.code = super.getInteger(request, "code");
		
		model.addAttribute("saleordersWithPaging", saleOrderService.searchstatus1(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		return "quantrivien/saleorders-admin-status1";
	}
	
	@RequestMapping(value = { "/admin/saleorders-admin-status0" }, method = RequestMethod.GET)
	public String adminSaleOrderStatus0(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		SaleOrderSearchModel searchModel = new SaleOrderSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		searchModel.code = super.getInteger(request, "code");
		
		model.addAttribute("saleordersWithPaging", saleOrderService.searchstatus0(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		return "quantrivien/saleorders-admin-status0";
	}

	
	
	@RequestMapping(value = { "/admin/saleorders-admin/status/{productId}" }, method = RequestMethod.GET)
	public String adminDeleteProduct(final Model model,  final HttpServletRequest request,
			final HttpServletResponse response,@PathVariable("productId") int productId ) 
			throws IOException {
		SaleOrder saleorder = saleOrderService.getById(productId);
		
		saleOrderService.delete(saleorder);
		
		model.addAttribute("saleorder", new SaleOrder());
		
		return "redirect:/admin/saleorders-admin";
	}
	
}
