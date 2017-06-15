package kr.co.nextdoor.project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import kr.co.nextdoor.project.dao.ProjectDAO;
import kr.co.nextdoor.project.dto.ProjectDTO;

@Service
public class ProjectService {

	@Autowired
	private SqlSession sqlsession;

	// 프로젝트 목록보기
	public List<ProjectDTO> projectList(ProjectDTO projectdto) throws Exception {
		ProjectDAO projectdao = sqlsession.getMapper(ProjectDAO.class);
		return projectdao.projectList(projectdto);
	}

	// 프로젝트 추가하기
	public int projectInsert(ProjectDTO projectdto) throws Exception {
		ProjectDAO projectdao = sqlsession.getMapper(ProjectDAO.class);
		return projectdao.insertProject(projectdto);
	}
	public void insertProjectMember(ProjectDTO projectdto) throws Exception{
		ProjectDAO projectdao = sqlsession.getMapper(ProjectDAO.class);
		projectdao.insertProjectMember(projectdto);
		return;
	}
}
