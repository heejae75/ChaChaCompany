//package com.kh.final3.chatting.controller;
//
//import java.util.List;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.kh.final3.chatting.model.dto.ChatRoomDTO;
//import com.kh.final3.chatting.model.repo.ChatRoomRepository;
//
//import lombok.RequiredArgsConstructor;
//
//@RequiredArgsConstructor
//@Controller
//@RequestMapping("/chat")
//public class ChatRoomController {
//	// 채팅방 목록
//	//private final LinkedList<ChatRoomDTO> chatRoomList = new LinkedList<>();
//	
//	private final ChatRoomRepository chatRoomRepository;
//
//	@GetMapping("/rooms")
//	public String rooms(Model model){
//		return "/chatting/chatting";
//	}
//
//	@GetMapping("/rooms")
//	@ResponseBody
//	public List<ChatRoomDTO> room()
//	{
//		return chatRoomRepository.findAllRoom();
//	}
//	
//	// 채팅방 생성
//		//@PreAuthorize
//		@PostMapping("/room")
//		@ResponseBody
//		public ChatRoomDTO createRoom(@RequestParam String name) {
//			return chatRoomRepository.createChatRoomDTO(name);
//			
//		}  //return "/chat/rooomList"
//		
//		// 방 들어가기
//		@GetMapping("/room/enter/{roomId}")
//		public String roomDetail(Model model,@PathVariable String roomId){
//
//			return "/chatting/roomdetail";
//		}
//		
//		@GetMapping("/room/{roomId}")
//		public ChatRoomDTO roomInfo(@PathVariable String roomId) {
//			return chatRoomRepository.findRoomById(roomId);
//		}
//	
//	//	----------------------------------------------------
//	// 유틸 메서드
//	
////	// 방 번호로 방 찾기
////	public ChatRoomDTO findRoom(String roomNumber) {
////		ChatRoomDTO room = ChatRoomDTO.builder().roomId(roomNumber).build(); 
////		int index = chatRoomList.indexOf(room);
////		
////		if(chatRoomList.contains(room)) {
////			return chatRoomList.get(index); 
////		}
////		return null;
////	}
////	
////	
////	// 쿠키에 추가
////	public void addCookie(String cookieName, String cookieValue) {
////		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
////		HttpServletResponse response = attr.getResponse();
////		
////		Cookie cookie = new Cookie(cookieName, cookieValue);
////		
////		int maxage = 60 * 60 * 24 * 7;
////		cookie.setMaxAge(maxage);
////		response.addCookie(cookie);
////	}
////	
////	
////	
////	// 방 번호, 닉네임 쿠키 삭제
////	public void deleteCookie( ) {
////		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
////		HttpServletResponse response = attr.getResponse();
////		
////		Cookie roomCookie = new Cookie("roomNumber", null);
////		Cookie nicknameCookie = new Cookie("nickname",null);
////		
////		roomCookie.setMaxAge(0);
////		nicknameCookie.setMaxAge(0);
////		
////		response.addCookie(nicknameCookie);
////		response.addCookie(roomCookie);
////	}
////	
////	
////	
////	// 쿠키에서 방번호, 닉네임 찾기
////	public Map<String, String> findCookie() {
////		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
////		HttpServletRequest request = attr.getRequest();
////		
////		Cookie[] cookies = request.getCookies();
////		String roomNumber = "";
////		String nickname= "";
////		
////		if(cookies == null) {
////			return null;
////		}
////		
////		if(cookies != null) {
////			for(int i=0;i<cookies.length;i++) {
////				if("roomNumber".equals(cookies[i].getName())) {
////					roomNumber = cookies[i].getValue();
////				}
////				if("nickname".equals(cookies[i].getName())) {
////					nickname = cookies[i].getValue();
////				}
////			}
////			
////			if(!"".equals(roomNumber) && !"".equals(nickname)) {
////				Map<String, String> map = new HashMap<>();
////				map.put("nickname", nickname);
////				map.put("roomNumber", roomNumber);
////				
////				return map;
////			}
////		}
////		
////		return null;
////	}
////	
////	// 닉네임 생성
////	public void createNickname(String nickname) {
////		addCookie("nickname", nickname);
////	}
////	
////	// 방 입장하기
////	public boolean enterChatRoom(ChatRoomDTO chatRoom, String nickname) {
////		createNickname(nickname);
////		
////		if(chatRoom == null) {
////			deleteCookie();
////			return false;
////		} else {
////			LinkedList<String> users = chatRoom.getUsers();
////			users.add(nickname);
////			
////			addCookie("roomNumber", chatRoom.getRoomId());
////			return true;
////		}
////	}
////	
////	//	----------------------------------------------------
////	
////	// 컨트롤러
////
//	
//	
//	
//	// 방 만들기
////	@PostMapping("/room")
////	public ResponseEntity<?> chatRoom(String roomName,String nickname) {
////		
////		// 방을 만들고 채팅방목록에 추가
////		String roomNumber = UUID.randomUUID().toString();
////		ChatRoomDTO chatRoom = ChatRoomDTO.builder()
////				.roomId(roomNumber)
////				.users(new LinkedList<>())
////				.roomName(roomName)
////				.build();
////		
////		System.out.println("방이름 : "+chatRoom);
////		
////		chatRoomList.add(chatRoom);
////		
////		// 방 입장하기
////		enterChatRoom(chatRoom, nickname);
////		
////		return new ResponseEntity<>(chatRoom, HttpStatus.OK);
////	}
////	
//	
//	
//	
//	//return /chat/roomdetail
//
//	// 방 나가기
////	@PatchMapping("/room/exit")
////	public ResponseEntity<?> ExitChatRoom(){
////			
////		Map<String, String> map = findCookie();
////			
////		if(map == null) {
////			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
////		}
////		
////		
////		String roomNumber = map.get("roomNumber");
////		String nickname = map.get("nickname");
////		
////		// 방목록에서 방번호에 맞는 유저목록 가져오기
////		ChatRoomDTO chatRoom = findRoom(roomNumber);
////		List<String> users = chatRoom.getUsers();
////		
////		// 닉네임 삭제
////		users.remove(nickname);
////		
////		// 쿠키에서 닉네임과 방번호 삭제
////		deleteCookie();
////		
////		// 유저가 한명도 없다면 방 삭제
////		if(users.size() == 0) {
////			chatRoomList.remove(chatRoom);
////		}
////		
////		return new ResponseEntity<>(chatRoom, HttpStatus.OK);
////	}
//	
////	
////	// 참가 중이었던 대화방
////	@GetMapping("/rooming")
////	public ResponseEntity<?> chatRoom() {
////		// 쿠키에 닉네임과 방번호가 있다면 대화중이던 방이 있던것
////		Map<String, String> map = findCookie();
////		
////		if(map == null) {
////			return new ResponseEntity<>(HttpStatus.OK);
////		}
////		
////		String roomNumber = map.get("roomNumber");
////		String nickname = map.get("nickname");
////		
////		ChatRoomDTO chatRoom = findRoom(roomNumber);
////		
////		if(chatRoom == null) {
////			deleteCookie(); 
////			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
////		} else {
////			Map<String, Object> map2 = new HashMap<>();
////			map2.put("chatRoom", chatRoom);
////			map2.put("myNickname", nickname);
////			
////			return new ResponseEntity<>(map2, HttpStatus.OK);
////		}
////	}
//}