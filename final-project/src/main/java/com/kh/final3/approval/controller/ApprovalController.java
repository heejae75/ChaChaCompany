package com.kh.final3.approval.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kh.final3.approval.model.service.ApprovalService;
import com.kh.final3.approval.model.vo.Approval;
import com.kh.final3.approval.model.vo.ApprovalAttachment;
import com.kh.final3.approval.model.vo.ApprovalDoc;
import com.kh.final3.approval.model.vo.DocType;
import com.kh.final3.approval.model.vo.Item;
import com.kh.final3.approval.model.vo.Leave;
import com.kh.final3.common.template.Pagination;
import com.kh.final3.common.template.SaveFile;
import com.kh.final3.common.vo.PageInfo;
import com.kh.final3.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value = {"/member", "/admin"}, method= {RequestMethod.GET,RequestMethod.POST})
public class ApprovalController {
	@Autowired
	private ApprovalService as;
	
	@RequestMapping("home.ap")
	public String approvalHome() {
		return "approval/approvalHome";
	}
	
	@RequestMapping("list.ap")
	public String approvalList(@RequestParam(value="currentPage",defaultValue="1")int currentPage,HttpServletRequest request, Model m) {
		String status = request.getParameter("status");
		int listCount = as.selectListCount(status);
		int pageLimit = 20;
		int boardLimit = 10;
		
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<ApprovalDoc> list = as.selectApprovalDocList(pi,status);
		ArrayList<Approval> a = as.selectApprovalList();
		m.addAttribute("list",list);
		m.addAttribute("pi",pi);
		m.addAttribute("status", status);
		m.addAttribute("a", a);
		return "approval/approvalListView";
	}
	
	@ResponseBody
	@RequestMapping(value="approvalMainList.ap", produces="application/json; charset=UTF-8")
	public String approvalMainList(String status) {
		ArrayList<ApprovalDoc> list = as.approvalMainList(status);
		
		return new Gson().toJson(list);
	}
	
	@RequestMapping("enrollList.ap")
	public String enrollList(Model m) {
		ArrayList<DocType> list = as.selectEnrollList();
		
		m.addAttribute("list",list);
		return "approval/enrollListView";
	}
	
	@RequestMapping("enrollForm.ap")
	public ModelAndView enrollForm(HttpServletRequest request, ModelAndView mv) {
		int appNo = Integer.parseInt(request.getParameter("appNo"));
		
		if(appNo==1) {
			mv.setViewName("approval/leaveForm");
		}else if(appNo==2) {
			
			mv.setViewName("approval/itemForm");
		}else if(appNo==3) {
			mv.setViewName("approval/minutes");
		}
		return mv;
	}
	
//	결재자 조회
	@ResponseBody
	@PostMapping(value="selectApproverList.ap",produces = "application/json; charset=UTF-8")
//	@RequestMapping(value="selectApproverList.ap", method = {RequestMethod.GET,RequestMethod.POST}, produces = "application/json; charset=UTF-8")
	public String selectApproverList(String deptCode) {
		ArrayList<Member> list = as.selectApproverList(deptCode);
		return new Gson().toJson(list);
	}
	//결재자 검색
	@ResponseBody
	@PostMapping(value="searchApprover.ap",produces = "application/json; charset=UTF-8")
//	@RequestMapping(value="searchApprover.ap",method = {RequestMethod.GET,RequestMethod.POST},produces="application/json; charset=UTF-8")
	public String searchApprover(String status, String keyword){
		HashMap<String, String> map = new HashMap<>();
		
		map.put("status", status);
		map.put("keyword", keyword);
		
		ArrayList<Member> list = as.searchApproverList(map);

		return new Gson().toJson(list);
	}
	
	//구매품의서
	@RequestMapping("item.ap")
	public ModelAndView insertItem(Item i, ApprovalDoc ad, Approval a,ModelAndView mv,HttpSession session, ArrayList<MultipartFile> upfile){
		ArrayList<ApprovalAttachment> atList = new ArrayList<>();
		for(MultipartFile file : upfile) {
			if(!file.getOriginalFilename().equals("")) {
				String changeName = new SaveFile().getSaveFile(file, session);
				
				String filePath = session.getServletContext().getRealPath("/resources/uploadFiles/approvalDoc/");
				
				try {
					file.transferTo(new File(filePath+changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				ApprovalAttachment at = ApprovalAttachment.builder().originName(file.getOriginalFilename())
																	.changeName(changeName)
																	.filePath(filePath+changeName)
																	.deptCode(ad.getDeptCode()).build();
				
				atList.add(at);
			}
			
		}
		int result = as.insertItem(i,atList,ad,a);
		if(result>0) {
			session.setAttribute("alertMsg", "결재등록이 완료되었습니다.");
			mv.setViewName("redirect:list.ap");
		}else {
			for(ApprovalAttachment aa : atList) {
				new File(session.getServletContext().getRealPath(aa.getFilePath())).delete();
			}
			session.setAttribute("alertMsg", "결재등록에 실패하였습니다.");
			mv.setViewName("redirect:list.ap");
		}
		return mv;
	}
	//휴가계
		@RequestMapping("leave.ap")
		public ModelAndView insertItem(Leave l, ApprovalDoc ad, Approval a,ModelAndView mv,HttpSession session, ArrayList<MultipartFile> upfile){
			ArrayList<ApprovalAttachment> atList = new ArrayList<>();
			
			for(MultipartFile file : upfile) {
				if(!file.getOriginalFilename().equals("")) {
					String changeName = new SaveFile().getSaveFile(file, session);
					
					String filePath = session.getServletContext().getRealPath("/resources/uploadFiles/approvalDoc/");
					
					try {
						file.transferTo(new File(filePath+changeName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					
					ApprovalAttachment at = ApprovalAttachment.builder().originName(file.getOriginalFilename())
																		.changeName(changeName)
																		.filePath(filePath+changeName)
																		.deptCode(ad.getDeptCode()).build();
					
					atList.add(at);
				}
				
			}
			int result = as.insertLeave(l,atList,ad,a);
			
			if(result>0) {
				session.setAttribute("alertMsg", "결재등록이 완료되었습니다.");
				mv.setViewName("redirect:list.ap");
			}else {
				for(ApprovalAttachment aa : atList) {
					new File(session.getServletContext().getRealPath(aa.getFilePath())).delete();
				}
				session.setAttribute("alertMsg", "결재등록에 실패하였습니다.");
				mv.setViewName("redirect:list.ap");
			}
			
			return mv;
		}
		@RequestMapping("detail.ap")
		public ModelAndView detailApp(int docNo, String docType, ModelAndView mv) {
			Approval a = as.selectApproval(docNo);
			ArrayList<ApprovalAttachment> at = as.selectApprovalAttachment(docNo);
			ApprovalDoc ad = as.selectApprovalDoc(docNo);
			Item i = new Item();
			Leave l = new Leave();
			
			if(docType.equals("구매품의서")) {
				i = as.selectItem(docNo);
				String[] arrSupplyName = i.getSupplyName().split(",");
				String[] arrSupplySize = i.getSupplySize().split(",");
				String[] arrAmount = i.getAmount().split(",");
				String[] arrPrice = i.getPrice().split(",");
				i.setArrSupplyName(arrSupplyName);
				i.setArrSupplySize(arrSupplySize);
				i.setArrPrice(arrPrice);
				i.setArrAmount(arrAmount);
				mv.addObject("a",a).addObject("at",at).addObject("ad", ad)
				.addObject("i", i)
				.setViewName("approval/itemDetailView");
				
			}else if(docType.equals("휴가계")) {
				l = as.selectLeave(docNo);
				String[] arrStartDate = l.getStartDate().split(",");
				String[] arrEndDate = l.getEndDate().split(",");
				l.setArrStartDate(arrStartDate);
				l.setArrEndDate(arrEndDate);
				mv.addObject("a",a).addObject("at",at).addObject("ad", ad)
				.addObject("l", l)
				.setViewName("approval/leaveDetailView");
			}
			
			return mv;
			
		}
		//중간결재자 반려
		@ResponseBody
		@PostMapping("updateSecondReturnReason.ap")
		public int updateSecondReturnReason(Approval a) {
			int result = as.updateSecondReturnReason(a);
			return result;
		}
		
		//최종결재자 반려
		@ResponseBody
		@PostMapping("updateLastReturnReason.ap")
		public int updateLastReturnReason(Approval a, ApprovalDoc ad) {
			int result = as.updateLastReturnReason(a,ad);
			return result;
		}
		
		//중간결재자 승인
		@ResponseBody
		@PostMapping("updateSecondApprover.ap")
		public int updateSecondApprover(Approval a) {
			int result = as.updateSecondApprover(a);
			return result;
		}
		
		//최종결재자 승인
		@ResponseBody
		@PostMapping("updateLastApprover.ap")
		public int updateLastApprover(Approval a, ApprovalDoc ad) {
			int result = as.updateLastApprover(a,ad);
			return result;
		}
		
		//그래프
		@ResponseBody
		@GetMapping(value="monthData.ap",produces="application/json; charset=UTF-8")
		public String monthData(ModelAndView mv, ApprovalDoc ad) {
			List<ApprovalDoc> list = as.monthData(ad);
			
			Iterator<ApprovalDoc> it = list.iterator();
			
			JsonArray jArr = new JsonArray();
			
			while(it.hasNext()){
				ad = it.next();
				JsonObject obj = new JsonObject();
				
				String createDate = ad.getCreateDate();
				int approval = ad.getApproval();
				int reject = ad.getReject();
				
				obj.addProperty("createDate", createDate);
				obj.addProperty("approval", approval);
				obj.addProperty("reject", reject);
				jArr.add(obj);
			}
			return new Gson().toJson(jArr);
		}
}
