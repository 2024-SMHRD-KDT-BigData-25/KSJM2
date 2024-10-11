package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class LikeDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public int insert(PotLike m) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int res = sqlSession.insert("LikeMapper.insert", m);
		
		sqlSession.close();
		
		return res;
	}

	public int delete(PotLike m) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int res = sqlSession.delete("LikeMapper.delete", m);
		
		sqlSession.close();
		
		return res;
	}
	
	public int count(int sns_idx) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int res = sqlSession.selectOne("LikeMapper.count", sns_idx);
		
		sqlSession.close();
		
		return res;
			
	}
	
	public PotLike likeuser(PotLike m) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		PotLike res = sqlSession.selectOne("LikeMapper.likeuser", m);
		
		sqlSession.close();
		
		return res;
			
	}
	
}
