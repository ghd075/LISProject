package kr.or.lis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.lis.util.MybatisUtil;
import kr.or.lis.vo.NoticeVO;

public class FBoardDaoImpl implements FBoardDao {

	private static FBoardDaoImpl dao;
	
	private FBoardDaoImpl() { }
	
	public static FBoardDaoImpl getInstance() {
		if(dao == null) dao = new FBoardDaoImpl();
		
		return dao;
	}
	
	@Override
	public List<NoticeVO> noticeSearch(String nSearch, int start, int end) {
		SqlSession session = null;
		List<NoticeVO> noticeList = null; 	// 반환값이 저장될 변수
		
		
		try {
			session = MybatisUtil.getSqlSession();
			HashMap<String, Object> params = new HashMap<String, Object>();
            params.put("nSearch", nSearch);
            params.put("start", start);
            params.put("end", end);
			
			if(noticeList == null) noticeList = session.selectList("fboard.noticeSearch", params);
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return noticeList;
	}

	@Override
	public int getSearchCount(String nSearch) {
        SqlSession session = null;
        int count = 0;

        try {
            session = MybatisUtil.getSqlSession();
            
            count = session.selectOne("fboard.getSearchCount", nSearch);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return count;
	}

	@Override
	public int getBoardCount() {
        SqlSession session = null;
        int count = 0;

        try {
            session = MybatisUtil.getSqlSession();
            count = session.selectOne("fboard.getBoardCount");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return count;
	}

	@Override
	public List<NoticeVO> noticeList(int start, int end) {
        SqlSession session = null;
        List<NoticeVO> noticeList = null;

        try {
            session = MybatisUtil.getSqlSession();
            HashMap<String, Object> params = new HashMap<String, Object>();
            params.put("start", start);
            params.put("end", end);
            
            noticeList = session.selectList("fboard.noticeList", params);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return noticeList;
	}

	@Override
	public NoticeVO noticeDetail(int nno) {
        SqlSession session = null;
        NoticeVO notice = null;

        try {
            session = MybatisUtil.getSqlSession();
            notice = session.selectOne("fboard.noticeDetail", nno);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return notice;
	}

	@Override
	public int noticeWrite(NoticeVO vo) {
        SqlSession session = null;
        int cnt = 0;

        try {
            session = MybatisUtil.getSqlSession();
            cnt = session.insert("fboard.noticeWrite", vo);
            
            if(cnt > 0) session.commit(); // 커밋
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return cnt;
	}

	@Override
	public int noticeUpdate(NoticeVO vo, int nno) {
        SqlSession session = null;
        int cnt = 0;

        try {
            session = MybatisUtil.getSqlSession();
            vo.setNno(nno); // 공지사항의 고유 번호 설정
            cnt = session.update("fboard.noticeUpdate", vo);
            if(cnt > 0) session.commit(); // 커밋
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return cnt;
	}

	@Override
	public int noticeDelete(int nno) {
        SqlSession session = null;
        int cnt = 0;

        try {
            session = MybatisUtil.getSqlSession();
            cnt = session.delete("fboard.noticeDelete", nno);
            if(cnt > 0) session.commit(); // 커밋
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return cnt;
	}

	@Override
	public int viewCount(int nno) {
        SqlSession session = null;
        int cnt = 0;

        try {
            session = MybatisUtil.getSqlSession();
            
            cnt = session.update("fboard.viewCount", nno);
            if(cnt > 0) session.commit(); // 커밋
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return cnt;
	}


}
