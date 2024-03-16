package com.devpro.shop16.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.devpro.shop16.entities.Categories;
import com.devpro.shop16.entities.Product;
import com.devpro.shop16.entities.Role;
import com.devpro.shop16.entities.SaleOrder;
import com.devpro.shop16.entities.SaleOrderProducts;
import com.devpro.shop16.entities.User;
import com.devpro.shop16.services.CategoriesService;
import com.devpro.shop16.services.OrderProductService;
import com.devpro.shop16.services.ProductService;
import com.devpro.shop16.services.RoleService;
import com.devpro.shop16.services.SaleOrderService;

public class BaseController {
	@Autowired
	private CategoriesService categoriesService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private SaleOrderService saleOrderService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private OrderProductService orderProductService;
	
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		boolean isLogined = false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			isLogined = true;
		}
		return isLogined;
	}
	
	@ModelAttribute("userLogined")
	public User getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails)
			return (User) userLogined;
		
		return null;
	}
	

	@ModelAttribute("categories")
	public List<Categories> getAllCategories() {
		return categoriesService.findAll();
	}
	
	@ModelAttribute("products")
	public List<Product> getAllProducts() {
		return productService.findAll();
	}
	@ModelAttribute("saleorder-products")
	public List<SaleOrderProducts> getAllSP() {
		return orderProductService.findAll();
	}
	
	@ModelAttribute("saleorders")
	public List<SaleOrder> getAllSaleOrders() {
		return saleOrderService.findAll();
	}
	
	@ModelAttribute("roles")
	public List<Role> getAllRoles() {
		return roleService.findAll();
	}
	
	
	public int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			return 1;
		}
	}
	
	
	public Integer getInteger(HttpServletRequest request, String paramName) {
		try {
			return Integer.parseInt(request.getParameter(paramName));
		} catch (Exception e) {
			return null;
		}
	}
}
