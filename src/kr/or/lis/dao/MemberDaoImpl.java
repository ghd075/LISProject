package kr.or.lis.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.lis.util.MybatisUtil;
import kr.or.lis.vo.MemberVO;

public class MemberDaoImpl implements MemberDao {
	private static MemberDaoImpl dao;

	private MemberDaoImpl() {
	}

	public static MemberDaoImpl getInstance() {
		if (dao == null)
			dao = new MemberDaoImpl();

		return dao;
	}

	@Override
	public int registerMember(MemberVO mvo) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("member.registerMember", mvo);

			if (cnt > 0)
				session.commit(); // 커밋

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return cnt;
	}

	@Override
	public MemberVO loginMember(String mid, String mpw) {
	    SqlSession session = null;
	    MemberVO resultMember = new MemberVO(); // MemberVO 객체를 초기화

	    try {
	        session = MybatisUtil.getSqlSession();

	        // 파라미터를 HashMap으로 래핑
	        Map<String, Object> parameters = new HashMap<>();
	        parameters.put("mid", mid);
	        parameters.put("mpw", mpw);

	        // 아이디와 비밀번호를 동시에 확인
	        resultMember.setLogin_type(0); // 초기값 0으로 설정
	        MemberVO retrievedMember = session.selectOne("member.loginMember", parameters);

	        if (retrievedMember != null) {
	            // 아이디와 비밀번호 일치
	            resultMember = retrievedMember;
	            resultMember.setLogin_type(2);
	        } else {
	            // 아이디와 비밀번호 불일치 또는 아이디가 존재하지 않음 (login_type는 이미 초기값 0으로 설정)
	            resultMember.setLogin_type(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (session != null)
	            session.close();
	    }

	    return resultMember;
	}


	@Override
	public String idSearch(String mname, String memail) {
		SqlSession session = null;
		String mid = null;

		try {
			session = MybatisUtil.getSqlSession();

			// 파라미터를 HashMap으로 래핑
			Map<String, Object> parameters = new HashMap<>();
			parameters.put("mname", mname);
			parameters.put("memail", memail);

			// 파라미터를 전달하여 쿼리 실행
			mid = session.selectOne("member.findMemberId", parameters);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return mid;
	}

	@Override
	public String pwSearch(String mid, String memail) {
		SqlSession session = null;
		String mpw = null;

		try {
			session = MybatisUtil.getSqlSession();

			// 파라미터를 HashMap으로 래핑
			Map<String, Object> parameters = new HashMap<>();
			parameters.put("mid", mid);
			parameters.put("memail", memail);

			// 파라미터를 전달하여 쿼리 실행
			mpw = session.selectOne("member.findMemberId", parameters);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return mpw;
	}

	@Override
	public int tmpPwUpdate(String mid, String tempPw) {
		 SqlSession session = null;
	        int cnt = 0;

	        try {
	            session = MybatisUtil.getSqlSession();
	            
	            Map<String, Object> parameters = new HashMap<>();
				parameters.put("mid", mid);
				parameters.put("tempPw", tempPw);
				
	            cnt = session.update("member.tmpPwUpdate", parameters);
	            
	            if(cnt > 0) session.commit(); // 커밋
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            if (session != null) session.close();
	        }
	        return cnt;
		}

	@Override
	public int isIdChk(String mid) {
		SqlSession session = null;
		int count = 0;

		try {
			session = MybatisUtil.getSqlSession();
			
			// 파라미터를 전달하여 쿼리 실행
			count = session.selectOne("member.isIdChk", mid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return count;
	}


	@Override
	public int isEmailChk(String memail) {
		SqlSession session = null;
		int count = 0;

		try {
			session = MybatisUtil.getSqlSession();
			
			// 파라미터를 전달하여 쿼리 실행
			count = session.selectOne("member.isEmailChk", memail);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return count;
	}

}
