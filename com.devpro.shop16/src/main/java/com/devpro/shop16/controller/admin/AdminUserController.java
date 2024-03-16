package com.devpro.shop16.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.servlet.ModelAndView;

import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.UserAdmin;
import com.devpro.shop16.dto.UserSearchModel;
import com.devpro.shop16.entities.Product;
import com.devpro.shop16.entities.Role;
import com.devpro.shop16.entities.User;
import com.devpro.shop16.services.RoleService;
import com.devpro.shop16.services.UserService;


@Controller
public class AdminUserController extends BaseController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
		
	
	@RequestMapping(value = { "/admin/users-admin" }, method = RequestMethod.GET)
	public String adminProductList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		UserSearchModel searchModel = new UserSearchModel();
		
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		searchModel.roleId = super.getInteger(request, "roleId");
		
		model.addAttribute("usersWithPaging", userService.search(searchModel));
		model.addAttribute("rolesWithPaging", roleService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		return "quantrivien/users-admin";
	}
	
//	@RequestMapping(value = { "/admin/users-admin/{id}" }, method = RequestMethod.GET)
//	public String adminDeleteEdit(final Model model, final HttpServletRequest request,
//			final HttpServletResponse response, @PathVariable("id") int id) throws IOException {
//		// đẩy danh sách categories xuống
////		model.addAttribute("categories", categoriesService.findAll());
//
//		userService.deleteById(id);
//
//		return "quantrivien/users-admin";
//	}
	
	
	
//	@RequestMapping(value = { "/ajax/DeleteUser/{id}" }, method = RequestMethod.POST)
//	public ResponseEntity<Map<String, Object>> ajax_DeleteProduct(final Model model, final HttpServletRequest request,
//			final HttpServletResponse response,
//			final @RequestBody UserAdmin userAdmin,
//			@PathVariable("id") int id
//			) {Map<String, Object> jsonResult = new HashMap<String, Object>();
//		jsonResult.put("message", "Cảm ơn bạn " + userAdmin.getName() + ", Chúng tôi sẽ liên hệ với bạn sớm nhất!");
//		
//		User user = userService.getById(id);
//		user.deleteRole(id);
//		userService.delete(user);
//		
//		return ResponseEntity.ok(jsonResult);
//	}
	
	
//	@GetMapping("delete/{username}")
//	public ModelAndView delete(ModelMap model, @PathVariable("username") String username) {
//		
//		userService.deleteById(username);
//		
//		model.addAttribute("message","User đã được xóa!");
//		
//		
//		return new ModelAndView("forward:quantrivien/users-admin", model) ;
//	}
	
	
}
