package kr.co.nextdoor.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * �ε�����Ʈ�ѷ� : �ε��� ȭ��
 */
@Controller
public class ChatController {
	
	@RequestMapping(value="chat.htm", method=RequestMethod.GET)
	public String home() {
		return "main.chat";
	}
}
