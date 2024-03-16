package com.devpro.shop16.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 * Cấu hình MVC
 * 
 * @author daing
 */
@Configuration // định nghĩa là 1 Bean nhưng mà là cấu hình
public class MvcConf implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/js/");
		registry.addResourceHandler("/imgs/**").addResourceLocations("classpath:/imgs/");
	
		registry.addResourceHandler("/upload/**").addResourceLocations("file:" + "C:/upload/");
	}
	
	@Bean // -> BEAN này dùng để chỉ ra thư mục chứa Views
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		//thiết lập view engine
		bean.setViewClass(JstlView.class);
		
		// Đường dẫn folder chứa Views.
		bean.setPrefix("/WEB-INF/views/");
		
		// Tên đuôi của View
		bean.setSuffix(".jsp");
		
		return bean;
	}
	
	
	
}
