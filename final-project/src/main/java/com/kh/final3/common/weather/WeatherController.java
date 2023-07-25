package com.kh.final3.common.weather;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping(value= {"/member", "/admin"})
@Controller
public class WeatherController {
	
	@ResponseBody
	@RequestMapping(value="weather.ma", produces = "application/json; charset=UTF-8")
	public String selectWeather(String baseDate, String baseTime) throws IOException {
		
		String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst";
		String serviceKey = "7zxXenAGLgeB%2BpWfu4otC7O%2B%2FNtGcsyOTvsbLe0qKv5vHOV9L93bTTlaZr9nHkDacPSV33NDe6YpPDyPkv6kyQ%3D%3D";
		
		apiUrl +="?serviceKey="+serviceKey; //serviceKey
		apiUrl +="&pageNo=1";				//페이지번호
		apiUrl +="&numOfRows=60";			//한페이지에 보여질 결과 개수 
		apiUrl +="&dataType=json";			//요청자료타입
		apiUrl +="&base_date="+baseDate;	//발표일
		apiUrl +="&base_time="+baseTime;	//발표시간
		apiUrl +="&nx=58";					//예보 지점의 X좌표 
		apiUrl +="&ny=126";					//예보 지점의 Y좌표
		
		//작성된 URL을 넣어서 URL객체 생성하기 
        URL requestUrl = new URL(apiUrl);
        
        //URL객체를 통해서 Connection얻어오기 
        HttpURLConnection conn = (HttpURLConnection)requestUrl.openConnection();
        conn.setRequestMethod("GET");
        
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        
        String responseText = "";
        String line;
        
        //Json상태로 읽어와서 String 형태로 만들었기때문에 인코딩해주기 
        while((line = br.readLine()) != null){
        	responseText += line;
        }
        
        System.out.println("json : " + responseText);
        
        //작업이 끝났기때문에 자원 반납 및 연결 해제 해주기 
        br.close();
        conn.disconnect();
        
		return responseText;
	}
	
}
