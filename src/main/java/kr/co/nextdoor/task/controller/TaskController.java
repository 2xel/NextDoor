package kr.co.nextdoor.task.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import kr.co.nextdoor.member.dto.MemberDTO;
import kr.co.nextdoor.project.dto.ProjectDTO;
import kr.co.nextdoor.task.dto.TaskDTO;
import kr.co.nextdoor.task.service.TaskService;


/*
* @Class : TaskController
* @Date : 2017. 06. 13 
* @Author : 장진환
* @Desc : task
*/


@Controller
public class TaskController {

	@Autowired
	private TaskService taskservice;
	
	

	/*
    * @method Name : listTask
    * @date : 2017. 06. 13
    * @author : 장진환
    * @description : 업무 선택시 업무 출력 화면으로 이동
    */
	@RequestMapping(value="task.htm", method=RequestMethod.GET)
	public String listTask(ProjectDTO projectdto, Model model, HttpSession session){
	session.setAttribute("project_no", projectdto.getProject_no());
		
		String specifictask = (String) session.getAttribute("specifictask_no");
		String specifictaskcont = (String) session.getAttribute("specifictask_cont");
		
		List<MemberDTO> memberlist = taskservice.listMember(projectdto.getProject_no());
		session.setAttribute("memberlist", memberlist);
		
		model.addAttribute("project_name", projectdto.getProject_name());
		session.setAttribute("specifictask_no", specifictask);
		session.setAttribute("specifictask_cont", specifictaskcont);
		
		System.out.println("task view 이동");
		return "task.task";
	}
	
	/*
    * @method Name : listTask
    * @date : 2017. 06. 13
    * @author : 장진환
    * @description : 업무리스트 출력의 비동기 화면 처리
    */
	@RequestMapping(value = "tasklist.htm", method=RequestMethod.POST)
	public ModelAndView listTask(Model model, HttpSession session) {
		String project_no = (String) session.getAttribute("project_no");
		System.out.println("project_no : " +project_no);
		List<TaskDTO> tasklist = taskservice.listTask(project_no);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("data", tasklist);

		return mv;
	}
	
	/*
    * @method Name : insertTask
    * @date : 2017. 06. 13
    * @author : 장진환
    * @description : 업무생성 후 업무리스트 화면으로 이동
    */
	@RequestMapping(value = "insertTask.htm")
	public String insertTask(TaskDTO taskdto, HttpSession session) {
		String project_no = (String) session.getAttribute("project_no");
		taskdto.setProject_no(project_no);
		taskservice.insertTask(taskdto);
		return "redirect:task.htm?project_no="+taskdto.getProject_no();
	}
	
	
	/*
    * @method Name : deleteTask
    * @date : 2017. 06. 13
    * @author : 장진환
    * @description : 업무삭제
    */
	@RequestMapping("deletetask.htm")
	public String deleteTask(TaskDTO taskdto){
		taskservice.deleteTask(taskdto);
		return "task.task";
	}
}
