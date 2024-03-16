package com.devpro.shop16.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_subscribe")
public class SubscribeEntities extends BaseEntity {
	
	@Column(name = "email", length = 1000, nullable = true)
	private String email;
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
