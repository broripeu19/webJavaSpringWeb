package com.devpro.shop16.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.shop16.dto.UserSearchModel;
import com.devpro.shop16.entities.Role;
import com.devpro.shop16.entities.User;


@Service
public class RoleService extends BaseService<Role> {

	@Override
	protected Class<Role> clazz() {
		return Role.class;
	}

	public Role loadRoleByRoleName(String roleName) {
		String sql = "select * from tbl_roles u where u.name = '" + roleName + "'";
		List<Role> roles = this.executeByNativeSQL(sql, 0).getData();
		
		if(roles == null || roles.size() <= 0) return null;
		return roles.get(0);
	}
	
	public PagerData<Role> search(UserSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_roles p WHERE 1=1";

		if (searchModel != null) {
			

			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.name like '%" + searchModel.keyword + "%'" + " or p.description like '%" + searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
//				sql += " and p.status=1 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}
	
}
