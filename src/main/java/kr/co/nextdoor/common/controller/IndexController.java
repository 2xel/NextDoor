package kr.co.nextdoor.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * �ε�����Ʈ�ѷ� : �ε��� ȭ��
 */
@Controller

public class IndexController {

	@RequestMapping("index.htm")
	public String home() {
		
		return "index.index";
	}
}
