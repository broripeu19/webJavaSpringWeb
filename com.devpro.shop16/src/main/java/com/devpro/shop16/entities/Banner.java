package com.devpro.shop16.entities;

import javax.persistence.*;

@Entity
@Table(name = "tbl_banner")
public class Banner extends BaseEntity {
	
	@Column(name = "name", nullable = false)
	private String name;

	@Column(name = "path", nullable = false)
	private String path;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}