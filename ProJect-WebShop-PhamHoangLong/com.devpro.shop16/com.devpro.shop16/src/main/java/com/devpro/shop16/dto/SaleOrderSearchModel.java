package com.devpro.shop16.dto;

public class SaleOrderSearchModel extends BaseSearchModel {

	// tìm theo keyword
	public String keyword;
	
	// tìm theo category
		public Integer userId;
		
		public Integer code;
		
	public Integer getCode() {
			return code;
		}

		public void setCode(Integer code) {
			this.code = code;
		}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	
}
