package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
public class PotSale {

    // 카테고리 
    private String sale_category;

    // 판매 식별자 
    private int sale_idx;

    // 판매 제목 
    private String sale_title;

    // 아이디 
    private String user_id;

    // 판매 가격 
    private String sale_price;

    // 이미지 
    private String sale_img;

    // 판매 내용 
    private String sale_content;

    // 등록일자 
    private String created_at;

    // 조회수 
    private int sale_views;

	public PotSale(String sale_category, String sale_title, String user_id, String sale_price, String sale_img,
			String sale_content) {
		super();
		this.sale_category = sale_category;
		this.sale_title = sale_title;
		this.user_id = user_id;
		this.sale_price = sale_price;
		this.sale_img = sale_img;
		this.sale_content = sale_content;
	}




}
