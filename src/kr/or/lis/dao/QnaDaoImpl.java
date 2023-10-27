package kr.or.lis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.lis.util.MybatisUtil;
import kr.or.lis.vo.NoticeVO;
import kr.or.lis.vo.ReplyVO;

public class QnaDaoImpl implements QnaDao {
	
private static QnaDaoImpl dao;
	
	private QnaDaoImpl() { }
	
	public static QnaDaoImpl getInstance() {
		if(dao == null) dao = new QnaDaoImpl();
		
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
			
			if(noticeList == null) noticeList = session.selectList("qnaboard.noticeSearch", params);
		
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
            
            count = session.selectOne("qnaboard.getSearchCount", nSearch);
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
            count = session.selectOne("qnaboard.getBoardCount");
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
            
            noticeList = session.selectList("qnaboard.noticeList", params);
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
            notice = session.selectOne("qnaboard.noticeDetail", nno);
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
            cnt = session.insert("qnaboard.noticeWrite", vo);
            
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
            cnt = session.update("qnaboard.noticeUpdate", vo);
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
            cnt = session.delete("qnaboard.noticeDelete", nno);
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
            
            cnt = session.update("qnaboard.viewCount", nno);
            if(cnt > 0) session.commit(); // 커밋
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return cnt;
	}
	
	@Override
	public int replyWrite(NoticeVO vo) {
        SqlSession session = null;
        int cnt = 0;

        try {
            session = MybatisUtil.getSqlSession();
            cnt = session.insert("qnaboard.replyWrite", vo);
            
            if(cnt > 0) session.commit(); // 커밋
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return cnt;
	}

	
	@Override
	public List<ReplyVO> getReply(int nno) {
        SqlSession session = null;
        List<ReplyVO> list = null;

        try {
            session = MybatisUtil.getSqlSession();
            list = session.selectList("qnaboard.getReply", nno);
            
  
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return list;
	}
	
	@Override
	public ReplyVO getReplyOne(int rno) {
        SqlSession session = null;
        ReplyVO vo = null;

        try {
            session = MybatisUtil.getSqlSession();
            vo = session.selectOne("qnaboard.getReplyOne", rno);
            
  
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return vo;
	}
	
	@Override
	public int replyDelete(int nno) {
        SqlSession session = null;
        int res = 0;

        try {
            session = MybatisUtil.getSqlSession();
            res = session.delete("qnaboard.replyDelete", nno);
            
            if(res > 0) session.commit(); // 커밋
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return nno;
	}
	
	@Override
	public List<ReplyVO> replyDetail(int nno) {
        SqlSession session = null;
        List<ReplyVO> list = null;

        try {
            session = MybatisUtil.getSqlSession();
            list = session.selectList("qnaboard.replyDetail", nno);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return list;
	}
	
	@Override
	public int replyUpdate(ReplyVO vo) {
        SqlSession session = null;
       int res = 0;

        try {
            session = MybatisUtil.getSqlSession();
            res = session.update("qnaboard.replyUpdate", vo);
            
            if(res > 0) session.commit(); // 커밋
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return res;
	}
	
	@Override
	public int getReplyCnt(int nno) {
        SqlSession session = null;
        int res = 0;

        try {
            session = MybatisUtil.getSqlSession();
            res = session.selectOne("qnaboard.getReplyCnt", nno);
            
  
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return res;
	}

}
