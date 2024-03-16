package com.devpro.shop16.dto;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * giỏ hàng
 * @author longph
 *
 */
public class Compare {

	// tổng số tiền trong giỏ hàng
	private BigDecimal totalPrice = BigDecimal.ZERO;
	
	// danh sách sản phẩm trong giỏ hàng
	private List<CompareItem> compareItems = new ArrayList<CompareItem>();

	public List<CompareItem> getCompareItems() {
		return compareItems;
	}

	public void setCompareItems(List<CompareItem> compareItems) {
		this.compareItems = compareItems;
	}

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

}
