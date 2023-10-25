package kr.or.lis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.lis.util.MybatisUtil;
import kr.or.lis.vo.BorrowVO;
import kr.or.lis.vo.BorrowVO2;

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

	@Override
	public int insertBorrow(BorrowVO b) {
        SqlSession session = null;
        int cnt = 0;

        try {
            session = MybatisUtil.getSqlSession();
            cnt = session.insert("borrow.insertBorrow", b);
            
            if(cnt > 0) session.commit(); // 커밋
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return cnt;
	}

	@Override
	public int getNextBorNo() {
        SqlSession session = null;
        int count = 0;

        try {
            session = MybatisUtil.getSqlSession();
            count = session.selectOne("borrow.getNextBorNo");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return count;
	}

	@Override
	public List<BorrowVO2> selectBycust_No(String mno) {
	   SqlSession session = null;
	    List<BorrowVO2> BorrowList = null;
	
	    try {
	        session = MybatisUtil.getSqlSession();
	        
	        BorrowList = session.selectList("borrow.selectBycust_No", mno);
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (session != null) session.close();
	    }
	    return BorrowList;
	}

	@Override
	public int getTotalCount(String mno) {
        SqlSession session = null;
        int count = 0;

        try {
            session = MybatisUtil.getSqlSession();
            count = session.selectOne("borrow.getTotalCount", mno);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return count;
	}

	@Override
	public int updateBorrow(int bor_no) {
        SqlSession session = null;
        int cnt = 0;

        try {
            session = MybatisUtil.getSqlSession();
            cnt = session.update("borrow.updateBorrow", bor_no);
            if(cnt > 0) session.commit(); // 커밋
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return cnt;
	}

	@Override
	public int getTotalCount3(String mno) {
        SqlSession session = null;
        int count = 0;

        try {
            session = MybatisUtil.getSqlSession();
            count = session.selectOne("borrow.getTotalCount3", mno);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return count;
	}

	@Override
	public List<BorrowVO2> selectBycust_No3(HashMap<String, Object> map) {
	   SqlSession session = null;
	    List<BorrowVO2> BorrowList = null;
	
	    try {
	        session = MybatisUtil.getSqlSession();
	        
	        BorrowList = session.selectList("borrow.selectBycust_No3", map);
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (session != null) session.close();
	    }
	    return BorrowList;
	}
	
}
