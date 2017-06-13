package kr.co.nextdoor.workspace.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.nextdoor.workspace.service.WorkspaceService;

@Controller
public class WorkspaceController {
	
	@Autowired
	private WorkspaceService service;

	//�α��� �� ��ũ�����̽� ���� ȭ��
	@RequestMapping(value = "workspace.htm")
	public ModelAndView workspaceList(ModelAndView mav) {
		service.WorkspaceList();
		mav.addObject("workspacelist",service.WorkspaceList());
		mav.setViewName("login.workspace");
		return mav;
	}

	//��ũ�����̽� ����� ȭ������ �̵�
	@RequestMapping(value = "workspaceInsert.htm", method = RequestMethod.GET)
	public String workspaceInsert() {
		
		return "login.workspaceInsert";
	}
	
/*	@RequestMapping(value = "workspaceInsert.htm", method = RequestMethod.POST)
	public String workspaceInsert(Model model) {
		model.addAllAttributes("result","��ũ�����̽� ��� ����");
		return "redirect:login.workspace.htm";
	}
*/
	@RequestMapping(value = "main.htm", method = RequestMethod.GET)
	public String main() {

		return "main.main";
	}
}
