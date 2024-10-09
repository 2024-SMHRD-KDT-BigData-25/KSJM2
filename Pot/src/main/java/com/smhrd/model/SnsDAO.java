package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class SnsDAO {
	
	// SqlSessionFactory 불러오기
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();

		
		// 게시물 작성
		public int writeSns(PotSns m) {
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			int res = sqlSession.insert("SnsMapper.write", m);
			sqlSession.close();
			
			return res;
		}
		
		// 전체 게시물 리스트 불러오기
		public List<PotSns> getList() {
			
			// 1. SqlSession 객체 생성 <= SqlSessionFactory
			SqlSession sqlSession = sqlSessionFactory.openSession(true); // true => autoCommit 옵션
			
			List<PotSns> res = sqlSession.selectList("SnsMapper.select");
			
			sqlSession.close();
			
			return res;
			
		}
		
		// 게시물 정보 불러오기
		public PotSns getBoard(int idx) {
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			
			PotSns res = sqlSession.selectOne("SnsMapper.getBoard", idx);
			
			sqlSession.close();
			
			return res;
			
		}
		
		// 게시물 조회수
		public int views(int sns_idx) {
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			
			int res = sqlSession.update("SnsMapper.views", sns_idx);
			
			sqlSession.close();
			
			return res;
			
		}
		
		// 게시물 삭제
		public int delete(int sns_idx) {
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			
			int res = sqlSession.delete("SnsMapper.delete" , sns_idx);
			
			sqlSession.close();
			
			return res;
			
		}
		
		
}
