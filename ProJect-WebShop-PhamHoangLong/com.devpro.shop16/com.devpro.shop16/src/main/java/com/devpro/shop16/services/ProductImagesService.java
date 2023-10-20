package com.devpro.shop16.services;

import org.springframework.stereotype.Service;

import com.devpro.shop16.entities.ProductImages;

@Service
public class ProductImagesService extends BaseServiceHomeProducts<ProductImages> {

	@Override
	protected Class<ProductImages> clazz() {
		return ProductImages.class;
	}

}
