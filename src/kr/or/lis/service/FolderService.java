package kr.or.lis.service;

import java.util.List;

import kr.or.lis.vo.FolderVO;

public interface FolderService {
    public List<FolderVO> findByNo(String mno);
    public int pageByFolder(String mno);
}
