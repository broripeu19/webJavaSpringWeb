package com.devpro.shop16.dto;

public class ProductAdmin {
	private String name;
	private String description;
	private String category;
	private String expire_date;
	private String stock;
	private String addfile;
	
	public String getAddfile() {
		return addfile;
	}
	public void setAddfile(String addfile) {
		this.addfile = addfile;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getExpire_date() {
		return expire_date;
	}
	public void setExpire_date(String expire_date) {
		this.expire_date = expire_date;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	
	
	
	
}
