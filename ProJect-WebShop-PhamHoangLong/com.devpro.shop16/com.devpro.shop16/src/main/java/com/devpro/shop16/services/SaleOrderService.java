package com.devpro.shop16.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.shop16.dto.SaleOrderSearchModel;
import com.devpro.shop16.entities.SaleOrder;


@Service
public class SaleOrderService extends BaseService<SaleOrder> {

	@Override
	protected Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}
	
	public PagerData<SaleOrder> search(SaleOrderSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder p WHERE 1=1";

		if (searchModel != null) {
			// tìm kiếm theo category
			if(searchModel.code != null) {
				sql += " and code = " + searchModel.code;
			}
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.code like '%" + searchModel.keyword + "%'" + " or p.customer_address like '%"
						+ searchModel.keyword + "%'" + " or p.customer_phone like '%"
						+ searchModel.keyword + "%'" + " or p.customer_email like '%" + searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}
	public PagerData<SaleOrder> searchstatus1(SaleOrderSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder p WHERE 1=1";

		if (searchModel != null) {
			// tìm kiếm theo category
			if(searchModel.code != null) {
				sql += " and code = " + searchModel.code;
			}
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.code like '%" + searchModel.keyword + "%'" + " or p.customer_address like '%"
						+ searchModel.keyword + "%'" + " or p.customer_phone like '%"
						+ searchModel.keyword + "%'" + " or p.customer_email like '%" + searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
				sql += " and p.status=1 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}
	public PagerData<SaleOrder> searchstatus0(SaleOrderSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder p WHERE 1=1";

		if (searchModel != null) {
			// tìm kiếm theo category
			if(searchModel.code != null) {
				sql += " and code = " + searchModel.code;
			}
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.code like '%" + searchModel.keyword + "%'" + " or p.customer_address like '%"
						+ searchModel.keyword + "%'" + " or p.customer_phone like '%"
						+ searchModel.keyword + "%'" + " or p.customer_email like '%" + searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
				sql += " and p.status=0 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}
	public PagerData<SaleOrder> setstatus(SaleOrderSearchModel searchModel) {
		
		String status = "SELECT * FROM tbl_saleorder p WHERE 1=1 and p.status=1";
		
		
		return executeByNativeSQL(status, searchModel == null ? 0 : searchModel.getPage());
	}
}
