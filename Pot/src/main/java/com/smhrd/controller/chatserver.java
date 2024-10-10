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
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/jsp/main")
public class chatserver {
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
    private static Map<Session, StringBuilder> messageHistory = Collections.synchronizedMap(new HashMap<>());
    

    @OnOpen
    public void onOpen(Session session) {
        clients.add(session);
        messageHistory.put(session, new StringBuilder()); // 세션당 메시지 기록 초기화

        // 새로운 클라이언트가 접속했다고 메시지 전송
        for (Session client : clients) {
            try {
                client.getBasicRemote().sendText("새로운 클라이언트 접속");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // 이전 메시지를 새로운 클라이언트에게 전송
        StringBuilder history = messageHistory.get(session);
        if (history.length() > 0) {
            try {
                session.getBasicRemote().sendText(history.toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
        messageHistory.remove(session); // 세션 종료 시 메시지 기록 삭제

        for (Session client : clients) {
            try {
                client.getBasicRemote().sendText("다른 클라이언트 접속 해제");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println(message);

        // 메시지를 기록
        messageHistory.forEach((s, history) -> {
            if (s != session) { // 자신에게는 보내지 않음
                history.append(message).append("\n");
            }
        });

        for (Session client : clients) {
            if (session != client) {
                try {
                    client.getBasicRemote().sendText(message);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
