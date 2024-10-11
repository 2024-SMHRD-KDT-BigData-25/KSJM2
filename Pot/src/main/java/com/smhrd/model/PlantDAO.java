package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class PlantDAO {
	
	// SqlSessionFactory 불러오기
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public List<PotPlant> search(String m) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<PotPlant> list = sqlSession.selectList("PlantMapper.search", m);
		
		sqlSession.close();
		
		return list;
	}
	
	public PotPlant view(int pl_idx) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		PotPlant res = sqlSession.selectOne("PlantMapper.view", pl_idx);
		
		sqlSession.close();
		
		return res;
		
	}
	
	// 게시물 조회수
	public int views(int pl_idx) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int res = sqlSession.update("PlantMapper.views", pl_idx);
		
		sqlSession.close();
		
		return res;
		
	}

}
