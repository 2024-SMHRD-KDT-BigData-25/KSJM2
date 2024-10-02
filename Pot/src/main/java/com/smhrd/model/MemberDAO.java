package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {

	// SqlSessionFactory 불러오기
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	// 회원가입(insert) 기능(메서드)
	public int join(PotUsers m) {
		
		// 1. SqlSession 객체 생성 <= SqlSessionFactory
		SqlSession sqlSession = sqlSessionFactory.openSession(true); // true => autoCommit 옵션
		
		// 2. SqlSession 객체 활용 insert 작업 수행
		// namespace.id => "MemberMapper.insert"
		int res = sqlSession.insert("PotMapper.insert", m);
		sqlSession.close(); // session의 자원 반환
		
		// 3. 결과값 반환
		return res;
	}
	
	// 로그인(select) 기능(메서드),
	public PotUsers login(PotUsers m) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		PotUsers res = sqlSession.selectOne("PotMapper.login", m);
		sqlSession.close();
		
		return res;
		
	}
	
	// 아이디 중복 체크 기능(메서드)
	public int confirmID(String user_id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int res = sqlSession.selectOne("PotMapper.idcheck", user_id);
		
		sqlSession.close();
		
		return res;
				
		
	}
	
	// 아이디 찾기 (메서드)
	public PotUsers findid(PotUsers m) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		PotUsers res = sqlSession.selectOne("PotMapper.findid", m);
		sqlSession.close();
		
		return res;
	}

}
