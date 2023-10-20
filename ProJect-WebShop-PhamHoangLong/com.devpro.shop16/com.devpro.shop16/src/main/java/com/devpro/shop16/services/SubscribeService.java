package com.devpro.shop16.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.shop16.dto.ContactSearchModel;
import com.devpro.shop16.entities.SubscribeEntities;

@Service
public class SubscribeService extends BaseService<SubscribeEntities> {

	@Override
	protected Class<SubscribeEntities> clazz() {
		return SubscribeEntities.class;
	}
	public PagerData<SubscribeEntities> search(ContactSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_subscribe p WHERE 1=1";

		if (searchModel != null) {
			// tìm kiếm theo category
			/*
			 * if(searchModel.categoryId != null) { sql += " and category_id = " +
			 * searchModel.categoryId; }
			 */
		
			//tìm theo seo
			/*
			 * if (!StringUtils.isEmpty(searchModel.seo)) { sql += " and p.seo = '" +
			 * searchModel.seo + "'"; }
			 */

			// tìm kiếm sản phẩm hot
			/*
			 * if (searchModel.isHot != null) { // sql += " and p.is_hot = '" +
			 * searchModel.seo + "'"; }
			 */
			
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.email like '%" + searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
//				sql += " and p.status=1 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}
}
