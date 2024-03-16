package com.devpro.shop16.controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devpro.shop16.dto.CategorySearchModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.ProductSearchModel;
import com.devpro.shop16.entities.Categories;
import com.devpro.shop16.entities.Product;
import com.devpro.shop16.services.CategoriesService;



@Controller
public class AdminCategoriesController extends BaseController {

	@Autowired
	private CategoriesService categoriesService;
		

	@RequestMapping(value = { "/admin/categories-admin" }, method = RequestMethod.GET)
	public String adminCategoriesList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		CategorySearchModel searchModel = new CategorySearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		searchModel.categoryId = super.getInteger(request, "categoryId");
		
		model.addAttribute("categoriesWithPaging", categoriesService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		return "quantrivien/categories-admin";
	}
	
	
//	@RequestMapping(value = { "/admin/add-categories" }, method = RequestMethod.GET)
//	public String adminCategoriesAddOrUpdate(final Model model, final HttpServletRequest request,
//			final HttpServletResponse response
//			, @ModelAttribute("categories") Categories categories
//	) throws IOException {
//		// đẩy danh sách categories xuống
//		/* model.addAttribute("categories", categoriesService.findAll()); */
//		//Categories categories = new Categories();
//		// add sản phẩm mới
//		model.addAttribute("categories", new Categories());
//
//		return "quantrivien/add-categories";
//	}
	
	@RequestMapping(value = { "/admin/add-categories/{categoriesId}" }, method = RequestMethod.GET)
	public String adminCategoriesEdit(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("categoriesId") int categoriesId) throws IOException {
		Categories category = categoriesService.getById(categoriesId);
		model.addAttribute("category", category);

		return "quantrivien/add-categories";
	}

	@RequestMapping(value = { "/admin/add-categories" }, method = RequestMethod.GET)
	public String adminProductAddOrUpdate(final Model model, final HttpServletRequest request,
										  final HttpServletResponse response) throws IOException {
		model.addAttribute("category", new Categories());

		return "quantrivien/add-categories";
	}

	@RequestMapping(value = { "/admin/add-categories" }, method = RequestMethod.POST)
	public String adminCategoriesAddOrUpdate(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("category") Categories category)
					throws Exception {
		 if (category.getId() == null || category.getId() <= 0) {
			 categoriesService.add(category);
			 } 
		 else { 
			 categoriesService.update(category);
		 }
		return "redirect:/admin/categories-admin";
	}

	
	@RequestMapping(value = { "/admin/categories-admin/delete/{categoriesId}" }, method = RequestMethod.GET)
	public String adminDeleteProduct(final Model model,  final HttpServletRequest request,
			final HttpServletResponse response,@PathVariable("categoriesId") int categoriesId ) 
			throws IOException {
		
		Categories categories = categoriesService.getById(categoriesId);
		
		categoriesService.delete(categories);
		
		model.addAttribute("category", new Categories());
		
		
		return "redirect:/admin/categories-admin";
	}


	
}
