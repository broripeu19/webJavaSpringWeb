package com.devpro.shop16.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;

@SuppressWarnings("serial")
@Entity
@Table(name = "tbl_roles")
public class Role extends BaseEntity implements GrantedAuthority {


	@Column(name = "name", length = 45, nullable = false)
	private String name;

	@Column(name = "description", length = 45, nullable = false)
	private String description;

//	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "roles")
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "tbl_users_roles", 
	joinColumns = @JoinColumn(name = "role_id"), 
	inverseJoinColumns = @JoinColumn(name = "user_id"))
	private Set<User> users = new HashSet<User>();
	
	
	public void addUsers(User user) {
		user.getRoles().add(this);
		users.add(user);
	}
	public void deleteUsers(User user) {
		user.getRoles().remove(this);
		users.remove(user);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}
	@Override
	public String getAuthority() {
		return name;
	}

}
