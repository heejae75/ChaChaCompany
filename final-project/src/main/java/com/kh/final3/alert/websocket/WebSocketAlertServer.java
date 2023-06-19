package com.kh.final3.alert.websocket;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

//접속한 사용자를 기억해두고 모두에 대한 처리를 하는 서버 
//중복 불가 
//동기화가 되어야 함 (동시 접근하면 안되기 때문)
public class WebSocketAlertServer extends TextWebSocketHandler {
	
	//로그인 중인 개별유저 
	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		String senderId = getUserId(session); //접속한 유저의 http세션을 조회하여 id를 얻는 함수
//		if(senderId != null) { //로그인 값이 있을 때 
//			users.put(senderId, session); //로그인 중 개별유저 저장 
//		}
		
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		String senderId = getUserId(session);
//		
//		//특정 유저에게 보내기
//		String msg = message.getPayload();
//		if(msg != null) {
//			String[] strs = msg
//		}
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
	}
}
