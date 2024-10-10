package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
public class PotPlant {
	
		private int pl_idx;
		
		private String pl_name;
		
		private String pl_kind;
		
		private String pl_temp;
		
		private String pl_effect;
		
		private String pl_time;
		
		private String pl_img;
		
		private String created_at;
		
		private int pl_views;

		public PotPlant(String pl_name) {
			super();
			this.pl_name = pl_name;
		}


		
		
}
