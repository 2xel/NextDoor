package kr.co.nextdoor.member.dao;

import kr.co.nextdoor.member.dto.MemberDTO;

public interface MemberDao {
	/*ȸ������*/
	public int insertMember(MemberDTO memberdto);
	
	/*���ѵ��*/
	public void insertRole(String email);
}
