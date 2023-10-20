package com.devpro.shop16.dto;

public class RoleSearchModel extends BaseSearchModel {

	// tìm theo keyword
		public String keyword;

	
		public String description;

		public String getKeyword() {
			return keyword;
		}

		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		

	
}
