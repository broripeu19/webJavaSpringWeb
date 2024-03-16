package com.devpro.shop16.dto;

import com.devpro.shop16.entities.Product;
import com.devpro.shop16.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * danh sách sản phẩm.
 * @author longph
 *
 */
public class CartItem {

	// mã sản phẩm
	private int productId;
	
	// tên sản phẩme
	private String productName;

	private String categoryName;
	
	// số lương sản phẩm
	private int quanlity;
	
	// đơn giá sản phẩm
	private BigDecimal priceUnit;

	private BigDecimal priceSale;

	// Avatar sản phẩm
	private String productAvatar;

	public int getProductId() {
		return productId;
	}

	public String getProductAvatar() {
		return productAvatar;
	}

	public void setProductAvatar(String productAvatar) {
		this.productAvatar = productAvatar;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuanlity() {
		return quanlity;
	}

	public void setQuanlity(int quanlity) {
		this.quanlity = quanlity;
	}

	public BigDecimal getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(BigDecimal priceUnit) {
		this.priceUnit = priceUnit;
	}

	public BigDecimal getPriceSale() {
		return priceSale;
	}

	public void setPriceSale(BigDecimal priceSale) {
		this.priceSale = priceSale;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
}
