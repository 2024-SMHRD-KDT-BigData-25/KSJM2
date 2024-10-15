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

    // 채팅방별로 세션을 관리하기 위한 Map
    private static Map<String, Set<Session>> chatRooms = Collections.synchronizedMap(new HashMap<>());
    private static Map<Session, StringBuilder> messageHistory = Collections.synchronizedMap(new HashMap<>());

    @OnOpen
    public void onOpen(Session session, @PathParam("chatIdx") String chatIdx) {
        // 해당 채팅방의 세션 Set을 가져오거나, 없으면 새로 생성
        chatRooms.computeIfAbsent(chatIdx, k -> Collections.synchronizedSet(new HashSet<>())).add(session);
        messageHistory.put(session, new StringBuilder()); // 세션당 메시지 기록 초기화

        // 방에 있는 모든 사용자에게 접속 메시지 전송
        broadcastMessage(chatIdx, "새로운 클라이언트 접속: " + chatIdx);
    }

    @OnClose
    public void onClose(Session session, @PathParam("chatIdx") String chatIdx) {
        // 해당 채팅방에서 세션 제거
        Set<Session> room = chatRooms.get(chatIdx);
        if (room != null) {
            room.remove(session);
            if (room.isEmpty()) {
                chatRooms.remove(chatIdx); // 방이 비었으면 삭제
            }
        }

        messageHistory.remove(session); // 세션 종료 시 메시지 기록 삭제
        broadcastMessage(chatIdx, "사용자가 방을 나갔습니다: " + chatIdx);
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("chatIdx") String chatIdx) {
        System.out.println("[" + chatIdx + "] " + message);

        // 메시지를 기록
        messageHistory.forEach((s, history) -> {
            if (s != session) { // 자신에게는 보내지 않음
                history.append(message).append("\n");
            }
        });

        // 해당 방에만 메시지 전송
        broadcastMessage(chatIdx, message);
    }

    // 특정 채팅방에 메시지를 브로드캐스트하는 메서드
    private void broadcastMessage(String chatIdx, String message) {
        Set<Session> room = chatRooms.get(chatIdx);
        if (room != null) {
            synchronized (room) {
                for (Session client : room) {
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
