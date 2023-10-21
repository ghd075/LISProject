package kr.or.lis.dao;

import kr.or.lis.vo.MemberVO;

public interface MemberDao {
	
	// 회원가입
	public int registerMember(MemberVO mvo);
	
	// 로그인
	public MemberVO loginMember(String mid, String mpw);
	
	// 아이디 찾기
	public MemberVO idSearch(String mname, String memail);
	
	// 비밀번호 찾기
	public MemberVO pwSearch(String mid, String memail);
	
	// 임시 비밀번호 찾기
	public int tmpPwUpdate(String mid,String tempPw);
	
	// 아이디 중복체크 확인
	public int isIdChk(String mid);
	
	// 이메일 중복체크 확인
	public int isEmailChk(String memail);
}
