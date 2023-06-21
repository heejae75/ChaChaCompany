<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>채팅</title>
<style>
@charset "UTF-8";
* {
/*     margin: 0;
    padding: 0; */
}
li {
    /* list-style: none; */
}
html {
    font-size: 62.5%;
}
.swal-footer {
    text-align: center;
}


/* 채팅방 목록 */
main {
    width: 35vw;
    min-width: 300px;
    height: 90vh;
    border: 1px solid #000;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, 1%);
    
    border-shadow:10px 8px 5px 3px;
}
 
main h1 {
    color:ghostwhite;
    background-color:#573737;  
    font-size: 2rem;
    padding: 10px;
    height: 50px;
    box-sizing: border-box;
}
 
main .new_chat {
    position: absolute;
    top: 10px;
    right: 10px;
    border-radius: 3px;
    padding: 3px;
    background: #fff;
    cursor: pointer;
}
 
main .new_chat:hover {
    background: #eee;
}
 
main nav {
     font-size: 1.6rem;
     display: flex;
     text-align: center;
     margin-bottom: 5px;
     padding: 0 7px;
}
 
main nav > span:first-child {
    width: 80%;
}
 
main nav > span:last-child {
    width: 20%;
}
 
main ul {
    overflow-y: auto;
    max-height: calc(100% - 50px);
}
 
main li {
    font-size: 1.6rem;
    width: 100%;
    height: 70px;
    padding: 7px;
    box-sizing: border-box;
    display: flex;
    justify-content: space-between;
}
 
main li:hover {
   background: #eee;
}
 
main .chat_title {
    font-weight: bold;
    width: 80%;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
 
main .chat_count {
    width: 20%;
    text-align: center;
}
 
/* 채팅방 목록 */
 
 
 
/* 채팅방 안 */
 
.chat {
    width: 50vw;
    min-width: 300px;
    height: 90vh;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    z-index: 10;
    display: none;
    border-shadow:5px 8px 2px;
}
 
.chat > div {
    height: 100%;
    display: flex;
}
 
.chat .chat_body {
    background: rgb(195, 204, 221);
    height: 100%;
    width: 70%;
    left: 80%;
    top: 100%;
    transform: translate(-50%, -50%);
    order: 1;
    border: 2px solid #000;
    position: absolute;
}
 
.chat h2 {
    font-size: 2rem;
    padding: 10px;
    height: 50px;
    box-sizing: border-box;
    text-align: center;
    background: #eee;
}
 
.chat .chat_back {
    font-size: 2rem;
    width: 50px;
    height: 50px;
    position: absolute;
    top: 0;
    left: 0;
    border: none;
    cursor: pointer;
}
 
.chat ul.chat_list {
    overflow-y: auto;
    height: calc(100% - 150px);
    box-sizing: border-box;
    padding: 5px 0;
}
 
.chat li {
    font-size: 1.5rem;
}
 
.chat li > div {
    padding: 10px;
    display: flex;
}
 
.chat li .notification {
    text-align: center;
}
 
.chat li .notification span {
    margin: 0 auto;
    border-radius: 15px;
    padding: 5px 10px;
    background: #ae9191;
    color: #fff;
}
 
.chat li > div .nickname {
    padding: 3px;   
}
 
.chat li > div .message {
    display: flex; 
}
 
.chat .chat_me {
   justify-content: end;
}
 
.chat .chat_other {
    justify-content: start;
}
 
.chat .chat_other .chat_in_time {
    order: 1;
}
 
.chat .chat_in_time {
    font-size: 1.3rem;
    margin: 0 5px;
    display: flex;
    align-items: flex-end;
}
 
.chat .chat_content {
    padding: 5px;
    border-radius: 3px;
    box-shadow: 0px 2px 3px 0px rgb(0 0 0 / 25%);
    display: inline-block;
    max-width: 250px;
    max-height: 400px;
    overflow-y: auto;
    word-break: break-all;
}
 
.chat .chat_me .chat_content {
    background: yellow;
}
 
.chat .chat_other .chat_content {
    background: #fff;
}
 
.chat .chat_input {
    height: 100px;
    display: flex;
    background: #fff;
}
 
.chat_input .chat_input_area {
    width: 87%;
}
 
.chat_input .chat_input_area textarea {
    width: 100%;
    height: 100%;
    border: none;
    resize: none;
    padding: 8px;
    box-sizing: border-box;
}
 
.chat_input .chat_input_area textarea:focus {
    outline: none;
}
 
.chat_input .chat_button_area {
    width: 13%;
}
 
.chat_input .chat_button_area button {
    background: yellow;
    border: 1px solid #ddd;
    border-radius: 3px;
    padding: 5px;
    width: 90%;
    margin-top: 10px;
    cursor: pointer;
}
 
.chat .chat_users {
    border: 1px solid #ddd;
    width: 30%;
    height: 300px;
/*  position: absolute;
    right: 101%;
    top: 0; */
    margin-right: 3px;
}
 
/* 참가인원 */
.chat .chat_users h2 {
    font-size: 1.6rem;
}
 
.chat .chat_users .chat_nickname {
    font-size: 1.6rem;
    height: calc(100% - 50px);
    overflow: auto;
}
    
.chat .chat_users .chat_nickname li {
    padding: 5px;
}
 
/* 참가인원 */
 
 
/* 채팅방 안 */
 
 
 
@media(max-width: 1024px)  {
    html {
        font-size: 60%;
    }
    main {
        width: 99vw;
    }
    
    .chat {
        width: 99vw;
    }
}
    </style>

</head>
<body>

<%@ include file="../common/menubar.jsp" %>
    <!-- 채팅방 목록 -->
 <!--    <button id="bubble" class="btn btn-outline success" value="말풍선">말풍선</button> -->

    <main id="plz">
        <h1>채팅방</h1>
        <button class="new_chat">새 채팅방 만들기</button>
        <nav>
            <span>방 제목</span>
            <span>인원</span>
        </nav>
        <hr>

            <ul>
                <li>
                    <span class="time_stamp">${dateString}</span>
                    <span class="chat_title">채팅창 제목</span>
                    <span class="chat_count">8</span>

                </li>
            </ul>
        </main>
        <!-- 채팅방 목록 -->

        <!-- 채팅방 입장 -->
        <div class="chat">
            <div>
                <div class="chat_body">
                    <h2 class="chat_title">1번방</h2>
                    <button class="chat_back">◀</button>

                    <ul class="chat_list">
                        <li>
                             <div class="notification">
                            <span>2023-06-19 화요일  10:45</span>
                        </div> 
                        </li>
                    </ul>

                    <div class="chat_input">
                        <div class="chat_input_area">
                            <textarea></textarea>
                        </div>

                        <div class="chat_button_area">
                            <button>전송</button>
                        </div>
                    </div>
                </div>

                <div class="chat_users">
                    <h2>
                    참가인원
                        <span class="user"></span>
                    </h2>

                    <div class="chat_nickname">
                        <ul>
                            <li>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- 채팅방 입장 -->

        <!-- sock js -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
        <!-- STOMP -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>
/* $(function(){
    
$("#bubble").click(function(){
 var pop = $(this).siblings('#plz');

    $(pop)
        .css('opacity',0)
        .slideToggle(380 , 'swing')
        .animate(
        { opacity : 1 }
        ,{ queue : false , duration : 700}
        ,'swing');
    });
}); */
    
//$(document).ready(function(){
    //connectWS();
    //connectSockJS();
//  connectStomp();
    /*  $(#send).on('click',function(evt){
        evt.preventDefault();
        if(!isStomp && socket.readyState !== 1) return;
        
        let msg = $('input#msg').val();
        console.log("msg>>>>>>",msg)
        socket.send(msg);
    }); */
    
    //if(!isStomp && socket.readyState !== 1) return;
    
    //if(isStomp){
        
        
//var isStomp = false;
//});
$(document).ready(function(){

    
//function connectStomp(){
    
    //Controller's MessageMapping,header,message(자유형식)
    //stomp.send()
    
    //해당 토픽을 구독한다
    //stomp.subscribe('/sub/message',function(evt){
        //  console.log("!!!!event",event);
    //});
    
    
    


           
 
// 방 목록 그리기
const listHtml = function(roomList) {
    console.log(roomList[0]);
    console.log(roomList[0].users.length);
    let listHtml = "";
        
        for(let i=roomList.length-1;i>=0;i--) {
            listHtml += 
                        '<li data-room_number='+roomList[i].roomNumber+'>'
                            +'<span class="chat_title">'+roomList[i].roomName+'</span>'
                            +'<span class="chat_count">'+roomList[i].users.length+명+'</span>'
                        +'</li>';
        }
        $("main ul").html(listHtml);
        
}   
    
    
// 채팅방 목록 불러오기
const chatingRoomList = function(){
    $.ajax({
        url: "/chat/rooms",
        type: "GET",
    })
    .then(function(result){
         listHtml(result) 
        console.log(result);
         swal(result.body.name+"방 개설에 성공하였습니다.");
    })
    .fail(function(e){
        swal("채팅방목록불러오는데 에러가 발생했습니다"+e);
    })
};
 
//var socket =     new SockJS("${pageContext.request.contextPath}/pub-stomp", //end-point);
        //null, {transports: ["websocket", "xhr-streaming", "xhr-polling"]}));
var stomp = Stomp.over(new SockJS("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/ws-stomp")); //end-point);
        //null, {transports: ["websocket", "xhr-streaming", "xhr-polling"]}));
/* stomp.debug(e){
	console.log(e);
	} // stomp 콘솔출력 X    
}) */


 
// 구독을 취소하기위해 구독 시 아이디 저장
var subscribe = [];   
 
// 모든 구독 취소하기
const subscribeCancle = function() {
    const length = subscribe.length;
    for(let i=0;i<length;i++) {
        const sid = subscribe.pop();
        stomp.unsubscribe(sid.id);
    }
}
 
 
// 메인 화면    
const main = function() {
    $("main").show();
    
    // 기존 구독 취소
    subscribeCancle();
    
    // 채팅 중이었던 방이 있을때
    const room = chatingRoom();
    
    if(room) {
        return;
    }
    
    const subscribeId = stomp.subscribe("/sub/roomList", function(response){
        // "/sub/roomList"에서 메세지가 왔을때 실행할 함수
        console.log("subresponse"+response.body);
        console.log("parse"+JSON.parse(response.body));
        chatingRoomList();
    });
        
    subscribe.push(subscribeId);
    chatingRoomList();
};
 
 

stomp.connect({}, function(frame){
    console.log("STOMP CONNECTION"+frame);
            main();
});
// ----------------- 메인화면 ---------------------------
 

 
// ----------------- 채팅방 ---------------------------
 
 
const info = (function(){
    let nickname = "";
    let roomNumber = "";
    
    const getNickname = function() {
        return nickname;
    }
    
    const setNickname = function(set){
        nickname = set;
    }
    
    const getRoomNumber = function() {
        return roomNumber;
    }
    
    const setRoomNumber = function(set) {
        roomNumber = set;
    }
    return {
        getNickname : getNickname,
        setNickname : setNickname,
        getRoomNumber : getRoomNumber,
        setRoomNumber : setRoomNumber,
    }
})();
 
 
var errorMSG = function(result){
    if(result.status == 404) {
        alert("종료되었거나 없는 방입니다(404error)");
    } else {
        alert("에러가 발생했습니다");
    }
    location.href = "/";
}
 
 
// 참가자 그리기
const userList = function(users){
    console.log(users);

    $(".chat .chat_users .user").text(users.length + "명");
    
    let userHtml = "";
    for(let i=0;i<users.length;i++) {
        userHtml += "<li>"+users[i]+"</li>";
    }
    
    $(".chat .chat_nickname ul").html(userHtml);
    console.log("userhtml"+userHtml);
}
// 메세지 그리기
const chating = function(messageInfo){
    console.log(messageInfo);
console.log('진짜 3번');

    let nickname = messageInfo.nickname;
    let message = messageInfo.message;
    
    console.log(nickname+message);
//  let type = messageInfo.type;
    
    if(typeof message == 'string'){
        message = message.replaceAll("\n", "<br>").replaceAll(" ", "&nbsp");
        console.log("str:"+message);
    }
     const date = messageInfo.date;
        const d = new Date(date);
    
        const time = String(d.getHours()).padStart(2, "0") 
                + ":" 
                + String(d.getMinutes()).padStart(2, "0");
    
    let sender = "";
    if(info.getNickname() == nickname) {
        sender = "chat_me";
        nickname = "";
        console.log(info.getNickname());
    } else { sender=  "chat_other";
    }
    
    console.log(sender);
    console.log(nickname);
    const chatHtml = '<li>'
                            +'<div class='+sender+'>'
                                +'<div>'
                                    +'<div class="nickname">'+nickname+'</div>'
                                    +'<div class="message">'
                                        +'<span class=chat_in_time>'+time+'</span>'
                                        +'<span class="chat_content">'+message+'}</span>'
                                    +'<span>'
                                +'</div>'
                            +'</div>'
                        +'</li>';
    console.log(chatHtml);
    $(".chat ul.chat_list").append(chatHtml);
        
    $(".chat ul").scrollTop($(".chat ul")[0].scrollHeight);
}
 
//채팅방 구독
const chatingConnect = function(roomNumber){
    // 기존 구독 취소
    subscribeCancle();
    
    // 메세지를 받을 경로
    const id1 = stomp.subscribe("/sub/message/" + roomNumber, function(result){
        const message = JSON.parse(result.body); 
        //var writer = message.nickname;
        console.log(message.nickname+'/'+message.date);
        console.log('2번');
        
        // 메세지가 왔을때 실행할 함수
        chating(message);
    });
    
    // 입장,퇴장 알림을 받을 경로
    const id2 = stomp.subscribe("/sub/notification/" + roomNumber, function(result){
        const room = JSON.parse(result.body);
        const message = room.message;
        
        // 메세지가 왔을때 실행할 함수
        userList(room.users);
        console.log(userList(room.users));
        const chatHtml = 
                            '<li>'
                                +'<div class="notification">'
                                    +'<span>'+message+'</span>'
                                +'</div>'
                            +'</li>';
                        
        $(".chat ul.chat_list").append(chatHtml);
            
        $(".chat ul").scrollTop($(".chat ul")[0].scrollHeight);
    
    });
        
    subscribe.push(id1);
    subscribe.push(id2);
};
    //main();  

 
 
// 채팅방 세팅
const initRoom = function(room, nickname) {
    // 방 목록 업데이트
    stomp.send("/pub/roomList");
    
    $("main").hide();
    
    info.setNickname(nickname);
    info.setRoomNumber(room.roomNumber);
    
    $(".chat").show();
    $(".chat .chat_title").text(room.roomName);
    
    userList(room.users);
    chatingConnect(room.roomNumber);
    
    $(".chat_input_area textarea").focus();
    console.log("room.roomName"+room.roomName);
    console.log("room.users initrom"+room.users);
    console.log("roomnumber or roomid"+room.roomId);
}
 
 
// 메세지 보내기
const sendMessage = function(){
    const message = $(".chat_input_area textarea");
    
    if (message.val() == "") {
        return;
    }
    
    const roomNumber = info.getRoomNumber();
    const nickname = info.getNickname();
    
    const data = {
        message : message.val(),
        nickname : nickname,
    }
    
    stomp.send("/pub/sendMessage" + roomNumber, {}, JSON.stringify(data));
    message.val("");
}
 

$(".chat_button_area button").click(function() {
    sendMessage();
    $(".chat_input_area textarea").focus();
});
 
 
$(".chat_input_area textarea").keypress(function(event) {
    if (event.keyCode == 13) {
        console.log(event.key);
    }
        if (!event.shiftKey) {
            event.preventDefault();
            cosnole.log(event.preventDefault());
            
            sendMessage();
        }
    })
});
 
 
 

    
// 닉네임 만들고 채팅방 들어가기
const enterChatingRoom = function(roomNumber) {
    
    swal({
        text: "사용하실 닉네임을 입력해주세요",
        content: "input",
        buttons: ["취소", "확인"],
        closeOnClickOutside : false 
    })
    .then(function(nickname){
        if(nickname) {
            
            const data = {
                roomId : roomNumber,
                writer : nickname
            }
            
            $.ajax({
                url: "/chat/room/enter",
                type: "GET",
                data: data,
            })
            .then(function(room){
                initRoom(room, nickname);
                        console.log("before"+room);
                // 채팅방 참가 메세지
                room.message = nickname + "님이 참가하셨습니다";
                stomp.send(
                    "/pub/chat/room/enter" + roomNumber, {}, 
                    JSON.stringify(room));
                    console.log("after"+room);
            })
            .fail(function(result){
                errorMSG(result);
            })
        }
        
    })
};
    
    
 
// 새 채팅방 만들기
const createRoom = function(roomName) {
    swal({
        text: "사용하실 닉네임을 입력해주세요",
        content: "input",
        buttons: ["취소", "확인"],
        closeOnClickOutside : false 
    })
    .then(function(nickname){
        if(nickname) {
            
            const data = {
                roomName: roomName,
                writer : nickname
            }
            
            $.ajax({
                url: "/chat/room",
                type: "POST",
                data: data,
            })
            .then(function(room){
                initRoom(room, nickname)
            })
            .fail(function(e){
                alert("에러가 발생했습니다+새채팅방"+e.data+e.body+e);
            })
        }
    })
};
 
 
 
 
$(".new_chat").click(function(){

    $(".chat").fadeToggle(600);
	
    /* swal({
        text: "방 이름을 입력해주세요",
        content: "input",
        buttons: ["취소", "확인"],
        closeOnClickOutside : false 
    })
    .then(function(roomName){
        if(roomName) {
            createRoom(roomName);
        }
    }) */
});
 
 
 
 
        
 
$(document).on("dblclick", "main li", function(){
    const roomNumber = $(this).data("room_number");
    enterChatingRoom(roomNumber);
})
 
 
 
 
// 채팅방 나가기
$(".chat_back").click(function() {
    swal({
        text: "대화방에서 나갈까요?",
        buttons: ["취소", "확인"]
    })
    .then(function(result){
        if(result) {
            $.ajax({
                url: "/chat/room/exit",
                type: "PATCH", 
            })
            .then(function(room){
                const roomNumber = info.getRoomNumber();
 
                if(room.users.length != 0) {
                    // 채팅방 나가기 메세지
                    room.message = info.getNickname() + "님이 퇴장하셨습니다";
                    stomp.send(
                        "/pub/nitification/" + roomNumber, {}, 
                        JSON.stringify(room));
                } 
                
                // 채팅방 목록 업데이트  
                stomp.send("/pub/roomList");
                                    
                main();  
                $(".chat").hide();
                $(".chat ul.chat_list").html("");
                    
                info.setRoomNumber("");
                info.setNickname("");
            })
            .fail(function(){
                errorMSG();
            })
        }
    })
})
// 대화 중이던 방
const chatingRoom = function (){
    let returnRoom = null;
    
    $.ajax({
        url: "/chat/rooming",
        type: "GET",
        async: false,
    })
    .then(function(result){
        if(result != "") {
            const room = result.chatingRoom;
            const nickname = result.myNickname;
            initRoom(room, nickname);
            returnRoom = result;
        }
    })
    .fail(function(result){
        errorMSG(result);
    })
    
    return returnRoom;
  }

 // document.ready
 
   function nowDate(){
     var today = new Date();
     var year = today.getFullYear();
     var month = ('0'+(today.getMonth()+1)).slice(-2);
     var day = ('0'+today.getDate()).slice(-2);
     var hours = ('0'+today.getHours()).slice(-2);
     var minutes = ('0'+today.getMinutes()).slice(-2);
     var dateString = year + "-" + month + "-" + day + " " + hours + ":" + minutes;
     return dateString;
     } 
 
    
    </script>
</body>
</html>
