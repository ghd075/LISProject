package kr.or.lis.dao;

import java.util.List;

import kr.or.lis.vo.FolderVO;

public interface FolderDao {
    public List<FolderVO> selectByNo(int mno);
    public int pageByFolder(int mno);
}
