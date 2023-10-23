package kr.or.lis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.lis.util.MybatisUtil;
import kr.or.lis.vo.FolderVO;

public class FolderDaoImpl implements FolderDao {
	private static FolderDaoImpl dao;

	private FolderDaoImpl() { }

	public static FolderDaoImpl getInstance() {
		if (dao == null)
			dao = new FolderDaoImpl();
		return dao;
	}
	@Override
	public List<FolderVO> selectByNo(int mno) {
        SqlSession session = null;
        List<FolderVO> folderList = null;

        try {
            session = MybatisUtil.getSqlSession();
            
            folderList = session.selectList("folder.selectByNo", mno);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return folderList;
	}

	@Override
	public int pageByFolder(int mno) {
        SqlSession session = null;
        int count = 0;

        try {
            session = MybatisUtil.getSqlSession();
            
            count = session.selectOne("folder.pageByFolder", mno);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return count;
	}

}
