package kr.or.lis.dao;

import org.apache.ibatis.session.SqlSession;

import kr.or.lis.util.MybatisUtil;

public class BorrowDaoImpl implements BorrowDao {

	private static BorrowDaoImpl dao;

	private BorrowDaoImpl() {
	}

	public static BorrowDaoImpl getInstance() {
		if (dao == null)
			dao = new BorrowDaoImpl();

		return dao;
	}
	
	@Override
	public int calB_no(int b_no) {
        SqlSession session = null;
        int count = 0;

        try {
            session = MybatisUtil.getSqlSession();
            
            count = session.selectOne("borrow.calB_no", b_no);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return count;
	}

	@Override
	public int delay(String mno) {
        SqlSession session = null;
        int count = 0;

        try {
            session = MybatisUtil.getSqlSession();
            
            count = session.selectOne("borrow.delay", mno);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return count;
	}

	@Override
	public int delay2(String mno) {
        SqlSession session = null;
        int count = 0;

        try {
            session = MybatisUtil.getSqlSession();
            
            count = session.selectOne("borrow.delay2", mno);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return count;
	}

}
