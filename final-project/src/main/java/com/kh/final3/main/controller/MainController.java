package com.kh.final3.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("home.ma")
	public String MainHome() {
		return "main/userMain";
	}
}
