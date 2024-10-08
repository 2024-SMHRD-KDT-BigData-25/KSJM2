package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class CmtDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();

	public int writeCmt(PotCmt m) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("CmtMapper.insert", m);
		sqlSession.close();
		
		return res;
	}
	
	public List<PotCmt> getList(int sns_idx) {
		
		// 1. SqlSession 객체 생성 <= SqlSessionFactory
		SqlSession sqlSession = sqlSessionFactory.openSession(true); // true => autoCommit 옵션
		
		List<PotCmt> res = sqlSession.selectList("CmtMapper.select", sns_idx);
		
		sqlSession.close();
		
		return res;
		
	}
}
