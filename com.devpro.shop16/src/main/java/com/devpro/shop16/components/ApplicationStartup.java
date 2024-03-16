package com.devpro.shop16.components;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import com.devpro.shop16.entities.Categories;

import com.devpro.shop16.entities.Product;
import com.devpro.shop16.services.CategoriesService;

import com.github.slugify.Slugify;

@Component // bean
public class ApplicationStartup implements ApplicationListener<ApplicationReadyEvent> {
	
	@Autowired // inject 1 bean vào trong 1 bean khác
	private CategoriesService categoriesService;
	
	/**
	 * khi ứng dụng chạy xong sẽ chạy vào hàm này.
	 */
	@Override
	public void onApplicationEvent(final ApplicationReadyEvent event) {
		
		System.out.println("------- BEGIN-ApplicationReadyEvent -------");		
		//this.seedPythonCategory();
		System.out.println("------- END-ApplicationReadyEvent -------");
		
	}
	
	private void seedPythonCategory() {
		//kiểm tra xem đã có python trong bảng tbl_category chưa ?
		Categories pythonCate = categoriesService.getOneByNativeSQL("SELECT * FROM tbl_category WHERE Name = 'Thực Phẩm'");
		
		//nếu không có thì thêm mới
		if (pythonCate == null) { // tạo mới
			pythonCate = new Categories();
			pythonCate.setName("Thực Phẩm");
			pythonCate.setDescription("Thực Phẩm");
			
			// thêm danh sách sản phẩm cho python category
			for (int i = 0; i < 20; i++) {
				Product p = new Product();
				p.setTitle("Thực Phẩm Title " + i);
				p.setShortDes("Thực Phẩm ShortDes" + i);
				p.setDetails("Thực Phẩm DetailsDes" + i);
				p.setPrice(new BigDecimal("1000"));
				p.setCreatedDate(new Date());
				
				// gọi hàm utility trong onetomany
				pythonCate.addProduct(p);
			}
			
		// ngược lại chỉnh sửa ngày	
		} else { // chỉnh sửa
			pythonCate.setUpdatedDate(new Date());
			pythonCate.setSeo(new Slugify().slugify("Thực Phẩm-" + System.currentTimeMillis())); //ngon-ngu-lap-trinh-python
		}
		
		categoriesService.saveOrUpdate(pythonCate);
	}
}
