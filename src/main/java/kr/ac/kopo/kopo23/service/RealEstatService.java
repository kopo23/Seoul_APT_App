package kr.ac.kopo.kopo23.service;

import java.util.List;

import kr.ac.kopo.kopo23.domain.RealEstat;

public interface RealEstatService {
	RealEstat findAPTbyCode(int id); //코드로아파트찾기
	List<RealEstat> showAll(); //전체 보여주기
	List<RealEstat> searchResults(String QueryTxt); //검색결과
	void add_reply (RealEstat estat); //후기
	void delete_reply (RealEstat estat); //후기지우기
	List<RealEstat> showReply(int id); //후기보여주기
	String changeNull (String value);
	String changeNull (int value);
	
	
}
