package com.kh.final3.chatting.model.vo;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatMessage {
	 private String roomId;            // 방 번호
	    private String messageId;        // 메세지 번호
	    private String message;            // 메세지 내용
	    private String name;            // 보낸이 이름
	    private String email;            // 보낸이 이메일
	    private int unReadCount;        // 안 읽은 메세지 수
	    private int sessionCount;        // 현재 세션 수
	
	
	
//	public enum MessageType {
//		ENTER,TALK,EXIT
//	}
//	
//	private MessageType type;
//	private String roomId;
//	private String sender;
//	private String message;
//	private Date date;
//	
//	ChatMessage(){
//		date = new Date();
//	}
	
}
