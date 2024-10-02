package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class PotUsers {
	
	// 아이디 
    private String user_id;

    // 비밀번호 
    private String user_pw;

    // 이름 
    private String user_name;

    // 닉네임 
    private String user_nick;

    // 연락처 
    private String user_phone;

    // 우편번호 
    private String user_post;

    // 주소 
    private String user_addr1;

    // 상세주소 
    private String user_addr2;

	
	
		
}
