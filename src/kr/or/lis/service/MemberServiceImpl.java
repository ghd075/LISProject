package kr.or.lis.service;

import kr.or.lis.dao.MemberDao;
import kr.or.lis.dao.MemberDaoImpl;
import kr.or.lis.vo.MemberVO;

public class MemberServiceImpl implements MemberService {

	private MemberDao dao;
	
	private static MemberServiceImpl service;
	
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}
	
	public static MemberServiceImpl getInstance() {
		if(service == null) service = new MemberServiceImpl();
		return service;
	}
	
	@Override
	public int registerMember(MemberVO mvo) {
		return dao.registerMember(mvo);
		
	}

	@Override
	public MemberVO loginMember(String mid, String mpw) {
		return dao.loginMember(mid, mpw);
		
	}

	@Override
	public String idSearch(String mname, String memail) {
		return dao.idSearch(mname, memail);
	}

	@Override
	public String pwSearch(String mid, String memail) {
		return dao.pwSearch(mid, memail);
	}

	@Override
	public int tmpPwUpdate(String mid, String tempPw) {
		return dao.tmpPwUpdate(mid, tempPw);
	}

	@Override
	public int isIdChk(String mid) {
		return dao.isIdChk(mid);
	}

	@Override
	public int isEmailChk(String memail) {
		return dao.isEmailChk(memail);
	}
}
