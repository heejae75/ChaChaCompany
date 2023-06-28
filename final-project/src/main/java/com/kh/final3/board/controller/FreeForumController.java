package com.kh.final3.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.final3.board.model.service.FreeForumService;
import com.kh.final3.board.model.vo.Board;
import com.kh.final3.board.model.vo.BoardAttachment;
import com.kh.final3.common.template.Pagination;
import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.CustomUserDetails;

@Controller
@RequestMapping(value = { "/admin", "/member" })
public class FreeForumController {

	@Autowired
	FreeForumService freeForumService;

	@GetMapping("/list.fr")
	public String freeForumList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model,
								String category, String searchWord) {
		
		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("searchWord", searchWord);
		
		int listCount = freeForumService.selectListCount(map);
		int pageLimit = 5;
		int boardLimit = 3;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> list = freeForumService.forumList(pi);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "board/freeForum/freeForumListView";
	}

	@GetMapping("/detailList.fr")
	public ModelAndView forumDetails(ModelAndView mv, int boardNo) {

		int result = freeForumService.increaseForumCount(boardNo);

		if (result > 0) {
			Board board = freeForumService.findForumDetails(boardNo);
			ArrayList<BoardAttachment> attachmentList = freeForumService.findAttachmentList(boardNo);
			int recommend = freeForumService.selectRecommendCount(boardNo);
			int deprecated = freeForumService.selectDeprecatedCount(boardNo);
			
			mv.setViewName("board/freeForum/freeForumDetailView");
			mv.addObject("board", board);
			mv.addObject("recommend", recommend);
			mv.addObject("deprecated", deprecated);
			mv.addObject("attachmentList", attachmentList);
		}

		return mv;
	}

	@GetMapping("/enrollForm.fr")
	public String enrollForm() {

		return "board/freeForum/freeForumEnrollForm";
	}

	@PostMapping("/insert.fr")
	public ModelAndView forumAdd(Board board, String role, Principal p, ModelAndView mv) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		CustomUserDetails userDetails = (CustomUserDetails)principal;
		
		String boardWriter = Integer.toString(userDetails.getUserNo());
		board.setBoardWriter(boardWriter);
		
		int result = freeForumService.addForum(board);
		
		if(result>0) {
			mv.setViewName("redirect:list.fr");
		}else {
			
		}
		
		return mv;
	}

	@PostMapping("/ckupload")
	public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res,
			@RequestParam MultipartFile upload, HttpSession session) throws Exception {

		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		try {

			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();

			// 업로드 경로
			String ckUploadPath = session.getServletContext().getRealPath("/resources/uploadFiles/freeForum/") + uid + "_"
					+ fileName;

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // out에 저장된 데이터를 전송하고 초기화

//			String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter();
//			String fileUrl = "/ckUpload/" + uid + "_" + fileName; // 구버전
			String fileUrl = "/final3/resources/uploadFiles/freeForum/" + uid + "_" + fileName;

			// 업로드시 메시지 출력
//			printWriter.println("<script type='text/javascript'>" + "window.parent.CKEDITOR.tools.callFunction("
//					+ callback + ",'" + fileUrl + "','이미지를 업로드하였습니다.')" + "</script>"); 구버전
			printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}
	
	@ResponseBody
	@PostMapping(value = "/recommend.fr", produces = "application/json; charset=UTF-8")
	public String increaseRecommend(int boardNo, Principal p) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUserDetails userDetails = (CustomUserDetails)principal;
		int userNo = userDetails.getUserNo();
		
		Map<String, Integer> map = new HashMap<>();
		map.put("boardNo", boardNo);
		map.put("userNo", userNo);
		
		int checking = freeForumService.checkRecommend(map);
		
		if(checking == 0) {
			int result = freeForumService.addRecommend(map);
			if(result>0) {
				int count = freeForumService.selectRecommendCount(boardNo);
				
				return new Gson().toJson(count);
			}else {
				
				return new Gson().toJson("작업도중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
			}
		}else {
			
			return new Gson().toJson("이미 좋아요를 누른 게시물입니다.");
		}
	}
	
	@ResponseBody
	@PostMapping(value = "/deprecated.fr", produces = "application/json; charset=UTF-8")
	public String increaseDeprecated(int boardNo, Principal p) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUserDetails userDetails = (CustomUserDetails)principal;
		int userNo = userDetails.getUserNo();
		
		Map<String, Integer> map = new HashMap<>();
		map.put("boardNo", boardNo);
		map.put("userNo", userNo);
		
		int checking = freeForumService.checkDeprecated(map);
		
		if(checking == 0) {
			int result = freeForumService.addDeprecated(map);
			if(result>0) {
				int count = freeForumService.selectDeprecatedCount(boardNo);
				
				return new Gson().toJson(count);
			}else {
				
				return new Gson().toJson("작업도중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
			}
		}else {
			
			return new Gson().toJson("이미 싫어요를 누른 게시물입니다.");
		}
	}	
}
