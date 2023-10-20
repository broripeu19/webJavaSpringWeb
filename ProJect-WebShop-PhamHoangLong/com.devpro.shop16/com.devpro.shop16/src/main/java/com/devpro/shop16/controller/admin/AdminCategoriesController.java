package com.devpro.shop16.controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.devpro.shop16.services.CategoriesService;



@Controller
public class AdminCategoriesController extends BaseController {

	@Autowired
	private CategoriesService categoriesService;
		

	@RequestMapping(value = { "/admin/categories-admin" }, method = RequestMethod.GET)
	public String adminCategoriesList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		searchModel.categoryId = super.getInteger(request, "categoryId");
		
		model.addAttribute("categoriesWithPaging", categoriesService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		return "quantrivien/categories-admin";
	}
	
	
	@RequestMapping(value = { "/admin/add-categories" }, method = RequestMethod.GET)
	public String adminCategoriesAddOrUpdate(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		// đẩy danh sách categories xuống
		/* model.addAttribute("categories", categoriesService.findAll()); */
		//Categories categories = new Categories();
		// add sản phẩm mới
		model.addAttribute("categories", new Categories());

		return "quantrivien/add-categories";
	}
	
	@RequestMapping(value = { "/admin/add-categories/{categoriesId}" }, method = RequestMethod.GET)
	public String adminCategoriesEdit(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("categoriesId") int categoriesId) throws IOException {
		// đẩy danh sách categories xuống
		/* model.addAttribute("categories", categoriesService.findAll()); */

		// lấy sản phẩm trong db
		//Product product = productService.getById(productId);
		Categories categories = categoriesService.getById(categoriesId);
		
		// edit sản phẩm
		model.addAttribute("categories", categories);

		return "quantrivien/add-categories";
	}
	
	
	@RequestMapping(value = { "/admin/add-categories" }, method = RequestMethod.POST)
	public String adminCategoriesAddOrUpdate(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("categories") Categories categories) 
					throws Exception {

		/*
		 * model.addAttribute("TB", "Danh mục " + categories.getName() +
		 * ", đã được thêm vào trong database!");
		 * 
		 * categories.setSeo(new Slugify().slugify(categories.getName()));
		 * 
		 * //lưu categories vào trong database
		 * categoriesService.saveOrUpdate(categories);
		 * 
		 * // sau khi xử lí xong thì đưa contact về trạng thái mới
		 * model.addAttribute("categories", new Categories());
		 */
		//model.addAttribute("TB", "Danh mục " + categories.getName() + ", đã được thêm vào trong database!");
		
		
		 // cần kiểm tra xem id của product // = null || = 0 thì thêm mới
		// ngược lại là chỉnh sửa 
		 if (categories.getId() == null || categories.getId() <= 0) { 
			 //thêm mới 
			 categoriesService.add(categories); 
			 } 
		 else { 
			 // chỉnh sửa
			 categoriesService.update(categories);
		 }
		 
		 model.addAttribute("categories", new Categories());
		// đường dẫn tới View.
		//return "quantrivien/add-categories"; 
		return "redirect:/admin/categories-admin";
	}



	
}
