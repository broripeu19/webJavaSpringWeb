package com.devpro.shop16.services;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.shop16.dto.UserSearchModel;
import com.devpro.shop16.entities.User;



@Service
public class UserService extends BaseService<User> {
	
	
	@Override
	protected Class<User> clazz() {
		return User.class;
	}

	public User loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "'";
		List<User> users = this.executeByNativeSQL(sql, 0).getData();
		
		if(users == null || users.size() <= 0) return null;
		return users.get(0);
	}
	
	
	public PagerData<User> search(UserSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_users p WHERE 1=1";

		if (searchModel != null) {
			// tìm kiếm theo category
			if(searchModel.roleId != null) {
				sql += " and role_id = " + searchModel.roleId;
			}

			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.username like '%" + searchModel.keyword + "%'" + " or p.email like '%" + searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
//				sql += " and p.status=1 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}

	
	

	
}
