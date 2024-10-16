package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
public class PotChat {

	// 방 식별자 
    private int chat_idx;

    // 판매 식별자 
    private int sale_idx;

    // 판매자 
    private String sale_id;

    // 회원 아이디 
    private String user_id;

    // 방 개설일자 
    private String created_at;
    
    private String sale_img;
    
    private String sale_title;

	public PotChat(int sale_idx, String sale_id, String user_id) {
		super();
		this.sale_idx = sale_idx;
		this.sale_id = sale_id;
		this.user_id = user_id;
	}
    
    
    
}
