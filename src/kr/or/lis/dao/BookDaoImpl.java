package kr.or.lis.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import kr.or.lis.util.MybatisUtil;
import kr.or.lis.vo.BookVO;

public class BookDaoImpl implements BookDao {

	private static BookDaoImpl dao;

	private BookDaoImpl() {
	}

	public static BookDaoImpl getInstance() {
		if (dao == null)
			dao = new BookDaoImpl();

		return dao;
	}
	
	@Override
	public BookVO findByNo(int b_no) {
        SqlSession session = null;
        BookVO book = null;

        try {
            session = MybatisUtil.getSqlSession();
            book = session.selectOne("book.findByNo", b_no);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return book;
	}

	@Override
	public int insertBook(BookVO b) {
        SqlSession session = null;
        int cnt = 0;

        try {
            session = MybatisUtil.getSqlSession();
            cnt = session.insert("book.insertBook", b);
            
            if(cnt > 0) session.commit(); // Ä¿¹Ô
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return cnt;
	}

	@Override
	public int getNextBno() {
        SqlSession session = null;
        int count = 0;

        try {
            session = MybatisUtil.getSqlSession();
            count = session.selectOne("book.getNextBno");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return count;
	}

	@Override
	public List<BookVO> findAllRecom() {
        SqlSession session = null;
        List<BookVO> bookList = null;

        try {
            session = MybatisUtil.getSqlSession();
            
            bookList = session.selectList("book.findAllRecom");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return bookList;
	}

	@Override
	public List<BookVO> getPopBook() {
        SqlSession session = null;
        List<BookVO> bookList = null;

        try {
            session = MybatisUtil.getSqlSession();
            
            bookList = session.selectList("book.getPopBook");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return bookList;
	}

	@Override
	public List<BookVO> findAllNew() {
        SqlSession session = null;
        List<BookVO> bookList = null;

        try {
            session = MybatisUtil.getSqlSession();
            
            bookList = session.selectList("book.selectAllNew");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return bookList;
	}

}
