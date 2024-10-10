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

}
