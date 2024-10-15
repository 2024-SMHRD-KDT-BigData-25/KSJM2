package com.smhrd.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/jsp/chat/{chatIdx}")
public class chatserver2 {

    // 채팅방별 세션 관리
    private static final Map<String, Set<Session>> chatRooms = Collections.synchronizedMap(new HashMap<>());
    private static final Map<Session, StringBuilder> messageHistory = Collections.synchronizedMap(new HashMap<>());

    @OnOpen
    public void onOpen(Session session, @PathParam("chatIdx") String chatIdx) {
        // 채팅방에 세션 추가
        synchronized (chatRooms) {
            chatRooms.computeIfAbsent(chatIdx, k -> Collections.synchronizedSet(new HashSet<>())).add(session);
        }
        messageHistory.put(session, new StringBuilder()); // 세션 메시지 기록 초기화

        // 접속 메시지 전송
        broadcastMessage(chatIdx, "새로운 클라이언트 접속: " + chatIdx, null);

        // 이전 메시지 전송
        StringBuilder history = messageHistory.get(session);
        if (history != null && history.length() > 0) {
            try {
                session.getBasicRemote().sendText(history.toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @OnClose
    public void onClose(Session session, @PathParam("chatIdx") String chatIdx) {
        // 해당 채팅방에서 세션 제거
        synchronized (chatRooms) {
            Set<Session> room = chatRooms.get(chatIdx);
            if (room != null) {
                room.remove(session);
            }
        }
        messageHistory.remove(session); // 세션 종료 시 메시지 기록 삭제

        // 사용자 퇴장 메시지 전송
        broadcastMessage(chatIdx, "사용자가 방을 나갔습니다: " + chatIdx, null);
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("chatIdx") String chatIdx) {
        System.out.println("[" + chatIdx + "] " + message);

        // 메시지 기록 (다른 세션에게만 저장)
        Set<Session> room = chatRooms.get(chatIdx);
        if (room != null) {
            synchronized (room) {
                for (Session s : room) {
                    if (s != session) { // 메시지를 보낸 세션을 제외한 나머지 세션에 기록
                        messageHistory.get(s).append(message).append("\n");
                    }
                }
            }
        }

        // 방의 다른 사용자들에게만 메시지 전송
        broadcastMessage(chatIdx, message, session); // session을 인자로 전달
    }

    // 특정 채팅방에 메시지를 전송하는 메서드 (보낸 사람 제외)
    private void broadcastMessage(String chatIdx, String message, Session senderSession) {
        Set<Session> room = chatRooms.get(chatIdx);
        if (room != null) {
            synchronized (room) {
                for (Session client : room) {
                    if (client != senderSession && client.isOpen()) { // 메시지를 보낸 세션은 제외
                        try {
                            client.getBasicRemote().sendText(message);
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
    }
}