package kr.or.lis.dao;

import java.util.List;

import kr.or.lis.vo.FolderVO;

public interface FolderDao {
    public List<FolderVO> findByNo(String mno);
    public int pageByFolder(String mno);
}
