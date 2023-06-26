package com.kh.final3.chatting.model.vo;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.WebSocketSession;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	@Builder
	public class ChatRoom {
		
		 private String roomId;        // 방 번호
		    
		    private String userEmail;    // 사용자 이메일
		    private String userName;    // 사용자 이름
		    private String userPic;        // 사용자 사진
		    
		    private String masterEmail; // 상대방 이메일
		    private String masterName;    // 상대방 이름
		    private String masterPic;    // 상대방 사진
		    
		    private int unReadCount;    // 안 읽은 메세지 수
		//WebSocketSession은 Spring에서 Websocket Connection이 맺어진 세션
		
		//private Set<WebSocketSession> session = new HashSet<>();
		
		//private LinkedList<String> users;
		
		
		
//		public static ChatRoom create(String roomName) {
//			ChatRoom room = new ChatRoom();
//			
//			room.roomId = UUID.randomUUID().toString();
//			room.roomName = roomName;
//			return room;
//		}
	}
