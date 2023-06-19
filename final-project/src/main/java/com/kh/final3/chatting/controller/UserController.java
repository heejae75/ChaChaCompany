package com.kh.final3.chatting.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.final3.chatting.config.ChatSession;
import com.kh.final3.member.model.dao.MemberDao;
import com.kh.final3.member.model.service.MemberService;
import com.kh.final3.member.model.vo.Member;

@SessionAttributes({"loginmember","master2","rankPic","admin"}) // Model에 loginmember라는 키값으로 객체가 추가되면 자동으로 세션에 추가하라는 의미의 어노테이션
@Controller
public class UserController {
    @Autowired
    private MemberService membervice;
    /* 채팅 */
    @Autowired
    private ChatSession cSession;
    /**
     * 1. 로그인 세션 메소드 ( 암호화 처리 )
     * 
     * @param u
     * @param model
     */
    @RequestMapping(value = "login.do", method = {RequestMethod.GET, RequestMethod.POST})
    public Member memberLogin(Member u, Model model, HttpServletRequest request,HttpSession session) { // view에 전달하는 데이터를 Model에 담는다.
        
            Member loginmember = (Member)session.getAttribute("loginUser");//membervice.loginmember(u);
            /* 채팅 */
            // 현재 로그인 한 member 채팅 Session ArrayList에 추가.
            cSession.addLoginUser(loginmember.getEmail());
            
            return loginmember;
    }
    /**
     * 2. 로그아웃 세션 메소드 (@SessionAttributes가 있기 때문에 session.invalidate()가 먹히지 않으므로)
     * 
     * @param status
     * @return
     */
    @RequestMapping("logout.do")
    public String logout(HttpSession session) {
        
        /* 채팅 */
        Member u = (Member)session.getAttribute("loginmember");
                
        /* 채팅 */
        // 로그아웃한 member를 채팅 Session ArrayList에서 삭제.
        cSession.removeLoginUser(u.getEmail());
		return "redirect:/";
    }
}