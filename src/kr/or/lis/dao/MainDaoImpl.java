package kr.or.lis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.lis.util.MybatisUtil;
import kr.or.lis.vo.NoticeVO;

public class MainDaoImpl implements MainDao {

	private static MainDaoImpl dao;

	private MainDaoImpl() {
	}

	public static MainDaoImpl getInstance() {
		if (dao == null)
			dao = new MainDaoImpl();

		return dao;
	}
	
	@Override
	public List<NoticeVO> getMainNotice() {
        SqlSession session = null;
        List<NoticeVO> noticeList = null;

        try {
            session = MybatisUtil.getSqlSession();
            
            noticeList = session.selectList("main.getMainNotice");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return noticeList;
	}

}
