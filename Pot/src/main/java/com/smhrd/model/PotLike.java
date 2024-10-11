package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
public class PotLike {
	// 좋아요 

	    // SNS 식별자 
	    private int sns_idx;

	    // 회원 아이디 
	    private String user_id;

		public PotLike(int sns_idx) {
			super();
			this.sns_idx = sns_idx;
		}

	   
	    
	    
	}