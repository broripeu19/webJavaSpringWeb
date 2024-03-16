package com.devpro.shop16.dto;

public class BannerSearchModel extends BaseSearchModel {

	// tìm theo keyword
	public String keyword;

	public Integer code;

	// tìm theo category
	public Integer categoryId;

	public String seo;

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

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

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
}
