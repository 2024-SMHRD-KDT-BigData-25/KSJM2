package com.smhrd.websocket;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

@ServerEndpoint("/ws/{chat_idx}")
public class ChatEndpoint {

    // 채팅방별 세션 관리 (chat_idx -> 해당 채팅방의 세션 집합)
    private static final Map<String, Set<Session>> chatRooms = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session, 
                       @PathParam("chat_idx") String chatIdx) {

        // 해당 채팅방에 세션 추가
        chatRooms.computeIfAbsent(chatIdx, k -> ConcurrentHashMap.newKeySet()).add(session);
        System.out.println("새 연결: Chat ID = " + chatIdx);
    }

    @OnMessage
    public void onMessage(String message, 
                          @PathParam("chat_idx") String chatIdx, 
                          Session session) throws IOException {
        System.out.println("수신 메시지: " + message + " (Chat ID: " + chatIdx + ")");

        // 해당 채팅방의 모든 세션에 메시지 전송
        for (Session s : chatRooms.getOrDefault(chatIdx, Set.of())) {
            if (s.isOpen()) {
                s.getBasicRemote().sendText("User: " + message);
            }
        }
    }

    @OnClose
    public void onClose(Session session, 
                        @PathParam("chat_idx") String chatIdx, 
                        CloseReason reason) {
        Set<Session> sessions = chatRooms.getOrDefault(chatIdx, Set.of());
        sessions.remove(session);

        System.out.println("연결 종료: Chat ID = " + chatIdx + ", 이유: " + reason);

        // 채팅방이 비어있으면 삭제
        if (sessions.isEmpty()) {
            chatRooms.remove(chatIdx);
        }
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        System.out.println("에러 발생: " + throwable.getMessage());
    }
}
