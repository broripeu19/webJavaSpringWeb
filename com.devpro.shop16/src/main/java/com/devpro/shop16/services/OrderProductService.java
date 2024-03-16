package com.devpro.shop16.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.shop16.dto.SaleOrderSearchModel;

import com.devpro.shop16.entities.SaleOrderProducts;


@Service
public class OrderProductService extends BaseService<SaleOrderProducts> {

	@Override
	protected Class<SaleOrderProducts> clazz() {
		return SaleOrderProducts.class;
	}
	
	public PagerData<SaleOrderProducts> search(SaleOrderSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder_products p WHERE 1=1";

		if (searchModel != null) {
			// tìm kiếm theo user_id
			if(searchModel.userId != null) {
					sql += " and user_id = " + searchModel.userId;
			}
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.saleorder_id like '%" + searchModel.keyword + "%'" + " or p.product_id like '%"
						+  searchModel.keyword + "%'" + " or p.user_id like '%"
						+ searchModel.keyword + "%'"  + " or p.quality like '%" + searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
				sql += " and p.status=1 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}

	public PagerData<SaleOrderProducts> searchstatus(SaleOrderSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder_products p WHERE 1=1";

		if (searchModel != null) {
			// tìm kiếm theo user_id
			if(searchModel.userId != null) {
					sql += " and user_id = " + searchModel.userId;
			}
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.saleorder_id like '%" + searchModel.keyword + "%'" + " or p.product_id like '%"
						+  searchModel.keyword + "%'" + " or p.user_id like '%"
						+ searchModel.keyword + "%'"  + " or p.quality like '%" + searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
				sql += " and p.status=0 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}
	
	public PagerData<SaleOrderProducts> searchAll(SaleOrderSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder_products p WHERE 1=1";

		if (searchModel != null) {
			// tìm kiếm theo user_id
			if(searchModel.userId != null) {
					sql += " and user_id = " + searchModel.userId;
			}
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.saleorder_id like '%" + searchModel.keyword + "%'" + " or p.product_id like '%"
						+  searchModel.keyword + "%'" + " or p.user_id like '%"
						+ searchModel.keyword + "%'"  + " or p.quality like '%" + searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
				
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}



}
