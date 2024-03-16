package com.devpro.shop16.dto;

public class UserSearchModel extends BaseSearchModel {

	// tìm theo keyword
		public String keyword;

		// tìm theo category
		public Integer roleId;

		public String email;

		public String getKeyword() {
			return keyword;
		}

		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}

		public Integer getRoleId() {
			return roleId;
		}

		public void setRoleId(Integer roleId) {
			this.roleId = roleId;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

	
}
