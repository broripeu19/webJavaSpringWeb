package com.devpro.shop16.services;

import java.io.IOException;

import javax.transaction.Transactional;

import com.devpro.shop16.dto.CategorySearchModel;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.shop16.dto.ProductSearchModel;
import com.devpro.shop16.entities.Categories;
import com.github.slugify.Slugify;

@Service
public class CategoriesService extends BaseService<Categories> {


	@Override
	protected Class<Categories> clazz() {
		return Categories.class;
	}

	public PagerData<Categories> search(CategorySearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_category p WHERE 1=1";

		if (searchModel != null) {
			// tìm kiếm theo category
			if (searchModel.categoryId != null) {
				//sql += " and category_id = " + searchModel.categoryId;
			}

			// tìm theo seo
			if (!StringUtils.isEmpty(searchModel.seo)) {
				sql += " and p.seo = '" + searchModel.seo + "'";
			}

			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.name like '%" + searchModel.keyword + "%'"  + " or p.description like '%" + searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
//				sql += " and p.status=1 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());

	}
	@Transactional
	public Categories add(Categories p )
			throws IllegalStateException, IOException {

		//tạo seo
		p.setSeo(new Slugify().slugify(p.getName()));
		
		// lưu vào database
		return super.saveOrUpdate(p);
	}

	@Transactional
	public Categories update(Categories p)
			throws IllegalStateException, IOException {


		//tạo seo
		p.setSeo(new Slugify().slugify(p.getName()));
		
		// lưu vào database
		return super.saveOrUpdate(p);
	}
	
}
