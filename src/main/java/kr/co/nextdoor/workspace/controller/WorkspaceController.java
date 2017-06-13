package kr.co.nextdoor.workspace.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.nextdoor.workspace.dto.WorkspaceDTO;
import kr.co.nextdoor.workspace.service.WorkspaceService;

@Controller
public class WorkspaceController {
	
	@Autowired
	private WorkspaceService service;

	//�α��� �� ��ũ�����̽� ���� ȭ��
	@RequestMapping(value = "workspace.htm")
	public ModelAndView workspaceList(ModelAndView mav) {
		mav.addObject("workspacelist",service.WorkspaceList());
		mav.setViewName("login.workspace");
		return mav;
	}

	//��ũ�����̽� ����� ȭ������ �̵�
	@RequestMapping(value = "workspaceInsert.htm", method = RequestMethod.GET)
	public String workspaceInsert() {
		return "login.workspaceInsert";
	}
	
	//��ũ�����̽� ������ ��ũ�����̽� ����ȭ������ �̵�
	@RequestMapping(value = "workspaceInsert.htm", method = RequestMethod.POST)
	public String workspaceInsert(WorkspaceDTO workspacedto) {
		System.out.println(workspacedto.toString());
		service.WorkspaceInsert(workspacedto);
		return "redirect:workspace.htm";
	}
	
	//��ũ�����̽� ������ ����ȭ������ �̵�
	@RequestMapping(value = "main.htm", method = RequestMethod.GET)
	public String main() {
		return "main.main";
	}
}
