package com.kh.final3.chatting.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.final3.chatting.model.dao.ChatDao;
import com.kh.final3.chatting.model.vo.ChatMessage;
import com.kh.final3.chatting.model.vo.ChatRoom;



@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	ChatDao chatDao;

	@Override
	public ChatRoom selectChatRoom(String roomId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMessage(ChatMessage chatMessage) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ChatMessage> messageList(String roomId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int createChat(ChatRoom room) {
		int result = chatDao.createChat(room); 
		return result;
	}

	@Override
	public ChatRoom searchChatRoom(ChatRoom room) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChatRoom> chatRoomList(String userEmail) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectUnReadCount(ChatMessage message) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCount(ChatMessage message) {
		// TODO Auto-generated method stub
		return 0;
	}

}
