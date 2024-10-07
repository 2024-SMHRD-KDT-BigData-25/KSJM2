package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class SaleDAO {

	// SqlSessionFactory 불러오기
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	// 게시물 작성
	public int writeSale(PotSale m) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("SaleMapper.write", m);
		sqlSession.close();
		
		return res;
	}
	
	// 전체 게시물 리스트 불러오기
	public List<PotSale> getList() {
		
		// 1. SqlSession 객체 생성 <= SqlSessionFactory
		SqlSession sqlSession = sqlSessionFactory.openSession(true); // true => autoCommit 옵션
		
		List<PotSale> res = sqlSession.selectList("SaleMapper.select");
		
		sqlSession.close();
		
		return res;
		
	}
	
	// 게시물 정보 불러오기
	
	public PotSale getBoard(int idx) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		PotSale res = sqlSession.selectOne("SaleMapper.getBoard", idx);
		sqlSession.close();
		return res;
		
	}
	
	
	
}
