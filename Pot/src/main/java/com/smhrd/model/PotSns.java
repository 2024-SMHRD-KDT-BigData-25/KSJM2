package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
public class PotSns {
	
	// 커뮤니티 인덱스
	private int sns_idx;
	
	// 아이디
	private String user_id;
	
	// 커뮤니티 제목
	private String sns_title;
	
	// 커뮤니티 이미지
	private String sns_img;
	
	// 커뮤니티 내용
	private String sns_content;
	
	// 커뮤니티 작성일자
	private String created_at;
	
	// 커뮤니티 조회수
	private int sns_views;
	
	// 커뮤니티 좋아요수
	private int sns_likes;
	
	private String user_nick;

	public PotSns(String user_id, String sns_title, String sns_img, String sns_content) {
		super();
		this.user_id = user_id;
		this.sns_title = sns_title;
		this.sns_img = sns_img;
		this.sns_content = sns_content;
	}
	
	

}
