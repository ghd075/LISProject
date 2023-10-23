package kr.or.lis.service;

import java.util.List;

import kr.or.lis.vo.FolderVO;

public interface FolderService {
    public List<FolderVO> selectByNo(int mno);
    public int pageByFolder(int mno);
}
