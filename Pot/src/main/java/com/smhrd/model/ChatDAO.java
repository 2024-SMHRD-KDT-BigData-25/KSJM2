package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ChatDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	// 채팅 룸 생성
	public int makeChatRoom(PotChat m) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("ChatMapper.makechat", m);
		sqlSession.close();
		
		return res;
	}
	
	// 채팅방 불러오기
	public PotChat getchat(PotChat m) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		PotChat res = sqlSession.selectOne("ChatMapper.getchat", m);
		
		sqlSession.close();
		
		return res;
		
	}
	
	public List<PotChat> chatlist() {
		
		// 1. SqlSession 객체 생성 <= SqlSessionFactory
		SqlSession sqlSession = sqlSessionFactory.openSession(true); // true => autoCommit 옵션
		
		List<PotChat> res = sqlSession.selectList("ChatMapper.chatlist");
		
		sqlSession.close();
		
		return res;
		
	}

}
