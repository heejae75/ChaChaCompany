package com.kh.final3.common.template;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class SaveFile {
	
	public String getSaveFile(MultipartFile upfile, HttpSession session) {
		
		//1. 원본 파일명 뽑기 
		String originName = upfile.getOriginalFilename();
		
		//2. 시간형식 문자열로 뽑아내기 
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		//3.뒤에 붙을 5자리 랜덤값 뽑아주기 
		int ranNum = (int)(Math.random()*90000+10000); //5자리 랜덤값
		
		//4.확장자명 추출하기 
		String ext = originName.substring(originName.lastIndexOf("."));
		
		//5.추출한 문자열들 다 합쳐서 changeName 만들기
		String changeName = currentTime+ranNum+ext;

		return changeName;
	}

}
