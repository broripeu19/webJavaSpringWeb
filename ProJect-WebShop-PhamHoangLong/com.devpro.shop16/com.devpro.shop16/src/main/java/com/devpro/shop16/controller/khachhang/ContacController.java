package com.devpro.shop16.controller.khachhang;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop16.components.Utilities;
import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.ContactSearchModel;
import com.devpro.shop16.entities.Contact;
import com.devpro.shop16.services.ContactService;

@Controller
public class ContacController extends BaseController {
	
	@Autowired
	private ContactService contactService;
	

	
	@RequestMapping(value = {"/contactus"}, method = RequestMethod.GET)
	
	public String contactus(final Model model, final HttpServletRequest request ,final HttpServletResponse response)
	throws IOException {	
		
			// tạo 1 đối tượng contact
				Contact contact = new Contact();
				
				// đẩy contact xuống tầng View từ Controller
				model.addAttribute("contactus", contact);
				
		
		return "khachhang/contactus";
			
	}
	
//định nghĩa action phải sử dụng "@RequestMapping"
	/**
	 * @param model:    sử dụng để đẩy dữ liệu từ Controller -> View
	 * @param request:  Sử dụng để lấy ReuqestParam
	 * @param response:
	 * @throws IOException
	 */
	@RequestMapping(value = { "/contactus" }, method = RequestMethod.POST)
	public String post_spring_form(final Model model, 
								   final HttpServletRequest request, 
								   final HttpServletResponse response,
								   final @ModelAttribute("contactus") Contact contact,
								   final @RequestParam("attach") MultipartFile attach) throws IllegalStateException, IOException{
		model.addAttribute("TB", "Cảm ơn " + contact.getName() + ", chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất!");

		if(Utilities.getKilobytes(attach.getSize()) > 100) {
			model.addAttribute("ERROR", "File attachment quá lớn");
		}
		
		// lưu ảnh lên server
		attach.transferTo(new File("C:/upload/" + attach.getOriginalFilename()));

		
		//lưu contact vào trong database		
		contactService.saveOrUpdate(contact);
		
		// sau khi xử lí xong thì đưa contact về trạng thái mới
				model.addAttribute("contactus", new Contact());
				
		// trả về đường dẫn tới view
		return "khachhang/contactus";
	}
	
	/**
	 * Sử dụng ajax
	 * @param model
	 * @param request
	 * @param response
	 * @param contactModel
	 * @return
	 */
	@RequestMapping(value = { "/ajax/contact" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_contact(final Model model , 
						final HttpServletRequest request, 
						final HttpServletResponse response, 
						final @RequestBody Contact contact) {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		/* jsonResult.put("code", 200); */
		jsonResult.put("message", "Cảm ơn bạn " + contact.getEmail() + ", Chúng tôi sẽ liên hệ với bạn sớm nhất!");
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/admin/contacts-admin" }, method = RequestMethod.GET)
	public String adminContactList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		ContactSearchModel searchModel = new ContactSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		
		model.addAttribute("contactsWithPaging", contactService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		return "quantrivien/contacts-admin";
	}
	
	
	
}
